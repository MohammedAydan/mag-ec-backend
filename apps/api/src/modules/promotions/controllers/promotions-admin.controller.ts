import { Body, Controller, Get, Inject, Param, Put, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import type { UpsertCouponDto, UpsertPromotionDto } from '../dto/promotions-admin.dto';
import { PromotionAdminService } from '../services/promotion-admin.service';

@ApiTags('Promotions Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['promotions.read'])
@Controller('promotions/admin')
export class PromotionsAdminController {
  constructor(@Inject(PromotionAdminService) private readonly promotionAdminService: PromotionAdminService) {}

  @Get()
  listPromotions() {
    return this.promotionAdminService.listPromotions();
  }

  @Get(':promotionId')
  getPromotion(@Param('promotionId') promotionId: string) {
    return this.promotionAdminService.getPromotion(promotionId);
  }

  @Put(':promotionKey')
  @RequirePermissions(['promotions.write'])
  upsertPromotion(
    @Param('promotionKey') promotionKey: string,
    @Body() dto: UpsertPromotionDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.promotionAdminService.upsertPromotion(promotionKey, dto, currentUser.sub);
  }

  @Put(':promotionId/coupons/:code')
  @RequirePermissions(['promotions.write'])
  upsertCoupon(
    @Param('promotionId') promotionId: string,
    @Param('code') code: string,
    @Body() dto: UpsertCouponDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.promotionAdminService.upsertCoupon(promotionId, { ...dto, code }, currentUser.sub);
  }
}
