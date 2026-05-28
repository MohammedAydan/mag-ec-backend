import { Body, Controller, Inject, Param, Put, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type {
  UpdatePricingBehaviorDto,
  UpdateStoreCurrencyDto,
  UpsertManualTaxRateDto,
  UpsertShippingMethodDto,
  UpsertShippingZoneDto,
  UpsertTaxClassDto,
  UpsertVariantPriceDto,
} from '../dto/pricing-admin.dto';
import { PricingAdminService } from '../services/pricing-admin.service';

@ApiTags('Pricing Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['pricing.write'])
@Controller('pricing/admin')
export class PricingAdminController {
  constructor(@Inject(PricingAdminService) private readonly pricingAdminService: PricingAdminService) {}

  @Put('settings/currency')
  updateStoreCurrency(@Body() dto: UpdateStoreCurrencyDto) {
    return this.pricingAdminService.updateStoreCurrency(dto);
  }

  @Put('settings/behavior')
  updatePricingBehavior(@Body() dto: UpdatePricingBehaviorDto) {
    return this.pricingAdminService.updatePricingBehavior(dto);
  }

  @Put('variants/:variantId/price')
  upsertVariantPrice(@Param('variantId') variantId: string, @Body() dto: UpsertVariantPriceDto) {
    return this.pricingAdminService.upsertVariantPrice(variantId, dto);
  }

  @Put('tax-classes/:key')
  upsertTaxClass(@Param('key') key: string, @Body() dto: UpsertTaxClassDto) {
    return this.pricingAdminService.upsertTaxClass(key, dto);
  }

  @Put('tax-classes/:taxClassId/rates/:countryCode')
  upsertManualTaxRate(
    @Param('taxClassId') taxClassId: string,
    @Param('countryCode') countryCode: string,
    @Body() dto: UpsertManualTaxRateDto,
  ) {
    return this.pricingAdminService.upsertManualTaxRate(taxClassId, countryCode, dto);
  }

  @Put('shipping-zones/:key')
  upsertShippingZone(@Param('key') key: string, @Body() dto: UpsertShippingZoneDto) {
    return this.pricingAdminService.upsertShippingZone(key, dto);
  }

  @Put('shipping-zones/:zoneId/methods/:key')
  upsertShippingMethod(
    @Param('zoneId') zoneId: string,
    @Param('key') key: string,
    @Body() dto: UpsertShippingMethodDto,
  ) {
    return this.pricingAdminService.upsertShippingMethod(zoneId, key, dto);
  }
}
