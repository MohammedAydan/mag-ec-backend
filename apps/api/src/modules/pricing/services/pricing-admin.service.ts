import { BadRequestException, Inject, Injectable, NotFoundException } from '@nestjs/common';

import { PrismaService } from '../../persistence/services/prisma.service';
import type {
  UpdatePricingBehaviorDto,
  UpdateStoreCurrencyDto,
  UpsertManualTaxRateDto,
  UpsertShippingMethodDto,
  UpsertShippingZoneDto,
  UpsertTaxClassDto,
  UpsertVariantPriceDto,
} from '../dto/pricing-admin.dto';
import type {
  ManualTaxRateResponseDto,
  ShippingMethodResponseDto,
  ShippingZoneResponseDto,
  StoreSettingResponseDto,
  TaxClassResponseDto,
  VariantPriceResponseDto,
} from '../dto/pricing-response.dto';
import { MoneyService } from './money.service';
import { ShippingService } from './shipping.service';

@Injectable()
export class PricingAdminService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(MoneyService) private readonly moneyService: MoneyService,
    @Inject(ShippingService) private readonly shippingService: ShippingService,
  ) {}

  async getStoreCurrency(): Promise<StoreSettingResponseDto> {
    const setting = await this.prisma.storeSetting.findUnique({
      where: { key: 'store.currency' },
    });
    if (!setting) {
      throw new NotFoundException('Store currency setting not found; seed data may be missing');
    }
    return this.serializeStoreSetting(setting);
  }

  async getPricingBehavior(): Promise<StoreSettingResponseDto> {
    const setting = await this.prisma.storeSetting.findUnique({
      where: { key: 'store.pricing' },
    });
    if (!setting) {
      throw new NotFoundException('Pricing behavior setting not found; seed data may be missing');
    }
    return this.serializeStoreSetting(setting);
  }

  async updateStoreCurrency(dto: UpdateStoreCurrencyDto) {
    const currencyCode = this.moneyService.normalizeCurrencyCode(dto.currencyCode);

    return this.serializeStoreSetting(
      await this.prisma.storeSetting.upsert({
        where: { key: 'store.currency' },
        update: {
          value: {
            code: currencyCode,
            symbol: dto.symbol.trim(),
            minorUnit: dto.minorUnit,
          },
          description: 'Default store currency configuration.',
          isPublic: true,
        },
        create: {
          key: 'store.currency',
          value: {
            code: currencyCode,
            symbol: dto.symbol.trim(),
            minorUnit: dto.minorUnit,
          },
          description: 'Default store currency configuration.',
          isPublic: true,
        },
      }),
    );
  }

  async updatePricingBehavior(dto: UpdatePricingBehaviorDto) {
    return this.serializeStoreSetting(
      await this.prisma.storeSetting.upsert({
        where: { key: 'store.pricing' },
        update: {
          value: {
            pricesIncludeTax: dto.pricesIncludeTax,
            defaultTaxCountryCode: dto.defaultTaxCountryCode?.trim().toUpperCase() ?? null,
            shippingCurrencyCode: dto.shippingCurrencyCode?.trim().toUpperCase() ?? null,
          },
          description: 'Pricing behavior defaults for tax and shipping policy.',
          isPublic: false,
        },
        create: {
          key: 'store.pricing',
          value: {
            pricesIncludeTax: dto.pricesIncludeTax,
            defaultTaxCountryCode: dto.defaultTaxCountryCode?.trim().toUpperCase() ?? null,
            shippingCurrencyCode: dto.shippingCurrencyCode?.trim().toUpperCase() ?? null,
          },
          description: 'Pricing behavior defaults for tax and shipping policy.',
          isPublic: false,
        },
      }),
    );
  }

  async upsertVariantPrice(variantId: string, dto: UpsertVariantPriceDto) {
    const variant = await this.prisma.catalogProductVariant.findUnique({
      where: { id: variantId },
      select: { id: true },
    });

    if (!variant) {
      throw new NotFoundException('Catalog product variant not found');
    }

    if (dto.saleAmount !== undefined && dto.saleAmount > dto.baseAmount) {
      throw new BadRequestException('Sale amount cannot exceed base amount');
    }

    if (dto.saleStartsAt && dto.saleEndsAt && dto.saleStartsAt > dto.saleEndsAt) {
      throw new BadRequestException('Sale start must be before sale end');
    }

    if (dto.taxClassId) {
      await this.findTaxClassOrThrow(dto.taxClassId);
    }

    return this.serializeVariantPrice(
      await this.prisma.catalogVariantPrice.upsert({
        where: { variantId },
        update: {
          currencyCode: this.moneyService.normalizeCurrencyCode(dto.currencyCode),
          baseAmount: dto.baseAmount,
          saleAmount: dto.saleAmount ?? null,
          saleStartsAt: dto.saleStartsAt ?? null,
          saleEndsAt: dto.saleEndsAt ?? null,
          taxClassId: dto.taxClassId ?? null,
        },
        create: {
          variantId,
          currencyCode: this.moneyService.normalizeCurrencyCode(dto.currencyCode),
          baseAmount: dto.baseAmount,
          saleAmount: dto.saleAmount ?? null,
          saleStartsAt: dto.saleStartsAt ?? null,
          saleEndsAt: dto.saleEndsAt ?? null,
          taxClassId: dto.taxClassId ?? null,
        },
      }),
    );
  }

  async getTaxClass(key: string): Promise<TaxClassResponseDto> {
    const taxClass = await this.prisma.taxClass.findUnique({
      where: { key: key.trim().toLowerCase() },
    });
    if (!taxClass) {
      throw new NotFoundException('Tax class not found');
    }
    return this.serializeTaxClass(taxClass);
  }

  async upsertTaxClass(key: string, dto: UpsertTaxClassDto) {
    const normalizedKey = key.trim().toLowerCase();

    return this.prisma.$transaction(async (tx) => {
      if (dto.isDefault) {
        await tx.taxClass.updateMany({
          data: { isDefault: false },
          where: { isDefault: true },
        });
      }

      const taxClass = await tx.taxClass.upsert({
        where: { key: normalizedKey },
        update: {
          name: dto.name.trim(),
          isDefault: dto.isDefault ?? false,
        },
        create: {
          key: normalizedKey,
          name: dto.name.trim(),
          isDefault: dto.isDefault ?? false,
        },
      });

      return this.serializeTaxClass(taxClass);
    });
  }

  async upsertManualTaxRate(taxClassId: string, countryCode: string, dto: UpsertManualTaxRateDto) {
    await this.findTaxClassOrThrow(taxClassId);

    return this.serializeManualTaxRate(
      await this.prisma.manualTaxRate.upsert({
        where: {
          taxClassId_countryCode: {
            taxClassId,
            countryCode: countryCode.trim().toUpperCase(),
          },
        },
        update: {
          rateBps: dto.rateBps,
          isIncludedInPrice: dto.isIncludedInPrice ?? false,
        },
        create: {
          taxClassId,
          countryCode: countryCode.trim().toUpperCase(),
          rateBps: dto.rateBps,
          isIncludedInPrice: dto.isIncludedInPrice ?? false,
        },
      }),
    );
  }

  async getShippingZone(key: string): Promise<ShippingZoneResponseDto> {
    const zone = await this.prisma.shippingZone.findUnique({
      where: { key: key.trim().toLowerCase() },
      include: { countries: true },
    });
    if (!zone) {
      throw new NotFoundException('Shipping zone not found');
    }
    return this.serializeShippingZone(zone);
  }

  async upsertShippingZone(key: string, dto: UpsertShippingZoneDto) {
    const normalizedKey = key.trim().toLowerCase();
    const countryCodes = Array.from(
      new Set(dto.countryCodes.map((countryCode) => countryCode.trim().toUpperCase())),
    );

    return this.prisma.$transaction(async (tx) => {
      const zone = await tx.shippingZone.upsert({
        where: { key: normalizedKey },
        update: {
          name: dto.name.trim(),
          isActive: dto.isActive ?? true,
        },
        create: {
          key: normalizedKey,
          name: dto.name.trim(),
          isActive: dto.isActive ?? true,
        },
      });

      await tx.shippingZoneCountry.deleteMany({
        where: { zoneId: zone.id },
      });

      await tx.shippingZoneCountry.createMany({
        data: countryCodes.map((countryCode) => ({
          zoneId: zone.id,
          countryCode,
        })),
      });

      const savedZone = await tx.shippingZone.findUniqueOrThrow({
        where: { id: zone.id },
        include: {
          countries: true,
        },
      });

      return this.serializeShippingZone(savedZone);
    });
  }

  async upsertShippingMethod(zoneId: string, key: string, dto: UpsertShippingMethodDto) {
    const zone = await this.prisma.shippingZone.findUnique({
      where: { id: zoneId },
      select: { id: true },
    });

    if (!zone) {
      throw new NotFoundException('Shipping zone not found');
    }

    this.shippingService.validateShippingMethodDto(dto.rateType, dto.flatAmount, dto.percentageBps);

    return this.serializeShippingMethod(
      await this.prisma.shippingMethod.upsert({
        where: {
          zoneId_key: {
            zoneId,
            key: key.trim().toLowerCase(),
          },
        },
        update: {
          name: dto.name.trim(),
          isActive: dto.isActive ?? true,
          rateType: dto.rateType,
          currencyCode: this.moneyService.normalizeCurrencyCode(dto.currencyCode),
          flatAmount: dto.rateType === 'FLAT' ? (dto.flatAmount ?? null) : null,
          percentageBps:
            dto.rateType === 'PERCENTAGE_OF_SUBTOTAL' ? (dto.percentageBps ?? null) : null,
          minSubtotalAmount: dto.minSubtotalAmount ?? null,
          maxSubtotalAmount: dto.maxSubtotalAmount ?? null,
          minItemQuantity: dto.minItemQuantity ?? null,
          maxItemQuantity: dto.maxItemQuantity ?? null,
          estimatedMinDays: dto.estimatedMinDays ?? null,
          estimatedMaxDays: dto.estimatedMaxDays ?? null,
          sortOrder: dto.sortOrder ?? 0,
        },
        create: {
          zoneId,
          key: key.trim().toLowerCase(),
          name: dto.name.trim(),
          isActive: dto.isActive ?? true,
          rateType: dto.rateType,
          currencyCode: this.moneyService.normalizeCurrencyCode(dto.currencyCode),
          flatAmount: dto.rateType === 'FLAT' ? (dto.flatAmount ?? null) : null,
          percentageBps:
            dto.rateType === 'PERCENTAGE_OF_SUBTOTAL' ? (dto.percentageBps ?? null) : null,
          minSubtotalAmount: dto.minSubtotalAmount ?? null,
          maxSubtotalAmount: dto.maxSubtotalAmount ?? null,
          minItemQuantity: dto.minItemQuantity ?? null,
          maxItemQuantity: dto.maxItemQuantity ?? null,
          estimatedMinDays: dto.estimatedMinDays ?? null,
          estimatedMaxDays: dto.estimatedMaxDays ?? null,
          sortOrder: dto.sortOrder ?? 0,
        },
      }),
    );
  }

  private async findTaxClassOrThrow(taxClassId: string) {
    const taxClass = await this.prisma.taxClass.findUnique({
      where: { id: taxClassId },
      select: { id: true },
    });

    if (!taxClass) {
      throw new NotFoundException('Tax class not found');
    }

    return taxClass;
  }

  private serializeStoreSetting(setting: {
    id: string;
    key: string;
    value: unknown;
    description: string | null;
    isPublic: boolean;
    updatedAt: Date;
  }): StoreSettingResponseDto {
    return {
      id: setting.id,
      key: setting.key,
      value: setting.value,
      description: setting.description,
      isPublic: setting.isPublic,
      updatedAt: setting.updatedAt.toISOString(),
    };
  }

  private serializeVariantPrice(price: {
    id: string;
    variantId: string;
    currencyCode: string;
    baseAmount: number;
    saleAmount: number | null;
    saleStartsAt: Date | null;
    saleEndsAt: Date | null;
    taxClassId: string | null;
    updatedAt: Date;
  }): VariantPriceResponseDto {
    return {
      id: price.id,
      variantId: price.variantId,
      currencyCode: price.currencyCode,
      baseAmount: price.baseAmount,
      saleAmount: price.saleAmount,
      saleStartsAt: price.saleStartsAt?.toISOString() ?? null,
      saleEndsAt: price.saleEndsAt?.toISOString() ?? null,
      taxClassId: price.taxClassId,
      updatedAt: price.updatedAt.toISOString(),
    };
  }

  private serializeTaxClass(taxClass: {
    id: string;
    key: string;
    name: string;
    isDefault: boolean;
    updatedAt: Date;
  }): TaxClassResponseDto {
    return {
      id: taxClass.id,
      key: taxClass.key,
      name: taxClass.name,
      isDefault: taxClass.isDefault,
      updatedAt: taxClass.updatedAt.toISOString(),
    };
  }

  private serializeManualTaxRate(rate: {
    id: string;
    taxClassId: string;
    countryCode: string;
    rateBps: number;
    isIncludedInPrice: boolean;
    updatedAt: Date;
  }): ManualTaxRateResponseDto {
    return {
      id: rate.id,
      taxClassId: rate.taxClassId,
      countryCode: rate.countryCode,
      rateBps: rate.rateBps,
      isIncludedInPrice: rate.isIncludedInPrice,
      updatedAt: rate.updatedAt.toISOString(),
    };
  }

  private serializeShippingZone(zone: {
    id: string;
    key: string;
    name: string;
    isActive: boolean;
    updatedAt: Date;
    countries: Array<{ countryCode: string }>;
  }): ShippingZoneResponseDto {
    return {
      id: zone.id,
      key: zone.key,
      name: zone.name,
      isActive: zone.isActive,
      countryCodes: zone.countries.map((country) => country.countryCode),
      updatedAt: zone.updatedAt.toISOString(),
    };
  }

  private serializeShippingMethod(method: {
    id: string;
    zoneId: string;
    key: string;
    name: string;
    isActive: boolean;
    rateType: string;
    currencyCode: string;
    flatAmount: number | null;
    percentageBps: number | null;
    estimatedMinDays: number | null;
    estimatedMaxDays: number | null;
    sortOrder: number;
    updatedAt: Date;
  }): ShippingMethodResponseDto {
    return {
      id: method.id,
      zoneId: method.zoneId,
      key: method.key,
      name: method.name,
      isActive: method.isActive,
      rateType: method.rateType,
      currencyCode: method.currencyCode,
      flatAmount: method.flatAmount,
      percentageBps: method.percentageBps,
      estimatedMinDays: method.estimatedMinDays,
      estimatedMaxDays: method.estimatedMaxDays,
      sortOrder: method.sortOrder,
      updatedAt: method.updatedAt.toISOString(),
    };
  }
}
