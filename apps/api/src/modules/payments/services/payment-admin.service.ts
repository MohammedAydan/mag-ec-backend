import { Inject, Injectable } from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';
import {
  ListPaymentAttemptsQueryDto,
  ListPaymentWebhookEventsQueryDto,
  ListRefundsQueryDto,
} from '../dto/admin-payments-query.dto';

const DEFAULT_LIMIT = 20;

@Injectable()
export class PaymentAdminService {
  constructor(@Inject(PrismaService) private readonly prisma: PrismaService) {}

  async listAttempts(query: ListPaymentAttemptsQueryDto) {
    const limit = query.limit ?? DEFAULT_LIMIT;
    const where: Prisma.PaymentAttemptWhereInput = {
      ...(query.orderId ? { orderId: query.orderId } : {}),
      ...(query.provider ? { provider: query.provider } : {}),
      ...(query.status ? { status: query.status } : {}),
    };
    const records = await this.prisma.paymentAttempt.findMany({
      where,
      take: limit + 1,
      ...(query.cursor ? { cursor: { id: query.cursor }, skip: 1 } : {}),
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
      select: {
        id: true,
        orderId: true,
        provider: true,
        method: true,
        status: true,
        currencyCode: true,
        amount: true,
        providerPaymentId: true,
        providerIntentStatus: true,
        providerReference: true,
        lastErrorCode: true,
        lastErrorMessage: true,
        succeededAt: true,
        failedAt: true,
        createdAt: true,
        updatedAt: true,
        order: { select: { orderNumber: true, paymentStatus: true, status: true } },
      },
    });
    return this.toPage(records, limit);
  }

  async listWebhookEvents(query: ListPaymentWebhookEventsQueryDto) {
    const limit = query.limit ?? DEFAULT_LIMIT;
    const where: Prisma.PaymentWebhookEventWhereInput = {
      ...(query.orderId ? { orderId: query.orderId } : {}),
      ...(query.provider ? { provider: query.provider } : {}),
      ...(query.status ? { status: query.status } : {}),
    };
    const records = await this.prisma.paymentWebhookEvent.findMany({
      where,
      take: limit + 1,
      ...(query.cursor ? { cursor: { id: query.cursor }, skip: 1 } : {}),
      orderBy: [{ receivedAt: 'desc' }, { id: 'desc' }],
      select: {
        id: true,
        provider: true,
        externalEventId: true,
        eventType: true,
        status: true,
        paymentAttemptId: true,
        orderId: true,
        processingError: true,
        receivedAt: true,
        processedAt: true,
        createdAt: true,
        updatedAt: true,
      },
    });
    return this.toPage(records, limit);
  }

  async listRefunds(query: ListRefundsQueryDto) {
    const limit = query.limit ?? DEFAULT_LIMIT;
    const where: Prisma.RefundWhereInput = {
      ...(query.orderId ? { orderId: query.orderId } : {}),
      ...(query.provider ? { provider: query.provider } : {}),
      ...(query.status ? { status: query.status } : {}),
    };
    const records = await this.prisma.refund.findMany({
      where,
      take: limit + 1,
      ...(query.cursor ? { cursor: { id: query.cursor }, skip: 1 } : {}),
      orderBy: [{ requestedAt: 'desc' }, { id: 'desc' }],
      select: {
        id: true,
        orderId: true,
        paymentAttemptId: true,
        returnRequestId: true,
        requestedByUserId: true,
        provider: true,
        status: true,
        amount: true,
        currencyCode: true,
        reason: true,
        providerRefundId: true,
        providerReference: true,
        failureReason: true,
        requestedAt: true,
        processedAt: true,
        createdAt: true,
        updatedAt: true,
        order: { select: { orderNumber: true, paymentStatus: true, status: true } },
      },
    });
    return this.toPage(records, limit);
  }

  private toPage<T extends { id: string }>(records: T[], limit: number) {
    const hasMore = records.length > limit;
    const items = hasMore ? records.slice(0, limit) : records;
    return {
      items,
      nextCursor: hasMore ? (items.at(-1)?.id ?? null) : null,
    };
  }
}
