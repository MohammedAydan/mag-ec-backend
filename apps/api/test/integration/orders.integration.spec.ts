import 'dotenv/config';

import {
  assertMysqlDatabaseAvailable,
  createMysqlTestPrismaClient,
} from './support/mysql-test-client';

const runMysqlIntegration = process.env.RUN_MYSQL_INTEGRATION === 'true';
const describeMysqlIntegration = runMysqlIntegration ? describe : describe.skip;

describeMysqlIntegration('orders integration', () => {
  const prisma = createMysqlTestPrismaClient();
  const suffix = Date.now().toString();

  let userId: string;
  let promotionId: string;
  let secondPromotionId: string;
  let productId: string;
  let variantId: string;
  let idempotencyKeyId: string;
  let orderId: string;

  beforeAll(async () => {
    await assertMysqlDatabaseAvailable(prisma, 'orders integration');

    const user = await prisma.user.create({
      data: {
        email: `orders-${suffix}@example.com`,
        normalizedEmail: `orders-${suffix}@example.com`,
        displayName: 'Orders Integration',
        passwordHash: 'hashed-password',
        userType: 'CUSTOMER',
        status: 'ACTIVE',
      },
    });
    userId = user.id;

    const productType = await prisma.catalogProductType.create({
      data: {
        key: `orders-type-${suffix}`,
        status: 'PUBLISHED',
        sortOrder: 99,
      },
    });
    await prisma.catalogProductTypeTranslation.create({
      data: {
        productTypeId: productType.id,
        locale: 'en',
        name: 'Orders Type',
        slug: `orders-type-${suffix}`,
      },
    });

    const product = await prisma.catalogProduct.create({
      data: {
        productTypeId: productType.id,
        sku: `ORDER-PRODUCT-${suffix}`,
        status: 'PUBLISHED',
      },
    });
    productId = product.id;
    await prisma.catalogProductTranslation.create({
      data: {
        productId,
        locale: 'en',
        name: 'Order Product',
        slug: `order-product-${suffix}`,
      },
    });

    const variant = await prisma.catalogProductVariant.create({
      data: {
        productId,
        sku: `ORDER-VARIANT-${suffix}`,
        status: 'PUBLISHED',
      },
    });
    variantId = variant.id;
    await prisma.catalogProductVariantTranslation.create({
      data: {
        variantId,
        locale: 'en',
        name: 'Order Variant',
      },
    });

    const idempotencyKey = await prisma.idempotencyKey.create({
      data: {
        scope: `checkout.place:user:${userId}`,
        key: `idem-${suffix}`,
        actorUserId: userId,
        requestHash: 'hash',
        status: 'COMPLETED',
        responseCode: 201,
        responseBody: { orderId: 'pending' },
        expiresAt: new Date(Date.now() + 24 * 60 * 60 * 1000),
      },
    });
    idempotencyKeyId = idempotencyKey.id;

    const firstPromotion = await prisma.promotion.create({
      data: {
        key: `orders-promo-${suffix}`,
        name: 'Orders Promotion',
        status: 'ACTIVE',
        trigger: 'AUTOMATIC',
        rewardType: 'PERCENTAGE',
        percentageBps: 1000,
      },
    });
    promotionId = firstPromotion.id;

    const secondPromotion = await prisma.promotion.create({
      data: {
        key: `orders-promo-2-${suffix}`,
        name: 'Orders Promotion Two',
        status: 'ACTIVE',
        trigger: 'AUTOMATIC',
        rewardType: 'FIXED_AMOUNT',
        currencyCode: 'USD',
        fixedAmount: 250,
      },
    });
    secondPromotionId = secondPromotion.id;
  });

  afterAll(async () => {
    if (orderId) {
      await prisma.orderAppliedPromotion.deleteMany({ where: { orderId } });
      await prisma.orderLine.deleteMany({ where: { orderId } });
      await prisma.orderAddress.deleteMany({ where: { orderId } });
      await prisma.order.deleteMany({ where: { id: orderId } });
      await prisma.promotionRedemption.deleteMany({ where: { orderReference: orderId } });
    }

    await prisma.promotion.deleteMany({
      where: {
        id: {
          in: [promotionId, secondPromotionId].filter(Boolean),
        },
      },
    });

    if (idempotencyKeyId) {
      await prisma.idempotencyKey.deleteMany({ where: { id: idempotencyKeyId } });
    }

    if (variantId) {
      await prisma.catalogProductVariantTranslation.deleteMany({ where: { variantId } });
      await prisma.catalogProductVariant.deleteMany({ where: { id: variantId } });
    }

    if (productId) {
      await prisma.catalogProductTranslation.deleteMany({ where: { productId } });
      await prisma.catalogProduct.deleteMany({ where: { id: productId } });
    }

    await prisma.catalogProductTypeTranslation.deleteMany({
      where: { slug: `orders-type-${suffix}` },
    });
    await prisma.catalogProductType.deleteMany({
      where: { key: `orders-type-${suffix}` },
    });

    if (userId) {
      await prisma.user.deleteMany({ where: { id: userId } });
    }

    await prisma.$disconnect();
  });

  it('persists order snapshots and enforces idempotency uniqueness', async () => {
    const order = await prisma.order.create({
      data: {
        orderNumber: `ORD-${suffix}`,
        userId,
        idempotencyKeyId,
        customerEmail: `orders-${suffix}@example.com`,
        customerName: 'Orders Integration',
        customerPhone: '+15550000000',
        currencyCode: 'USD',
        countryCode: 'US',
        paymentMethod: 'CASH_ON_DELIVERY',
        shippingMethodKey: 'standard',
        shippingMethodName: 'Standard Shipping',
        shippingRateType: 'FLAT',
        subtotalAmount: 2000,
        subtotalDiscountAmount: 250,
        discountedSubtotalAmount: 1750,
        shippingAmount: 700,
        taxAmount: 100,
        grandTotalAmount: 2550,
      },
    });
    orderId = order.id;

    await prisma.orderAddress.create({
      data: {
        orderId,
        type: 'SHIPPING',
        recipientName: 'Orders Integration',
        phoneNumber: '+15550000000',
        countryCode: 'US',
        city: 'New York',
        addressLine1: '1 Example St',
      },
    });

    await prisma.orderLine.create({
      data: {
        orderId,
        variantId,
        productId,
        sku: `ORDER-VARIANT-${suffix}`,
        productName: 'Order Product',
        variantName: 'Order Variant',
        quantity: 2,
        currencyCode: 'USD',
        unitBaseAmount: 1000,
        unitSaleAmount: 875,
        effectiveUnitAmount: 875,
        lineSubtotalAmount: 1750,
        taxAmount: 100,
      },
    });

    await prisma.orderAppliedPromotion.create({
      data: {
        orderId,
        promotionId,
        key: `orders-promo-${suffix}`,
        name: 'Orders Promotion',
        rewardType: 'PERCENTAGE',
        discountAmount: 250,
        freeShipping: false,
        source: 'AUTOMATIC',
      },
    });

    await prisma.promotionRedemption.createMany({
      data: [
        {
          promotionId,
          userId,
          orderReference: orderId,
          reservationKey: `order:${orderId}:promotion:${promotionId}`,
          status: 'REDEEMED',
        },
        {
          promotionId: secondPromotionId,
          userId,
          orderReference: orderId,
          reservationKey: `order:${orderId}:promotion:${secondPromotionId}`,
          status: 'REDEEMED',
        },
      ],
    });

    const storedOrder = await prisma.order.findUnique({
      where: { id: orderId },
      include: {
        addresses: true,
        lines: true,
        appliedPromotions: true,
      },
    });

    expect(storedOrder?.addresses).toHaveLength(1);
    expect(storedOrder?.lines).toHaveLength(1);
    expect(storedOrder?.appliedPromotions).toHaveLength(1);

    await expect(
      prisma.idempotencyKey.create({
        data: {
          scope: `checkout.place:user:${userId}`,
          key: `idem-${suffix}`,
          actorUserId: userId,
          requestHash: 'hash-2',
          expiresAt: new Date(Date.now() + 24 * 60 * 60 * 1000),
        },
      }),
    ).rejects.toThrow();
  });
});
