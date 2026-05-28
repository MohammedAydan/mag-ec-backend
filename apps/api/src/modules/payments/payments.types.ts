import type {
  PaymentAttemptStatus,
  PaymentMethodType,
  PaymentProviderType,
  PaymentWebhookStatus,
} from '@prisma/client';

export type PaymentGatewayCreatePaymentParams = {
  orderId: string;
  orderNumber: string;
  amount: number;
  currencyCode: string;
  customerEmail: string;
  idempotencyKey: string;
  metadata: Record<string, string>;
};

export type PaymentGatewayCreatePaymentResult = {
  provider: PaymentProviderType;
  method: PaymentMethodType;
  status: PaymentAttemptStatus;
  providerPaymentId: string;
  clientSecret?: string;
  checkoutUrl?: string;
  providerIntentStatus?: string;
  providerReference?: string;
};

export type VerifiedPaymentWebhookEvent = {
  provider: PaymentProviderType;
  externalEventId: string;
  eventType: string;
  status: PaymentWebhookStatus;
  providerPaymentId?: string;
  providerRefundId?: string;
  providerObjectStatus?: string;
  providerReference?: string;
  metadata: Record<string, string>;
  payload: Record<string, unknown>;
};

export type PaymentGatewayRefundParams = {
  providerPaymentId: string;
  amount: number;
  currencyCode: string;
  reason?: string;
  metadata: Record<string, string>;
  idempotencyKey: string;
};

export type PaymentGatewayCancelResult = {
  providerPaymentId: string;
  status: 'cancelled' | 'captured';
};

export type PaymentGatewayRefundResult = {
  providerRefundId: string;
  providerReference?: string;
  rawStatus: string;
};

export interface PaymentGateway {
  createPayment(
    params: PaymentGatewayCreatePaymentParams,
  ): Promise<PaymentGatewayCreatePaymentResult>;

  verifyWebhook(payload: Buffer | string, signature: string): Promise<VerifiedPaymentWebhookEvent>;

  cancelPayment(providerPaymentId: string): Promise<PaymentGatewayCancelResult>;

  createRefund(params: PaymentGatewayRefundParams): Promise<PaymentGatewayRefundResult>;
}
