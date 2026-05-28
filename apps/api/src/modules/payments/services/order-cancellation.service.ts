import {
  BadRequestException,
  ForbiddenException,
  Inject,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { InventoryCoreService } from '../../inventory/services/inventory-core.service';
import { OrderOutboxService } from '../../orders/services/order-outbox.service';
import { OrderService } from '../../orders/services/order.service';
import { PrismaTransactionService } from '../../persistence/services/prisma-transaction.service';
import { PrismaService } from '../../persistence/services/prisma.service';
import { PaymentGatewayService } from './payment-gateway.service';

const cancellationInclude = {
  paymentAttempts: {
    where: { provider: 'STRIPE' as const },
    orderBy: [{ createdAt: 'desc' as const }],
    take: 1,
  },
  shipments: {
    where: { status: { not: 'CANCELLED' as const } },
    select: { id: true },
  },
} satisfies Prisma.OrderInclude;

type CancellationOrder = Prisma.OrderGetPayload<{ include: typeof cancellationInclude }>;

@Injectable()
export class OrderCancellationService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(PrismaTransactionService) private readonly transactions: PrismaTransactionService,
    @Inject(InventoryCoreService) private readonly inventoryCoreService: InventoryCoreService,
    @Inject(OrderOutboxService) private readonly orderOutboxService: OrderOutboxService,
    @Inject(OrderService) private readonly orderService: OrderService,
    @Inject(PaymentGatewayService) private readonly paymentGatewayService: PaymentGatewayService,
  ) {}

  async cancelCustomerOrder(orderId: string, userId: string, reason?: string) {
    const order = await this.loadOrderOrThrow(orderId);
    if (order.userId !== userId) {
      throw new ForbiddenException('You do not have access to this order');
    }
    return this.cancelOrder(order, userId, reason);
  }

  async cancelAdminOrder(orderId: string, actorUserId: string, reason?: string) {
    const order = await this.loadOrderOrThrow(orderId);
    return this.cancelOrder(order, actorUserId, reason);
  }

  private async cancelOrder(order: CancellationOrder, actorUserId: string, reason?: string) {
    if (order.status === 'CANCELLED') {
      return this.orderService.getSerializedOrderById(order.id);
    }
    this.assertCancelable(order);

    return this.transactions.runInTransaction(async (tx) => {
      await tx.$queryRaw`SELECT id FROM \`Order\` WHERE id = ${order.id} FOR UPDATE`;
      const lockedOrder = await tx.order.findUnique({
        where: { id: order.id },
        include: cancellationInclude,
      });
      if (!lockedOrder) {
        throw new NotFoundException(`Order "${order.id}" was not found`);
      }
      if (lockedOrder.status === 'CANCELLED') {
        return this.orderService.getSerializedOrderById(lockedOrder.id, tx);
      }
      this.assertCancelable(lockedOrder);

      const attempt = lockedOrder.paymentAttempts[0];
      if (lockedOrder.paymentMethod === 'STRIPE_CARD' && attempt?.providerPaymentId) {
        // This provider request is intentionally issued while the order row is locked.
        // Without a dedicated CANCELLATION_PROCESSING state, moving it outside the lock
        // allows fulfillment and cancellation to race and corrupt the order lifecycle.
        const cancellation = await this.paymentGatewayService.cancelOnlinePayment(
          attempt.providerPaymentId,
        );
        if (cancellation.status === 'captured') {
          throw new BadRequestException(
            'Captured card payments cannot be cancelled directly; create an approved refund instead',
          );
        }
      }

      const updated = await tx.order.update({
        where: { id: lockedOrder.id },
        data: { status: 'CANCELLED', paymentStatus: 'VOIDED' },
      });

      if (lockedOrder.reservationKey) {
        if (lockedOrder.paymentMethod === 'CASH_ON_DELIVERY') {
          await this.inventoryCoreService.restockRedeemedReservation(
            lockedOrder.reservationKey,
            lockedOrder.id,
            actorUserId,
            tx,
          );
        } else {
          await this.inventoryCoreService.releaseStockReservation(lockedOrder.reservationKey, tx);
        }
      }

      await tx.paymentAttempt.updateMany({
        where: {
          orderId: lockedOrder.id,
          status: { in: ['PROCESSING', 'AWAITING_CUSTOMER_ACTION'] },
        },
        data: { status: 'CANCELLED' },
      });
      await tx.auditLog.create({
        data: {
          actorUserId,
          category: 'DATA_CHANGE',
          action: 'order.cancel',
          entityType: 'Order',
          entityId: lockedOrder.id,
          metadata: { reason: reason?.trim() || null },
        },
      });
      await this.orderOutboxService.emitStatusChanged(updated, tx);
      await this.orderOutboxService.emitEvent(
        {
          aggregateId: updated.id,
          eventType: 'order.cancelled',
          deduplicationKey: `order.cancelled:${updated.id}`,
          payload: { orderId: updated.id },
        },
        tx,
      );
      return this.orderService.getSerializedOrderById(updated.id, tx);
    });
  }

  private loadOrderOrThrow(orderId: string): Promise<CancellationOrder> {
    return this.prisma.order
      .findUnique({ where: { id: orderId }, include: cancellationInclude })
      .then((order) => {
        if (!order) {
          throw new NotFoundException(`Order "${orderId}" was not found`);
        }
        return order;
      });
  }

  private assertCancelable(order: CancellationOrder) {
    if (order.status === 'CANCELLED') {
      return;
    }
    if (
      order.status !== 'PLACED' ||
      order.fulfillmentStatus !== 'UNFULFILLED' ||
      order.shipments.length > 0
    ) {
      throw new BadRequestException(
        'Only unfulfilled orders without active shipments can be cancelled',
      );
    }
    if (order.paymentStatus !== 'PENDING') {
      throw new BadRequestException(
        'Only unpaid orders can be cancelled directly; captured payments require refund processing',
      );
    }
  }
}
