import { Body, Controller, Get, Inject, Post, Query, UseGuards } from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiForbiddenResponse,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';
import type { Prisma } from '@prisma/client';

import { coercePositiveInt } from '../../../common/http/query-int';
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
import {
  PaginatedStockMovementsDto,
  StockAdjustmentResponseDto,
  StockLevelResponseDto,
  StockReservationResponseDto,
} from '../dto/inventory-response.dto';
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
  @ApiOperation({ summary: 'Adjust stock quantity for a variant in a warehouse' })
  @ApiCreatedResponse({ type: StockAdjustmentResponseDto, description: 'Stock adjustment applied' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  adjustStock(
    @Body() body: AdjustStockDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.inventoryCoreService.adjustStock(
      body.warehouseId,
      body.variantId,
      body.quantityChanged,
      body.type,
      body.referenceType,
      body.referenceId,
      currentUser.sub,
      body.reason ? { reason: body.reason } : undefined,
    ) as unknown as StockAdjustmentResponseDto;
  }

  @Get('levels')
  @RequirePermissions(['inventory.read'])
  @ApiOperation({ summary: 'Query current stock levels with optional filters' })
  @ApiOkResponse({ type: [StockLevelResponseDto], description: 'Current stock levels' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  getStockLevels(@Query() query: QueryStockLevelsDto) {
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
    }) as unknown as StockLevelResponseDto[];
  }

  @Get('reservations')
  @RequirePermissions(['inventory.read'])
  @ApiOperation({ summary: 'Query stock reservations with optional filters and status' })
  @ApiOkResponse({ type: [StockReservationResponseDto], description: 'Stock reservations' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  getReservations(@Query() query: QueryStockReservationsDto) {
    const limit = coercePositiveInt(query.limit, 50);
    const where: Prisma.StockReservationWhereInput = {};
    if (query.warehouseId) where.warehouseId = query.warehouseId;
    if (query.variantId) where.variantId = query.variantId;
    if (query.status) where.status = query.status;

    return this.prisma.stockReservation.findMany({
      where,
      take: limit,
      orderBy: [{ expiresAt: 'asc' }, { id: 'asc' }],
      include: {
        variant: { select: { id: true, sku: true } },
        warehouse: { select: { id: true, key: true, name: true } },
        user: { select: { id: true, email: true, displayName: true } },
      },
    }) as unknown as StockReservationResponseDto[];
  }

  @Get('movements')
  @RequirePermissions(['inventory.read'])
  @ApiOperation({ summary: 'Query paginated stock movement history' })
  @ApiOkResponse({ type: PaginatedStockMovementsDto, description: 'Paginated stock movements' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  async getStockMovements(@Query() query: QueryStockMovementsDto): Promise<PaginatedStockMovementsDto> {
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

    const page = coercePositiveInt(query.page, 1);
    const limit = coercePositiveInt(query.limit, 20);
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
    } as unknown as PaginatedStockMovementsDto;
  }
}
