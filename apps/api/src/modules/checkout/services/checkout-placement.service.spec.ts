import { BadRequestException, ConflictException } from '@nestjs/common';

import { CheckoutPaymentMethod } from '../dto/checkout.dto';
import { CheckoutPlacementService } from './checkout-placement.service';

describe('CheckoutPlacementService', () => {
  const prisma = {};

  const cart = {
    id: 'cart_1',
    guestToken: 'guest-token',
    userId: null,
    couponCode: 'VIP15',
    items: [
      {
        variantId: 'variant_1',
        quantity: 2,
      },
    ],
  };

  const cartService = {
    getCartOrThrow: jest.fn(),
    assertCartAccess: jest.fn(),
  };

  const pricingPreviewService = {
    previewCheckout: jest.fn(),
  };

  const inventoryCoreService = {
    reserveStock: jest.fn(),
    redeemStockReservation: jest.fn(),
  };

  const tx = {
    warehouse: {
      findFirst: jest.fn(),
    },
    stockReservation: {
      findMany: jest.fn(),
    },
    shippingMethod: {
      findUnique: jest.fn(),
    },
    catalogProductVariant: {
      findMany: jest.fn(),
    },
    order: {
      create: jest.fn(),
    },
    orderAddress: {
      createMany: jest.fn(),
    },
    orderLine: {
      createMany: jest.fn(),
    },
    orderAppliedPromotion: {
      createMany: jest.fn(),
    },
    cart: {
      updateMany: jest.fn(),
    },
  };

  const prismaTransactionService = {
    runInTransaction: jest.fn(async (callback: (input: typeof tx) => Promise<unknown>) =>
      callback(tx),
    ),
  };

  const checkoutIdempotencyService = {
    execute: jest.fn(
      async (params: {
        execute: (idempotencyKeyId: string) => Promise<{ responseCode: number; responseBody: Record<string, unknown> }>;
      }) => {
        const result = await params.execute('idem-key-id');
        return { replayed: false, ...result };
      },
    ),
  };

  const codPaymentService = {
    assertPlacementAllowed: jest.fn().mockReturnValue({
      paymentMethod: 'CASH_ON_DELIVERY',
      paymentStatus: 'PENDING',
    }),
  };

  const paymentAttemptService = {
    assertCheckoutMethodAllowed: jest.fn(),
    createPendingOnlinePaymentAttempt: jest.fn(),
    initializeOnlinePaymentAttempt: jest.fn(),
  };

  const promotionUsageService = {
    redeemAppliedPromotions: jest.fn(),
  };

  const orderOutboxService = {
    emitPlaced: jest.fn(),
  };

  const orderService = {
    getSerializedOrderById: jest.fn(),
  };

  let service: CheckoutPlacementService;

  beforeEach(() => {
    jest.clearAllMocks();
    cartService.getCartOrThrow.mockResolvedValue(cart);
    pricingPreviewService.previewCheckout.mockResolvedValue({
      currencyCode: 'USD',
      countryCode: 'US',
      subtotalAmount: 2000,
      subtotalDiscountAmount: 500,
      discountedSubtotalAmount: 1500,
      taxAmount: 100,
      appliedPromotions: [
        {
          promotionId: 'promo_1',
          key: 'vip-coupon',
          name: 'VIP Coupon',
          rewardType: 'FIXED_AMOUNT',
          discountAmount: 500,
          freeShipping: false,
          source: 'COUPON',
          couponCode: 'VIP15',
        },
      ],
      rejectedPromotions: [],
      grandTotalExcludingShippingAmount: 1600,
      shippingMethods: [
        {
          methodId: 'ship_1',
          key: 'standard',
          name: 'Standard Shipping',
          zone: { id: 'zone_1', key: 'us', name: 'US' },
          amount: 700,
          totalAmount: 2300,
          currencyCode: 'USD',
          estimatedMinDays: 3,
          estimatedMaxDays: 5,
        },
      ],
      items: [
        {
          variantId: 'variant_1',
          sku: 'SKU-1',
          quantity: 2,
          currencyCode: 'USD',
          unitBaseAmount: 1000,
          unitSaleAmount: 750,
          effectiveUnitAmount: 750,
          lineSubtotalAmount: 1500,
          taxAmount: 100,
        },
      ],
    });
    tx.warehouse.findFirst.mockResolvedValue({ id: 'warehouse_1' });
    tx.shippingMethod.findUnique.mockResolvedValue({ id: 'ship_1', rateType: 'FLAT' });
    tx.catalogProductVariant.findMany.mockResolvedValue([
      {
        id: 'variant_1',
        productId: 'product_1',
        sku: 'SKU-1',
        translations: [{ locale: 'en', name: 'Variant Name' }],
        product: {
          sku: 'PRODUCT-SKU',
          translations: [{ locale: 'en', name: 'Product Name' }],
        },
      },
    ]);
    tx.order.create.mockResolvedValue({
      id: 'order_1',
      orderNumber: 'ORD-20260525-ABCD1234',
      userId: null,
      status: 'PLACED',
      paymentStatus: 'PENDING',
      fulfillmentStatus: 'UNFULFILLED',
      grandTotalAmount: 2300,
      currencyCode: 'USD',
    });
    tx.cart.updateMany.mockResolvedValue({ count: 1 });
    orderService.getSerializedOrderById.mockResolvedValue({
      id: 'order_1',
      orderNumber: 'ORD-20260525-ABCD1234',
    });

    service = new CheckoutPlacementService(
      prisma as never,
      cartService as never,
      pricingPreviewService as never,
      inventoryCoreService as never,
      prismaTransactionService as never,
      checkoutIdempotencyService as never,
      codPaymentService as never,
      paymentAttemptService as never,
      promotionUsageService as never,
      orderOutboxService as never,
      orderService as never,
    );
  });

  it('places an order by reserving, redeeming, snapshotting, and emitting outbox events', async () => {
    const result = await service.placeOrder(
      {
        cartId: 'cart_1',
        currencyCode: 'USD',
        countryCode: 'US',
        customerEmail: 'guest@example.com',
        shippingMethodKey: 'standard',
        paymentMethod: CheckoutPaymentMethod.CASH_ON_DELIVERY,
        shippingAddress: {
          recipientName: 'Guest User',
          phoneNumber: '+15551230000',
          countryCode: 'US',
          city: 'New York',
          addressLine1: '1 Example St',
        },
      },
      {
        guestToken: 'guest-token',
        idempotencyKey: 'idem-key',
      },
    );

    expect(codPaymentService.assertPlacementAllowed).toHaveBeenCalledWith(
      CheckoutPaymentMethod.CASH_ON_DELIVERY,
    );
    expect(inventoryCoreService.reserveStock).toHaveBeenCalledWith(
      'warehouse_1',
      'variant_1',
      2,
      expect.stringContaining('order:cart_1:'),
      expect.any(Date),
      undefined,
      tx,
    );
    expect(inventoryCoreService.redeemStockReservation).toHaveBeenCalledWith(
      expect.stringContaining('order:cart_1:'),
      'order_1',
      tx,
    );
    expect(promotionUsageService.redeemAppliedPromotions).toHaveBeenCalledWith(
      expect.any(Array),
      'order_1',
      undefined,
      tx,
    );
    expect(orderOutboxService.emitPlaced).toHaveBeenCalled();
    expect(tx.cart.updateMany).toHaveBeenCalledWith({
      where: { id: 'cart_1', status: 'ACTIVE' },
      data: { status: 'ABANDONED' },
    });
    expect(tx.order.create).toHaveBeenCalledWith(
      expect.objectContaining({
        data: expect.objectContaining({
          idempotencyKeyId: 'idem-key-id',
        }),
      }),
    );
    expect(result).toEqual({
      id: 'order_1',
      orderNumber: 'ORD-20260525-ABCD1234',
    });
  });

  it('rejects placement when a supplied reservation key no longer matches the cart', async () => {
    tx.stockReservation.findMany.mockResolvedValue([
      {
        variantId: 'variant_1',
        quantity: 1,
        userId: null,
      },
    ]);

    await expect(
      service.placeOrder(
        {
          cartId: 'cart_1',
          currencyCode: 'USD',
          countryCode: 'US',
          customerEmail: 'guest@example.com',
          shippingMethodKey: 'standard',
          paymentMethod: CheckoutPaymentMethod.CASH_ON_DELIVERY,
          reservationKey: 'preview-key',
          shippingAddress: {
            recipientName: 'Guest User',
            phoneNumber: '+15551230000',
            countryCode: 'US',
            city: 'New York',
            addressLine1: '1 Example St',
          },
        },
        {
          guestToken: 'guest-token',
          idempotencyKey: 'idem-key',
        },
      ),
    ).rejects.toThrow(BadRequestException);

    expect(inventoryCoreService.redeemStockReservation).not.toHaveBeenCalled();
  });

  it('creates an online payment attempt and leaves stock reserved until payment confirmation', async () => {
    paymentAttemptService.createPendingOnlinePaymentAttempt.mockResolvedValue({
      id: 'pay_attempt_1',
    });
    paymentAttemptService.initializeOnlinePaymentAttempt.mockResolvedValue({
      attemptId: 'pay_attempt_1',
      provider: 'STRIPE',
      status: 'AWAITING_CUSTOMER_ACTION',
      clientSecret: 'pi_secret_123',
      checkoutUrl: null,
      providerPaymentId: 'pi_123',
    });

    const result = await service.placeOrder(
      {
        cartId: 'cart_1',
        currencyCode: 'USD',
        countryCode: 'US',
        customerEmail: 'guest@example.com',
        shippingMethodKey: 'standard',
        paymentMethod: CheckoutPaymentMethod.ONLINE_CARD,
        shippingAddress: {
          recipientName: 'Guest User',
          phoneNumber: '+15551230000',
          countryCode: 'US',
          city: 'New York',
          addressLine1: '1 Example St',
        },
      },
      {
        guestToken: 'guest-token',
        idempotencyKey: 'idem-key',
      },
    );

    expect(codPaymentService.assertPlacementAllowed).not.toHaveBeenCalled();
    expect(paymentAttemptService.assertCheckoutMethodAllowed).toHaveBeenCalledWith(
      CheckoutPaymentMethod.ONLINE_CARD,
    );
    expect(paymentAttemptService.createPendingOnlinePaymentAttempt).toHaveBeenCalledWith(
      expect.objectContaining({
        id: 'order_1',
        orderNumber: 'ORD-20260525-ABCD1234',
      }),
      tx,
    );
    expect(paymentAttemptService.initializeOnlinePaymentAttempt).toHaveBeenCalledWith(
      'pay_attempt_1',
      expect.objectContaining({ id: 'order_1', orderNumber: 'ORD-20260525-ABCD1234' }),
      expect.objectContaining({ paymentMethod: CheckoutPaymentMethod.ONLINE_CARD }),
    );
    expect(inventoryCoreService.redeemStockReservation).not.toHaveBeenCalled();
    expect(result).toEqual({
      id: 'order_1',
      orderNumber: 'ORD-20260525-ABCD1234',
      payment: {
        attemptId: 'pay_attempt_1',
        provider: 'STRIPE',
        status: 'AWAITING_CUSTOMER_ACTION',
        clientSecret: 'pi_secret_123',
        checkoutUrl: null,
        providerPaymentId: 'pi_123',
      },
    });
  });

  it('rejects concurrent checkout on the same cart when the cart is already claimed', async () => {
    // Simulate a concurrent claim: the cart is no longer ACTIVE
    tx.cart.updateMany.mockResolvedValue({ count: 0 });

    await expect(
      service.placeOrder(
        {
          cartId: 'cart_1',
          currencyCode: 'USD',
          countryCode: 'US',
          customerEmail: 'guest@example.com',
          shippingMethodKey: 'standard',
          paymentMethod: CheckoutPaymentMethod.CASH_ON_DELIVERY,
          shippingAddress: {
            recipientName: 'Guest User',
            phoneNumber: '+15551230000',
            countryCode: 'US',
            city: 'New York',
            addressLine1: '1 Example St',
          },
        },
        {
          guestToken: 'guest-token',
          idempotencyKey: 'idem-key-concurrent',
        },
      ),
    ).rejects.toThrow(ConflictException);

    expect(tx.cart.updateMany).toHaveBeenCalledWith({
      where: { id: 'cart_1', status: 'ACTIVE' },
      data: { status: 'ABANDONED' },
    });
    // The order should never be created because the cart claim failed
    expect(tx.order.create).not.toHaveBeenCalled();
    expect(inventoryCoreService.reserveStock).not.toHaveBeenCalled();
    expect(inventoryCoreService.redeemStockReservation).not.toHaveBeenCalled();
  });
});
