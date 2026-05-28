import { Inject, Injectable, NotFoundException } from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { CheckoutPaymentMethod } from '../../checkout/dto/checkout.dto';
import { PrismaService } from '../../persistence/services/prisma.service';
import { PaymentGatewayService } from './payment-gateway.service';

type OnlinePaymentOrderContext = {
  id: string;
  orderNumber: string;
  currencyCode: string;
  grandTotalAmount: number;
  customerEmail: string;
};

@Injectable()
export class PaymentAttemptService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
    @Inject(PaymentGatewayService)
    private readonly paymentGatewayService: PaymentGatewayService,
  ) {}

  isOnlinePaymentEnabled() {
    return this.paymentGatewayService.isOnlinePaymentEnabled();
  }

  assertCheckoutMethodAllowed(paymentMethod: CheckoutPaymentMethod) {
    this.paymentGatewayService.assertCheckoutMethodAllowed(paymentMethod);
  }

  /** Persist a pending attempt inside the order transaction; no provider request is made here. */
  async createPendingOnlinePaymentAttempt(
    order: OnlinePaymentOrderContext,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    return tx.paymentAttempt.create({
      data: {
        orderId: order.id,
        provider: 'STRIPE',
        method: 'STRIPE_CARD',
        status: 'PROCESSING',
        currencyCode: order.currencyCode,
        amount: order.grandTotalAmount,
      },
    });
  }

  /**
   * Contact Stripe only after the local order transaction is committed. Metadata contains
   * paymentAttemptId so a webhook can repair linkage if the provider succeeds before this update.
   */
  async initializeOnlinePaymentAttempt(
    paymentAttemptId: string,
    order: OnlinePaymentOrderContext,
    params: {
      paymentMethod: CheckoutPaymentMethod;
      requestIdempotencyKey: string;
    },
  ) {
    const gatewayResult = await this.paymentGatewayService.createOnlinePayment(
      params.paymentMethod,
      {
        orderId: order.id,
        orderNumber: order.orderNumber,
        amount: order.grandTotalAmount,
        currencyCode: order.currencyCode,
        customerEmail: order.customerEmail,
        idempotencyKey: params.requestIdempotencyKey,
        metadata: {
          orderId: order.id,
          orderNumber: order.orderNumber,
          paymentAttemptId,
        },
      },
    );

    const updatedAttempt = await this.prisma.paymentAttempt.update({
      where: { id: paymentAttemptId },
      data: {
        providerPaymentId: gatewayResult.providerPaymentId,
        providerClientSecret: gatewayResult.clientSecret,
        providerCheckoutUrl: gatewayResult.checkoutUrl,
        providerIntentStatus: gatewayResult.providerIntentStatus,
        providerReference: gatewayResult.providerReference,
        status: gatewayResult.status,
      },
    });

    return {
      attemptId: updatedAttempt.id,
      provider: updatedAttempt.provider,
      status: updatedAttempt.status,
      clientSecret: updatedAttempt.providerClientSecret,
      checkoutUrl: updatedAttempt.providerCheckoutUrl,
      providerPaymentId: updatedAttempt.providerPaymentId,
    };
  }

  async findByProviderPaymentId(
    providerPaymentId: string,
    tx: Prisma.TransactionClient | PrismaService = this.prisma,
  ) {
    const attempt = await tx.paymentAttempt.findUnique({
      where: { providerPaymentId },
      include: {
        order: true,
      },
    });

    if (!attempt) {
      throw new NotFoundException(
        `Payment attempt for provider payment "${providerPaymentId}" was not found`,
      );
    }

    return attempt;
  }

  async resolveWebhookAttempt(
    params: { providerPaymentId?: string; paymentAttemptId?: string; orderId?: string },
    tx: Prisma.TransactionClient | PrismaService = this.prisma,
  ) {
    let attempt = params.providerPaymentId
      ? await tx.paymentAttempt.findUnique({
          where: { providerPaymentId: params.providerPaymentId },
          include: { order: true },
        })
      : null;

    if (!attempt && params.paymentAttemptId) {
      attempt = await tx.paymentAttempt.findUnique({
        where: { id: params.paymentAttemptId },
        include: { order: true },
      });
    }

    if (!attempt || (params.orderId && attempt.orderId !== params.orderId)) {
      throw new NotFoundException('Payment attempt referenced by the provider event was not found');
    }

    if (params.providerPaymentId && !attempt.providerPaymentId) {
      return tx.paymentAttempt.update({
        where: { id: attempt.id },
        data: { providerPaymentId: params.providerPaymentId },
        include: { order: true },
      });
    }

    if (params.providerPaymentId && attempt.providerPaymentId !== params.providerPaymentId) {
      throw new NotFoundException(
        'Provider payment identifier does not match the recorded payment attempt',
      );
    }

    return attempt;
  }
}
