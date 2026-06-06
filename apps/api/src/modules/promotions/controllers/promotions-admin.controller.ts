import { Body, Controller, Get, Inject, Param, Post, Put, UseGuards } from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { UpsertCouponDto, UpsertPromotionDto } from '../dto/promotions-admin.dto';
import { PromotionAdminService } from '../services/promotion-admin.service';
import { CouponResponseDto, PromotionResponseDto } from '../dto/promotions-response.dto';

@ApiTags('Promotions Admin')
@ApiBearerAuth()
@ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
@ApiForbiddenResponse({ description: 'Insufficient permissions' })
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['promotions.read'])
@Controller('promotions/admin')
export class PromotionsAdminController {
  constructor(@Inject(PromotionAdminService) private readonly promotionAdminService: PromotionAdminService) {}

  @Post()
  @RequirePermissions(['promotions.write'])
  @ApiOperation({ summary: 'Create a new promotion (auto-generates key)' })
  @ApiCreatedResponse({ type: PromotionResponseDto, description: 'Promotion created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async createPromotion(
    @Body() dto: UpsertPromotionDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    const key = dto.name
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '')
      .substring(0, 80);
    return this.promotionAdminService.upsertPromotion(key, dto, currentUser.sub);
  }

  @Get()
  @ApiOperation({ summary: 'List all promotions' })
  @ApiOkResponse({ type: [PromotionResponseDto], description: 'All promotions' })
  async listPromotions() {
    return this.promotionAdminService.listPromotions();
  }

  @Get(':promotionId')
  @ApiOperation({ summary: 'Get a single promotion by ID' })
  @ApiParam({ name: 'promotionId', description: 'Promotion ID', type: String })
  @ApiOkResponse({ type: PromotionResponseDto, description: 'Promotion details' })
  @ApiNotFoundResponse({ description: 'Promotion not found' })
  async getPromotion(@Param('promotionId') promotionId: string) {
    return this.promotionAdminService.getPromotion(promotionId);
  }

  @Put('by-key/:promotionKey')
  @RequirePermissions(['promotions.write'])
  @ApiOperation({ summary: 'Create or update a promotion by key' })
  @ApiParam({ name: 'promotionKey', description: 'Unique promotion key', type: String })
  @ApiOkResponse({ type: PromotionResponseDto, description: 'Promotion created or updated' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async upsertPromotion(
    @Param('promotionKey') promotionKey: string,
    @Body() dto: UpsertPromotionDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.promotionAdminService.upsertPromotion(promotionKey, dto, currentUser.sub);
  }

  @Put(':promotionId/coupons/:code')
  @RequirePermissions(['promotions.write'])
  @ApiOperation({ summary: 'Create or update a coupon for a promotion' })
  @ApiParam({ name: 'promotionId', description: 'Promotion ID', type: String })
  @ApiParam({ name: 'code', description: 'Coupon code', type: String })
  @ApiOkResponse({ type: CouponResponseDto, description: 'Coupon created or updated' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Promotion not found' })
  async upsertCoupon(
    @Param('promotionId') promotionId: string,
    @Param('code') code: string,
    @Body() dto: UpsertCouponDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.promotionAdminService.upsertCoupon(promotionId, { ...dto, code }, currentUser.sub);
  }
}
