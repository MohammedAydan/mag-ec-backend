import { randomUUID } from 'node:crypto';

import {
  BadRequestException,
  ForbiddenException,
  Inject,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import type { Prisma, ShipmentStatus } from '@prisma/client';

import { OrderOutboxService } from '../../orders/services/order-outbox.service';
import { OrderPostPurchaseService } from '../../orders/services/order-post-purchase.service';
import { PrismaTransactionService } from '../../persistence/services/prisma-transaction.service';
import { PrismaService } from '../../persistence/services/prisma.service';
import type { CreateShipmentDto, UpdateShipmentStatusDto } from '../dto/fulfillment-admin.dto';

const shipmentInclude = {
  lines: {
    orderBy: [{ createdAt: 'asc' as const }],
    include: {
      orderLine: true,
    },
  },
} satisfies Prisma.ShipmentInclude;

type ShipmentRecord = Prisma.ShipmentGetPayload<{
  include: typeof shipmentInclude;
}>;

@Injectable()
export class FulfillmentService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
    @Inject(PrismaTransactionService)
    private readonly prismaTransactionService: PrismaTransactionService,
    @Inject(OrderPostPurchaseService)
    private readonly orderPostPurchaseService: OrderPostPurchaseService,
    @Inject(OrderOutboxService)
    private readonly orderOutboxService: OrderOutboxService,
  ) {}

  async listCustomerShipments(orderId: string, userId: string) {
    const order = await this.prisma.order.findUnique({
      where: { id: orderId },
      select: { id: true, userId: true },
    });

    if (!order) {
      throw new NotFoundException(`Order "${orderId}" was not found`);
    }

    if (order.userId !== userId) {
      throw new ForbiddenException('You do not have access to this order');
    }

    const shipments = await this.prisma.shipment.findMany({
      where: { orderId },
      include: shipmentInclude,
      orderBy: [{ createdAt: 'asc' }],
    });

    return shipments.map((shipment) => this.serializeShipment(shipment));
  }

  async listAdminShipments(orderId: string) {
    const order = await this.prisma.order.findUnique({
      where: { id: orderId },
      select: { id: true },
    });

    if (!order) {
      throw new NotFoundException(`Order "${orderId}" was not found`);
    }

    const shipments = await this.prisma.shipment.findMany({
      where: { orderId },
      include: shipmentInclude,
      orderBy: [{ createdAt: 'asc' }],
    });

    return shipments.map((shipment) => this.serializeShipment(shipment));
  }

  async createShipment(orderId: string, dto: CreateShipmentDto, actorUserId: string) {
    return this.prismaTransactionService.runInTransaction(async (tx) => {
      const order = await tx.order.findUnique({
        where: { id: orderId },
        include: {
          lines: true,
          shipments: {
            where: {
              status: {
                not: 'CANCELLED',
              },
            },
            include: {
              lines: true,
            },
          },
        },
      });

      if (!order) {
        throw new NotFoundException(`Order "${orderId}" was not found`);
      }

      if (order.status === 'CANCELLED') {
        throw new BadRequestException('Cancelled orders cannot be fulfilled');
      }

      const outstandingByOrderLineId = new Map(order.lines.map((line) => [line.id, line.quantity]));
      for (const shipment of order.shipments) {
        for (const line of shipment.lines) {
          outstandingByOrderLineId.set(
            line.orderLineId,
            (outstandingByOrderLineId.get(line.orderLineId) ?? 0) - line.quantity,
          );
        }
      }

      const seenOrderLineIds = new Set<string>();
      for (const item of dto.items) {
        if (seenOrderLineIds.has(item.orderLineId)) {
          throw new BadRequestException(
            `Order line "${item.orderLineId}" is duplicated in the shipment payload`,
          );
        }
        seenOrderLineIds.add(item.orderLineId);

        const line = order.lines.find((entry) => entry.id === item.orderLineId);
        if (!line) {
          throw new BadRequestException(
            `Order line "${item.orderLineId}" does not belong to this order`,
          );
        }

        const remainingQuantity = outstandingByOrderLineId.get(item.orderLineId) ?? 0;
        if (item.quantity > remainingQuantity) {
          throw new BadRequestException(
            `Shipment quantity ${item.quantity} exceeds outstanding quantity ${remainingQuantity} for order line "${item.orderLineId}"`,
          );
        }
      }

      const shipment = await tx.shipment.create({
        data: {
          orderId,
          shipmentNumber: this.generateShipmentNumber(
            order.orderNumber,
            order.shipments.length + 1,
          ),
          status: 'PENDING',
          carrierKey: dto.carrierKey?.trim(),
          carrierName: dto.carrierName?.trim(),
          trackingNumber: dto.trackingNumber?.trim(),
          trackingUrl: dto.trackingUrl?.trim(),
          notes: dto.notes?.trim(),
          createdByUserId: actorUserId,
          updatedByUserId: actorUserId,
        },
      });

      await tx.shipmentLine.createMany({
        data: dto.items.map((item) => ({
          shipmentId: shipment.id,
          orderLineId: item.orderLineId,
          quantity: item.quantity,
        })),
      });

      await tx.auditLog.create({
        data: {
          actorUserId,
          category: 'DATA_CHANGE',
          action: 'shipment.create',
          entityType: 'Shipment',
          entityId: shipment.id,
          metadata: {
            orderId,
            shipmentNumber: shipment.shipmentNumber,
          },
        },
      });

      await this.orderOutboxService.emitEvent(
        {
          aggregateId: orderId,
          eventType: 'order.shipment.created',
          deduplicationKey: `order.shipment.created:${shipment.id}`,
          payload: {
            orderId,
            shipmentId: shipment.id,
            shipmentNumber: shipment.shipmentNumber,
          },
        },
        tx,
      );

      await this.orderPostPurchaseService.syncOrderPostPurchaseState(orderId, tx);

      const createdShipment = await tx.shipment.findUniqueOrThrow({
        where: { id: shipment.id },
        include: shipmentInclude,
      });

      return this.serializeShipment(createdShipment);
    });
  }

  async updateShipmentStatus(
    orderId: string,
    shipmentId: string,
    dto: UpdateShipmentStatusDto,
    actorUserId: string,
  ) {
    return this.prismaTransactionService.runInTransaction(async (tx) => {
      const shipment = await tx.shipment.findUnique({
        where: { id: shipmentId },
        include: shipmentInclude,
      });

      if (!shipment || shipment.orderId !== orderId) {
        throw new NotFoundException(
          `Shipment "${shipmentId}" was not found for order "${orderId}"`,
        );
      }

      this.assertShipmentStatusTransition(shipment.status, dto.status);

      const updatedShipment = await tx.shipment.update({
        where: { id: shipment.id },
        data: {
          status: dto.status,
          trackingNumber: dto.trackingNumber?.trim() ?? shipment.trackingNumber,
          trackingUrl: dto.trackingUrl?.trim() ?? shipment.trackingUrl,
          notes: dto.notes?.trim() ?? shipment.notes,
          shippedAt:
            dto.status === 'SHIPPED' && !shipment.shippedAt ? new Date() : shipment.shippedAt,
          deliveredAt:
            dto.status === 'DELIVERED' && !shipment.deliveredAt ? new Date() : shipment.deliveredAt,
          cancelledAt:
            dto.status === 'CANCELLED' && !shipment.cancelledAt ? new Date() : shipment.cancelledAt,
          updatedByUserId: actorUserId,
        },
        include: shipmentInclude,
      });

      await tx.auditLog.create({
        data: {
          actorUserId,
          category: 'DATA_CHANGE',
          action: 'shipment.update_status',
          entityType: 'Shipment',
          entityId: shipment.id,
          metadata: {
            orderId,
            previousStatus: shipment.status,
            nextStatus: dto.status,
          },
        },
      });

      await this.orderOutboxService.emitEvent(
        {
          aggregateId: orderId,
          eventType: 'order.shipment.status_changed',
          deduplicationKey: `order.shipment.status_changed:${shipment.id}:${dto.status}`,
          payload: {
            orderId,
            shipmentId: shipment.id,
            shipmentNumber: shipment.shipmentNumber,
            status: dto.status,
          },
        },
        tx,
      );

      await this.orderPostPurchaseService.syncOrderPostPurchaseState(orderId, tx);

      return this.serializeShipment(updatedShipment);
    });
  }

  private assertShipmentStatusTransition(
    currentStatus: ShipmentStatus,
    nextStatus: ShipmentStatus,
  ) {
    if (currentStatus === nextStatus) {
      return;
    }

    const allowedTransitions: Record<ShipmentStatus, ShipmentStatus[]> = {
      PENDING: ['SHIPPED', 'CANCELLED'],
      SHIPPED: ['DELIVERED'],
      DELIVERED: [],
      CANCELLED: [],
    };

    if (!allowedTransitions[currentStatus].includes(nextStatus)) {
      throw new BadRequestException(
        `Shipment status cannot transition from "${currentStatus}" to "${nextStatus}"`,
      );
    }
  }

  private generateShipmentNumber(orderNumber: string, sequence: number) {
    const suffix = randomUUID().slice(0, 6).toUpperCase();
    return `${orderNumber}-S${sequence}-${suffix}`;
  }

  private serializeShipment(shipment: ShipmentRecord) {
    return {
      id: shipment.id,
      orderId: shipment.orderId,
      shipmentNumber: shipment.shipmentNumber,
      status: shipment.status,
      carrierKey: shipment.carrierKey,
      carrierName: shipment.carrierName,
      trackingNumber: shipment.trackingNumber,
      trackingUrl: shipment.trackingUrl,
      notes: shipment.notes,
      shippedAt: shipment.shippedAt?.toISOString() ?? null,
      deliveredAt: shipment.deliveredAt?.toISOString() ?? null,
      cancelledAt: shipment.cancelledAt?.toISOString() ?? null,
      createdAt: shipment.createdAt.toISOString(),
      updatedAt: shipment.updatedAt.toISOString(),
      items: shipment.lines.map((line) => ({
        id: line.id,
        orderLineId: line.orderLineId,
        quantity: line.quantity,
        productId: line.orderLine.productId,
        variantId: line.orderLine.variantId,
        sku: line.orderLine.sku,
        productName: line.orderLine.productName,
        variantName: line.orderLine.variantName,
      })),
    };
  }
}
