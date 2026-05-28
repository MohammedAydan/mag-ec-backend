import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import Stripe from 'stripe';

import type { WorkerConfig } from '../config/worker.config';

type CancellationResult = 'cancelled' | 'captured';
type StripeClient = InstanceType<typeof Stripe>;

@Injectable()
export class StripePaymentLifecycleService {
  private readonly config: WorkerConfig;
  private readonly stripe: StripeClient | null;

  constructor(configService: ConfigService) {
    this.config = configService.getOrThrow<WorkerConfig>('worker');
    this.stripe = this.config.stripeSecretKey
      ? new Stripe(this.config.stripeSecretKey, { maxNetworkRetries: 2, timeout: 10_000 })
      : null;
  }

  async cancelUncapturedPaymentIntent(paymentIntentId: string): Promise<CancellationResult> {
    if (this.config.paymentProvider !== 'stripe' || !this.stripe) {
      throw new Error('Stripe payment lifecycle integration is not configured');
    }

    try {
      const paymentIntent = await this.stripe.paymentIntents.cancel(paymentIntentId);
      return paymentIntent.status === 'succeeded' ? 'captured' : 'cancelled';
    } catch (error) {
      const paymentIntent = await this.stripe.paymentIntents.retrieve(paymentIntentId);
      if (paymentIntent.status === 'succeeded') {
        return 'captured';
      }
      if (paymentIntent.status === 'canceled') {
        return 'cancelled';
      }
      throw error;
    }
  }
}
