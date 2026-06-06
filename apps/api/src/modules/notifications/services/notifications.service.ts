import { BadRequestException, Inject, Injectable, NotFoundException } from '@nestjs/common';
import type { NotificationChannel, Prisma } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';
import { TaskDispatcherService } from '../../queue/task-dispatcher.service';
import { NotificationDeliveryService } from './notification-delivery.service';
import type {
  ListNotificationsQueryDto,
  RegisterPushDeviceDto,
  UpsertNotificationPreferenceDto,
} from '../dto/notifications.dto';

const notificationInclude = {
  user: {
    select: { id: true, email: true, displayName: true, userType: true },
  },
} satisfies Prisma.NotificationInclude;

type NotificationWithUser = Prisma.NotificationGetPayload<{
  include: typeof notificationInclude;
}>;

@Injectable()
export class NotificationsService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(TaskDispatcherService) private readonly taskDispatcher: TaskDispatcherService,
    @Inject(NotificationDeliveryService)
    private readonly deliveryService: NotificationDeliveryService,
  ) {}

  async getMyPreference(userId: string) {
    const existing = await this.prisma.notificationPreference.findUnique({
      where: { userId },
    });

    if (existing) {
      return existing;
    }

    return this.prisma.notificationPreference.create({
      data: {
        userId,
        channel: 'EMAIL',
      },
    });
  }

  async upsertMyPreference(userId: string, dto: UpsertNotificationPreferenceDto) {
    if (dto.channel === 'PUSH') {
      const activeDevices = await this.prisma.pushDevice.count({
        where: { userId, isActive: true },
      });
      if (activeDevices === 0) {
        throw new BadRequestException('Register a push device before enabling PUSH notifications');
      }
    }

    return this.prisma.notificationPreference.upsert({
      where: { userId },
      update: {
        channel: dto.channel,
        orderConfirmations: dto.orderConfirmations ?? true,
        orderShipments: dto.orderShipments ?? true,
        orderDeliveries: dto.orderDeliveries ?? true,
        returnStatusUpdates: dto.returnStatusUpdates ?? true,
        reviewReplies: dto.reviewReplies ?? true,
        backInStock: dto.backInStock ?? false,
        lowStockAlerts: dto.lowStockAlerts ?? true,
        promotionalMessages: dto.promotionalMessages ?? true,
      },
      create: {
        userId,
        channel: dto.channel,
        orderConfirmations: dto.orderConfirmations ?? true,
        orderShipments: dto.orderShipments ?? true,
        orderDeliveries: dto.orderDeliveries ?? true,
        returnStatusUpdates: dto.returnStatusUpdates ?? true,
        reviewReplies: dto.reviewReplies ?? true,
        backInStock: dto.backInStock ?? false,
        lowStockAlerts: dto.lowStockAlerts ?? true,
        promotionalMessages: dto.promotionalMessages ?? true,
      },
    });
  }

  async registerMyPushDevice(userId: string, dto: RegisterPushDeviceDto) {
    return this.prisma.pushDevice.upsert({
      where: { token: dto.token.trim() },
      update: { userId, platform: dto.platform, isActive: true },
      create: { userId, token: dto.token.trim(), platform: dto.platform, isActive: true },
    });
  }

  async unregisterMyPushDevice(userId: string, deviceId: string) {
    const updated = await this.prisma.pushDevice.updateMany({
      where: { id: deviceId, userId, isActive: true },
      data: { isActive: false },
    });

    if (updated.count !== 1) {
      throw new NotFoundException('Active push device was not found');
    }

    return { removed: true };
  }

  async listMyNotifications(userId: string, query: ListNotificationsQueryDto) {
    const notifications = await this.prisma.notification.findMany({
      where: {
        userId,
        ...(query.status ? { status: query.status } : {}),
        ...(query.channel ? { channel: query.channel } : {}),
      },
      include: notificationInclude,
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
      ...(query.cursor ? { cursor: { id: query.cursor }, skip: 1 } : {}),
      take: 21,
    });

    return this.serializePage(notifications, 20);
  }

  async enqueueNotification(input: {
    userId: string | null;
    recipientEmail?: string | null;
    channel: NotificationChannel;
    eventType: string;
    title: string;
    body?: string | null;
    relatedEntityType?: string | null;
    relatedEntityId?: string | null;
    deduplicationKey: string;
  }) {
    const notification = await this.prisma.notification.upsert({
      where: { deduplicationKey: input.deduplicationKey },
      // A deduplicated event must never reset an already-sent delivery back to PENDING.
      // Failed deliveries are retried explicitly through the admin action below.
      update: {},
      create: {
        userId: input.userId,
        recipientEmail: input.recipientEmail ?? null,
        channel: input.channel,
        eventType: input.eventType,
        title: input.title,
        body: input.body ?? null,
        relatedEntityType: input.relatedEntityType ?? null,
        relatedEntityId: input.relatedEntityId ?? null,
        deduplicationKey: input.deduplicationKey,
      },
    });

    if (this.taskDispatcher.usesQueue) {
      await this.taskDispatcher.dispatchNotification(notification.id);
      return notification;
    }

    if (notification.status === 'PENDING') {
      try {
        await this.deliveryService.deliver(notification.id);
      } catch {
        // Direct-mode delivery failure is recorded on the notification and can
        // be retried by an administrator without failing the originating order.
      }
    }
    return this.prisma.notification.findUnique({ where: { id: notification.id } });
  }

  async retryFailedNotification(notificationId: string) {
    const retried = await this.prisma.notification.updateMany({
      where: { id: notificationId, status: 'FAILED' },
      data: { status: 'PENDING', processedAt: null, lastError: null },
    });
    if (retried.count !== 1) {
      throw new BadRequestException('Only a failed notification can be retried');
    }
    if (this.taskDispatcher.usesQueue) {
      await this.taskDispatcher.dispatchNotification(notificationId, true);
    } else {
      await this.deliveryService.deliver(notificationId);
    }
    return this.prisma.notification.findUnique({ where: { id: notificationId } });
  }

  async listAdminNotifications(query: ListNotificationsQueryDto) {
    const notifications = await this.prisma.notification.findMany({
      where: {
        ...(query.status ? { status: query.status } : {}),
        ...(query.channel ? { channel: query.channel } : {}),
      },
      include: notificationInclude,
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
      ...(query.cursor ? { cursor: { id: query.cursor }, skip: 1 } : {}),
      take: 21,
    });

    return this.serializePage(notifications, 20);
  }

  private toNotificationResponse(notification: NotificationWithUser) {
    return {
      id: notification.id,
      userId: notification.userId,
      recipientEmail: notification.recipientEmail,
      channel: notification.channel,
      eventType: notification.eventType,
      title: notification.title,
      body: notification.body,
      status: notification.status,
      relatedEntityType: notification.relatedEntityType,
      relatedEntityId: notification.relatedEntityId,
      deduplicationKey: notification.deduplicationKey,
      lastError: notification.lastError,
      attempts: notification.attempts,
      availableAt: null,
      processedAt: notification.processedAt?.toISOString() ?? null,
      createdAt: notification.createdAt.toISOString(),
      updatedAt: notification.updatedAt.toISOString(),
      user: notification.user
        ? {
            id: notification.user.id,
            email: notification.user.email,
            displayName: notification.user.displayName,
            userType: notification.user.userType,
          }
        : null,
    };
  }

  private serializePage(notifications: NotificationWithUser[], limit: number) {
    const hasNextPage = notifications.length > limit;
    const items = (hasNextPage ? notifications.slice(0, limit) : notifications).map((n) =>
      this.toNotificationResponse(n),
    );
    return {
      items,
      nextCursor: hasNextPage ? (items[items.length - 1]?.id ?? null) : null,
    };
  }
}
