import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { WishlistController } from './controllers/wishlist.controller';
import { WishlistService } from './services/wishlist.service';

@Module({
  imports: [IdentityModule],
  controllers: [WishlistController],
  providers: [WishlistService],
  exports: [WishlistService],
})
export class WishlistModule {}
