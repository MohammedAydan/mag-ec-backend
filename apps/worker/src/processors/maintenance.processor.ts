import { Processor, WorkerHost, InjectQueue } from '@nestjs/bullmq';
import type { NotificationChannel, Prisma } from '@prisma/client';
import type { Job, Queue } from 'bullmq';
import { PinoLogger } from 'nestjs-pino';

import { PrismaService } from '../persistence/prisma.service';

const MAINTENANCE_QUEUE = 'maintenance';
const NOTIFICATION_DISPATCH_QUEUE = 'notification-dispatch';
const OUTBOX_BATCH_SIZE = 50;
const OUTBOX_PROCESSING_LEASE_MS = 5 * 60 * 1000;

interface NotificationTemplate {
  title: string;
  body: string;
  preferenceFlag:
    | 'orderConfirmations'
    | 'orderShipments'
    | 'orderDeliveries'
    | 'returnStatusUpdates';
}

@Processor(MAINTENANCE_QUEUE)
export class MaintenanceProcessor extends WorkerHost {
  constructor(
    private readonly prisma: PrismaService,
    @InjectQueue(NOTIFICATION_DISPATCH_QUEUE)
    private readonly notificationQueue: Queue,
    private readonly logger: PinoLogger,
  ) {
    super();
  }

  async process(job: Job): Promise<void> {
    if (job.name !== 'dispatch-outbox') {
      this.logger.logger.info(
        { jobId: job.id, jobName: job.name },
        'Ignoring unknown maintenance job.',
      );
      return;
    }

    const staleBefore = new Date(Date.now() - OUTBOX_PROCESSING_LEASE_MS);
    const events = await this.prisma.outboxEvent.findMany({
      where: {
        OR: [
          { status: { in: ['PENDING', 'FAILED'] }, availableAt: { lte: new Date() } },
          { status: 'PROCESSING', updatedAt: { lt: staleBefore } },
        ],
      },
      orderBy: [{ availableAt: 'asc' }, { createdAt: 'asc' }],
      take: OUTBOX_BATCH_SIZE,
    });

    for (const event of events) {
      await this.dispatchOutboxEvent(event);
    }
  }

  private async dispatchOutboxEvent(event: {
    id: string;
    aggregateId: string;
    eventType: string;
    payload: Prisma.JsonValue;
  }): Promise<void> {
    const claim = await this.prisma.outboxEvent.updateMany({
      where: {
        id: event.id,
        OR: [
          { status: { in: ['PENDING', 'FAILED'] } },
          {
            status: 'PROCESSING',
            updatedAt: { lt: new Date(Date.now() - OUTBOX_PROCESSING_LEASE_MS) },
          },
        ],
      },
      data: { status: 'PROCESSING', attempts: { increment: 1 }, lastError: null },
    });
    if (claim.count !== 1) {
      return;
    }

    try {
      const template = this.templateForEvent(event.eventType, event.payload);
      if (!template) {
        await this.completeEvent(event.id);
        return;
      }

      const order = await this.prisma.order.findUnique({
        where: { id: event.aggregateId },
        select: { id: true, userId: true, customerEmail: true, orderNumber: true },
      });
      if (!order) {
        throw new Error(`Order ${event.aggregateId} referenced by outbox event was not found`);
      }

      const preference = order.userId
        ? await this.prisma.notificationPreference.findUnique({ where: { userId: order.userId } })
        : null;
      if (preference && !preference[template.preferenceFlag]) {
        await this.completeEvent(event.id);
        return;
      }

      const channel: NotificationChannel = preference?.channel ?? 'EMAIL';
      const notification = await this.prisma.notification.upsert({
        where: { deduplicationKey: `outbox:${event.id}:${channel}` },
        update: {},
        create: {
          userId: order.userId,
          recipientEmail: order.customerEmail,
          channel,
          eventType: event.eventType,
          title: template.title.replace('{orderNumber}', order.orderNumber),
          body: template.body.replace('{orderNumber}', order.orderNumber),
          relatedEntityType: 'ORDER',
          relatedEntityId: order.id,
          deduplicationKey: `outbox:${event.id}:${channel}`,
        },
      });

      await this.notificationQueue.add(
        'dispatch-notification',
        { notificationId: notification.id },
        {
          jobId: `notification:${notification.id}`,
          attempts: 5,
          backoff: { type: 'exponential', delay: 1_000 },
          removeOnComplete: 100,
          removeOnFail: 1_000,
        },
      );
      await this.completeEvent(event.id);
    } catch (error) {
      const message = error instanceof Error ? error.message : 'Outbox dispatch failed';
      await this.prisma.outboxEvent.update({
        where: { id: event.id },
        data: {
          status: 'FAILED',
          lastError: message,
          availableAt: new Date(Date.now() + 60_000),
        },
      });
      this.logger.logger.error({ eventId: event.id, err: error }, 'Outbox dispatch failed.');
    }
  }

  private completeEvent(eventId: string): Promise<unknown> {
    return this.prisma.outboxEvent.update({
      where: { id: eventId },
      data: { status: 'DISPATCHED', processedAt: new Date(), lastError: null },
    });
  }

  private templateForEvent(
    eventType: string,
    payload: Prisma.JsonValue,
  ): NotificationTemplate | null {
    const data: Prisma.JsonObject =
      typeof payload === 'object' && payload !== null && !Array.isArray(payload) ? payload : {};
    const shipmentStatus = typeof data.status === 'string' ? data.status : null;

    switch (eventType) {
      case 'order.cancelled':
        return {
          title: 'Order {orderNumber} cancelled',
          body: 'Your order {orderNumber} has been cancelled.',
          preferenceFlag: 'orderConfirmations',
        };
      case 'order.payment.expired':
        return {
          title: 'Payment session expired for order {orderNumber}',
          body: 'The payment session for order {orderNumber} expired before payment was completed. Please place a new order if you still want these items.',
          preferenceFlag: 'orderConfirmations',
        };
      case 'order.placed':
        return {
          title: 'Order {orderNumber} received',
          body: 'We received your order {orderNumber} and will update you as it progresses.',
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
          title: `Order {orderNumber} shipment ${shipmentStatus ?? 'updated'}`,
          body: `Your shipment for order {orderNumber} is now ${shipmentStatus ?? 'updated'}.`,
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
