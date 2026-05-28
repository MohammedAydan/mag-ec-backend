import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { PromotionsModule } from '../promotions/promotions.module';
import { PricingAdminController } from './controllers/pricing-admin.controller';
import { PricingPublicController } from './controllers/pricing-public.controller';
import { TAX_STRATEGY } from './pricing.constants';
import { ManualTaxStrategyService } from './services/manual-tax-strategy.service';
import { MoneyService } from './services/money.service';
import { PricingAdminService } from './services/pricing-admin.service';
import { PricingPreviewService } from './services/pricing-preview.service';
import { ShippingService } from './services/shipping.service';

@Module({
  imports: [IdentityModule, PromotionsModule],
  controllers: [PricingAdminController, PricingPublicController],
  providers: [
    MoneyService,
    ShippingService,
    ManualTaxStrategyService,
    PricingAdminService,
    PricingPreviewService,
    {
      provide: TAX_STRATEGY,
      useExisting: ManualTaxStrategyService,
    },
  ],
  exports: [
    MoneyService,
    ShippingService,
    PricingAdminService,
    PricingPreviewService,
    TAX_STRATEGY,
  ],
})
export class PricingModule {}
