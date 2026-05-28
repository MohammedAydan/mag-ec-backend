import { Controller, Get, Inject, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AdminGuard } from '../../identity/guards/admin.guard';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { PrismaService } from '../../persistence/services/prisma.service';

@ApiTags('Commerce Support Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['orders.read'])
@Controller('support/admin')
export class CommerceSupportAdminController {
  constructor(@Inject(PrismaService) private readonly prisma: PrismaService) {}

  @Get('carts')
  listActiveCarts() {
    return this.prisma.cart.findMany({
      where: { status: 'ACTIVE' },
      take: 50,
      orderBy: [{ updatedAt: 'desc' }, { id: 'desc' }],
      select: {
        id: true,
        status: true,
        couponCode: true,
        createdAt: true,
        updatedAt: true,
        user: { select: { id: true, email: true, displayName: true } },
        items: {
          select: {
            quantity: true,
            variant: { select: { id: true, sku: true } },
          },
        },
      },
    });
  }

  @Get('wishlists')
  listWishlists() {
    return this.prisma.wishlist.findMany({
      take: 50,
      orderBy: [{ updatedAt: 'desc' }, { id: 'desc' }],
      select: {
        id: true,
        createdAt: true,
        updatedAt: true,
        user: { select: { id: true, email: true, displayName: true } },
        items: {
          select: {
            variant: { select: { id: true, sku: true } },
          },
        },
      },
    });
  }
}
