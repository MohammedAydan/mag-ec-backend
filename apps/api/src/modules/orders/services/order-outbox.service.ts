import { Inject, Injectable } from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';

@Injectable()
export class OrderOutboxService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
  ) {}

  async emitPlaced(
    order: {
      id: string;
      orderNumber: string;
      userId: string | null;
      status: string;
      paymentStatus: string;
      fulfillmentStatus: string;
      grandTotalAmount: number;
      currencyCode: string;
    },
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    await tx.outboxEvent.createMany({
      data: [
        {
          aggregateType: 'ORDER',
          aggregateId: order.id,
          eventType: 'order.placed',
          deduplicationKey: `order.placed:${order.id}`,
          payload: {
            orderId: order.id,
            orderNumber: order.orderNumber,
            userId: order.userId,
            grandTotalAmount: order.grandTotalAmount,
            currencyCode: order.currencyCode,
          },
        },
        {
          ...this.buildStatusChangedEvent(order),
        },
      ],
    });
  }

  async emitStatusChanged(
    order: {
      id: string;
      status: string;
      paymentStatus: string;
      fulfillmentStatus: string;
    },
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    await tx.outboxEvent.create({
      data: this.buildStatusChangedEvent(order),
    });
  }

  async emitEvent(
    params: {
      aggregateId: string;
      eventType: string;
      payload: Prisma.InputJsonValue;
      deduplicationKey?: string;
      aggregateType?: string;
    },
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    await tx.outboxEvent.create({
      data: {
        aggregateType: params.aggregateType ?? 'ORDER',
        aggregateId: params.aggregateId,
        eventType: params.eventType,
        deduplicationKey: params.deduplicationKey,
        payload: params.payload,
      },
    });
  }

  private buildStatusChangedEvent(order: {
    id: string;
    status: string;
    paymentStatus: string;
    fulfillmentStatus: string;
  }) {
    return {
      aggregateType: 'ORDER',
      aggregateId: order.id,
      eventType: 'order.status.changed',
      deduplicationKey: `order.status.changed:${order.id}:${order.status}:${order.paymentStatus}:${order.fulfillmentStatus}`,
      payload: {
        orderId: order.id,
        status: order.status,
        paymentStatus: order.paymentStatus,
        fulfillmentStatus: order.fulfillmentStatus,
      },
    };
  }
}
