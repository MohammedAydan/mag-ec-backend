import { ForbiddenException } from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { PromotionUsageService } from './promotion-usage.service';
import type { PrismaService } from '../../persistence/services/prisma.service';
import type { PromotionApplication } from '../promotions.types';

type TxClient = {
  $executeRaw: jest.Mock;
  promotion: {
    findUniqueOrThrow: jest.Mock;
    updateMany: jest.Mock;
  };
  coupon: {
    findUniqueOrThrow: jest.Mock;
    updateMany: jest.Mock;
  };
  promotionRedemption: {
    create: jest.Mock;
  };
  couponRedemption: {
    create: jest.Mock;
  };
};

function makeTx(): TxClient {
  return {
    $executeRaw: jest.fn(),
    promotion: {
      findUniqueOrThrow: jest.fn(),
      updateMany: jest.fn(),
    },
    coupon: {
      findUniqueOrThrow: jest.fn(),
      updateMany: jest.fn(),
    },
    promotionRedemption: {
      create: jest.fn(),
    },
    couponRedemption: {
      create: jest.fn(),
    },
  };
}

function makeAppliedPromotions(
  overrides: Partial<PromotionApplication>[],
): PromotionApplication[] {
  return overrides.map((override) => ({
    promotionId: 'promo_1',
    key: 'test_promo',
    name: 'Test Promo',
    rewardType: 'FIXED_AMOUNT' as const,
    discountAmount: 500,
    freeShipping: false,
    source: 'AUTOMATIC' as const,
    ...override,
  }));
}

describe('PromotionUsageService', () => {
  let service: PromotionUsageService;
  let couponNormalizer: { normalize: jest.Mock };

  beforeEach(() => {
    couponNormalizer = {
      normalize: jest.fn((code: string) => code.trim().toUpperCase()),
    };
    service = new PromotionUsageService(
      {} as unknown as PrismaService,
      couponNormalizer,
    );
    jest.clearAllMocks();
  });

  // ── Happy path ──────────────────────────────────────────────────────────

  it('redeems a promotion successfully when limits are not set', async () => {
    const tx = makeTx();
    tx.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: null,
      perCustomerUsageLimit: null,
      key: 'test_promo',
    });
    tx.promotion.updateMany.mockResolvedValue({ count: 1 });

    const applied = makeAppliedPromotions([{}]);

    await expect(
      service.redeemAppliedPromotions(applied, 'order_1', undefined, tx as unknown as Prisma.TransactionClient),
    ).resolves.toBeUndefined();

    // updateMany was called (no totalUsageLimit → no redeemedCount filter)
    expect(tx.promotion.updateMany).toHaveBeenCalledTimes(1);
    expect(tx.promotion.updateMany).toHaveBeenCalledWith({
      where: { id: 'promo_1' },
      data: { redeemedCount: { increment: 1 } },
    });
    // Ledger created normally (no per-customer limit)
    expect(tx.promotionRedemption.create).toHaveBeenCalledWith(
      expect.objectContaining({
        data: expect.objectContaining({
          promotionId: 'promo_1',
          status: 'REDEEMED',
          orderReference: 'order_1',
          reservationKey: 'order:order_1:promotion:promo_1',
        }),
      }),
    );
  });

  it('redeems a promotion and coupon together', async () => {
    const tx = makeTx();
    tx.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: null,
      perCustomerUsageLimit: null,
      key: 'test_promo',
    });
    tx.promotion.updateMany.mockResolvedValue({ count: 1 });
    tx.coupon.findUniqueOrThrow.mockResolvedValue({
      id: 'coupon_1',
      code: 'SAVE10',
      perCustomerUsageLimit: null,
      totalUsageLimit: null,
    });
    tx.coupon.updateMany.mockResolvedValue({ count: 1 });

    const applied = makeAppliedPromotions([
      { source: 'COUPON', couponCode: 'save10' },
    ]);

    await expect(
      service.redeemAppliedPromotions(applied, 'order_2', 'user_1', tx as unknown as Prisma.TransactionClient),
    ).resolves.toBeUndefined();

    expect(tx.promotion.updateMany).toHaveBeenCalledTimes(1);
    expect(tx.coupon.updateMany).toHaveBeenCalledTimes(1);
    expect(tx.promotionRedemption.create).toHaveBeenCalledTimes(1);
    expect(tx.couponRedemption.create).toHaveBeenCalledTimes(1);
  });

  // ── Total usage limit (via updateMany) ──────────────────────────────────

  it('throws when promotion total usage limit is exceeded (updateMany returns count 0)', async () => {
    const tx = makeTx();
    tx.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: 100,
      perCustomerUsageLimit: null,
      key: 'test_promo',
    });
    tx.promotion.updateMany.mockResolvedValue({ count: 0 }); // limit hit

    const applied = makeAppliedPromotions([{}]);

    await expect(
      service.redeemAppliedPromotions(applied, 'order_3', undefined, tx as unknown as Prisma.TransactionClient),
    ).rejects.toThrow(ForbiddenException);

    expect(tx.promotion.updateMany).toHaveBeenCalledTimes(1);
    // Redemption must NOT be created when the total limit is exceeded
    expect(tx.promotionRedemption.create).not.toHaveBeenCalled();
  });

  it('includes redeemedCount < totalUsageLimit filter when limit is set', async () => {
    const tx = makeTx();
    tx.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: 50,
      perCustomerUsageLimit: null,
      key: 'test_promo',
    });
    tx.promotion.updateMany.mockResolvedValue({ count: 1 });

    const applied = makeAppliedPromotions([{}]);

    await service.redeemAppliedPromotions(applied, 'order_4', undefined, tx as unknown as Prisma.TransactionClient);

    expect(tx.promotion.updateMany).toHaveBeenCalledWith({
      where: {
        id: 'promo_1',
        redeemedCount: { lt: 50 },
      },
      data: { redeemedCount: { increment: 1 } },
    });
  });

  it('throws when coupon total usage limit is exceeded', async () => {
    const tx = makeTx();
    tx.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: null,
      perCustomerUsageLimit: null,
      key: 'test_promo',
    });
    tx.promotion.updateMany.mockResolvedValue({ count: 1 });
    tx.coupon.findUniqueOrThrow.mockResolvedValue({
      id: 'coupon_1',
      code: 'SAVE10',
      perCustomerUsageLimit: null,
      totalUsageLimit: 5,
    });
    tx.coupon.updateMany.mockResolvedValue({ count: 0 }); // coupon limit hit

    const applied = makeAppliedPromotions([
      { source: 'COUPON', couponCode: 'save10' },
    ]);

    await expect(
      service.redeemAppliedPromotions(applied, 'order_5', undefined, tx as unknown as Prisma.TransactionClient),
    ).rejects.toThrow(ForbiddenException);

    // Promotion updateMany succeeded, but coupon did not
    expect(tx.promotion.updateMany).toHaveBeenCalledTimes(1);
    expect(tx.coupon.updateMany).toHaveBeenCalledTimes(1);
    expect(tx.promotionRedemption.create).toHaveBeenCalledTimes(1);
    expect(tx.couponRedemption.create).not.toHaveBeenCalled();
  });

  // ── Per-customer limit (race-safe conditional INSERT) ───────────────────

  it('throws when per-customer promotion limit is reached (conditional INSERT returns 0)', async () => {
    const tx = makeTx();
    tx.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: null,
      perCustomerUsageLimit: 1,
      key: 'test_promo',
    });
    tx.promotion.updateMany.mockResolvedValue({ count: 1 });
    // Conditional INSERT returns 0 → limit hit
    tx.$executeRaw.mockResolvedValue(0);

    const applied = makeAppliedPromotions([{}]);

    await expect(
      service.redeemAppliedPromotions(applied, 'order_6', 'user_1', tx as unknown as Prisma.TransactionClient),
    ).rejects.toThrow(ForbiddenException);

    // updateMany succeeded but per-customer INSERT blocked
    expect(tx.promotion.updateMany).toHaveBeenCalledTimes(1);
    expect(tx.$executeRaw).toHaveBeenCalledTimes(1);
    // Normal redemption create must NOT be called for per-customer path
    expect(tx.promotionRedemption.create).not.toHaveBeenCalled();
  });

  it('throws when per-customer coupon limit is reached (conditional INSERT returns 0)', async () => {
    const tx = makeTx();
    tx.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: null,
      perCustomerUsageLimit: null,
      key: 'test_promo',
    });
    tx.promotion.updateMany.mockResolvedValue({ count: 1 });
    tx.coupon.findUniqueOrThrow.mockResolvedValue({
      id: 'coupon_1',
      code: 'SAVE10',
      perCustomerUsageLimit: 1,
      totalUsageLimit: null,
    });
    tx.coupon.updateMany.mockResolvedValue({ count: 1 });
    // Coupon conditional INSERT returns 0 → limit hit
    tx.$executeRaw.mockResolvedValue(0);

    const applied = makeAppliedPromotions([
      { source: 'COUPON', couponCode: 'save10' },
    ]);

    await expect(
      service.redeemAppliedPromotions(applied, 'order_7', 'user_1', tx as unknown as Prisma.TransactionClient),
    ).rejects.toThrow(ForbiddenException);

    // Promotion succeeded, coupon per-customer blocked
    expect(tx.promotion.updateMany).toHaveBeenCalledTimes(1);
    expect(tx.coupon.updateMany).toHaveBeenCalledTimes(1);
    expect(tx.promotionRedemption.create).toHaveBeenCalledTimes(1);
    expect(tx.couponRedemption.create).not.toHaveBeenCalled();
  });

  it('skips per-customer check when no userId is provided (uses normal create)', async () => {
    const tx = makeTx();
    tx.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: null,
      perCustomerUsageLimit: 1, // limit exists but no userId → skipped
      key: 'test_promo',
    });
    tx.promotion.updateMany.mockResolvedValue({ count: 1 });

    const applied = makeAppliedPromotions([{}]);

    await service.redeemAppliedPromotions(applied, 'order_8', undefined, tx as unknown as Prisma.TransactionClient);

    // No userId → no conditional INSERT, normal create used
    expect(tx.$executeRaw).not.toHaveBeenCalled();
    expect(tx.promotionRedemption.create).toHaveBeenCalledTimes(1);
  });

  // ── Per-customer limit: happy path (conditional INSERT succeeds) ────────

  it('creates redemption via conditional INSERT when per-customer limit is set', async () => {
    const tx = makeTx();
    tx.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: null,
      perCustomerUsageLimit: 1,
      key: 'test_promo',
    });
    tx.promotion.updateMany.mockResolvedValue({ count: 1 });
    tx.$executeRaw.mockResolvedValue(1); // conditional INSERT succeeds

    const applied = makeAppliedPromotions([{}]);

    await expect(
      service.redeemAppliedPromotions(applied, 'order_9', 'user_1', tx as unknown as Prisma.TransactionClient),
    ).resolves.toBeUndefined();

    expect(tx.promotion.updateMany).toHaveBeenCalledTimes(1);
    expect(tx.$executeRaw).toHaveBeenCalledTimes(1);
    // Conditional INSERT replaces the normal create – normal create must not be called
    expect(tx.promotionRedemption.create).not.toHaveBeenCalled();
  });

  // ── Concurrency: race prevention ─────────────────────────────────────────

  it('prevents two concurrent checkouts from exceeding total usage limit', async () => {
    // Simulate two concurrent transactions. Transaction A's updateMany
    // sees count=1; transaction B's updateMany sees count=0 because
    // the redeemedCount is already at the limit.

    // Transaction A: passes
    const txA = makeTx();
    txA.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: 1,
      perCustomerUsageLimit: null,
      key: 'test_promo',
    });
    txA.promotion.updateMany.mockResolvedValue({ count: 1 });

    // Transaction B: fails (redeemedCount already at limit)
    const txB = makeTx();
    txB.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: 1,
      perCustomerUsageLimit: null,
      key: 'test_promo',
    });
    txB.promotion.updateMany.mockResolvedValue({ count: 0 });

    const applied = makeAppliedPromotions([{}]);

    // eslint-disable-next-line @typescript-eslint/no-unsafe-argument
    await service.redeemAppliedPromotions(applied, 'order_a', 'user_a', txA as any);
    expect(txA.promotionRedemption.create).toHaveBeenCalled();

    await expect(
      // eslint-disable-next-line @typescript-eslint/no-unsafe-argument
      service.redeemAppliedPromotions(applied, 'order_b', 'user_b', txB as any),
    ).rejects.toThrow(ForbiddenException);

    expect(txB.promotion.updateMany).toHaveBeenCalledTimes(1);
    expect(txB.promotionRedemption.create).not.toHaveBeenCalled();
  });

  it('prevents two concurrent checkouts from exceeding per-customer limit', async () => {
    // Two customers attempt the same promotion with perCustomerUsageLimit=1.
    // The first conditional INSERT succeeds (1), the second returns 0.

    // Transaction A: passes
    const txA = makeTx();
    txA.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: null,
      perCustomerUsageLimit: 1,
      key: 'test_promo',
    });
    txA.promotion.updateMany.mockResolvedValue({ count: 1 });
    txA.$executeRaw.mockResolvedValue(1);

    // Transaction B: per-customer limit hit (conditional INSERT returns 0)
    const txB = makeTx();
    txB.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: null,
      perCustomerUsageLimit: 1,
      key: 'test_promo',
    });
    txB.promotion.updateMany.mockResolvedValue({ count: 1 });
    txB.$executeRaw.mockResolvedValue(0);

    const applied = makeAppliedPromotions([{}]);

    // eslint-disable-next-line @typescript-eslint/no-unsafe-argument
    await service.redeemAppliedPromotions(applied, 'order_a', 'user_a', txA as any);

    await expect(
      // eslint-disable-next-line @typescript-eslint/no-unsafe-argument
      service.redeemAppliedPromotions(applied, 'order_b', 'user_a', txB as any),
    ).rejects.toThrow(ForbiddenException);

    // Transaction B's updateMany succeeded (total limit not set), but
    // the per-customer conditional INSERT blocked it.
    expect(txB.promotion.updateMany).toHaveBeenCalledTimes(1);
    expect(txB.$executeRaw).toHaveBeenCalledTimes(1);
  });

  // ── Concurrency: Promise.all simulation ─────────────────────────────────

  it('handles concurrent redemptions via Promise.all without exceeding limits', async () => {
    // Fire multiple concurrent redemption attempts against a promotion
    // with totalUsageLimit=2. Only two should succeed.

    const CONCURRENCY = 5;

    // Track how many times updateMany returned count=1
    let successCount = 0;

    // Each concurrent call gets its own mock tx
    const makeConcurrentTx = () => {
      const tx = makeTx();
      tx.promotion.findUniqueOrThrow.mockResolvedValue({
        totalUsageLimit: 2,
        perCustomerUsageLimit: null,
        key: 'limited_promo',
      });
      // First 2 calls succeed, subsequent calls fail
      tx.promotion.updateMany.mockImplementation(() => {
        successCount += 1;
        return Promise.resolve({ count: successCount <= 2 ? 1 : 0 });
      });
      return tx;
    };

    const concurrentCalls = Array.from({ length: CONCURRENCY }, (_, i) => {
      const tx = makeConcurrentTx();
      const applied = makeAppliedPromotions([
        { promotionId: `promo_${i}`, key: `promo_${i}` },
      ]);
      return service
        .redeemAppliedPromotions(applied, `order_c${i}`, `user_c${i}`, tx as unknown as Prisma.TransactionClient)
        .then(() => 'success' as const)
        .catch(() => 'rejected' as const);
    });

    const settled = await Promise.all(concurrentCalls);

    // Exactly 2 successes, 3 rejections
    const successes = settled.filter((s) => s === 'success').length;
    const rejections = settled.filter((s) => s === 'rejected').length;
    expect(successes).toBe(2);
    expect(rejections).toBe(3);
  });

  // ── Multiple promotions ──────────────────────────────────────────────────

  it('processes multiple applied promotions in one call', async () => {
    const tx = makeTx();
    tx.promotion.findUniqueOrThrow.mockResolvedValue({
      totalUsageLimit: null,
      perCustomerUsageLimit: null,
      key: 'test_promo',
    });
    tx.promotion.updateMany.mockResolvedValue({ count: 1 });

    const applied = makeAppliedPromotions([
      { promotionId: 'promo_1', key: 'first' },
      { promotionId: 'promo_2', key: 'second' },
    ]);

    await service.redeemAppliedPromotions(applied, 'order_10', 'user_x', tx as unknown as Prisma.TransactionClient);

    expect(tx.promotion.updateMany).toHaveBeenCalledTimes(2);
    expect(tx.promotion.findUniqueOrThrow).toHaveBeenCalledTimes(2);
    expect(tx.promotionRedemption.create).toHaveBeenCalledTimes(2);
  });

  it('rolls back when the second of two promotions hits a limit', async () => {
    const tx = makeTx();
    // First promotion succeeds
    tx.promotion.findUniqueOrThrow.mockResolvedValueOnce({
      totalUsageLimit: null,
      perCustomerUsageLimit: null,
      key: 'first',
    });
    tx.promotion.findUniqueOrThrow.mockResolvedValueOnce({
      totalUsageLimit: 1,
      perCustomerUsageLimit: null,
      key: 'second',
    });
    tx.promotion.updateMany.mockResolvedValueOnce({ count: 1 }).mockResolvedValueOnce({ count: 0 });

    const applied = makeAppliedPromotions([
      { promotionId: 'promo_1', key: 'first' },
      { promotionId: 'promo_2', key: 'second' },
    ]);

    await expect(
      service.redeemAppliedPromotions(applied, 'order_11', 'user_x', tx as unknown as Prisma.TransactionClient),
    ).rejects.toThrow(ForbiddenException);

    // The transaction is aborted by the throw; the caller's transaction
    // wrapper will roll back. In the unit test we just verify the calls.
    expect(tx.promotion.updateMany).toHaveBeenCalledTimes(2);
    expect(tx.promotionRedemption.create).toHaveBeenCalledTimes(1); // only first
  });
});
