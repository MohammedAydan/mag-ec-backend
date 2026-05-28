import { ForbiddenException, Inject, Injectable, NotFoundException } from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';

const orderInclude = {
  addresses: {
    orderBy: [{ createdAt: 'asc' as const }],
  },
  lines: {
    orderBy: [{ createdAt: 'asc' as const }],
  },
  appliedPromotions: {
    orderBy: [{ createdAt: 'asc' as const }],
  },
  shipments: {
    include: {
      lines: {
        orderBy: [{ createdAt: 'asc' as const }],
      },
    },
    orderBy: [{ createdAt: 'asc' as const }],
  },
  returnRequests: {
    include: {
      items: {
        orderBy: [{ createdAt: 'asc' as const }],
      },
      refunds: {
        orderBy: [{ createdAt: 'asc' as const }],
      },
    },
    orderBy: [{ createdAt: 'asc' as const }],
  },
  refunds: {
    orderBy: [{ createdAt: 'asc' as const }],
  },
} satisfies Prisma.OrderInclude;

type OrderRecord = Prisma.OrderGetPayload<{
  include: typeof orderInclude;
}>;

@Injectable()
export class OrderService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
  ) {}

  async listCustomerOrders(userId: string) {
    const orders = await this.prisma.order.findMany({
      where: { userId },
      include: orderInclude,
      orderBy: [{ createdAt: 'desc' }],
    });

    return orders.map((order) => this.serializeOrder(order));
  }

  async getCustomerOrder(orderId: string, userId: string) {
    const order = await this.prisma.order.findUnique({
      where: { id: orderId },
      include: orderInclude,
    });

    if (!order) {
      throw new NotFoundException(`Order "${orderId}" was not found`);
    }

    if (order.userId !== userId) {
      throw new ForbiddenException('You do not have access to this order');
    }

    return this.serializeOrder(order);
  }

  async listAdminOrders() {
    const orders = await this.prisma.order.findMany({
      include: orderInclude,
      orderBy: [{ createdAt: 'desc' }],
    });

    return orders.map((order) => this.serializeOrder(order));
  }

  async getAdminOrder(orderId: string) {
    const order = await this.prisma.order.findUnique({
      where: { id: orderId },
      include: orderInclude,
    });

    if (!order) {
      throw new NotFoundException(`Order "${orderId}" was not found`);
    }

    return this.serializeOrder(order);
  }

  async getSerializedOrderById(
    orderId: string,
    tx: Prisma.TransactionClient | PrismaService = this.prisma,
  ) {
    const order = await tx.order.findUnique({
      where: { id: orderId },
      include: orderInclude,
    });

    if (!order) {
      throw new NotFoundException(`Order "${orderId}" was not found`);
    }

    return this.serializeOrder(order);
  }

  serializeOrder(order: OrderRecord) {
    return {
      id: order.id,
      orderNumber: order.orderNumber,
      userId: order.userId,
      cartId: order.cartId,
      status: order.status,
      paymentMethod: order.paymentMethod,
      paymentStatus: order.paymentStatus,
      fulfillmentStatus: order.fulfillmentStatus,
      customerEmail: order.customerEmail,
      customerName: order.customerName,
      customerPhone: order.customerPhone,
      currencyCode: order.currencyCode,
      countryCode: order.countryCode,
      shippingMethod: {
        key: order.shippingMethodKey,
        name: order.shippingMethodName,
        rateType: order.shippingRateType,
        estimatedMinDays: order.shippingEstimatedMinDays,
        estimatedMaxDays: order.shippingEstimatedMaxDays,
      },
      couponCode: order.couponCode,
      subtotalAmount: order.subtotalAmount,
      subtotalDiscountAmount: order.subtotalDiscountAmount,
      discountedSubtotalAmount: order.discountedSubtotalAmount,
      shippingAmount: order.shippingAmount,
      taxAmount: order.taxAmount,
      grandTotalAmount: order.grandTotalAmount,
      paidAt: order.paidAt?.toISOString() ?? null,
      placedAt: order.placedAt.toISOString(),
      createdAt: order.createdAt.toISOString(),
      updatedAt: order.updatedAt.toISOString(),
      addresses: order.addresses.map((address) => ({
        id: address.id,
        type: address.type,
        recipientName: address.recipientName,
        phoneNumber: address.phoneNumber,
        countryCode: address.countryCode,
        city: address.city,
        state: address.state,
        postalCode: address.postalCode,
        addressLine1: address.addressLine1,
        addressLine2: address.addressLine2,
        company: address.company,
      })),
      items: order.lines.map((line) => ({
        id: line.id,
        productId: line.productId,
        variantId: line.variantId,
        sku: line.sku,
        productName: line.productName,
        variantName: line.variantName,
        quantity: line.quantity,
        currencyCode: line.currencyCode,
        unitBaseAmount: line.unitBaseAmount,
        unitSaleAmount: line.unitSaleAmount,
        effectiveUnitAmount: line.effectiveUnitAmount,
        lineSubtotalAmount: line.lineSubtotalAmount,
        taxAmount: line.taxAmount,
      })),
      appliedPromotions: order.appliedPromotions.map((promotion) => ({
        id: promotion.id,
        promotionId: promotion.promotionId,
        key: promotion.key,
        name: promotion.name,
        rewardType: promotion.rewardType,
        discountAmount: promotion.discountAmount,
        freeShipping: promotion.freeShipping,
        source: promotion.source,
        couponCode: promotion.couponCode,
      })),
      shipments: order.shipments.map((shipment) => ({
        id: shipment.id,
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
        })),
      })),
      returnRequests: order.returnRequests.map((returnRequest) => ({
        id: returnRequest.id,
        returnNumber: returnRequest.returnNumber,
        requestedByUserId: returnRequest.requestedByUserId,
        reviewedByUserId: returnRequest.reviewedByUserId,
        receivedByUserId: returnRequest.receivedByUserId,
        status: returnRequest.status,
        reason: returnRequest.reason,
        notes: returnRequest.notes,
        reviewNotes: returnRequest.reviewNotes,
        rejectionReason: returnRequest.rejectionReason,
        approvedAt: returnRequest.approvedAt?.toISOString() ?? null,
        rejectedAt: returnRequest.rejectedAt?.toISOString() ?? null,
        receivedAt: returnRequest.receivedAt?.toISOString() ?? null,
        closedAt: returnRequest.closedAt?.toISOString() ?? null,
        createdAt: returnRequest.createdAt.toISOString(),
        updatedAt: returnRequest.updatedAt.toISOString(),
        items: returnRequest.items.map((item) => ({
          id: item.id,
          orderLineId: item.orderLineId,
          quantity: item.quantity,
          requestedDisposition: item.requestedDisposition,
          finalDisposition: item.finalDisposition,
          warehouseId: item.warehouseId,
          receivedQuantity: item.receivedQuantity,
          reason: item.reason,
          conditionNotes: item.conditionNotes,
          restockedAt: item.restockedAt?.toISOString() ?? null,
        })),
        refunds: returnRequest.refunds.map((refund) => ({
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
      })),
      refunds: order.refunds.map((refund) => ({
        id: refund.id,
        returnRequestId: refund.returnRequestId,
        paymentAttemptId: refund.paymentAttemptId,
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
