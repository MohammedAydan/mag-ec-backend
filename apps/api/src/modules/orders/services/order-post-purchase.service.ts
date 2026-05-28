import { Inject, Injectable } from '@nestjs/common';
import type { FulfillmentStatus, Prisma } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';
import { OrderOutboxService } from './order-outbox.service';

const returnStatusesCountingTowardReturns = ['RECEIVED', 'CLOSED'] as const;

@Injectable()
export class OrderPostPurchaseService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
    @Inject(OrderOutboxService)
    private readonly orderOutboxService: OrderOutboxService,
  ) {}

  async syncOrderPostPurchaseState(orderId: string, tx: Prisma.TransactionClient = this.prisma) {
    const order = await tx.order.findUniqueOrThrow({
      where: { id: orderId },
      include: {
        lines: true,
        shipments: {
          include: {
            lines: true,
          },
        },
        returnRequests: {
          where: {
            status: {
              in: [...returnStatusesCountingTowardReturns],
            },
          },
          include: {
            items: true,
          },
        },
      },
    });

    if (order.status === 'CANCELLED') {
      return order;
    }

    const shippedByOrderLineId = new Map<string, number>();
    for (const shipment of order.shipments) {
      if (shipment.status !== 'SHIPPED' && shipment.status !== 'DELIVERED') {
        continue;
      }

      for (const line of shipment.lines) {
        shippedByOrderLineId.set(
          line.orderLineId,
          (shippedByOrderLineId.get(line.orderLineId) ?? 0) + line.quantity,
        );
      }
    }

    const returnedByOrderLineId = new Map<string, number>();
    for (const returnRequest of order.returnRequests) {
      for (const item of returnRequest.items) {
        const receivedQuantity = item.receivedQuantity ?? 0;
        if (receivedQuantity <= 0) {
          continue;
        }

        returnedByOrderLineId.set(
          item.orderLineId,
          (returnedByOrderLineId.get(item.orderLineId) ?? 0) + receivedQuantity,
        );
      }
    }

    const totalLines = order.lines.length;
    const fullyShippedLines = order.lines.filter(
      (line) => (shippedByOrderLineId.get(line.id) ?? 0) >= line.quantity,
    ).length;
    const anyShippedLine = order.lines.some((line) => (shippedByOrderLineId.get(line.id) ?? 0) > 0);
    const fullyReturnedLines = order.lines.filter(
      (line) => (returnedByOrderLineId.get(line.id) ?? 0) >= line.quantity,
    ).length;
    const anyReturnedLine = order.lines.some(
      (line) => (returnedByOrderLineId.get(line.id) ?? 0) > 0,
    );

    const nextFulfillmentStatus = this.resolveFulfillmentStatus({
      totalLines,
      fullyShippedLines,
      anyShippedLine,
      fullyReturnedLines,
      anyReturnedLine,
    });
    const nextOrderStatus =
      fullyShippedLines === totalLines && totalLines > 0 ? 'FULFILLED' : 'PLACED';

    if (nextFulfillmentStatus === order.fulfillmentStatus && nextOrderStatus === order.status) {
      return order;
    }

    const updatedOrder = await tx.order.update({
      where: { id: orderId },
      data: {
        fulfillmentStatus: nextFulfillmentStatus,
        status: nextOrderStatus,
      },
    });

    await this.orderOutboxService.emitStatusChanged(updatedOrder, tx);
    return updatedOrder;
  }

  private resolveFulfillmentStatus(params: {
    totalLines: number;
    fullyShippedLines: number;
    anyShippedLine: boolean;
    fullyReturnedLines: number;
    anyReturnedLine: boolean;
  }): FulfillmentStatus {
    if (params.fullyReturnedLines === params.totalLines && params.totalLines > 0) {
      return 'RETURNED';
    }

    if (params.anyReturnedLine) {
      return 'PARTIALLY_RETURNED';
    }

    if (params.fullyShippedLines === params.totalLines && params.totalLines > 0) {
      return 'FULFILLED';
    }

    if (params.anyShippedLine) {
      return 'PARTIALLY_FULFILLED';
    }

    return 'UNFULFILLED';
  }
}
