import { BadRequestException, Inject, Injectable, NotFoundException } from '@nestjs/common';

import { PrismaService } from '../../persistence/services/prisma.service';
import { CouponNormalizerService } from './coupon-normalizer.service';
import type { UpsertCouponDto, UpsertPromotionDto } from '../dto/promotions-admin.dto';

interface PromotionAdminTransactionClient {
  promotion: {
    upsert(args: unknown): Promise<{ id: string }>;
    findMany(args: unknown): Promise<Array<{ id: string }>>;
    findUniqueOrThrow(args: unknown): Promise<unknown>;
  };
  promotionExclusion: {
    deleteMany(args: unknown): Promise<unknown>;
    createMany(args: unknown): Promise<unknown>;
  };
  coupon: {
    upsert(args: unknown): Promise<unknown>;
  };
  auditLog: {
    create(args: unknown): Promise<unknown>;
  };
}

interface PromotionAdminPrismaClient {
  promotion: {
    findUnique(args: unknown): Promise<{ id: string; trigger: string } | null>;
  };
  $transaction<T>(callback: (tx: PromotionAdminTransactionClient) => Promise<T>): Promise<T>;
}

@Injectable()
export class PromotionAdminService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(CouponNormalizerService) private readonly couponNormalizer: CouponNormalizerService,
  ) {}

  private get prismaClient(): PromotionAdminPrismaClient {
    return this.prisma;
  }

  listPromotions() {
    return this.prisma.promotion.findMany({
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
      include: {
        coupons: { orderBy: [{ createdAt: 'desc' }, { id: 'desc' }] },
        exclusions: true,
      },
    });
  }

  async getPromotion(promotionId: string) {
    const promotion = await this.prisma.promotion.findUnique({
      where: { id: promotionId },
      include: {
        coupons: { orderBy: [{ createdAt: 'desc' }, { id: 'desc' }] },
        exclusions: true,
      },
    });

    if (!promotion) {
      throw new NotFoundException('Promotion not found');
    }

    return promotion;
  }

  async upsertPromotion(promotionKey: string, dto: UpsertPromotionDto, actorUserId: string) {
    this.validatePromotionDto(dto);
    const normalizedKey = promotionKey.trim().toLowerCase();

    const promotion = await this.prismaClient.$transaction(async (tx) => {
      const record = await tx.promotion.upsert({
        where: { key: normalizedKey },
        update: {
          name: dto.name.trim(),
          description: dto.description?.trim(),
          status: dto.status,
          trigger: dto.trigger,
          rewardType: dto.rewardType,
          currencyCode: dto.currencyCode?.trim().toUpperCase() ?? null,
          fixedAmount: dto.fixedAmount ?? null,
          percentageBps: dto.percentageBps ?? null,
          maxDiscountAmount: dto.maxDiscountAmount ?? null,
          minSubtotalAmount: dto.minSubtotalAmount ?? null,
          isCombinable: dto.isCombinable ?? false,
          priority: dto.priority ?? 0,
          startsAt: dto.startsAt ?? null,
          endsAt: dto.endsAt ?? null,
          totalUsageLimit: dto.totalUsageLimit ?? null,
          perCustomerUsageLimit: dto.perCustomerUsageLimit ?? null,
          maxApplicationsPerOrder: dto.maxApplicationsPerOrder ?? 1,
        },
        create: {
          key: normalizedKey,
          name: dto.name.trim(),
          description: dto.description?.trim(),
          status: dto.status,
          trigger: dto.trigger,
          rewardType: dto.rewardType,
          currencyCode: dto.currencyCode?.trim().toUpperCase() ?? null,
          fixedAmount: dto.fixedAmount ?? null,
          percentageBps: dto.percentageBps ?? null,
          maxDiscountAmount: dto.maxDiscountAmount ?? null,
          minSubtotalAmount: dto.minSubtotalAmount ?? null,
          isCombinable: dto.isCombinable ?? false,
          priority: dto.priority ?? 0,
          startsAt: dto.startsAt ?? null,
          endsAt: dto.endsAt ?? null,
          totalUsageLimit: dto.totalUsageLimit ?? null,
          perCustomerUsageLimit: dto.perCustomerUsageLimit ?? null,
          maxApplicationsPerOrder: dto.maxApplicationsPerOrder ?? 1,
        },
      });

      await tx.promotionExclusion.deleteMany({
        where: { sourcePromotionId: record.id },
      });

      if (dto.excludedPromotionIds && dto.excludedPromotionIds.length > 0) {
        const excluded = await tx.promotion.findMany({
          where: {
            id: {
              in: dto.excludedPromotionIds,
            },
          },
          select: { id: true },
        });

        if (excluded.length !== dto.excludedPromotionIds.length) {
          throw new NotFoundException('One or more excluded promotions were not found');
        }

        await tx.promotionExclusion.createMany({
          data: excluded.map((item) => ({
            sourcePromotionId: record.id,
            targetPromotionId: item.id,
          })),
        });
      }

      await tx.auditLog.create({
        data: {
          actorUserId,
          category: 'ADMINISTRATION',
          action: 'promotion.upserted',
          entityType: 'Promotion',
          entityId: record.id,
          metadata: {
            key: normalizedKey,
            trigger: dto.trigger,
            rewardType: dto.rewardType,
            status: dto.status,
          },
        },
      });

      return tx.promotion.findUniqueOrThrow({
        where: { id: record.id },
        include: {
          exclusions: true,
          coupons: true,
        },
      });
    });

    return promotion;
  }

  async upsertCoupon(promotionId: string, dto: UpsertCouponDto, actorUserId: string) {
    const promotion = await this.prismaClient.promotion.findUnique({
      where: { id: promotionId },
      select: { id: true, trigger: true },
    });

    if (!promotion) {
      throw new NotFoundException('Promotion not found');
    }

    if (promotion.trigger !== 'COUPON') {
      throw new BadRequestException('Coupons can only be attached to coupon-trigger promotions');
    }

    if (dto.startsAt && dto.endsAt && dto.startsAt > dto.endsAt) {
      throw new BadRequestException('Coupon start must be before coupon end');
    }

    const normalizedCode = this.couponNormalizer.normalize(dto.code);

    return this.prisma.$transaction(async (tx) => {
      const coupon = await tx.coupon.upsert({
        where: { normalizedCode },
        update: {
          code: dto.code.trim(),
          status: dto.status,
          startsAt: dto.startsAt ?? null,
          endsAt: dto.endsAt ?? null,
          totalUsageLimit: dto.totalUsageLimit ?? null,
          perCustomerUsageLimit: dto.perCustomerUsageLimit ?? null,
          promotionId,
        },
        create: {
          promotionId,
          code: dto.code.trim(),
          normalizedCode,
          status: dto.status,
          startsAt: dto.startsAt ?? null,
          endsAt: dto.endsAt ?? null,
          totalUsageLimit: dto.totalUsageLimit ?? null,
          perCustomerUsageLimit: dto.perCustomerUsageLimit ?? null,
        },
      });

      await tx.auditLog.create({
        data: {
          actorUserId,
          category: 'ADMINISTRATION',
          action: 'coupon.upserted',
          entityType: 'Coupon',
          entityId: coupon.id,
          metadata: {
            normalizedCode,
            promotionId,
            status: dto.status,
          },
        },
      });

      return coupon;
    });
  }

  private validatePromotionDto(dto: UpsertPromotionDto) {
    if (dto.startsAt && dto.endsAt && dto.startsAt > dto.endsAt) {
      throw new BadRequestException('Promotion start must be before promotion end');
    }

    if (dto.rewardType === 'FIXED_AMOUNT' && (dto.fixedAmount === undefined || !dto.currencyCode)) {
      throw new BadRequestException('Fixed-amount promotions require fixedAmount and currencyCode');
    }

    if (dto.rewardType === 'PERCENTAGE' && dto.percentageBps === undefined) {
      throw new BadRequestException('Percentage promotions require percentageBps');
    }

    if (
      dto.rewardType === 'FREE_SHIPPING' &&
      dto.trigger === 'AUTOMATIC' &&
      dto.isCombinable === false
    ) {
      return;
    }
  }
}
