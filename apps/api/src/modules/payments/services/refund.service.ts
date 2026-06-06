import {
  BadRequestException,
  Inject,
  Injectable,
  NotFoundException,
  NotImplementedException,
  ServiceUnavailableException,
} from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { OrderOutboxService } from '../../orders/services/order-outbox.service';
import { PrismaTransactionService } from '../../persistence/services/prisma-transaction.service';
import { PrismaService } from '../../persistence/services/prisma.service';
import type { VerifiedPaymentWebhookEvent } from '../payments.types';
import { PaymentGatewayService } from './payment-gateway.service';

type CreatePendingRefundParams = {
  orderId: string;
  paymentAttemptId?: string;
  returnRequestId?: string;
  requestedByUserId?: string;
  provider: 'COD' | 'STRIPE';
  amount: number;
  currencyCode: string;
  reason?: string;
  metadata?: Prisma.InputJsonValue;
};

@Injectable()
export class RefundService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
    @Inject(PrismaTransactionService)
    private readonly prismaTransactionService: PrismaTransactionService,
    @Inject(PaymentGatewayService)
    private readonly paymentGatewayService: PaymentGatewayService,
    @Inject(OrderOutboxService)
    private readonly orderOutboxService: OrderOutboxService,
  ) {}

  async createPendingRefund(
    params: CreatePendingRefundParams,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    return tx.refund.create({
      data: {
        orderId: params.orderId,
        paymentAttemptId: params.paymentAttemptId,
        returnRequestId: params.returnRequestId,
        requestedByUserId: params.requestedByUserId,
        provider: params.provider,
        amount: params.amount,
        currencyCode: params.currencyCode,
        reason: params.reason,
        metadata: params.metadata,
        status: 'PENDING',
      },
    });
  }

  async executeRefund(params: {
    orderId: string;
    returnRequestId?: string;
    requestedByUserId?: string;
    amount: number;
    reason?: string;
    metadata?: Prisma.InputJsonValue;
  }) {
    if (params.amount <= 0) {
      throw new BadRequestException('Refund amount must be greater than zero');
    }

    const { orderContext, paymentAttempt, pendingRefund } =
      await this.prismaTransactionService.runInTransaction(async (tx) => {
        await tx.$queryRaw`SELECT id FROM \`Order\` WHERE id = ${params.orderId} FOR UPDATE`;

        const orderContext = await tx.order.findUnique({
          where: { id: params.orderId },
          include: {
            paymentAttempts: {
              where: { status: 'SUCCEEDED' },
              orderBy: [{ createdAt: 'desc' }],
            },
            refunds: {
              where: { status: { in: ['PENDING', 'SUCCEEDED'] } },
            },
          },
        });

        if (!orderContext) {
          throw new NotFoundException(`Order "${params.orderId}" was not found`);
        }

        if (!['PAID', 'PARTIALLY_REFUNDED'].includes(orderContext.paymentStatus)) {
          throw new BadRequestException('Refunds require an order with captured payment');
        }

        const paymentAttempt = orderContext.paymentAttempts.find(
          (attempt) => attempt.provider === 'STRIPE' && Boolean(attempt.providerPaymentId),
        );

        if (!paymentAttempt?.providerPaymentId) {
          throw new NotImplementedException(
            'Automatic refunds are only supported for captured Stripe payments',
          );
        }

        const alreadyCommittedAmount = orderContext.refunds.reduce(
          (sum, refund) => sum + refund.amount,
          0,
        );
        const refundableAmount = orderContext.grandTotalAmount - alreadyCommittedAmount;
        if (params.amount > refundableAmount) {
          throw new BadRequestException(
            `Refund amount ${params.amount} exceeds refundable balance ${refundableAmount}`,
          );
        }

        const pendingRefund = await this.createPendingRefund(
          {
            orderId: orderContext.id,
            paymentAttemptId: paymentAttempt.id,
            returnRequestId: params.returnRequestId,
            requestedByUserId: params.requestedByUserId,
            provider: 'STRIPE',
            amount: params.amount,
            currencyCode: orderContext.currencyCode,
            reason: params.reason,
            metadata: {
              orderId: orderContext.id,
              paymentAttemptId: paymentAttempt.id,
              returnRequestId: params.returnRequestId ?? null,
              ...(params.metadata as Record<string, unknown> | undefined),
            },
          },
          tx,
        );

        return { orderContext, paymentAttempt, pendingRefund };
      });

    try {
      const gatewayRefund = await this.paymentGatewayService.createRefund({
        providerPaymentId: paymentAttempt.providerPaymentId!,
        amount: params.amount,
        currencyCode: orderContext.currencyCode,
        reason: params.reason,
        metadata: {
          orderId: orderContext.id,
          refundId: pendingRefund.id,
          returnRequestId: params.returnRequestId ?? '',
        },
        idempotencyKey: `refund:${pendingRefund.id}`,
      });

      if (gatewayRefund.rawStatus !== 'succeeded') {
        return this.prisma.refund.update({
          where: { id: pendingRefund.id },
          data: {
            providerRefundId: gatewayRefund.providerRefundId,
            providerReference: gatewayRefund.providerReference,
            status: 'PENDING',
          },
        });
      }

      try {
        return await this.prismaTransactionService.runInTransaction((tx) =>
          this.completeSuccessfulRefund(
            pendingRefund.id,
            gatewayRefund.providerRefundId,
            gatewayRefund.providerReference,
            params.requestedByUserId,
            tx,
          ),
        );
      } catch {
        throw new ServiceUnavailableException(
          'Refund was accepted by the payment provider and is pending reconciliation',
        );
      }
    } catch (error) {
      if (error instanceof ServiceUnavailableException) {
        throw error;
      }

      // A transport/provider error is ambiguous: Stripe may have accepted the
      // idempotent refund request even if the response was not received locally.
      // Keep the allocation PENDING for webhook or operator reconciliation rather
      // than permitting a second refund against the same balance.
      await this.prismaTransactionService.runInTransaction(async (tx) => {
        await tx.refund.update({
          where: { id: pendingRefund.id },
          data: {
            status: 'PENDING',
            failureReason:
              error instanceof Error ? error.message : 'Refund execution requires reconciliation',
          },
        });

        await tx.auditLog.create({
          data: {
            actorUserId: params.requestedByUserId,
            category: 'SECURITY',
            action: 'refund.pending_reconciliation',
            entityType: 'Refund',
            entityId: pendingRefund.id,
            metadata: {
              orderId: orderContext.id,
              returnRequestId: params.returnRequestId ?? null,
              amount: params.amount,
            },
          },
        });
      });

      throw new ServiceUnavailableException(
        'Refund request status is pending reconciliation with the payment provider',
        { cause: error },
      );
    }
  }

  async reconcileProviderRefund(event: VerifiedPaymentWebhookEvent, tx: Prisma.TransactionClient) {
    const refundId = event.metadata.refundId;
    const providerRefundId = event.providerRefundId;
    const refund = refundId
      ? await tx.refund.findUnique({
          where: { id: refundId },
          include: { paymentAttempt: true },
        })
      : providerRefundId
        ? await tx.refund.findUnique({
            where: { providerRefundId },
            include: { paymentAttempt: true },
          })
        : null;

    if (!refund || !providerRefundId) {
      throw new NotFoundException('Refund referenced by the provider event was not found');
    }

    // SEC-013: Enforce that the webhook's payment intent matches the refund's associated payment attempt.
    if (
      event.providerPaymentId &&
      refund.paymentAttempt?.providerPaymentId &&
      event.providerPaymentId !== refund.paymentAttempt.providerPaymentId
    ) {
      // Persist audit log outside the caller's transaction so the security
      // warning survives even when the refund reconciliation is rolled back.
      await this.prisma.auditLog.create({
        data: {
          category: 'SECURITY',
          action: 'refund.pi_ownership_mismatch',
          entityType: 'Refund',
          entityId: refund.id,
          metadata: {
            webhookEventId: event.externalEventId,
            webhookPaymentIntent: event.providerPaymentId,
            localPaymentIntent: refund.paymentAttempt.providerPaymentId,
            orderId: refund.orderId,
            refundId: refund.id,
            paymentAttemptId: refund.paymentAttempt.id,
          },
        },
      });
      throw new BadRequestException(
        `Webhook payment intent "${event.providerPaymentId}" does not match refund's payment attempt "${refund.paymentAttempt.providerPaymentId}"`,
      );
    }

    if (event.providerObjectStatus === 'succeeded') {
      return this.completeSuccessfulRefund(
        refund.id,
        providerRefundId,
        event.providerReference,
        undefined,
        tx,
      );
    }

    if (['failed', 'canceled'].includes(event.providerObjectStatus ?? '')) {
      await tx.refund.updateMany({
        where: { id: refund.id, status: { not: 'SUCCEEDED' } },
        data: {
          providerRefundId,
          providerReference: event.providerReference,
          status: 'FAILED',
          failureReason: `Stripe refund ${event.providerObjectStatus}`,
          processedAt: new Date(),
        },
      });
      return tx.refund.findUniqueOrThrow({ where: { id: refund.id } });
    }

    await tx.refund.updateMany({
      where: { id: refund.id, status: { not: 'SUCCEEDED' } },
      data: { providerRefundId, providerReference: event.providerReference },
    });
    return tx.refund.findUniqueOrThrow({ where: { id: refund.id } });
  }

  private async completeSuccessfulRefund(
    refundId: string,
    providerRefundId: string,
    providerReference: string | undefined,
    actorUserId: string | undefined,
    tx: Prisma.TransactionClient,
  ) {
    const claimed = await tx.refund.updateMany({
      where: { id: refundId, status: { not: 'SUCCEEDED' } },
      data: {
        status: 'SUCCEEDED',
        providerRefundId,
        providerReference,
        processedAt: new Date(),
        failureReason: null,
      },
    });

    const refund = await tx.refund.findUniqueOrThrow({ where: { id: refundId } });
    if (claimed.count === 0) {
      return refund;
    }
    const order = await tx.order.findUniqueOrThrow({ where: { id: refund.orderId } });
    const aggregate = await tx.refund.aggregate({
      where: { orderId: refund.orderId, status: 'SUCCEEDED' },
      _sum: { amount: true },
    });
    const refundedAmount = aggregate._sum.amount ?? 0;
    const nextPaymentStatus =
      refundedAmount >= order.grandTotalAmount ? 'REFUNDED' : 'PARTIALLY_REFUNDED';
    const updatedOrder = await tx.order.update({
      where: { id: refund.orderId },
      data: { paymentStatus: nextPaymentStatus },
    });

    await tx.auditLog.create({
      data: {
        actorUserId,
        category: 'DATA_CHANGE',
        action: 'refund.execute',
        entityType: 'Refund',
        entityId: refund.id,
        metadata: {
          orderId: refund.orderId,
          returnRequestId: refund.returnRequestId ?? null,
          amount: refund.amount,
          currencyCode: refund.currencyCode,
          providerRefundId: refund.providerRefundId,
        },
      },
    });

    await this.orderOutboxService.emitStatusChanged(updatedOrder, tx);
    await this.orderOutboxService.emitEvent(
      {
        aggregateId: refund.orderId,
        eventType: 'order.refund.succeeded',
        deduplicationKey: `order.refund.succeeded:${refund.id}`,
        payload: {
          orderId: refund.orderId,
          refundId: refund.id,
          returnRequestId: refund.returnRequestId ?? null,
          amount: refund.amount,
          currencyCode: refund.currencyCode,
        },
      },
      tx,
    );

    if (refund.returnRequestId) {
      await tx.returnRequest.updateMany({
        where: { id: refund.returnRequestId, status: 'REFUND_PROCESSING' },
        data: { status: 'CLOSED', closedAt: new Date() },
      });
      await this.orderOutboxService.emitEvent(
        {
          aggregateId: refund.orderId,
          eventType: 'order.return.refund_succeeded',
          deduplicationKey: `order.return.refund_succeeded:${refund.id}`,
          payload: {
            orderId: refund.orderId,
            returnRequestId: refund.returnRequestId,
            refundId: refund.id,
            amount: refund.amount,
          },
        },
        tx,
      );
    }

    return refund;
  }
}
