import { BadRequestException, NotFoundException } from '@nestjs/common';

import { CheckoutPreviewService } from './checkout-preview.service';

describe('CheckoutPreviewService', () => {
  const prisma = {
    warehouse: {
      findFirst: jest.fn(),
    },
    stockLevel: {
      findMany: jest.fn(),
    },
  };

  const cartService = {
    getCartOrThrow: jest.fn(),
  };

  const configService = {
    getOrThrow: jest.fn().mockReturnValue({
      paymentProvider: 'cod',
    }),
  };

  const pricingPreviewService = {
    previewCheckout: jest.fn(),
  };

  const inventoryCoreService = {
    reserveStock: jest.fn(),
  };

  const prismaTransactionService = {
    runInTransaction: jest.fn(async (callback: (tx: unknown) => Promise<unknown>) => callback({})),
  };

  let service: CheckoutPreviewService;

  beforeEach(() => {
    jest.clearAllMocks();
    service = new CheckoutPreviewService(
      prisma as never,
      configService as never,
      cartService as never,
      pricingPreviewService as never,
      inventoryCoreService as never,
      prismaTransactionService as never,
    );
  });

  it('returns stock availability for a cart preview', async () => {
    cartService.getCartOrThrow.mockResolvedValue({
      id: 'cart_1',
      userId: null,
      couponCode: 'SAVE10',
      items: [{ variantId: 'variant_1', quantity: 2 }],
    });
    pricingPreviewService.previewCheckout.mockResolvedValue({
      currencyCode: 'USD',
      countryCode: 'US',
      subtotalAmount: 2000,
      subtotalDiscountAmount: 0,
      discountedSubtotalAmount: 2000,
      taxAmount: 100,
      appliedPromotions: [],
      rejectedPromotions: [],
      grandTotalExcludingShippingAmount: 2100,
      shippingMethods: [],
      items: [{ variantId: 'variant_1', quantity: 2 }],
    });
    prisma.warehouse.findFirst.mockResolvedValue({ id: 'warehouse_1', isDefault: true });
    prisma.stockLevel.findMany.mockResolvedValue([
      { variantId: 'variant_1', quantityOnHand: 5, quantityReserved: 1 },
    ]);

    await expect(
      service.previewFromCart({
        cartId: 'cart_1',
        currencyCode: 'USD',
        countryCode: 'US',
        reserveStockOnPreview: false,
      }),
    ).resolves.toMatchObject({
      cartId: 'cart_1',
      items: [
        {
          variantId: 'variant_1',
          stockAvailability: {
            availableQuantity: 4,
            isAvailable: true,
          },
        },
      ],
    });
  });

  it('creates stock reservations when reserveStockOnPreview is enabled', async () => {
    cartService.getCartOrThrow.mockResolvedValue({
      id: 'cart_1',
      userId: 'user_1',
      couponCode: null,
      items: [{ variantId: 'variant_1', quantity: 1 }],
    });
    pricingPreviewService.previewCheckout.mockResolvedValue({
      currencyCode: 'USD',
      countryCode: 'US',
      subtotalAmount: 1000,
      subtotalDiscountAmount: 0,
      discountedSubtotalAmount: 1000,
      taxAmount: 50,
      appliedPromotions: [],
      rejectedPromotions: [],
      grandTotalExcludingShippingAmount: 1050,
      shippingMethods: [],
      items: [{ variantId: 'variant_1', quantity: 1 }],
    });
    prisma.warehouse.findFirst.mockResolvedValue({ id: 'warehouse_1', isDefault: true });
    prisma.stockLevel.findMany.mockResolvedValue([
      { variantId: 'variant_1', quantityOnHand: 3, quantityReserved: 0 },
    ]);

    const result = await service.previewFromCart(
      {
        cartId: 'cart_1',
        currencyCode: 'USD',
        countryCode: 'US',
        reserveStockOnPreview: true,
      },
      'user_1',
    );

    expect(inventoryCoreService.reserveStock).toHaveBeenCalledWith(
      'warehouse_1',
      'variant_1',
      1,
      expect.stringContaining('checkout-preview-cart_1-'),
      expect.any(Date),
      'user_1',
      {},
    );
    expect(result.reservationKey).toContain('checkout-preview-cart_1-');
  });

  it('rejects previews for empty carts', async () => {
    cartService.getCartOrThrow.mockResolvedValue({
      id: 'cart_1',
      items: [],
    });

    await expect(
      service.previewFromCart({
        cartId: 'cart_1',
        currencyCode: 'USD',
        countryCode: 'US',
      }),
    ).rejects.toThrow(BadRequestException);
  });

  it('fails when the default warehouse is missing', async () => {
    cartService.getCartOrThrow.mockResolvedValue({
      id: 'cart_1',
      items: [{ variantId: 'variant_1', quantity: 1 }],
    });
    pricingPreviewService.previewCheckout.mockResolvedValue({
      currencyCode: 'USD',
      countryCode: 'US',
      subtotalAmount: 1000,
      subtotalDiscountAmount: 0,
      discountedSubtotalAmount: 1000,
      taxAmount: 50,
      appliedPromotions: [],
      rejectedPromotions: [],
      grandTotalExcludingShippingAmount: 1050,
      shippingMethods: [],
      items: [{ variantId: 'variant_1', quantity: 1 }],
    });
    prisma.warehouse.findFirst.mockResolvedValue(null);
    prisma.stockLevel.findMany.mockResolvedValue([]);

    await expect(
      service.previewFromCart({
        cartId: 'cart_1',
        currencyCode: 'USD',
        countryCode: 'US',
      }),
    ).rejects.toThrow(NotFoundException);
  });
});
