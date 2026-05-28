import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { MoneyService } from '../pricing/services/money.service';
import { PromotionsAdminController } from './controllers/promotions-admin.controller';
import { CouponNormalizerService } from './services/coupon-normalizer.service';
import { PromotionAdminService } from './services/promotion-admin.service';
import { PromotionEvaluatorService } from './services/promotion-evaluator.service';
import { PromotionUsageService } from './services/promotion-usage.service';

@Module({
  imports: [IdentityModule],
  controllers: [PromotionsAdminController],
  providers: [
    MoneyService,
    CouponNormalizerService,
    PromotionAdminService,
    PromotionEvaluatorService,
    PromotionUsageService,
  ],
  exports: [
    CouponNormalizerService,
    PromotionAdminService,
    PromotionEvaluatorService,
    PromotionUsageService,
  ],
})
export class PromotionsModule {}
