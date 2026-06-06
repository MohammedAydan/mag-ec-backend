import { Controller, Delete, Get, Inject, Param, Post, UseGuards } from '@nestjs/common';
import { Body } from '@nestjs/common';
import { ApiBadRequestResponse, ApiBearerAuth, ApiCreatedResponse, ApiForbiddenResponse, ApiNotFoundResponse, ApiOkResponse, ApiOperation, ApiParam, ApiTags, ApiUnauthorizedResponse } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { CustomerGuard } from '../../identity/guards/customer.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { AddWishlistItemDto, WishlistResponseDto } from '../dto/wishlist.dto';
import { WishlistService } from '../services/wishlist.service';

@ApiTags('Wishlist')
@ApiBearerAuth()
@ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
@ApiForbiddenResponse({ description: 'Customer-only resource; admin/staff tokens are rejected' })
@UseGuards(AuthGuard, CustomerGuard)
@Controller('wishlist')
export class WishlistController {
  constructor(@Inject(WishlistService) private readonly wishlistService: WishlistService) {}

  @Get()
  @ApiOperation({ summary: 'Get the authenticated user wishlist' })
  @ApiOkResponse({ type: WishlistResponseDto, description: 'User wishlist' })
  async getWishlist(@CurrentUser() currentUser: AccessTokenPayload): Promise<WishlistResponseDto> {
    return this.wishlistService.getWishlist(currentUser.sub);
  }

  @Post('items')
  @ApiOperation({ summary: 'Add an item to the wishlist' })
  @ApiCreatedResponse({ type: WishlistResponseDto, description: 'Item added to wishlist' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async addItem(@CurrentUser() currentUser: AccessTokenPayload, @Body() body: AddWishlistItemDto): Promise<WishlistResponseDto> {
    return this.wishlistService.addItem(currentUser.sub, body.variantId);
  }

  @Delete('items/:variantId')
  @ApiOperation({ summary: 'Remove an item from the wishlist' })
  @ApiParam({ name: 'variantId', description: 'Product variant ID', required: true })
  @ApiOkResponse({ type: WishlistResponseDto, description: 'Item removed from wishlist' })
  @ApiNotFoundResponse({ description: 'Wishlist item not found' })
  async removeItem(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Param('variantId') variantId: string,
  ): Promise<WishlistResponseDto> {
    return this.wishlistService.removeItem(currentUser.sub, variantId);
  }
}
