import { Inject, Injectable } from '@nestjs/common';
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

  async redeemAppliedPromotions(
    appliedPromotions: PromotionApplication[],
    orderReference: string,
    userId?: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    for (const promotion of appliedPromotions) {
      await tx.promotionRedemption.create({
        data: {
          promotionId: promotion.promotionId,
          userId,
          orderReference,
          reservationKey: `order:${orderReference}:promotion:${promotion.promotionId}`,
          status: 'REDEEMED',
          quantity: 1,
        },
      });

      await tx.promotion.update({
        where: { id: promotion.promotionId },
        data: {
          redeemedCount: {
            increment: 1,
          },
        },
      });

      if (promotion.source !== 'COUPON' || !promotion.couponCode) {
        continue;
      }

      const normalizedCode = this.couponNormalizerService.normalize(promotion.couponCode);
      const coupon = await tx.coupon.findUniqueOrThrow({
        where: {
          normalizedCode,
        },
      });

      await tx.couponRedemption.create({
        data: {
          couponId: coupon.id,
          userId,
          orderReference,
          reservationKey: `order:${orderReference}:coupon:${coupon.id}`,
          status: 'REDEEMED',
          quantity: 1,
        },
      });

      await tx.coupon.update({
        where: { id: coupon.id },
        data: {
          redeemedCount: {
            increment: 1,
          },
        },
      });
    }
  }
}
