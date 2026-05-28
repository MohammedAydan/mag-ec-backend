import { Body, Controller, Get, Inject, Post, Query, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import type { Prisma } from '@prisma/client';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { PrismaService } from '../../persistence/services/prisma.service';
import {
  AdjustStockDto,
  QueryStockLevelsDto,
  QueryStockMovementsDto,
  QueryStockReservationsDto,
} from '../dto/inventory-admin.dto';
import { InventoryCoreService } from '../services/inventory-core.service';

@ApiTags('Inventory Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@Controller('inventory/admin')
export class InventoryAdminController {
  constructor(
    @Inject(InventoryCoreService) private readonly inventoryCoreService: InventoryCoreService,
    @Inject(PrismaService) private readonly prisma: PrismaService,
  ) {}

  @Post('adjustments')
  @RequirePermissions(['inventory.write'])
  async adjustStock(@Body() body: AdjustStockDto, @CurrentUser() currentUser: AccessTokenPayload) {
    return this.inventoryCoreService.adjustStock(
      body.warehouseId,
      body.variantId,
      body.quantityChanged,
      body.type,
      body.referenceType,
      body.referenceId,
      currentUser.sub,
      body.reason ? { reason: body.reason } : undefined,
    );
  }

  @Get('levels')
  @RequirePermissions(['inventory.read'])
  async getStockLevels(@Query() query: QueryStockLevelsDto) {
    const where: Prisma.StockLevelWhereInput = {};
    if (query.warehouseId) {
      where.warehouseId = query.warehouseId;
    }
    if (query.variantId) {
      where.variantId = query.variantId;
    }
    if (query.sku) {
      where.variant = { sku: query.sku };
    }

    return this.prisma.stockLevel.findMany({
      where,
      include: {
        variant: {
          select: {
            id: true,
            sku: true,
            isDefault: true,
          },
        },
        warehouse: {
          select: {
            id: true,
            key: true,
            name: true,
          },
        },
      },
    });
  }

  @Get('reservations')
  @RequirePermissions(['inventory.read'])
  async getReservations(@Query() query: QueryStockReservationsDto) {
    const where: Prisma.StockReservationWhereInput = {};
    if (query.warehouseId) where.warehouseId = query.warehouseId;
    if (query.variantId) where.variantId = query.variantId;
    if (query.status) where.status = query.status;

    return this.prisma.stockReservation.findMany({
      where,
      take: query.limit ?? 50,
      orderBy: [{ expiresAt: 'asc' }, { id: 'asc' }],
      include: {
        variant: { select: { id: true, sku: true } },
        warehouse: { select: { id: true, key: true, name: true } },
        user: { select: { id: true, email: true, displayName: true } },
      },
    });
  }

  @Get('movements')
  @RequirePermissions(['inventory.read'])
  async getStockMovements(@Query() query: QueryStockMovementsDto) {
    const where: Prisma.StockMovementWhereInput = {};
    if (query.warehouseId) {
      where.warehouseId = query.warehouseId;
    }
    if (query.variantId) {
      where.variantId = query.variantId;
    }
    if (query.type) {
      where.type = query.type;
    }

    const page = query.page || 1;
    const limit = query.limit || 20;
    const skip = (page - 1) * limit;

    const [items, total] = await Promise.all([
      this.prisma.stockMovement.findMany({
        where,
        skip,
        take: limit,
        orderBy: { createdAt: 'desc' },
        include: {
          variant: {
            select: {
              id: true,
              sku: true,
            },
          },
          warehouse: {
            select: {
              id: true,
              key: true,
              name: true,
            },
          },
          actorUser: {
            select: {
              id: true,
              displayName: true,
              email: true,
            },
          },
        },
      }),
      this.prisma.stockMovement.count({ where }),
    ]);

    return {
      items,
      pagination: {
        page,
        limit,
        total,
        totalPages: Math.ceil(total / limit),
      },
    };
  }
}
