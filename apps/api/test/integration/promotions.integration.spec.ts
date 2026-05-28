import 'dotenv/config';

import {
  assertMysqlDatabaseAvailable,
  createMysqlTestPrismaClient,
} from './support/mysql-test-client';

interface PromotionIntegrationPrismaClient {
  promotion: {
    create(args: unknown): Promise<{ id: string }>;
    findUnique(args: unknown): Promise<{
      exclusions: unknown[];
      coupons: unknown[];
      redemptions: unknown[];
    } | null>;
    delete(args: unknown): Promise<unknown>;
  };
  promotionExclusion: {
    create(args: unknown): Promise<unknown>;
    deleteMany(args: unknown): Promise<unknown>;
  };
  coupon: {
    create(args: unknown): Promise<{ id: string }>;
    delete(args: unknown): Promise<unknown>;
  };
  promotionRedemption: {
    create(args: unknown): Promise<unknown>;
    deleteMany(args: unknown): Promise<unknown>;
  };
  couponRedemption: {
    create(args: unknown): Promise<unknown>;
    deleteMany(args: unknown): Promise<unknown>;
  };
  $disconnect(): Promise<void>;
}

const runMysqlIntegration = process.env.RUN_MYSQL_INTEGRATION === 'true';

const describeMysqlIntegration = runMysqlIntegration ? describe : describe.skip;

describeMysqlIntegration('promotions integration', () => {
  const prisma = createMysqlTestPrismaClient() as unknown as PromotionIntegrationPrismaClient;

  beforeAll(async () => {
    await assertMysqlDatabaseAvailable(prisma as never, 'promotions integration');
  });

  afterAll(async () => {
    await prisma.$disconnect();
  });

  it('persists promotions, coupons, exclusions, and usage ledgers relationally', async () => {
    const suffix = `${Date.now()}`;

    const promotion = await prisma.promotion.create({
      data: {
        key: `promo-${suffix}`,
        name: 'Promo',
        status: 'ACTIVE',
        rewardType: 'PERCENTAGE',
        trigger: 'COUPON',
        percentageBps: 1000,
      },
    });

    const excludedPromotion = await prisma.promotion.create({
      data: {
        key: `promo-excluded-${suffix}`,
        name: 'Excluded Promo',
        status: 'ACTIVE',
        rewardType: 'FIXED_AMOUNT',
        trigger: 'AUTOMATIC',
        currencyCode: 'USD',
        fixedAmount: 500,
      },
    });

    await prisma.promotionExclusion.create({
      data: {
        sourcePromotionId: promotion.id,
        targetPromotionId: excludedPromotion.id,
      },
    });

    const coupon = await prisma.coupon.create({
      data: {
        promotionId: promotion.id,
        code: `SAVE-${suffix}`,
        normalizedCode: `SAVE${suffix}`,
      },
    });

    await prisma.promotionRedemption.create({
      data: {
        promotionId: promotion.id,
        status: 'RESERVED',
      },
    });

    await prisma.couponRedemption.create({
      data: {
        couponId: coupon.id,
        status: 'REDEEMED',
      },
    });

    const storedPromotion = await prisma.promotion.findUnique({
      where: { id: promotion.id },
      include: {
        exclusions: true,
        coupons: true,
        redemptions: true,
      },
    });

    expect(storedPromotion?.exclusions).toHaveLength(1);
    expect(storedPromotion?.coupons).toHaveLength(1);
    expect(storedPromotion?.redemptions).toHaveLength(1);

    await prisma.couponRedemption.deleteMany({ where: { couponId: coupon.id } });
    await prisma.promotionRedemption.deleteMany({ where: { promotionId: promotion.id } });
    await prisma.coupon.delete({ where: { id: coupon.id } });
    await prisma.promotionExclusion.deleteMany({
      where: {
        OR: [
          { sourcePromotionId: promotion.id },
          { targetPromotionId: promotion.id },
          { sourcePromotionId: excludedPromotion.id },
          { targetPromotionId: excludedPromotion.id },
        ],
      },
    });
    await prisma.promotion.delete({ where: { id: promotion.id } });
    await prisma.promotion.delete({ where: { id: excludedPromotion.id } });
  });
});
