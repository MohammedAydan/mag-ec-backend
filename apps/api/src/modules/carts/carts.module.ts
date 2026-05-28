import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { PromotionsModule } from '../promotions/promotions.module';
import { CartController } from './controllers/cart.controller';
import { CommerceSupportAdminController } from './controllers/commerce-support-admin.controller';
import { CartService } from './services/cart.service';

@Module({
  imports: [IdentityModule, PromotionsModule],
  controllers: [CartController, CommerceSupportAdminController],
  providers: [CartService],
  exports: [CartService],
})
export class CartsModule {}
