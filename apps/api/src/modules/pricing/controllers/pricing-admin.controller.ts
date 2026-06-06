import { Body, Controller, Get, Inject, Param, Put, UseGuards } from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import {
  UpdatePricingBehaviorDto,
  UpdateStoreCurrencyDto,
  UpsertManualTaxRateDto,
  UpsertShippingMethodDto,
  UpsertShippingZoneDto,
  UpsertTaxClassDto,
  UpsertVariantPriceDto,
} from '../dto/pricing-admin.dto';
import { PricingAdminService } from '../services/pricing-admin.service';
import {
  ManualTaxRateResponseDto,
  ShippingMethodResponseDto,
  ShippingZoneResponseDto,
  StoreSettingResponseDto,
  TaxClassResponseDto,
  VariantPriceResponseDto,
} from '../dto/pricing-response.dto';

@ApiTags('Pricing Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['pricing.write'])
@Controller('pricing/admin')
export class PricingAdminController {
  constructor(
    @Inject(PricingAdminService) private readonly pricingAdminService: PricingAdminService,
  ) {}

  @Get('settings/currency')
  @ApiOperation({ summary: 'Get the current store currency settings' })
  @ApiOkResponse({ type: StoreSettingResponseDto, description: 'Current store currency settings' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  async getStoreCurrency(): Promise<StoreSettingResponseDto> {
    return this.pricingAdminService.getStoreCurrency();
  }

  @Put('settings/currency')
  @ApiOperation({ summary: 'Update the default store currency' })
  @ApiOkResponse({ type: StoreSettingResponseDto, description: 'Store currency updated' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async updateStoreCurrency(@Body() dto: UpdateStoreCurrencyDto): Promise<StoreSettingResponseDto> {
    return this.pricingAdminService.updateStoreCurrency(dto);
  }

  @Get('settings/behavior')
  @ApiOperation({ summary: 'Get the current pricing behavior settings' })
  @ApiOkResponse({ type: StoreSettingResponseDto, description: 'Current pricing behavior settings' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  async getPricingBehavior(): Promise<StoreSettingResponseDto> {
    return this.pricingAdminService.getPricingBehavior();
  }

  @Put('settings/behavior')
  @ApiOperation({ summary: 'Update pricing behavior (tax inclusion, defaults)' })
  @ApiOkResponse({ type: StoreSettingResponseDto, description: 'Pricing behavior updated' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async updatePricingBehavior(@Body() dto: UpdatePricingBehaviorDto): Promise<StoreSettingResponseDto> {
    return this.pricingAdminService.updatePricingBehavior(dto);
  }

  @Put('variants/:variantId/price')
  @ApiOperation({ summary: 'Upsert variant price for a given currency' })
  @ApiParam({ name: 'variantId', description: 'Unique identifier of the catalog variant' })
  @ApiOkResponse({ type: VariantPriceResponseDto, description: 'Variant price upserted' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async upsertVariantPrice(
    @Param('variantId') variantId: string,
    @Body() dto: UpsertVariantPriceDto,
  ): Promise<VariantPriceResponseDto> {
    return this.pricingAdminService.upsertVariantPrice(variantId, dto);
  }

  @Get('tax-classes/:key')
  @ApiOperation({ summary: 'Get a tax class by key' })
  @ApiParam({ name: 'key', description: 'Unique key of the tax class' })
  @ApiOkResponse({ type: TaxClassResponseDto, description: 'Tax class found' })
  @ApiNotFoundResponse({ description: 'Tax class not found' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  async getTaxClass(@Param('key') key: string): Promise<TaxClassResponseDto> {
    return this.pricingAdminService.getTaxClass(key);
  }

  @Put('tax-classes/:key')
  @ApiOperation({ summary: 'Upsert a tax class by key' })
  @ApiParam({ name: 'key', description: 'Unique key of the tax class' })
  @ApiOkResponse({ type: TaxClassResponseDto, description: 'Tax class upserted' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async upsertTaxClass(
    @Param('key') key: string,
    @Body() dto: UpsertTaxClassDto,
  ): Promise<TaxClassResponseDto> {
    return this.pricingAdminService.upsertTaxClass(key, dto);
  }

  @Put('tax-classes/:taxClassId/rates/:countryCode')
  @ApiOperation({ summary: 'Upsert a manual tax rate for a tax class and country' })
  @ApiParam({ name: 'taxClassId', description: 'Unique identifier of the tax class' })
  @ApiParam({ name: 'countryCode', description: 'ISO 3166-1 alpha-2 country code' })
  @ApiOkResponse({ type: ManualTaxRateResponseDto, description: 'Manual tax rate upserted' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async upsertManualTaxRate(
    @Param('taxClassId') taxClassId: string,
    @Param('countryCode') countryCode: string,
    @Body() dto: UpsertManualTaxRateDto,
  ): Promise<ManualTaxRateResponseDto> {
    return this.pricingAdminService.upsertManualTaxRate(taxClassId, countryCode, dto);
  }

  @Get('shipping-zones/:key')
  @ApiOperation({ summary: 'Get a shipping zone by key' })
  @ApiParam({ name: 'key', description: 'Unique key of the shipping zone' })
  @ApiOkResponse({ type: ShippingZoneResponseDto, description: 'Shipping zone found' })
  @ApiNotFoundResponse({ description: 'Shipping zone not found' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  async getShippingZone(@Param('key') key: string): Promise<ShippingZoneResponseDto> {
    return this.pricingAdminService.getShippingZone(key);
  }

  @Put('shipping-zones/:key')
  @ApiOperation({ summary: 'Upsert a shipping zone by key' })
  @ApiParam({ name: 'key', description: 'Unique key of the shipping zone' })
  @ApiOkResponse({ type: ShippingZoneResponseDto, description: 'Shipping zone upserted' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async upsertShippingZone(
    @Param('key') key: string,
    @Body() dto: UpsertShippingZoneDto,
  ): Promise<ShippingZoneResponseDto> {
    return this.pricingAdminService.upsertShippingZone(key, dto);
  }

  @Put('shipping-zones/:zoneId/methods/:key')
  @ApiOperation({ summary: 'Upsert a shipping method within a shipping zone' })
  @ApiParam({ name: 'zoneId', description: 'Unique identifier of the shipping zone' })
  @ApiParam({ name: 'key', description: 'Unique key of the shipping method' })
  @ApiOkResponse({ type: ShippingMethodResponseDto, description: 'Shipping method upserted' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async upsertShippingMethod(
    @Param('zoneId') zoneId: string,
    @Param('key') key: string,
    @Body() dto: UpsertShippingMethodDto,
  ): Promise<ShippingMethodResponseDto> {
    return this.pricingAdminService.upsertShippingMethod(zoneId, key, dto);
  }
}
