import { Inject, Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import type { NotificationChannel, Prisma } from '@prisma/client';
import Stripe from 'stripe';

import type { AppConfig } from '../../../config/app.config';
import { NotificationsService } from '../../notifications/services/notifications.service';
import { PrismaService } from '../../persistence/services/prisma.service';

const LEASE_MS = 5 * 60 * 1000;
interface NotificationTemplate {
  title: string;
  body: string;
  preferenceFlag:
    | 'orderConfirmations'
    | 'orderShipments'
    | 'orderDeliveries'
    | 'returnStatusUpdates';
}

@Injectable()
export class DirectRuntimeService {
  private readonly logger = new Logger(DirectRuntimeService.name);
  private readonly config: AppConfig;
  private readonly stripe: InstanceType<typeof Stripe> | null;

  constructor(
    @Inject(ConfigService) configService: ConfigService,
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(NotificationsService) private readonly notifications: NotificationsService,
  ) {
    this.config = configService.getOrThrow<AppConfig>('app');
    this.stripe = this.config.stripeSecretKey
      ? new Stripe(this.config.stripeSecretKey, {
          apiVersion: '2026-04-22.dahlia',
          maxNetworkRetries: 2,
          timeout: 10_000,
        })
      : null;
  }

  get enabled(): boolean {
    return this.config.executionMode === 'direct';
  }

  async runMaintenance(batchSize = this.config.maintenanceBatchSize) {
    if (!this.enabled)
      return { mode: 'queue', skipped: true, expiredReservations: 0, dispatchedEvents: 0 };
    const expiredReservations = await this.expireDueReservations(batchSize);
    const dispatchedEvents = await this.dispatchOutbox(batchSize);
    return { mode: 'direct', skipped: false, expiredReservations, dispatchedEvents };
  }

  private async expireDueReservations(limit: number): Promise<number> {
    const due = await this.prisma.stockReservation.findMany({
      where: { status: 'RESERVED', expiresAt: { lte: new Date() } },
      orderBy: [{ expiresAt: 'asc' }, { id: 'asc' }],
      take: limit,
    });
    let completed = 0;
    for (const reservation of due) {
      try {
        if (await this.expireReservation(reservation)) completed += 1;
      } catch (error) {
        this.logger.error(
          `Failed to expire reservation ${reservation.id}`,
          error instanceof Error ? error.stack : undefined,
        );
      }
    }
    return completed;
  }

  private async expireReservation(reservation: {
    id: string;
    reservationKey: string;
    quantity: number;
    warehouseId: string;
    variantId: string;
  }): Promise<boolean> {
    const stripeOrder = await this.prisma.order.findFirst({
      where: {
        reservationKey: reservation.reservationKey,
        paymentMethod: 'STRIPE_CARD',
        paymentStatus: 'PENDING',
      },
      include: {
        paymentAttempts: {
          where: { provider: 'STRIPE', status: { in: ['PROCESSING', 'AWAITING_CUSTOMER_ACTION'] } },
          orderBy: [{ createdAt: 'desc' }],
          take: 1,
        },
      },
    });
    const attempt = stripeOrder?.paymentAttempts[0];
    if (attempt?.providerPaymentId) {
      const cancelled = await this.cancelUncapturedPayment(attempt.providerPaymentId);
      if (!cancelled) {
        this.logger.warn(
          `Reservation ${reservation.id} retained because its Stripe payment has succeeded and awaits webhook reconciliation.`,
        );
        return false;
      }
    }
    return this.prisma.$transaction(async (tx) => {
      const claim = await tx.stockReservation.updateMany({
        where: { id: reservation.id, status: 'RESERVED' },
        data: { status: 'EXPIRED' },
      });
      if (claim.count !== 1) return false;
      const reduced = await tx.$executeRaw`
        UPDATE StockLevel SET quantityReserved = quantityReserved - ${reservation.quantity}
        WHERE warehouseId = ${reservation.warehouseId} AND variantId = ${reservation.variantId}
          AND quantityReserved >= ${reservation.quantity}
      `;
      if (Number(reduced) !== 1)
        throw new Error('Inventory invariant violation while expiring reservation');
      if (stripeOrder) {
        await tx.paymentAttempt.updateMany({
          where: {
            orderId: stripeOrder.id,
            status: { in: ['PROCESSING', 'AWAITING_CUSTOMER_ACTION'] },
          },
          data: { status: 'CANCELLED' },
        });
        const voided = await tx.order.updateMany({
          where: { id: stripeOrder.id, paymentStatus: 'PENDING' },
          data: { status: 'CANCELLED', paymentStatus: 'VOIDED' },
        });
        if (voided.count === 1) {
          await tx.outboxEvent.upsert({
            where: { deduplicationKey: `order.payment.expired:${stripeOrder.id}` },
            update: {},
            create: {
              aggregateType: 'ORDER',
              aggregateId: stripeOrder.id,
              eventType: 'order.payment.expired',
              deduplicationKey: `order.payment.expired:${stripeOrder.id}`,
              payload: { orderId: stripeOrder.id, paymentStatus: 'VOIDED' },
            },
          });
        }
      }
      return true;
    });
  }

  private async cancelUncapturedPayment(paymentIntentId: string): Promise<boolean> {
    if (this.config.paymentProvider !== 'stripe' || !this.stripe)
      throw new Error('Stripe is not configured for pending payment expiry');
    try {
      const intent = await this.stripe.paymentIntents.cancel(paymentIntentId);
      return intent.status !== 'succeeded';
    } catch (error) {
      const intent = await this.stripe.paymentIntents.retrieve(paymentIntentId);
      if (intent.status === 'succeeded') return false;
      if (intent.status === 'canceled') return true;
      throw error;
    }
  }

  private async dispatchOutbox(limit: number): Promise<number> {
    const staleBefore = new Date(Date.now() - LEASE_MS);
    const events = await this.prisma.outboxEvent.findMany({
      where: {
        OR: [
          { status: { in: ['PENDING', 'FAILED'] }, availableAt: { lte: new Date() } },
          { status: 'PROCESSING', updatedAt: { lt: staleBefore } },
        ],
      },
      orderBy: [{ availableAt: 'asc' }, { createdAt: 'asc' }],
      take: limit,
    });
    let completed = 0;
    for (const event of events) if (await this.dispatchEvent(event)) completed += 1;
    return completed;
  }

  private async dispatchEvent(event: {
    id: string;
    aggregateId: string;
    eventType: string;
    payload: Prisma.JsonValue;
  }): Promise<boolean> {
    const claimed = await this.prisma.outboxEvent.updateMany({
      where: {
        id: event.id,
        OR: [
          { status: { in: ['PENDING', 'FAILED'] } },
          { status: 'PROCESSING', updatedAt: { lt: new Date(Date.now() - LEASE_MS) } },
        ],
      },
      data: { status: 'PROCESSING', attempts: { increment: 1 }, lastError: null },
    });
    if (claimed.count !== 1) return false;
    try {
      const template = this.templateFor(event.eventType, event.payload);
      if (!template) {
        await this.completeEvent(event.id);
        return true;
      }
      const order = await this.prisma.order.findUnique({
        where: { id: event.aggregateId },
        select: { id: true, userId: true, customerEmail: true, orderNumber: true },
      });
      if (!order)
        throw new Error(`Order ${event.aggregateId} referenced by outbox event was not found`);
      const preference = order.userId
        ? await this.prisma.notificationPreference.findUnique({ where: { userId: order.userId } })
        : null;
      if (preference && !preference[template.preferenceFlag]) {
        await this.completeEvent(event.id);
        return true;
      }
      const channel: NotificationChannel = preference?.channel ?? 'EMAIL';
      await this.notifications.enqueueNotification({
        userId: order.userId,
        recipientEmail: order.customerEmail,
        channel,
        eventType: event.eventType,
        title: template.title.replace('{orderNumber}', order.orderNumber),
        body: template.body.replace('{orderNumber}', order.orderNumber),
        relatedEntityType: 'ORDER',
        relatedEntityId: order.id,
        deduplicationKey: `outbox:${event.id}:${channel}`,
      });
      await this.completeEvent(event.id);
      return true;
    } catch (error) {
      await this.prisma.outboxEvent.update({
        where: { id: event.id },
        data: {
          status: 'FAILED',
          lastError: error instanceof Error ? error.message : 'Outbox dispatch failed',
          availableAt: new Date(Date.now() + 60_000),
        },
      });
      return false;
    }
  }

  private completeEvent(id: string) {
    return this.prisma.outboxEvent.update({
      where: { id },
      data: { status: 'DISPATCHED', processedAt: new Date(), lastError: null },
    });
  }

  private templateFor(eventType: string, payload: Prisma.JsonValue): NotificationTemplate | null {
    const data =
      typeof payload === 'object' && payload !== null && !Array.isArray(payload) ? payload : {};
    const shipmentStatus = typeof data.status === 'string' ? data.status : 'updated';
    switch (eventType) {
      case 'order.placed':
        return {
          title: 'Order {orderNumber} received',
          body: 'We received your order {orderNumber} and will update you as it progresses.',
          preferenceFlag: 'orderConfirmations',
        };
      case 'order.cancelled':
        return {
          title: 'Order {orderNumber} cancelled',
          body: 'Your order {orderNumber} has been cancelled.',
          preferenceFlag: 'orderConfirmations',
        };
      case 'order.payment.expired':
        return {
          title: 'Payment session expired for order {orderNumber}',
          body: 'The payment session for order {orderNumber} expired before completion.',
          preferenceFlag: 'orderConfirmations',
        };
      case 'order.shipment.created':
        return {
          title: 'Order {orderNumber} is being prepared',
          body: 'A shipment has been created for order {orderNumber}.',
          preferenceFlag: 'orderShipments',
        };
      case 'order.shipment.status_changed':
        return {
          title: `Order {orderNumber} shipment ${shipmentStatus}`,
          body: `Your shipment for order {orderNumber} is now ${shipmentStatus}.`,
          preferenceFlag: shipmentStatus === 'DELIVERED' ? 'orderDeliveries' : 'orderShipments',
        };
      case 'order.return.approved':
      case 'order.return.rejected':
      case 'order.return.received':
      case 'order.return.refund_succeeded':
      case 'order.refund.succeeded':
        return {
          title: 'Return update for order {orderNumber}',
          body: `There is a new return or refund update for order {orderNumber}: ${eventType}.`,
          preferenceFlag: 'returnStatusUpdates',
        };
      default:
        return null;
    }
  }
}
