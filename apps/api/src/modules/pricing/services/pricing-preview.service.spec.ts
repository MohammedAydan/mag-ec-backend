import { BadRequestException, NotFoundException } from '@nestjs/common';

import { PricingPreviewService } from './pricing-preview.service';

describe('PricingPreviewService', () => {
  const prisma = {
    catalogProductVariant: {
      findMany: jest.fn(),
    },
  };
  const moneyService = {
    normalizeCurrencyCode: jest.fn((currencyCode: string) => currencyCode.trim().toUpperCase()),
    create: jest.fn((amount: number, currencyCode: string) => ({ amount, currencyCode })),
    multiply: jest.fn((money: { amount: number; currencyCode: string }, quantity: number) => ({
      amount: money.amount * quantity,
      currencyCode: money.currencyCode,
    })),
  };
  const shippingService = {
    estimateAvailableMethods: jest.fn(),
  };
  const promotionEvaluatorService = {
    evaluate: jest.fn(),
  };
  const taxStrategy = {
    computeTax: jest.fn(),
  };

  let service: PricingPreviewService;

  beforeEach(() => {
    jest.clearAllMocks();
    service = new PricingPreviewService(
      prisma as never,
      moneyService as never,
      shippingService as never,
      promotionEvaluatorService as never,
      taxStrategy,
    );
  });

  it('computes snapshot-ready checkout totals and shipping estimates', async () => {
    prisma.catalogProductVariant.findMany.mockResolvedValue([
      {
        id: 'variant_1',
        sku: 'SKU-1',
        price: {
          currencyCode: 'USD',
          baseAmount: 2500,
          saleAmount: 2000,
          saleStartsAt: new Date(Date.now() - 60_000),
          saleEndsAt: new Date(Date.now() + 60_000),
          taxClassId: 'tax_1',
        },
      },
    ]);
    taxStrategy.computeTax.mockResolvedValue({
      amount: 200,
      rateBps: 1000,
      isIncludedInPrice: false,
    });
    shippingService.estimateAvailableMethods.mockResolvedValue([
      {
        methodId: 'ship_1',
        key: 'standard',
        name: 'Standard',
        zone: { id: 'zone_1', key: 'gcc', name: 'GCC' },
        amount: 500,
        currencyCode: 'USD',
        estimatedMinDays: 2,
        estimatedMaxDays: 4,
      },
    ]);
    promotionEvaluatorService.evaluate.mockResolvedValue({
      subtotalDiscountAmount: 250,
      freeShipping: true,
      appliedPromotions: [{ key: 'spring-sale', discountAmount: 250 }],
      rejectedPromotions: [],
    });

    await expect(
      service.previewCheckout({
        currencyCode: 'usd',
        countryCode: 'eg',
        items: [{ variantId: 'variant_1', quantity: 2 }],
      }),
    ).resolves.toMatchObject({
      currencyCode: 'USD',
      countryCode: 'EG',
      subtotalAmount: 4000,
      subtotalDiscountAmount: 250,
      discountedSubtotalAmount: 3750,
      taxAmount: 200,
      grandTotalExcludingShippingAmount: 3950,
      appliedPromotions: [{ key: 'spring-sale' }],
      items: [
        {
          variantId: 'variant_1',
          quantity: 2,
          effectiveUnitAmount: 2000,
          lineSubtotalAmount: 4000,
        },
      ],
      shippingMethods: [
        {
          methodId: 'ship_1',
          amount: 0,
          totalAmount: 3950,
        },
      ],
    });
  });

  it('rejects currency mismatches between request and stored price', async () => {
    prisma.catalogProductVariant.findMany.mockResolvedValue([
      {
        id: 'variant_1',
        sku: 'SKU-1',
        price: {
          currencyCode: 'AED',
          baseAmount: 1000,
          saleAmount: null,
          saleStartsAt: null,
          saleEndsAt: null,
          taxClassId: null,
        },
      },
    ]);
    promotionEvaluatorService.evaluate.mockResolvedValue({
      subtotalDiscountAmount: 0,
      freeShipping: false,
      appliedPromotions: [],
      rejectedPromotions: [],
    });

    await expect(
      service.previewCheckout({
        currencyCode: 'USD',
        countryCode: 'AE',
        items: [{ variantId: 'variant_1', quantity: 1 }],
      }),
    ).rejects.toThrow(BadRequestException);
  });

  it('fails when a requested variant cannot be priced', async () => {
    prisma.catalogProductVariant.findMany.mockResolvedValue([]);
    promotionEvaluatorService.evaluate.mockResolvedValue({
      subtotalDiscountAmount: 0,
      freeShipping: false,
      appliedPromotions: [],
      rejectedPromotions: [],
    });

    await expect(
      service.previewCheckout({
        currencyCode: 'USD',
        countryCode: 'US',
        items: [{ variantId: 'missing', quantity: 1 }],
      }),
    ).rejects.toThrow(NotFoundException);
  });
});
