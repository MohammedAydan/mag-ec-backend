import { Module } from '@nestjs/common';

import { CartsModule } from '../carts/carts.module';
import { IdentityModule } from '../identity/identity.module';
import { InventoryModule } from '../inventory/inventory.module';
import { OrdersModule } from '../orders/orders.module';
import { PaymentsModule } from '../payments/payments.module';
import { PersistenceModule } from '../persistence/persistence.module';
import { PricingModule } from '../pricing/pricing.module';
import { PromotionsModule } from '../promotions/promotions.module';
import { CheckoutController } from './controllers/checkout.controller';
import { CheckoutIdempotencyService } from './services/checkout-idempotency.service';
import { CheckoutPlacementService } from './services/checkout-placement.service';
import { CheckoutPreviewService } from './services/checkout-preview.service';

@Module({
  imports: [
    IdentityModule,
    PricingModule,
    InventoryModule,
    CartsModule,
    PersistenceModule,
    OrdersModule,
    PaymentsModule,
    PromotionsModule,
  ],
  controllers: [CheckoutController],
  providers: [CheckoutPreviewService, CheckoutIdempotencyService, CheckoutPlacementService],
  exports: [CheckoutPreviewService, CheckoutPlacementService],
})
export class CheckoutModule {}
