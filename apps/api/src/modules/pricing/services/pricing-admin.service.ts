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
import { MoneyService } from './money.service';
import { ShippingService } from './shipping.service';

@Injectable()
export class PricingAdminService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(MoneyService) private readonly moneyService: MoneyService,
    @Inject(ShippingService) private readonly shippingService: ShippingService,
  ) {}

  async updateStoreCurrency(dto: UpdateStoreCurrencyDto) {
    const currencyCode = this.moneyService.normalizeCurrencyCode(dto.currencyCode);

    return this.prisma.storeSetting.upsert({
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
    });
  }

  async updatePricingBehavior(dto: UpdatePricingBehaviorDto) {
    return this.prisma.storeSetting.upsert({
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
    });
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

    return this.prisma.catalogVariantPrice.upsert({
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
    });
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

      return tx.taxClass.upsert({
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
    });
  }

  async upsertManualTaxRate(taxClassId: string, countryCode: string, dto: UpsertManualTaxRateDto) {
    await this.findTaxClassOrThrow(taxClassId);

    return this.prisma.manualTaxRate.upsert({
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
    });
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

      return tx.shippingZone.findUniqueOrThrow({
        where: { id: zone.id },
        include: {
          countries: true,
        },
      });
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

    return this.prisma.shippingMethod.upsert({
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
    });
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
}
