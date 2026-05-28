import { Inject, Injectable, InternalServerErrorException } from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { InventoryCoreService } from '../../inventory/services/inventory-core.service';
import { OrderOutboxService } from '../../orders/services/order-outbox.service';
import { PrismaService } from '../../persistence/services/prisma.service';

const SETTLED_PAYMENT_STATUSES = ['PAID', 'PARTIALLY_REFUNDED', 'REFUNDED'] as const;

@Injectable()
export class OrderPaymentTransitionService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
    @Inject(InventoryCoreService)
    private readonly inventoryCoreService: InventoryCoreService,
    @Inject(OrderOutboxService)
    private readonly orderOutboxService: OrderOutboxService,
  ) {}

  async markPaid(
    orderId: string,
    paymentAttemptId: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    const order = await tx.order.findUniqueOrThrow({ where: { id: orderId } });

    if ((SETTLED_PAYMENT_STATUSES as readonly string[]).includes(order.paymentStatus)) {
      return order;
    }

    await tx.paymentAttempt.updateMany({
      where: { id: paymentAttemptId, status: { not: 'SUCCEEDED' } },
      data: { status: 'SUCCEEDED', succeededAt: new Date(), failedAt: null },
    });

    const transitioned = await tx.order.updateMany({
      where: {
        id: orderId,
        paymentStatus: { in: ['PENDING', 'FAILED', 'VOIDED'] },
      },
      data: { paymentStatus: 'PAID', paidAt: new Date() },
    });

    const updatedOrder = await tx.order.findUniqueOrThrow({ where: { id: orderId } });
    if (transitioned.count !== 1) {
      return updatedOrder;
    }

    if (updatedOrder.reservationKey) {
      const redeemedReservations = await this.inventoryCoreService.redeemStockReservation(
        updatedOrder.reservationKey,
        updatedOrder.id,
        tx,
      );
      if (redeemedReservations === 0) {
        throw new InternalServerErrorException(
          'Captured payment has no redeemable stock reservation and requires reconciliation',
        );
      }
    }

    await this.orderOutboxService.emitStatusChanged(updatedOrder, tx);
    return updatedOrder;
  }

  async markFailed(
    orderId: string,
    paymentAttemptId: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    const order = await tx.order.findUniqueOrThrow({ where: { id: orderId } });
    if ((SETTLED_PAYMENT_STATUSES as readonly string[]).includes(order.paymentStatus)) {
      return order;
    }

    await tx.paymentAttempt.updateMany({
      where: { id: paymentAttemptId, status: { not: 'SUCCEEDED' } },
      data: { status: 'FAILED', failedAt: new Date() },
    });

    const transitioned = await tx.order.updateMany({
      where: { id: orderId, paymentStatus: 'PENDING' },
      data: { paymentStatus: 'FAILED' },
    });
    const updatedOrder = await tx.order.findUniqueOrThrow({ where: { id: orderId } });

    if (transitioned.count === 1 && updatedOrder.reservationKey) {
      await this.inventoryCoreService.releaseStockReservation(updatedOrder.reservationKey, tx);
      await this.orderOutboxService.emitStatusChanged(updatedOrder, tx);
    }

    return updatedOrder;
  }

  async markCancelled(
    orderId: string,
    paymentAttemptId: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    const order = await tx.order.findUniqueOrThrow({ where: { id: orderId } });
    if ((SETTLED_PAYMENT_STATUSES as readonly string[]).includes(order.paymentStatus)) {
      return order;
    }

    await tx.paymentAttempt.updateMany({
      where: { id: paymentAttemptId, status: { not: 'SUCCEEDED' } },
      data: { status: 'CANCELLED' },
    });

    const transitioned = await tx.order.updateMany({
      where: { id: orderId, paymentStatus: { in: ['PENDING', 'FAILED'] } },
      data: { status: 'CANCELLED', paymentStatus: 'VOIDED' },
    });
    const updatedOrder = await tx.order.findUniqueOrThrow({ where: { id: orderId } });

    if (transitioned.count === 1 && updatedOrder.reservationKey) {
      await this.inventoryCoreService.releaseStockReservation(updatedOrder.reservationKey, tx);
      await this.orderOutboxService.emitStatusChanged(updatedOrder, tx);
      await this.orderOutboxService.emitEvent(
        {
          aggregateId: updatedOrder.id,
          eventType: 'order.cancelled',
          deduplicationKey: `order.cancelled:${updatedOrder.id}`,
          payload: { orderId: updatedOrder.id },
        },
        tx,
      );
    }

    return updatedOrder;
  }
}
