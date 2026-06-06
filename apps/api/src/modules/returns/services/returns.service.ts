import { randomUUID } from 'node:crypto';

import {
  BadRequestException,
  ForbiddenException,
  Inject,
  Injectable,
  Logger,
  NotFoundException,
  ServiceUnavailableException,
} from '@nestjs/common';
import type { Prisma, ReturnRequestStatus } from '@prisma/client';

import { InventoryCoreService } from '../../inventory/services/inventory-core.service';
import { OrderOutboxService } from '../../orders/services/order-outbox.service';
import { OrderPostPurchaseService } from '../../orders/services/order-post-purchase.service';
import { PrismaTransactionService } from '../../persistence/services/prisma-transaction.service';
import { PrismaService } from '../../persistence/services/prisma.service';
import { RefundService } from '../../payments/services/refund.service';
import type {
  CreateReturnRequestDto,
  ExecuteReturnRefundDto,
  ReceiveReturnRequestDto,
  ReviewReturnRequestDto,
} from '../dto/returns.dto';

const returnRequestInclude = {
  items: {
    orderBy: [{ createdAt: 'asc' as const }],
    include: {
      orderLine: true,
    },
  },
  refunds: {
    orderBy: [{ createdAt: 'asc' as const }],
  },
  order: {
    include: {
      lines: true,
      shipments: {
        include: {
          lines: true,
        },
      },
      returnRequests: {
        include: {
          items: true,
        },
      },
    },
  },
} satisfies Prisma.ReturnRequestInclude;

type ReturnRequestRecord = Prisma.ReturnRequestGetPayload<{
  include: typeof returnRequestInclude;
}>;

const returnStatusesCountingAgainstAllowance: ReturnRequestStatus[] = [
  'REQUESTED',
  'APPROVED',
  'RECEIVED',
  'REFUND_PROCESSING',
  'CLOSED',
];

@Injectable()
export class ReturnsService {
  private readonly logger = new Logger(ReturnsService.name);

  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
    @Inject(PrismaTransactionService)
    private readonly prismaTransactionService: PrismaTransactionService,
    @Inject(RefundService)
    private readonly refundService: RefundService,
    @Inject(InventoryCoreService)
    private readonly inventoryCoreService: InventoryCoreService,
    @Inject(OrderPostPurchaseService)
    private readonly orderPostPurchaseService: OrderPostPurchaseService,
    @Inject(OrderOutboxService)
    private readonly orderOutboxService: OrderOutboxService,
  ) {}

  async listCustomerReturns(userId: string) {
    const requests = await this.prisma.returnRequest.findMany({
      where: {
        order: {
          userId,
        },
      },
      include: returnRequestInclude,
      orderBy: [{ createdAt: 'desc' }],
    });

    return requests.map((request) => this.serializeReturnRequest(request));
  }

  async getCustomerReturn(returnRequestId: string, userId: string) {
    const request = await this.prisma.returnRequest.findUnique({
      where: { id: returnRequestId, order: { userId } },
      include: returnRequestInclude,
    });

    if (!request) {
      this.logger.warn({ userId, returnRequestId, resourceType: 'ReturnRequest' }, 'Unauthorized or nonexistent return request access probe');
      throw new NotFoundException(`Return request "${returnRequestId}" was not found`);
    }

    return this.serializeReturnRequest(request);
  }

  async listAdminReturns() {
    const requests = await this.prisma.returnRequest.findMany({
      include: returnRequestInclude,
      orderBy: [{ createdAt: 'desc' }],
    });

    return requests.map((request) => this.serializeReturnRequest(request));
  }

  async getAdminReturn(returnRequestId: string) {
    const request = await this.prisma.returnRequest.findUnique({
      where: { id: returnRequestId },
      include: returnRequestInclude,
    });

    if (!request) {
      throw new NotFoundException(`Return request "${returnRequestId}" was not found`);
    }

    return this.serializeReturnRequest(request);
  }

  async createCustomerReturn(orderId: string, userId: string, dto: CreateReturnRequestDto) {
    return this.prismaTransactionService.runInTransaction(async (tx) => {
      const order = await tx.order.findUnique({
        where: { id: orderId, userId },
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
                in: returnStatusesCountingAgainstAllowance,
              },
            },
            include: {
              items: true,
            },
          },
        },
      });

      if (!order) {
        this.logger.warn({ userId, orderId, resourceType: 'Order' }, 'Unauthorized or nonexistent order access probe during return creation');
        throw new NotFoundException(`Order "${orderId}" was not found`);
      }

      const shippedByLineId = this.buildShippedQuantityMap(order.shipments);
      const existingRequestedByLineId = new Map<string, number>();
      for (const request of order.returnRequests) {
        for (const item of request.items) {
          existingRequestedByLineId.set(
            item.orderLineId,
            (existingRequestedByLineId.get(item.orderLineId) ?? 0) + item.quantity,
          );
        }
      }

      const seenOrderLineIds = new Set<string>();
      for (const item of dto.items) {
        if (seenOrderLineIds.has(item.orderLineId)) {
          throw new BadRequestException(
            `Order line "${item.orderLineId}" is duplicated in the return request payload`,
          );
        }
        seenOrderLineIds.add(item.orderLineId);

        const orderLine = order.lines.find((line) => line.id === item.orderLineId);
        if (!orderLine) {
          throw new BadRequestException(
            `Order line "${item.orderLineId}" does not belong to this order`,
          );
        }

        const shippedQuantity = shippedByLineId.get(item.orderLineId) ?? 0;
        const alreadyRequestedQuantity = existingRequestedByLineId.get(item.orderLineId) ?? 0;
        const requestableQuantity = shippedQuantity - alreadyRequestedQuantity;
        if (requestableQuantity <= 0) {
          throw new BadRequestException(
            `Order line "${item.orderLineId}" has no remaining returnable quantity`,
          );
        }

        if (item.quantity > requestableQuantity) {
          throw new BadRequestException(
            `Return quantity ${item.quantity} exceeds remaining returnable quantity ${requestableQuantity} for order line "${item.orderLineId}"`,
          );
        }
      }

      const request = await tx.returnRequest.create({
        data: {
          orderId,
          returnNumber: this.generateReturnNumber(),
          requestedByUserId: userId,
          status: 'REQUESTED',
          reason: dto.reason.trim(),
          notes: dto.notes?.trim(),
        },
      });

      await tx.returnRequestItem.createMany({
        data: dto.items.map((item) => ({
          returnRequestId: request.id,
          orderLineId: item.orderLineId,
          quantity: item.quantity,
          reason: item.reason?.trim(),
          requestedDisposition: item.requestedDisposition,
        })),
      });

      await tx.auditLog.create({
        data: {
          actorUserId: userId,
          category: 'DATA_CHANGE',
          action: 'return_request.create',
          entityType: 'ReturnRequest',
          entityId: request.id,
          metadata: {
            orderId,
            returnNumber: request.returnNumber,
          },
        },
      });

      await this.orderOutboxService.emitEvent(
        {
          aggregateId: orderId,
          eventType: 'order.return.requested',
          deduplicationKey: `order.return.requested:${request.id}`,
          payload: {
            orderId,
            returnRequestId: request.id,
            returnNumber: request.returnNumber,
          },
        },
        tx,
      );

      const createdRequest = await tx.returnRequest.findUniqueOrThrow({
        where: { id: request.id },
        include: returnRequestInclude,
      });

      return this.serializeReturnRequest(createdRequest);
    });
  }

  async reviewReturnRequest(
    returnRequestId: string,
    dto: ReviewReturnRequestDto,
    actorUserId: string,
  ) {
    return this.prismaTransactionService.runInTransaction(async (tx) => {
      const request = await tx.returnRequest.findUnique({
        where: { id: returnRequestId },
        include: returnRequestInclude,
      });

      if (!request) {
        throw new NotFoundException(`Return request "${returnRequestId}" was not found`);
      }

      if (request.status !== 'REQUESTED') {
        throw new BadRequestException('Only newly requested returns can be reviewed');
      }

      if (dto.decision === 'reject' && !dto.rejectionReason?.trim()) {
        throw new BadRequestException('Rejected returns require a rejection reason');
      }

      const updated = await tx.returnRequest.update({
        where: { id: returnRequestId },
        data: {
          status: dto.decision === 'approve' ? 'APPROVED' : 'REJECTED',
          reviewedByUserId: actorUserId,
          reviewNotes: dto.reviewNotes?.trim(),
          rejectionReason: dto.decision === 'reject' ? dto.rejectionReason?.trim() : null,
          approvedAt: dto.decision === 'approve' ? new Date() : null,
          rejectedAt: dto.decision === 'reject' ? new Date() : null,
        },
        include: returnRequestInclude,
      });

      await tx.auditLog.create({
        data: {
          actorUserId,
          category: 'ADMINISTRATION',
          action: 'return_request.review',
          entityType: 'ReturnRequest',
          entityId: request.id,
          metadata: {
            orderId: request.orderId,
            decision: dto.decision,
          },
        },
      });

      await this.orderOutboxService.emitEvent(
        {
          aggregateId: request.orderId,
          eventType: dto.decision === 'approve' ? 'order.return.approved' : 'order.return.rejected',
          deduplicationKey: `order.return.review:${request.id}:${dto.decision}`,
          payload: {
            orderId: request.orderId,
            returnRequestId: request.id,
            decision: dto.decision,
          },
        },
        tx,
      );

      return this.serializeReturnRequest(updated);
    });
  }

  async receiveReturnRequest(
    returnRequestId: string,
    dto: ReceiveReturnRequestDto,
    actorUserId: string,
  ) {
    return this.prismaTransactionService.runInTransaction(async (tx) => {
      const request = await tx.returnRequest.findUnique({
        where: { id: returnRequestId },
        include: returnRequestInclude,
      });

      if (!request) {
        throw new NotFoundException(`Return request "${returnRequestId}" was not found`);
      }

      if (request.status !== 'APPROVED') {
        throw new BadRequestException('Only approved returns can be received');
      }

      const payloadItemIds = new Set(dto.items.map((item) => item.returnRequestItemId));
      if (payloadItemIds.size !== request.items.length) {
        throw new BadRequestException(
          'Receive payload must include every return request item exactly once',
        );
      }

      for (const requestItem of request.items) {
        const payloadItem = dto.items.find((item) => item.returnRequestItemId === requestItem.id);
        if (!payloadItem) {
          throw new BadRequestException(
            `Missing receive payload for return request item "${requestItem.id}"`,
          );
        }

        if (payloadItem.receivedQuantity > requestItem.quantity) {
          throw new BadRequestException(
            `Received quantity ${payloadItem.receivedQuantity} exceeds approved quantity ${requestItem.quantity} for item "${requestItem.id}"`,
          );
        }

        if (payloadItem.finalDisposition === 'RESTOCK' && !payloadItem.warehouseId) {
          throw new BadRequestException(
            `Restocked return item "${requestItem.id}" requires a warehouseId`,
          );
        }
      }

      for (const requestItem of request.items) {
        const payloadItem = dto.items.find((item) => item.returnRequestItemId === requestItem.id)!;

        if (payloadItem.finalDisposition === 'RESTOCK' && payloadItem.receivedQuantity > 0) {
          await this.inventoryCoreService.adjustStock(
            payloadItem.warehouseId!,
            requestItem.orderLine.variantId,
            payloadItem.receivedQuantity,
            'RETURN_RESTOCK',
            'RETURN_REQUEST',
            request.id,
            actorUserId,
            {
              orderId: request.orderId,
              orderLineId: requestItem.orderLineId,
            },
            tx,
          );
        }

        await tx.returnRequestItem.update({
          where: { id: requestItem.id },
          data: {
            finalDisposition: payloadItem.finalDisposition,
            warehouseId: payloadItem.warehouseId ?? null,
            receivedQuantity: payloadItem.receivedQuantity,
            conditionNotes: payloadItem.conditionNotes?.trim(),
            restockedAt:
              payloadItem.finalDisposition === 'RESTOCK' && payloadItem.receivedQuantity > 0
                ? new Date()
                : null,
          },
        });
      }

      const updatedRequest = await tx.returnRequest.update({
        where: { id: request.id },
        data: {
          status: 'RECEIVED',
          receivedByUserId: actorUserId,
          receivedAt: new Date(),
        },
        include: returnRequestInclude,
      });

      await tx.auditLog.create({
        data: {
          actorUserId,
          category: 'DATA_CHANGE',
          action: 'return_request.receive',
          entityType: 'ReturnRequest',
          entityId: request.id,
          metadata: {
            orderId: request.orderId,
            returnRequestId: request.id,
          },
        },
      });

      await this.orderOutboxService.emitEvent(
        {
          aggregateId: request.orderId,
          eventType: 'order.return.received',
          deduplicationKey: `order.return.received:${request.id}`,
          payload: {
            orderId: request.orderId,
            returnRequestId: request.id,
          },
        },
        tx,
      );

      await this.orderPostPurchaseService.syncOrderPostPurchaseState(request.orderId, tx);

      return this.serializeReturnRequest(updatedRequest);
    });
  }

  async executeReturnRefund(
    returnRequestId: string,
    dto: ExecuteReturnRefundDto,
    actorUserId: string,
    actorPermissions?: string[],
  ) {
    const request = await this.prisma.returnRequest.findUnique({
      where: { id: returnRequestId },
      include: returnRequestInclude,
    });

    if (!request) {
      throw new NotFoundException(`Return request "${returnRequestId}" was not found`);
    }

    if (request.status !== 'RECEIVED') {
      throw new BadRequestException('Refund execution requires a received return request');
    }

    // ── Received-items refund cap ──
    const receivedItemsCap = request.items.reduce((sum, item) => {
      const qty = item.receivedQuantity ?? 0;
      if (qty <= 0) return sum;
      return sum + qty * item.orderLine.effectiveUnitAmount;
    }, 0);

    if (dto.amount > receivedItemsCap) {
      if (!dto.isOverride || !dto.overrideReason?.trim()) {
        throw new BadRequestException(
          `Refund amount ${dto.amount} exceeds the received-items refund cap of ${receivedItemsCap}. ` +
            `Set isOverride=true with an overrideReason to proceed (requires refunds.override_cap permission).`,
        );
      }

      if (!actorPermissions?.includes('refunds.override_cap')) {
        throw new ForbiddenException(
          'Refund cap override requires the refunds.override_cap permission.',
        );
      }
    }

    const claim = await this.prisma.returnRequest.updateMany({
      where: { id: request.id, status: 'RECEIVED' },
      data: { status: 'REFUND_PROCESSING' },
    });
    if (claim.count !== 1) {
      throw new BadRequestException('Return refund is already being processed');
    }

    try {
      await this.refundService.executeRefund({
        orderId: request.orderId,
        returnRequestId: request.id,
        requestedByUserId: actorUserId,
        amount: dto.amount,
        reason: dto.reason ?? request.reason,
        metadata: dto.amount > receivedItemsCap
          ? {
              overrideCap: true,
              receivedItemsCap,
              overrideReason: dto.overrideReason?.trim(),
            }
          : undefined,
      });
    } catch (error) {
      if (error instanceof ServiceUnavailableException) {
        throw error;
      }

      await this.prisma.returnRequest.updateMany({
        where: { id: request.id, status: 'REFUND_PROCESSING' },
        data: { status: 'RECEIVED' },
      });
      throw error;
    }

    return this.getAdminReturn(returnRequestId);
  }

  private buildShippedQuantityMap(
    shipments: Array<{
      status: string;
      lines: Array<{ orderLineId: string; quantity: number }>;
    }>,
  ) {
    const shippedByLineId = new Map<string, number>();
    for (const shipment of shipments) {
      if (!['SHIPPED', 'DELIVERED'].includes(shipment.status)) {
        continue;
      }

      for (const line of shipment.lines) {
        shippedByLineId.set(
          line.orderLineId,
          (shippedByLineId.get(line.orderLineId) ?? 0) + line.quantity,
        );
      }
    }

    return shippedByLineId;
  }

  private generateReturnNumber() {
    return `RET-${new Date().toISOString().slice(0, 10).replace(/-/g, '')}-${randomUUID().slice(0, 8).toUpperCase()}`;
  }

  private serializeReturnRequest(request: ReturnRequestRecord) {
    return {
      id: request.id,
      orderId: request.orderId,
      returnNumber: request.returnNumber,
      requestedByUserId: request.requestedByUserId,
      reviewedByUserId: request.reviewedByUserId,
      receivedByUserId: request.receivedByUserId,
      status: request.status,
      reason: request.reason,
      notes: request.notes,
      reviewNotes: request.reviewNotes,
      rejectionReason: request.rejectionReason,
      approvedAt: request.approvedAt?.toISOString() ?? null,
      rejectedAt: request.rejectedAt?.toISOString() ?? null,
      receivedAt: request.receivedAt?.toISOString() ?? null,
      closedAt: request.closedAt?.toISOString() ?? null,
      createdAt: request.createdAt.toISOString(),
      updatedAt: request.updatedAt.toISOString(),
      items: request.items.map((item) => ({
        id: item.id,
        orderLineId: item.orderLineId,
        quantity: item.quantity,
        receivedQuantity: item.receivedQuantity,
        requestedDisposition: item.requestedDisposition,
        finalDisposition: item.finalDisposition,
        warehouseId: item.warehouseId,
        reason: item.reason,
        conditionNotes: item.conditionNotes,
        restockedAt: item.restockedAt?.toISOString() ?? null,
        productId: item.orderLine.productId,
        variantId: item.orderLine.variantId,
        sku: item.orderLine.sku,
        productName: item.orderLine.productName,
        variantName: item.orderLine.variantName,
      })),
      refunds: request.refunds.map((refund) => ({
        id: refund.id,
        status: refund.status,
        amount: refund.amount,
        currencyCode: refund.currencyCode,
        reason: refund.reason,
        provider: refund.provider,
        providerRefundId: refund.providerRefundId,
        requestedAt: refund.requestedAt.toISOString(),
        processedAt: refund.processedAt?.toISOString() ?? null,
      })),
    };
  }
}
