import { PromotionEvaluatorService } from './promotion-evaluator.service';
import type { PrismaService } from '../../persistence/services/prisma.service';
import { MoneyService } from '../../pricing/services/money.service';

describe('PromotionEvaluatorService', () => {
  const prisma = {
    promotion: {
      findMany: jest.fn(),
    },
    coupon: {
      findMany: jest.fn(),
    },
    promotionRedemption: {
      groupBy: jest.fn(),
    },
    couponRedemption: {
      groupBy: jest.fn(),
    },
  };
  const moneyService = new MoneyService();
  const couponNormalizer = {
    normalize: jest.fn((code: string) => code.trim().replace(/\s+/g, '').toUpperCase()),
  };

  let service: PromotionEvaluatorService;

  beforeEach(() => {
    jest.clearAllMocks();
    prisma.promotionRedemption.groupBy.mockResolvedValue([]);
    prisma.couponRedemption.groupBy.mockResolvedValue([]);
    jest.spyOn(moneyService, 'normalizeCurrencyCode');
    jest.spyOn(moneyService, 'create');
    jest.spyOn(moneyService, 'applyBasisPoints');
    service = new PromotionEvaluatorService(
      prisma as unknown as PrismaService,
      moneyService,
      couponNormalizer,
    );
  });

  it('applies fixed and percentage promotions deterministically', async () => {
    prisma.promotion.findMany.mockResolvedValue([
      {
        id: 'promo_fixed',
        key: 'fixed10',
        name: 'Fixed Ten',
        status: 'ACTIVE',
        trigger: 'AUTOMATIC',
        rewardType: 'FIXED_AMOUNT',
        currencyCode: 'USD',
        fixedAmount: 1000,
        percentageBps: null,
        maxDiscountAmount: null,
        minSubtotalAmount: 2000,
        isCombinable: true,
        priority: 1,
        startsAt: null,
        endsAt: null,
        totalUsageLimit: null,
        perCustomerUsageLimit: null,
        maxApplicationsPerOrder: 1,
        reservedCount: 0,
        redeemedCount: 0,
        exclusions: [],
      },
      {
        id: 'promo_percent',
        key: 'percent10',
        name: 'Ten Percent',
        status: 'ACTIVE',
        trigger: 'AUTOMATIC',
        rewardType: 'PERCENTAGE',
        currencyCode: null,
        fixedAmount: null,
        percentageBps: 1000,
        maxDiscountAmount: 300,
        minSubtotalAmount: 0,
        isCombinable: true,
        priority: 2,
        startsAt: null,
        endsAt: null,
        totalUsageLimit: null,
        perCustomerUsageLimit: null,
        maxApplicationsPerOrder: 1,
        reservedCount: 0,
        redeemedCount: 0,
        exclusions: [],
      },
    ]);
    prisma.coupon.findMany.mockResolvedValue([]);

    await expect(
      service.evaluate({
        subtotalAmount: 5000,
        currencyCode: 'usd',
        countryCode: 'us',
      }),
    ).resolves.toMatchObject({
      subtotalDiscountAmount: 1300,
      freeShipping: false,
      appliedPromotions: [
        { key: 'fixed10', discountAmount: 1000 },
        { key: 'percent10', discountAmount: 300 },
      ],
    });
  });

  it('applies free shipping coupon promotions', async () => {
    prisma.promotion.findMany.mockResolvedValue([]);
    prisma.coupon.findMany.mockResolvedValue([
      {
        id: 'coupon_1',
        code: 'SHIPFREE',
        status: 'ACTIVE',
        startsAt: null,
        endsAt: null,
        totalUsageLimit: null,
        perCustomerUsageLimit: null,
        reservedCount: 0,
        redeemedCount: 0,
        promotion: {
          id: 'promo_ship',
          key: 'shipfree',
          name: 'Free Shipping',
          status: 'ACTIVE',
          trigger: 'COUPON',
          rewardType: 'FREE_SHIPPING',
          currencyCode: null,
          fixedAmount: null,
          percentageBps: null,
          maxDiscountAmount: null,
          minSubtotalAmount: 0,
          isCombinable: true,
          priority: 0,
          startsAt: null,
          endsAt: null,
          totalUsageLimit: null,
          perCustomerUsageLimit: null,
          maxApplicationsPerOrder: 1,
          reservedCount: 0,
          redeemedCount: 0,
          exclusions: [],
        },
      },
    ]);

    await expect(
      service.evaluate({
        subtotalAmount: 2000,
        currencyCode: 'USD',
        countryCode: 'US',
        couponCodes: ['ship free'],
      }),
    ).resolves.toMatchObject({
      freeShipping: true,
      appliedPromotions: [{ key: 'shipfree', couponCode: 'SHIPFREE' }],
    });
  });

  it('rejects minimum-spend, exclusion, and customer-limit cases', async () => {
    prisma.promotion.findMany.mockResolvedValue([
      {
        id: 'promo_min',
        key: 'min-spend',
        name: 'Min Spend',
        status: 'ACTIVE',
        trigger: 'AUTOMATIC',
        rewardType: 'FIXED_AMOUNT',
        currencyCode: 'USD',
        fixedAmount: 500,
        percentageBps: null,
        maxDiscountAmount: null,
        minSubtotalAmount: 5000,
        isCombinable: true,
        priority: 0,
        startsAt: null,
        endsAt: null,
        totalUsageLimit: null,
        perCustomerUsageLimit: null,
        maxApplicationsPerOrder: 1,
        reservedCount: 0,
        redeemedCount: 0,
        exclusions: [],
      },
      {
        id: 'promo_a',
        key: 'exclusive-a',
        name: 'Exclusive A',
        status: 'ACTIVE',
        trigger: 'AUTOMATIC',
        rewardType: 'FIXED_AMOUNT',
        currencyCode: 'USD',
        fixedAmount: 200,
        percentageBps: null,
        maxDiscountAmount: null,
        minSubtotalAmount: 0,
        isCombinable: false,
        priority: 1,
        startsAt: null,
        endsAt: null,
        totalUsageLimit: null,
        perCustomerUsageLimit: null,
        maxApplicationsPerOrder: 1,
        reservedCount: 0,
        redeemedCount: 0,
        exclusions: [],
      },
      {
        id: 'promo_b',
        key: 'exclusive-b',
        name: 'Exclusive B',
        status: 'ACTIVE',
        trigger: 'AUTOMATIC',
        rewardType: 'FIXED_AMOUNT',
        currencyCode: 'USD',
        fixedAmount: 100,
        percentageBps: null,
        maxDiscountAmount: null,
        minSubtotalAmount: 0,
        isCombinable: true,
        priority: 2,
        startsAt: null,
        endsAt: null,
        totalUsageLimit: null,
        perCustomerUsageLimit: 1,
        maxApplicationsPerOrder: 1,
        reservedCount: 0,
        redeemedCount: 0,
        exclusions: [{ targetPromotionId: 'promo_a' }],
      },
    ]);
    prisma.coupon.findMany.mockResolvedValue([]);
    prisma.promotionRedemption.groupBy.mockResolvedValue([
      { promotionId: 'promo_b', _sum: { quantity: 1 } },
    ]);

    await expect(
      service.evaluate({
        subtotalAmount: 1000,
        currencyCode: 'USD',
        countryCode: 'US',
        customerId: 'user_1',
      }),
    ).resolves.toMatchObject({
      appliedPromotions: [{ key: 'exclusive-a' }],
      rejectedPromotions: expect.arrayContaining([
        { key: 'min-spend', reason: 'minimum_subtotal_not_met' },
        { key: 'exclusive-b', reason: 'promotion_customer_limit_reached' },
      ]),
    });
  });
});
