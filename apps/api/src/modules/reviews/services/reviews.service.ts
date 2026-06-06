import {
  BadRequestException,
  ConflictException,
  Inject,
  Injectable,
  Logger,
  NotFoundException,
} from '@nestjs/common';
import { Prisma, type ReviewModerationActionType, type ReviewStatus } from '@prisma/client';

import { coercePositiveInt } from '../../../common/http/query-int';
import { PrismaService } from '../../persistence/services/prisma.service';
import type { CreateReviewDto, ListReviewsQueryDto, ReviewModerationDto } from '../dto/reviews.dto';

const reviewInclude = {
  product: {
    include: {
      translations: true,
    },
  },
  orderLine: true,
  moderationActions: {
    orderBy: [{ createdAt: 'desc' as const }],
  },
} satisfies Prisma.ReviewInclude;

type ReviewRecord = Prisma.ReviewGetPayload<{ include: typeof reviewInclude }>;

type ReviewModerationDecision = ReviewModerationDto['decision'];

const reviewModerationMap: Record<
  ReviewModerationDecision,
  { status: ReviewStatus; actionType: ReviewModerationActionType }
> = {
  APPROVE: { status: 'APPROVED', actionType: 'APPROVED' },
  REJECT: { status: 'REJECTED', actionType: 'REJECTED' },
  FLAG: { status: 'FLAGGED', actionType: 'FLAGGED' },
  HIDE: { status: 'HIDDEN', actionType: 'HIDDEN' },
};

@Injectable()
export class ReviewsService {
  private readonly logger = new Logger(ReviewsService.name);

  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
  ) {}

  async createVerifiedReview(orderLineId: string, userId: string, dto: CreateReviewDto) {
    if (dto.rating < 1 || dto.rating > 5) {
      throw new BadRequestException('Review rating must be between 1 and 5');
    }

    return this.prisma.$transaction(async (tx) => {
      const orderLine = await tx.orderLine.findUnique({
        where: { id: orderLineId, order: { userId } },
        include: {
          order: true,
          product: true,
        },
      });

      if (!orderLine) {
        this.logger.warn({ userId, orderLineId, resourceType: 'OrderLine' }, 'Unauthorized or nonexistent order line access probe during review creation');
        throw new NotFoundException(`Order line "${orderLineId}" was not found`);
      }

      const existingReview = await tx.review.findUnique({
        where: {
          productId_userId: {
            productId: orderLine.productId,
            userId,
          },
        },
      });

      if (existingReview) {
        throw new ConflictException('You have already reviewed this product');
      }

      const review = await tx.review.create({
        data: {
          productId: orderLine.productId,
          userId,
          orderLineId,
          rating: dto.rating,
          title: dto.title.trim(),
          body: dto.body.trim(),
          isVerifiedPurchase: true,
          status: 'PENDING',
        },
        include: reviewInclude,
      });

      await tx.auditLog.create({
        data: {
          actorUserId: userId,
          category: 'DATA_CHANGE',
          action: 'review.created',
          entityType: 'Review',
          entityId: review.id,
          metadata: {
            productId: review.productId,
            orderLineId,
            rating: review.rating,
          },
        },
      });

      return review;
    });
  }

  async listMyReviews(userId: string, query: ListReviewsQueryDto) {
    const limit = coercePositiveInt(query.limit, 20);
    const reviews = await this.prisma.review.findMany({
      where: {
        userId,
        ...(query.status ? { status: query.status } : {}),
        ...(query.productId ? { productId: query.productId } : {}),
      },
      include: reviewInclude,
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
      ...(query.cursor ? { cursor: { id: query.cursor }, skip: 1 } : {}),
      take: limit + 1,
    });

    return this.serializePage(reviews, limit);
  }

  async getMyReview(reviewId: string, userId: string) {
    const review = await this.prisma.review.findUnique({
      where: { id: reviewId, userId },
      include: reviewInclude,
    });

    if (!review) {
      this.logger.warn({ userId, reviewId, resourceType: 'Review' }, 'Unauthorized or nonexistent review access probe');
      throw new NotFoundException(`Review "${reviewId}" was not found`);
    }

    return review;
  }

  async listAdminReviews(query: ListReviewsQueryDto) {
    const limit = coercePositiveInt(query.limit, 20);
    const reviews = await this.prisma.review.findMany({
      where: {
        ...(query.status ? { status: query.status } : {}),
        ...(query.productId ? { productId: query.productId } : {}),
        ...(query.userId ? { userId: query.userId } : {}),
      },
      include: reviewInclude,
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
      ...(query.cursor ? { cursor: { id: query.cursor }, skip: 1 } : {}),
      take: limit + 1,
    });

    return this.serializePage(reviews, limit);
  }

  async getAdminReview(reviewId: string) {
    const review = await this.prisma.review.findUnique({
      where: { id: reviewId },
      include: reviewInclude,
    });

    if (!review) {
      throw new NotFoundException(`Review "${reviewId}" was not found`);
    }

    return review;
  }

  async moderateReview(reviewId: string, dto: ReviewModerationDto, actorUserId: string) {
    const review = await this.prisma.review.findUnique({
      where: { id: reviewId },
    });

    if (!review) {
      throw new NotFoundException(`Review "${reviewId}" was not found`);
    }

    if ((dto.decision === 'REJECT' || dto.decision === 'HIDE') && !dto.reason?.trim()) {
      throw new BadRequestException(
        'A moderation reason is required for rejected or hidden reviews',
      );
    }

    return this.prisma.$transaction(async (tx) => {
      const updated = await tx.review.update({
        where: { id: reviewId },
        data: {
          status: reviewModerationMap[dto.decision].status,
          rejectionReason: dto.reason?.trim() ?? null,
        },
        include: reviewInclude,
      });

      await tx.reviewModerationAction.create({
        data: {
          reviewId,
          moderatorUserId: actorUserId,
          actionType: reviewModerationMap[dto.decision].actionType,
          reason: dto.reason?.trim() ?? null,
        },
      });

      await tx.auditLog.create({
        data: {
          actorUserId,
          category: 'ADMINISTRATION',
          action: `review.${dto.decision.toLowerCase()}`,
          entityType: 'Review',
          entityId: reviewId,
          metadata: {
            decision: dto.decision,
            reason: dto.reason?.trim() ?? null,
          },
        },
      });

      return updated;
    });
  }

  private serializePage(reviews: ReviewRecord[], limit: number) {
    const hasNextPage = reviews.length > limit;
    const items = hasNextPage ? reviews.slice(0, limit) : reviews;
    const nextCursor = hasNextPage ? (items[items.length - 1]?.id ?? null) : null;

    return {
      items,
      nextCursor,
    };
  }
}
