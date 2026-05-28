import { Controller, Delete, Get, Inject, Param, Post, UseGuards } from '@nestjs/common';
import { Body } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { AddWishlistItemDto } from '../dto/wishlist.dto';
import { WishlistService } from '../services/wishlist.service';

@ApiTags('Wishlist')
@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('wishlist')
export class WishlistController {
  constructor(@Inject(WishlistService) private readonly wishlistService: WishlistService) {}

  @Get()
  async getWishlist(@CurrentUser() currentUser: AccessTokenPayload) {
    return this.wishlistService.getWishlist(currentUser.sub);
  }

  @Post('items')
  async addItem(@CurrentUser() currentUser: AccessTokenPayload, @Body() body: AddWishlistItemDto) {
    return this.wishlistService.addItem(currentUser.sub, body.variantId);
  }

  @Delete('items/:variantId')
  async removeItem(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Param('variantId') variantId: string,
  ) {
    return this.wishlistService.removeItem(currentUser.sub, variantId);
  }
}
