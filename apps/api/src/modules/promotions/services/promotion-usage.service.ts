import { randomUUID } from 'node:crypto';

import { ForbiddenException, Inject, Injectable } from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import type { PromotionApplication } from '../promotions.types';
import { CouponNormalizerService } from './coupon-normalizer.service';
import { PrismaService } from '../../persistence/services/prisma.service';

@Injectable()
export class PromotionUsageService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
    @Inject(CouponNormalizerService)
    private readonly couponNormalizerService: CouponNormalizerService,
  ) {}

  /**
   * Redeems applied promotions atomically within the supplied transaction.
   *
   * **Race-safe design (SEC-015):**
   *
   * - **Total usage limits**: enforced via a conditional `updateMany` whose
   *   WHERE clause checks that `redeemedCount` is still below the limit at
   *   the moment the UPDATE acquires its row lock. If another concurrent
   *   checkout already incremented past the limit, the WHERE does not match
   *   and `result.count` will be 0, causing a `ForbiddenException`.
   *
   * - **Per-customer limits**: enforced via a conditional `INSERT …
   *   SELECT … WHERE` that counts existing ledger rows inside a single
   *   atomic statement. The INSERT only materialises when the sub-query
   *   count is below the per-customer cap. If 0 rows are inserted the
   *   transaction throws, and the Prisma interactive-transaction wrapper
   *   rolls back all prior side-effects.
   */
  async redeemAppliedPromotions(
    appliedPromotions: PromotionApplication[],
    orderReference: string,
    userId?: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    for (const promotion of appliedPromotions) {
      await this.redeemPromotion(promotion, orderReference, userId, tx);

      // ── Coupon handling ───────────────────────────────────────────────
      if (promotion.source !== 'COUPON' || !promotion.couponCode) {
        continue;
      }

      await this.redeemCoupon(promotion, orderReference, userId, tx);
    }
  }

  // ────────────────────────────────────────────────────────────────────────
  //  Promotion redemption (race-safe)
  // ────────────────────────────────────────────────────────────────────────

  private async redeemPromotion(
    promotion: PromotionApplication,
    orderReference: string,
    userId: string | undefined,
    tx: Prisma.TransactionClient,
  ) {
    const currentPromotion = await tx.promotion.findUniqueOrThrow({
      where: { id: promotion.promotionId },
      select: { totalUsageLimit: true, perCustomerUsageLimit: true, key: true },
    });

    // ── 1. Total usage limit: conditional atomic increment ──────────────
    const totalResult = await tx.promotion.updateMany({
      where: {
        id: promotion.promotionId,
        ...(currentPromotion.totalUsageLimit !== null
          ? { redeemedCount: { lt: currentPromotion.totalUsageLimit } }
          : {}),
      },
      data: { redeemedCount: { increment: 1 } },
    });

    if (totalResult.count !== 1) {
      throw new ForbiddenException(
        `Promotion "${currentPromotion.key}" usage limit has been exceeded.`,
      );
    }

    // ── 2. Per-customer limit + ledger entry ────────────────────────────
    const reservationKey = `order:${orderReference}:promotion:${promotion.promotionId}`;

    if (userId && currentPromotion.perCustomerUsageLimit !== null) {
      await this.createPromotionRedemptionWithCustomerLimit(
        promotion.promotionId,
        currentPromotion.key,
        currentPromotion.perCustomerUsageLimit,
        orderReference,
        reservationKey,
        userId,
        tx,
      );
    } else {
      await tx.promotionRedemption.create({
        data: {
          promotionId: promotion.promotionId,
          userId: userId ?? null,
          orderReference,
          reservationKey,
          status: 'REDEEMED',
          quantity: 1,
        },
      });
    }
  }

  /**
   * Creates a `PromotionRedemption` ledger row while atomically enforcing
   * the per-customer usage limit. The INSERT only succeeds when the sub-query
   * confirms the customer has not yet reached the cap; otherwise 0 rows are
   * written and a `ForbiddenException` is thrown, causing the calling
   * interactive transaction to roll back.
   */
  private async createPromotionRedemptionWithCustomerLimit(
    promotionId: string,
    promotionKey: string,
    perCustomerUsageLimit: number,
    orderReference: string,
    reservationKey: string,
    userId: string,
    tx: Prisma.TransactionClient,
  ) {
    const redemptionId = randomUUID();

    const inserted = await tx.$executeRaw`
      INSERT INTO \`PromotionRedemption\`
        (\`id\`, \`promotionId\`, \`userId\`, \`orderReference\`,
         \`reservationKey\`, \`status\`, \`quantity\`,
         \`createdAt\`, \`updatedAt\`)
      SELECT
        ${redemptionId}, ${promotionId}, ${userId}, ${orderReference},
        ${reservationKey}, 'REDEEMED', 1,
        NOW(), NOW()
      WHERE (
        SELECT COUNT(*)
        FROM \`PromotionRedemption\`
        WHERE \`promotionId\` = ${promotionId}
          AND \`userId\`        = ${userId}
          AND \`status\`        IN ('REDEEMED', 'RESERVED')
      ) < ${perCustomerUsageLimit}
    `;

    if (Number(inserted) !== 1) {
      throw new ForbiddenException(
        `Customer has reached the usage limit for promotion "${promotionKey}".`,
      );
    }
  }

  // ────────────────────────────────────────────────────────────────────────
  //  Coupon redemption (race-safe)
  // ────────────────────────────────────────────────────────────────────────

  private async redeemCoupon(
    promotion: PromotionApplication,
    orderReference: string,
    userId: string | undefined,
    tx: Prisma.TransactionClient,
  ) {
    const couponCode = promotion.couponCode!;
    const normalizedCode = this.couponNormalizerService.normalize(couponCode);
    const coupon = await tx.coupon.findUniqueOrThrow({
      where: { normalizedCode },
    });

    // ── 1. Coupon total usage limit: conditional atomic increment ──────
    const totalResult = await tx.coupon.updateMany({
      where: {
        id: coupon.id,
        ...(coupon.totalUsageLimit !== null
          ? { redeemedCount: { lt: coupon.totalUsageLimit } }
          : {}),
      },
      data: { redeemedCount: { increment: 1 } },
    });

    if (totalResult.count !== 1) {
      throw new ForbiddenException(
        `Coupon "${coupon.code}" usage limit has been exceeded.`,
      );
    }

    // ── 2. Per-customer coupon limit + ledger entry ────────────────────
    const reservationKey = `order:${orderReference}:coupon:${coupon.id}`;

    if (userId && coupon.perCustomerUsageLimit !== null) {
      await this.createCouponRedemptionWithCustomerLimit(
        coupon.id,
        coupon.code,
        coupon.perCustomerUsageLimit,
        orderReference,
        reservationKey,
        userId,
        tx,
      );
    } else {
      await tx.couponRedemption.create({
        data: {
          couponId: coupon.id,
          userId: userId ?? null,
          orderReference,
          reservationKey,
          status: 'REDEEMED',
          quantity: 1,
        },
      });
    }
  }

  /**
   * Creates a `CouponRedemption` ledger row while atomically enforcing
   * the per-customer usage limit. See `createPromotionRedemptionWithCustomerLimit`
   * for the race-safety rationale.
   */
  private async createCouponRedemptionWithCustomerLimit(
    couponId: string,
    couponCode: string,
    perCustomerUsageLimit: number,
    orderReference: string,
    reservationKey: string,
    userId: string,
    tx: Prisma.TransactionClient,
  ) {
    const redemptionId = randomUUID();

    const inserted = await tx.$executeRaw`
      INSERT INTO \`CouponRedemption\`
        (\`id\`, \`couponId\`, \`userId\`, \`orderReference\`,
         \`reservationKey\`, \`status\`, \`quantity\`,
         \`createdAt\`, \`updatedAt\`)
      SELECT
        ${redemptionId}, ${couponId}, ${userId}, ${orderReference},
        ${reservationKey}, 'REDEEMED', 1,
        NOW(), NOW()
      WHERE (
        SELECT COUNT(*)
        FROM \`CouponRedemption\`
        WHERE \`couponId\` = ${couponId}
          AND \`userId\`   = ${userId}
          AND \`status\`   IN ('REDEEMED', 'RESERVED')
      ) < ${perCustomerUsageLimit}
    `;

    if (Number(inserted) !== 1) {
      throw new ForbiddenException(
        `Customer has reached the usage limit for coupon "${couponCode}".`,
      );
    }
  }
}
