import { BadRequestException, Inject, Injectable, NotFoundException } from '@nestjs/common';

import { PrismaService } from '../../persistence/services/prisma.service';
import { PromotionEvaluatorService } from '../../promotions/services/promotion-evaluator.service';
import { MoneyService } from './money.service';
import { ShippingService } from './shipping.service';
import { TAX_STRATEGY } from '../pricing.constants';
import type { CheckoutPreviewDto } from '../dto/pricing-public.dto';
import type { TaxStrategy } from '../pricing.types';

@Injectable()
export class PricingPreviewService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(MoneyService) private readonly moneyService: MoneyService,
    @Inject(ShippingService) private readonly shippingService: ShippingService,
    @Inject(PromotionEvaluatorService)
    private readonly promotionEvaluatorService: PromotionEvaluatorService,
    @Inject(TAX_STRATEGY) private readonly taxStrategy: TaxStrategy,
  ) {}

  async previewCheckout(dto: CheckoutPreviewDto) {
    const currencyCode = this.moneyService.normalizeCurrencyCode(dto.currencyCode);
    const variants = await this.prisma.catalogProductVariant.findMany({
      where: {
        id: {
          in: dto.items.map((item) => item.variantId),
        },
        status: 'PUBLISHED',
        product: {
          status: 'PUBLISHED',
        },
      },
      include: {
        price: true,
      },
    });

    if (variants.length !== dto.items.length) {
      throw new NotFoundException('One or more catalog variants could not be priced');
    }

    const variantById = new Map(variants.map((variant) => [variant.id, variant]));
    const lineItems = [];
    let subtotalAmount = 0;
    let taxAmount = 0;
    let itemQuantity = 0;

    for (const item of dto.items) {
      const variant = variantById.get(item.variantId);

      if (!variant || !variant.price) {
        throw new NotFoundException('Catalog variant price not found');
      }

      if (this.moneyService.normalizeCurrencyCode(variant.price.currencyCode) !== currencyCode) {
        throw new BadRequestException(
          'Checkout preview currency does not match catalog pricing currency',
        );
      }

      const unitAmount = this.resolveEffectiveUnitAmount(variant.price);
      const lineSubtotal = this.moneyService.multiply(
        this.moneyService.create(unitAmount, currencyCode),
        item.quantity,
      );
      const lineTax = await this.taxStrategy.computeTax({
        taxClassId: variant.price.taxClassId,
        countryCode: dto.countryCode,
        subtotalAmount: lineSubtotal.amount,
        currencyCode,
      });

      subtotalAmount += lineSubtotal.amount;
      taxAmount += lineTax.amount;
      itemQuantity += item.quantity;

      lineItems.push({
        variantId: variant.id,
        sku: variant.sku,
        quantity: item.quantity,
        currencyCode,
        unitBaseAmount: variant.price.baseAmount,
        unitSaleAmount: this.isSaleActive(variant.price)
          ? (variant.price.saleAmount ?? null)
          : null,
        effectiveUnitAmount: unitAmount,
        lineSubtotalAmount: lineSubtotal.amount,
        taxAmount: lineTax.amount,
        taxRateBps: lineTax.rateBps,
        taxIncludedInPrice: lineTax.isIncludedInPrice,
      });
    }

    const promotionResult = await this.promotionEvaluatorService.evaluate({
      subtotalAmount,
      currencyCode,
      countryCode: dto.countryCode,
      customerId: dto.customerId,
      couponCodes: dto.couponCodes,
    });

    const discountedSubtotalAmount = Math.max(
      subtotalAmount - promotionResult.subtotalDiscountAmount,
      0,
    );

    const shippingMethods = await this.shippingService.estimateAvailableMethods({
      countryCode: dto.countryCode,
      currencyCode,
      subtotalAmount: discountedSubtotalAmount,
      itemQuantity,
    });

    return {
      currencyCode,
      countryCode: dto.countryCode.trim().toUpperCase(),
      subtotalAmount,
      subtotalDiscountAmount: promotionResult.subtotalDiscountAmount,
      discountedSubtotalAmount,
      taxAmount,
      appliedPromotions: promotionResult.appliedPromotions,
      rejectedPromotions: promotionResult.rejectedPromotions,
      grandTotalExcludingShippingAmount: discountedSubtotalAmount + taxAmount,
      items: lineItems,
      shippingMethods: shippingMethods.map((method) => ({
        ...method,
        amount: promotionResult.freeShipping ? 0 : method.amount,
        totalAmount:
          discountedSubtotalAmount + taxAmount + (promotionResult.freeShipping ? 0 : method.amount),
      })),
    };
  }

  private resolveEffectiveUnitAmount(price: {
    baseAmount: number;
    saleAmount: number | null;
    saleStartsAt: Date | null;
    saleEndsAt: Date | null;
  }) {
    if (!this.isSaleActive(price) || price.saleAmount === null) {
      return price.baseAmount;
    }

    return price.saleAmount;
  }

  private isSaleActive(price: {
    saleAmount: number | null;
    saleStartsAt: Date | null;
    saleEndsAt: Date | null;
  }) {
    if (price.saleAmount === null) {
      return false;
    }

    const now = Date.now();
    const startsAt = price.saleStartsAt?.getTime();
    const endsAt = price.saleEndsAt?.getTime();

    if (startsAt !== undefined && startsAt !== null && startsAt > now) {
      return false;
    }

    if (endsAt !== undefined && endsAt !== null && endsAt < now) {
      return false;
    }

    return true;
  }
}
