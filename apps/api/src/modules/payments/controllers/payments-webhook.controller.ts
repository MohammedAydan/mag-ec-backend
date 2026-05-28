import { Buffer } from 'node:buffer';

import { BadRequestException, Controller, Headers, HttpCode, Inject, Post, Req } from '@nestjs/common';
import { ApiExcludeController } from '@nestjs/swagger';
import { SkipThrottle } from '@nestjs/throttler';
import type { FastifyRequest } from 'fastify';

import { PaymentWebhookService } from '../services/payment-webhook.service';

@ApiExcludeController()
@Controller('payments/webhooks')
export class PaymentsWebhookController {
  constructor(@Inject(PaymentWebhookService) private readonly paymentWebhookService: PaymentWebhookService) {}

  @Post('stripe')
  @SkipThrottle()
  @HttpCode(200)
  async handleStripeWebhook(
    @Req() request: FastifyRequest & { rawBody?: Buffer | string },
    @Headers('stripe-signature') signature: string | undefined,
  ) {
    if (!signature?.trim()) {
      throw new BadRequestException('Missing Stripe signature header');
    }

    if (!request.rawBody) {
      throw new BadRequestException('Raw webhook body is unavailable');
    }

    return this.paymentWebhookService.handleStripeWebhook(request.rawBody, signature);
  }
}
