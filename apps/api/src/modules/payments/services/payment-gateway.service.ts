import { BadRequestException, Inject, Injectable, NotImplementedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

import type { AppConfig } from '../../../config/app.config';
import { CheckoutPaymentMethod } from '../../checkout/dto/checkout.dto';
import { PAYMENT_GATEWAY } from '../payments.constants';
import type {
  PaymentGateway,
  PaymentGatewayCreatePaymentParams,
  PaymentGatewayRefundParams,
  VerifiedPaymentWebhookEvent,
} from '../payments.types';

@Injectable()
export class PaymentGatewayService {
  constructor(
    @Inject(ConfigService)
    private readonly configService: ConfigService,
    @Inject(PAYMENT_GATEWAY)
    private readonly paymentGateway: PaymentGateway,
  ) {}

  isOnlinePaymentEnabled() {
    return this.configService.getOrThrow<AppConfig>('app').paymentProvider === 'stripe';
  }

  assertCheckoutMethodAllowed(paymentMethod: CheckoutPaymentMethod) {
    if (paymentMethod === CheckoutPaymentMethod.CASH_ON_DELIVERY) {
      return;
    }

    if (paymentMethod === CheckoutPaymentMethod.ONLINE_CARD && this.isOnlinePaymentEnabled()) {
      return;
    }

    throw new BadRequestException('Selected payment method is not enabled for this environment');
  }

  async createOnlinePayment(
    paymentMethod: CheckoutPaymentMethod,
    params: PaymentGatewayCreatePaymentParams,
  ) {
    if (paymentMethod !== CheckoutPaymentMethod.ONLINE_CARD) {
      throw new BadRequestException(
        'Only online-card payments can create provider payment attempts',
      );
    }

    if (!this.isOnlinePaymentEnabled()) {
      throw new BadRequestException('Online card payments are not enabled for this environment');
    }

    return this.paymentGateway.createPayment(params);
  }

  async verifyStripeWebhook(
    payload: Buffer | string,
    signature: string,
  ): Promise<VerifiedPaymentWebhookEvent> {
    if (!this.isOnlinePaymentEnabled()) {
      throw new NotImplementedException('Stripe webhooks are not enabled in this environment');
    }

    return this.paymentGateway.verifyWebhook(payload, signature);
  }

  async cancelOnlinePayment(providerPaymentId: string) {
    if (!this.isOnlinePaymentEnabled()) {
      throw new NotImplementedException(
        'Provider payment cancellation is not enabled in this environment',
      );
    }

    return this.paymentGateway.cancelPayment(providerPaymentId);
  }

  async createRefund(params: PaymentGatewayRefundParams) {
    if (!this.isOnlinePaymentEnabled()) {
      throw new NotImplementedException('Provider refunds are not enabled in this environment');
    }

    return this.paymentGateway.createRefund(params);
  }
}
