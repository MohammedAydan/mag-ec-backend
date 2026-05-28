import { BadRequestException, Inject, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

import type { AppConfig } from '../../../config/app.config';
import { CheckoutPaymentMethod } from '../../checkout/dto/checkout.dto';

@Injectable()
export class CodPaymentService {
  constructor(
    @Inject(ConfigService)
    private readonly configService: ConfigService,
  ) {}

  assertPlacementAllowed(paymentMethod: CheckoutPaymentMethod) {
    if (paymentMethod !== CheckoutPaymentMethod.CASH_ON_DELIVERY) {
      throw new BadRequestException('Only cash on delivery is available at this time');
    }

    const appConfig = this.configService.getOrThrow<AppConfig>('app');
    if (!['cod', 'stripe'].includes(appConfig.paymentProvider)) {
      throw new BadRequestException('Cash on delivery is not enabled for this environment');
    }

    return {
      paymentMethod: 'CASH_ON_DELIVERY' as const,
      paymentStatus: 'PENDING' as const,
    };
  }
}
