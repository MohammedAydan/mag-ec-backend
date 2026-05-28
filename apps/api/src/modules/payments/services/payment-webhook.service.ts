import {
  BadRequestException,
  Inject,
  Injectable,
  ServiceUnavailableException,
} from '@nestjs/common';
import { Prisma } from '@prisma/client';

import { PrismaTransactionService } from '../../persistence/services/prisma-transaction.service';
import { PrismaService } from '../../persistence/services/prisma.service';
import type { VerifiedPaymentWebhookEvent } from '../payments.types';
import { PaymentAttemptService } from './payment-attempt.service';
import { PaymentGatewayService } from './payment-gateway.service';
import { OrderPaymentTransitionService } from './order-payment-transition.service';
import { RefundService } from './refund.service';

const ACTIONABLE_PAYMENT_EVENTS = new Set([
  'payment_intent.succeeded',
  'payment_intent.payment_failed',
  'payment_intent.canceled',
]);
const ACTIONABLE_REFUND_EVENTS = new Set(['refund.created', 'refund.updated']);
const WEBHOOK_PROCESSING_LEASE_MS = 5 * 60 * 1000;

@Injectable()
export class PaymentWebhookService {
  constructor(
    @Inject(PaymentGatewayService)
    private readonly paymentGatewayService: PaymentGatewayService,
    @Inject(PaymentAttemptService)
    private readonly paymentAttemptService: PaymentAttemptService,
    @Inject(OrderPaymentTransitionService)
    private readonly orderPaymentTransitionService: OrderPaymentTransitionService,
    @Inject(RefundService)
    private readonly refundService: RefundService,
    @Inject(PrismaTransactionService)
    private readonly prismaTransactionService: PrismaTransactionService,
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
  ) {}

  async handleStripeWebhook(payload: Buffer | string, signature: string) {
    const verifiedEvent = await this.paymentGatewayService.verifyStripeWebhook(payload, signature);
    const claimedEvent = await this.acquireEventForProcessing(verifiedEvent, signature);

    if (!claimedEvent) {
      return { received: true, duplicate: true };
    }

    try {
      await this.prismaTransactionService.runInTransaction(async (tx) => {
        if (ACTIONABLE_REFUND_EVENTS.has(verifiedEvent.eventType)) {
          const refund = await this.refundService.reconcileProviderRefund(verifiedEvent, tx);
          await tx.paymentWebhookEvent.update({
            where: { id: claimedEvent.id },
            data: { orderId: refund.orderId },
          });
        }

        const needsPaymentAttempt = ACTIONABLE_PAYMENT_EVENTS.has(verifiedEvent.eventType);
        const paymentAttempt = needsPaymentAttempt
          ? await this.paymentAttemptService.resolveWebhookAttempt(
              {
                providerPaymentId: verifiedEvent.providerPaymentId,
                paymentAttemptId: verifiedEvent.metadata.paymentAttemptId,
                orderId: verifiedEvent.metadata.orderId,
              },
              tx,
            )
          : null;

        if (needsPaymentAttempt && !paymentAttempt) {
          throw new BadRequestException(
            `Payment attempt not found for webhook event "${verifiedEvent.externalEventId}"`,
          );
        }

        if (paymentAttempt) {
          await tx.paymentWebhookEvent.update({
            where: { id: claimedEvent.id },
            data: {
              paymentAttemptId: paymentAttempt.id,
              orderId: paymentAttempt.orderId,
            },
          });
        }

        switch (verifiedEvent.eventType) {
          case 'payment_intent.succeeded':
            await this.orderPaymentTransitionService.markPaid(
              paymentAttempt!.orderId,
              paymentAttempt!.id,
              tx,
            );
            break;
          case 'payment_intent.payment_failed':
            await this.orderPaymentTransitionService.markFailed(
              paymentAttempt!.orderId,
              paymentAttempt!.id,
              tx,
            );
            break;
          case 'payment_intent.canceled':
            await this.orderPaymentTransitionService.markCancelled(
              paymentAttempt!.orderId,
              paymentAttempt!.id,
              tx,
            );
            break;
          default:
            // Store and acknowledge non-state-changing Stripe events for auditability.
            break;
        }

        await tx.paymentWebhookEvent.update({
          where: { id: claimedEvent.id },
          data: {
            status: 'PROCESSED',
            processingError: null,
            processedAt: new Date(),
          },
        });
      });
    } catch (error) {
      const message = error instanceof Error ? error.message : 'Webhook processing failed';

      // This write occurs outside the rolled-back business transaction so failed deliveries
      // remain visible and can be retried safely by Stripe.
      await this.prisma.paymentWebhookEvent.update({
        where: { id: claimedEvent.id },
        data: {
          status: 'FAILED',
          processingError: message,
          processedAt: new Date(),
        },
      });
      throw error;
    }

    return { received: true, duplicate: false };
  }

  private async acquireEventForProcessing(event: VerifiedPaymentWebhookEvent, signature: string) {
    try {
      return await this.prisma.paymentWebhookEvent.create({
        data: {
          provider: event.provider,
          externalEventId: event.externalEventId,
          eventType: event.eventType,
          signature,
          payload: event.payload as Prisma.InputJsonValue,
          status: 'RECEIVED',
        },
      });
    } catch (error) {
      if (!(error instanceof Prisma.PrismaClientKnownRequestError) || error.code !== 'P2002') {
        throw error;
      }
    }

    const existing = await this.prisma.paymentWebhookEvent.findUnique({
      where: {
        provider_externalEventId: {
          provider: event.provider,
          externalEventId: event.externalEventId,
        },
      },
    });

    if (!existing) {
      throw new ServiceUnavailableException('Webhook event could not be acquired for processing');
    }

    if (existing.status === 'PROCESSED') {
      return null;
    }

    const staleBefore = new Date(Date.now() - WEBHOOK_PROCESSING_LEASE_MS);
    const claim = await this.prisma.paymentWebhookEvent.updateMany({
      where: {
        id: existing.id,
        OR: [{ status: 'FAILED' }, { status: 'RECEIVED', receivedAt: { lt: staleBefore } }],
      },
      data: {
        status: 'RECEIVED',
        receivedAt: new Date(),
        processedAt: null,
        processingError: null,
        signature,
        payload: event.payload as Prisma.InputJsonValue,
      },
    });

    if (claim.count !== 1) {
      throw new ServiceUnavailableException('Webhook event processing is already in progress');
    }

    return this.prisma.paymentWebhookEvent.findUniqueOrThrow({
      where: { id: existing.id },
    });
  }
}
