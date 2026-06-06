import { Controller, Get, Inject, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiForbiddenResponse, ApiOkResponse, ApiOperation, ApiTags, ApiUnauthorizedResponse } from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AdminGuard } from '../../identity/guards/admin.guard';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { PrismaService } from '../../persistence/services/prisma.service';
import { CartResponseDto } from '../dto/cart.dto';
import { WishlistResponseDto } from '../../wishlist/dto/wishlist.dto';

@ApiTags('Commerce Support Admin')
@ApiBearerAuth()
@ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
@ApiForbiddenResponse({ description: 'Insufficient permissions' })
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['orders.read'])
@Controller('support/admin')
export class CommerceSupportAdminController {
  constructor(@Inject(PrismaService) private readonly prisma: PrismaService) {}

  @Get('carts')
  @ApiOperation({ summary: 'List active carts for support review' })
  @ApiOkResponse({ type: [CartResponseDto], description: 'Active carts (support view)' })
  listActiveCarts(): Promise<CartResponseDto[]> {
    return this.prisma.cart
      .findMany({
        where: { status: 'ACTIVE' },
        take: 50,
        orderBy: [{ updatedAt: 'desc' }, { id: 'desc' }],
        select: {
          id: true,
          guestToken: true,
          userId: true,
          status: true,
          couponCode: true,
          createdAt: true,
          updatedAt: true,
          user: { select: { id: true, email: true, displayName: true } },
          items: {
            select: {
              id: true,
              variantId: true,
              quantity: true,
              variant: { select: { id: true, sku: true } },
            },
          },
        },
      })
      .then((carts) =>
        carts.map((cart) => ({
          id: cart.id,
          guestToken: null,
          status: cart.status,
          couponCode: cart.couponCode,
          userId: cart.userId,
          createdAt: cart.createdAt.toISOString(),
          updatedAt: cart.updatedAt.toISOString(),
          items: cart.items.map((item) => ({
            id: item.id,
            variantId: item.variantId,
            quantity: item.quantity,
          })),
        })),
      );
  }

  @Get('wishlists')
  @ApiOperation({ summary: 'List active wishlists for support review' })
  @ApiOkResponse({ type: [WishlistResponseDto], description: 'Active wishlists (support view)' })
  listWishlists(): Promise<WishlistResponseDto[]> {
    return this.prisma.wishlist
      .findMany({
        take: 50,
        orderBy: [{ updatedAt: 'desc' }, { id: 'desc' }],
        select: {
          id: true,
          userId: true,
          createdAt: true,
          updatedAt: true,
          user: { select: { id: true, email: true, displayName: true } },
          items: {
            select: {
              id: true,
              variantId: true,
              createdAt: true,
              variant: { select: { id: true, sku: true } },
            },
          },
        },
      })
      .then((wishlists) =>
        wishlists.map((wishlist) => ({
          id: wishlist.id,
          userId: wishlist.userId,
          items: wishlist.items.map((item) => ({
            id: item.id,
            variantId: item.variantId,
            addedAt: item.createdAt.toISOString(),
          })),
          itemCount: wishlist.items.length,
        })),
      );
  }
}
