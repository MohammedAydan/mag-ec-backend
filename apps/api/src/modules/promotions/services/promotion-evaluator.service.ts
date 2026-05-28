import { Inject, Injectable } from '@nestjs/common';

import { PrismaService } from '../../persistence/services/prisma.service';
import { MoneyService } from '../../pricing/services/money.service';
import { CouponNormalizerService } from './coupon-normalizer.service';
import type {
  PromotionApplication,
  PromotionEvaluationInput,
  PromotionEvaluationResult,
  PromotionRejection,
} from '../promotions.types';

interface PromotionCandidateRecord {
  id: string;
  key: string;
  name: string;
  status: string;
  trigger: 'AUTOMATIC' | 'COUPON';
  rewardType: 'FIXED_AMOUNT' | 'PERCENTAGE' | 'FREE_SHIPPING';
  currencyCode: string | null;
  fixedAmount: number | null;
  percentageBps: number | null;
  maxDiscountAmount: number | null;
  minSubtotalAmount: number | null;
  isCombinable: boolean;
  priority: number;
  startsAt: Date | null;
  endsAt: Date | null;
  totalUsageLimit: number | null;
  perCustomerUsageLimit: number | null;
  maxApplicationsPerOrder: number;
  reservedCount: number;
  redeemedCount: number;
  exclusions: Array<{ targetPromotionId: string }>;
}

interface CouponCandidateRecord {
  id: string;
  code: string;
  status: string;
  startsAt: Date | null;
  endsAt: Date | null;
  totalUsageLimit: number | null;
  perCustomerUsageLimit: number | null;
  reservedCount: number;
  redeemedCount: number;
  promotion: PromotionCandidateRecord;
}

interface GroupedUsageRecord {
  promotionId?: string;
  couponId?: string;
  _sum: { quantity: number | null };
}

interface PromotionEvaluatorPrismaClient {
  promotion: {
    findMany(args: unknown): Promise<PromotionCandidateRecord[]>;
  };
  coupon: {
    findMany(args: unknown): Promise<CouponCandidateRecord[]>;
  };
  promotionRedemption: {
    groupBy(args: unknown): Promise<GroupedUsageRecord[]>;
  };
  couponRedemption: {
    groupBy(args: unknown): Promise<GroupedUsageRecord[]>;
  };
}

@Injectable()
export class PromotionEvaluatorService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(MoneyService) private readonly moneyService: MoneyService,
    @Inject(CouponNormalizerService) private readonly couponNormalizer: CouponNormalizerService,
  ) {}

  private get prismaClient(): PromotionEvaluatorPrismaClient {
    return this.prisma as unknown as PromotionEvaluatorPrismaClient;
  }

  async evaluate(input: PromotionEvaluationInput): Promise<PromotionEvaluationResult> {
    const now = new Date();
    const normalizedCurrency = this.moneyService.normalizeCurrencyCode(input.currencyCode);
    const normalizedCouponCodes = (input.couponCodes ?? []).map((code) =>
      this.couponNormalizer.normalize(code),
    );

    const [automaticPromotions, coupons] = await Promise.all([
      this.prismaClient.promotion.findMany({
        where: {
          status: 'ACTIVE',
          trigger: 'AUTOMATIC',
        },
        include: {
          exclusions: true,
        },
        orderBy: [{ priority: 'asc' }, { createdAt: 'asc' }],
      }),
      normalizedCouponCodes.length > 0
        ? this.prismaClient.coupon.findMany({
            where: {
              normalizedCode: {
                in: normalizedCouponCodes,
              },
            },
            include: {
              promotion: {
                include: {
                  exclusions: true,
                },
              },
            },
          })
        : Promise.resolve([]),
    ]);

    const customerPromotionUsage =
      input.customerId === undefined
        ? new Map<string, number>()
        : new Map(
            (
              await this.prismaClient.promotionRedemption.groupBy({
                by: ['promotionId'],
                where: {
                  userId: input.customerId,
                  status: {
                    in: ['RESERVED', 'REDEEMED'],
                  },
                },
                _sum: {
                  quantity: true,
                },
              })
            ).map((row) => [row.promotionId ?? '', row._sum.quantity ?? 0]),
          );

    const customerCouponUsage =
      input.customerId === undefined
        ? new Map<string, number>()
        : new Map(
            (
              await this.prismaClient.couponRedemption.groupBy({
                by: ['couponId'],
                where: {
                  userId: input.customerId,
                  status: {
                    in: ['RESERVED', 'REDEEMED'],
                  },
                },
                _sum: {
                  quantity: true,
                },
              })
            ).map((row) => [row.couponId ?? '', row._sum.quantity ?? 0]),
          );

    const rejections: PromotionRejection[] = [];
    const applied: PromotionApplication[] = [];
    const appliedIds = new Set<string>();
    let currentSubtotal = input.subtotalAmount;
    let subtotalDiscountAmount = 0;
    let freeShipping = false;

    const candidates = [
      ...automaticPromotions.map((promotion: PromotionCandidateRecord) => ({
        promotion,
        source: 'AUTOMATIC' as const,
      })),
      ...coupons.map((coupon) => ({
        promotion: coupon.promotion,
        coupon,
        source: 'COUPON' as const,
      })),
    ].sort((left, right) => left.promotion.priority - right.promotion.priority);

    for (const candidate of candidates) {
      const promotion = candidate.promotion;
      const coupon = 'coupon' in candidate ? candidate.coupon : undefined;
      const rejection = this.getEligibilityRejection({
        promotion,
        coupon,
        now,
        subtotalAmount: currentSubtotal,
        currencyCode: normalizedCurrency,
        customerPromotionUsageCount: customerPromotionUsage.get(promotion.id) ?? 0,
        customerCouponUsageCount: coupon ? (customerCouponUsage.get(coupon.id) ?? 0) : 0,
        alreadyAppliedCount: appliedIds.has(promotion.id) ? 1 : 0,
      });

      if (rejection) {
        rejections.push({
          key: promotion.key,
          reason: rejection,
          couponCode: coupon?.code,
        });
        continue;
      }

      const excludedByApplied = applied.some((entry) =>
        promotion.exclusions.some(
          (exclusion: { targetPromotionId: string }) =>
            exclusion.targetPromotionId === entry.promotionId,
        ),
      );
      const blockedByAppliedNonCombinable =
        applied.some((entry) => entry.freeShipping === false) &&
        (!promotion.isCombinable ||
          applied.some((entry) => !this.isPromotionCombinable(entry.promotionId, candidates)));
      const blocksExistingApplied = !promotion.isCombinable && applied.length > 0;

      if (excludedByApplied || blockedByAppliedNonCombinable || blocksExistingApplied) {
        rejections.push({
          key: promotion.key,
          reason: 'stacking_not_allowed',
          couponCode: coupon?.code,
        });
        continue;
      }

      const application = this.applyPromotion({
        promotion,
        source: candidate.source,
        couponCode: coupon?.code,
        subtotalAmount: currentSubtotal,
        currencyCode: normalizedCurrency,
      });

      if (application.discountAmount > 0) {
        currentSubtotal -= application.discountAmount;
        subtotalDiscountAmount += application.discountAmount;
      }
      if (application.freeShipping) {
        freeShipping = true;
      }

      appliedIds.add(promotion.id);
      applied.push(application);
    }

    return {
      appliedPromotions: applied,
      rejectedPromotions: rejections,
      subtotalDiscountAmount,
      freeShipping,
    };
  }

  private getEligibilityRejection(input: {
    promotion: {
      id: string;
      key: string;
      status: string;
      startsAt: Date | null;
      endsAt: Date | null;
      minSubtotalAmount: number | null;
      rewardType: string;
      currencyCode: string | null;
      totalUsageLimit: number | null;
      reservedCount: number;
      redeemedCount: number;
      perCustomerUsageLimit: number | null;
      maxApplicationsPerOrder: number;
    };
    coupon?: {
      id: string;
      code: string;
      status: string;
      startsAt: Date | null;
      endsAt: Date | null;
      totalUsageLimit: number | null;
      reservedCount: number;
      redeemedCount: number;
      perCustomerUsageLimit: number | null;
    };
    now: Date;
    subtotalAmount: number;
    currencyCode: string;
    customerPromotionUsageCount: number;
    customerCouponUsageCount: number;
    alreadyAppliedCount: number;
  }) {
    const { promotion, coupon, now } = input;

    if (promotion.status !== 'ACTIVE') {
      return 'promotion_inactive';
    }
    if (promotion.startsAt && promotion.startsAt > now) {
      return 'promotion_not_started';
    }
    if (promotion.endsAt && promotion.endsAt < now) {
      return 'promotion_expired';
    }
    if (
      promotion.minSubtotalAmount !== null &&
      input.subtotalAmount < promotion.minSubtotalAmount
    ) {
      return 'minimum_subtotal_not_met';
    }
    if (
      promotion.rewardType === 'FIXED_AMOUNT' &&
      this.moneyService.normalizeCurrencyCode(promotion.currencyCode ?? '') !== input.currencyCode
    ) {
      return 'currency_mismatch';
    }
    if (
      promotion.totalUsageLimit !== null &&
      promotion.reservedCount + promotion.redeemedCount >= promotion.totalUsageLimit
    ) {
      return 'promotion_usage_exhausted';
    }
    if (
      promotion.perCustomerUsageLimit !== null &&
      input.customerPromotionUsageCount >= promotion.perCustomerUsageLimit
    ) {
      return 'promotion_customer_limit_reached';
    }
    if (input.alreadyAppliedCount >= promotion.maxApplicationsPerOrder) {
      return 'promotion_order_limit_reached';
    }

    if (coupon) {
      if (coupon.status !== 'ACTIVE') {
        return 'coupon_inactive';
      }
      if (coupon.startsAt && coupon.startsAt > now) {
        return 'coupon_not_started';
      }
      if (coupon.endsAt && coupon.endsAt < now) {
        return 'coupon_expired';
      }
      if (
        coupon.totalUsageLimit !== null &&
        coupon.reservedCount + coupon.redeemedCount >= coupon.totalUsageLimit
      ) {
        return 'coupon_usage_exhausted';
      }
      if (
        coupon.perCustomerUsageLimit !== null &&
        input.customerCouponUsageCount >= coupon.perCustomerUsageLimit
      ) {
        return 'coupon_customer_limit_reached';
      }
    }

    return null;
  }

  private applyPromotion(input: {
    promotion: {
      id: string;
      key: string;
      name: string;
      rewardType: 'FIXED_AMOUNT' | 'PERCENTAGE' | 'FREE_SHIPPING';
      fixedAmount: number | null;
      percentageBps: number | null;
      maxDiscountAmount: number | null;
    };
    source: 'AUTOMATIC' | 'COUPON';
    couponCode?: string;
    subtotalAmount: number;
    currencyCode: string;
  }): PromotionApplication {
    let discountAmount = 0;
    let freeShipping = false;

    if (input.promotion.rewardType === 'FIXED_AMOUNT') {
      discountAmount = Math.min(input.subtotalAmount, input.promotion.fixedAmount ?? 0);
    } else if (input.promotion.rewardType === 'PERCENTAGE') {
      const calculated = this.moneyService.applyBasisPoints(
        this.moneyService.create(input.subtotalAmount, input.currencyCode),
        input.promotion.percentageBps ?? 0,
      ).amount;
      discountAmount =
        input.promotion.maxDiscountAmount === null
          ? calculated
          : Math.min(calculated, input.promotion.maxDiscountAmount);
    } else {
      freeShipping = true;
    }

    return {
      promotionId: input.promotion.id,
      key: input.promotion.key,
      name: input.promotion.name,
      rewardType: input.promotion.rewardType,
      discountAmount,
      freeShipping,
      source: input.source,
      couponCode: input.couponCode,
    };
  }

  private isPromotionCombinable(
    promotionId: string,
    candidates: Array<{ promotion: { id: string; isCombinable: boolean } }>,
  ) {
    return (
      candidates.find((candidate) => candidate.promotion.id === promotionId)?.promotion
        .isCombinable ?? false
    );
  }
}
