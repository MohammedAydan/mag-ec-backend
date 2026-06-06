import { BadRequestException, Inject, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import Stripe from 'stripe';

import type { AppConfig } from '../../../config/app.config';
import type {
  PaymentGateway,
  PaymentGatewayCreatePaymentParams,
  PaymentGatewayCreatePaymentResult,
  PaymentGatewayCancelResult,
  PaymentGatewayRefundParams,
  PaymentGatewayRefundResult,
  VerifiedPaymentWebhookEvent,
} from '../payments.types';

type StripeRefundObject = {
  id: string;
  metadata?: Record<string, string | number | boolean | null>;
  payment_intent?: string | { id?: string };
  status?: string | null;
  charge?: string | { id?: string };
};

type StripePaymentIntentObject = {
  id: string;
  metadata?: Record<string, string | number | boolean | null>;
  status: string;
  amount: number;
  amount_received: number;
  currency: string;
  latest_charge?: string | { id?: string } | null;
};

@Injectable()
export class StripePaymentGatewayService implements PaymentGateway {
  constructor(
    @Inject(ConfigService)
    private readonly configService: ConfigService,
  ) {}

  async createPayment(
    params: PaymentGatewayCreatePaymentParams,
  ): Promise<PaymentGatewayCreatePaymentResult> {
    const appConfig = this.configService.getOrThrow<AppConfig>('app');
    if (!appConfig.stripeSecretKey?.trim()) {
      throw new BadRequestException('Stripe secret key is not configured');
    }

    const stripe = this.createStripeClient(appConfig.stripeSecretKey);
    const paymentIntent = await stripe.paymentIntents.create(
      {
        amount: params.amount,
        currency: params.currencyCode.toLowerCase(),
        receipt_email: params.customerEmail,
        automatic_payment_methods: { enabled: true },
        metadata: params.metadata,
      },
      {
        idempotencyKey: params.idempotencyKey,
      },
    );

    return {
      provider: 'STRIPE',
      method: 'STRIPE_CARD',
      status: paymentIntent.status === 'succeeded' ? 'SUCCEEDED' : 'AWAITING_CUSTOMER_ACTION',
      providerPaymentId: paymentIntent.id,
      clientSecret: paymentIntent.client_secret ?? undefined,
      providerIntentStatus: paymentIntent.status,
      providerReference:
        typeof paymentIntent.latest_charge === 'string' ? paymentIntent.latest_charge : undefined,
    };
  }

  verifyWebhook(payload: Buffer | string, signature: string): Promise<VerifiedPaymentWebhookEvent> {
    const appConfig = this.configService.getOrThrow<AppConfig>('app');
    if (!appConfig.paymentWebhookSecret?.trim()) {
      throw new BadRequestException('Stripe webhook secret is not configured');
    }

    const stripe = this.createStripeClient(appConfig.stripeSecretKey || 'sk_test_placeholder');
    const event = stripe.webhooks.constructEvent(
      payload,
      signature,
      appConfig.paymentWebhookSecret,
    );

    if (event.type.startsWith('refund.')) {
      const refund = event.data.object as StripeRefundObject;
      const metadata = Object.fromEntries(
        Object.entries(refund.metadata ?? {}).map(([key, value]) => [key, String(value)]),
      );

      return Promise.resolve({
        provider: 'STRIPE',
        externalEventId: event.id,
        eventType: event.type,
        status: 'RECEIVED',
        providerRefundId: refund.id,
        providerPaymentId:
          typeof refund.payment_intent === 'string'
            ? refund.payment_intent
            : refund.payment_intent?.id,
        providerObjectStatus: refund.status ?? undefined,
        providerReference: typeof refund.charge === 'string' ? refund.charge : refund.charge?.id,
        metadata,
        payload: event as unknown as Record<string, unknown>,
      });
    }

    const paymentIntent = event.data.object as StripePaymentIntentObject;
    const metadata = Object.fromEntries(
      Object.entries(paymentIntent.metadata ?? {}).map(([key, value]) => [key, String(value)]),
    );

    return Promise.resolve({
      provider: 'STRIPE',
      externalEventId: event.id,
      eventType: event.type,
      status: 'RECEIVED',
      providerPaymentId: paymentIntent.id,
      providerObjectStatus: paymentIntent.status,
      providerReference:
        typeof paymentIntent.latest_charge === 'string'
          ? paymentIntent.latest_charge
          : paymentIntent.latest_charge?.id,
      amount: paymentIntent.amount,
      amountReceived: paymentIntent.amount_received,
      currency: paymentIntent.currency,
      metadata,
      payload: event as unknown as Record<string, unknown>,
    });
  }

  async cancelPayment(providerPaymentId: string): Promise<PaymentGatewayCancelResult> {
    const appConfig = this.configService.getOrThrow<AppConfig>('app');
    if (!appConfig.stripeSecretKey?.trim()) {
      throw new BadRequestException('Stripe secret key is not configured');
    }

    const stripe = this.createStripeClient(appConfig.stripeSecretKey);
    try {
      const paymentIntent = await stripe.paymentIntents.cancel(providerPaymentId);
      return {
        providerPaymentId: paymentIntent.id,
        status: paymentIntent.status === 'succeeded' ? 'captured' : 'cancelled',
      };
    } catch (error) {
      const paymentIntent = await stripe.paymentIntents.retrieve(providerPaymentId);
      if (paymentIntent.status === 'succeeded') {
        return { providerPaymentId: paymentIntent.id, status: 'captured' };
      }
      if (paymentIntent.status === 'canceled') {
        return { providerPaymentId: paymentIntent.id, status: 'cancelled' };
      }
      throw error;
    }
  }

  async createRefund(params: PaymentGatewayRefundParams): Promise<PaymentGatewayRefundResult> {
    const appConfig = this.configService.getOrThrow<AppConfig>('app');
    if (!appConfig.stripeSecretKey?.trim()) {
      throw new BadRequestException('Stripe secret key is not configured');
    }

    const stripe = this.createStripeClient(appConfig.stripeSecretKey);
    const refund = await stripe.refunds.create(
      {
        payment_intent: params.providerPaymentId,
        amount: params.amount,
        metadata: params.metadata,
        reason: 'requested_by_customer',
      },
      { idempotencyKey: params.idempotencyKey },
    );

    if (refund.status === 'failed' || refund.status === 'canceled') {
      throw new BadRequestException(`Stripe refund failed with status "${refund.status}"`);
    }

    return {
      providerRefundId: refund.id,
      providerReference: typeof refund.charge === 'string' ? refund.charge : undefined,
      rawStatus: refund.status ?? 'unknown',
    };
  }

  private createStripeClient(secretKey: string) {
    return new Stripe(secretKey, {
      apiVersion: '2026-04-22.dahlia',
      maxNetworkRetries: 2,
      timeout: 10_000,
    });
  }
}
