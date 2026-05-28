import { Processor, WorkerHost } from '@nestjs/bullmq';
import type { Job } from 'bullmq';
import { PinoLogger } from 'nestjs-pino';

import { EmailProviderService } from '../notifications/email-provider.service';
import { PushProviderService } from '../notifications/push-provider.service';
import { PrismaService } from '../persistence/prisma.service';

const NOTIFICATION_DISPATCH_QUEUE = 'notification-dispatch';
const NOTIFICATION_PROCESSING_LEASE_MS = 5 * 60 * 1000;

interface NotificationDispatchJobData {
  notificationId: string;
}

@Processor(NOTIFICATION_DISPATCH_QUEUE)
export class NotificationDispatchProcessor extends WorkerHost {
  constructor(
    private readonly prisma: PrismaService,
    private readonly emailProvider: EmailProviderService,
    private readonly pushProvider: PushProviderService,
    private readonly logger: PinoLogger,
  ) {
    super();
  }

  async process(job: Job<NotificationDispatchJobData>): Promise<void> {
    const { notificationId } = job.data;

    if (!notificationId) {
      this.logger.logger.warn(
        { jobId: job.id },
        'Notification dispatch job missing notificationId, skipping.',
      );
      return;
    }

    const claimed = await this.prisma.notification.updateMany({
      where: {
        id: notificationId,
        OR: [
          { status: { in: ['PENDING', 'FAILED'] } },
          {
            status: 'PROCESSING',
            processedAt: { lt: new Date(Date.now() - NOTIFICATION_PROCESSING_LEASE_MS) },
          },
        ],
      },
      data: {
        status: 'PROCESSING',
        attempts: { increment: 1 },
        processedAt: new Date(),
        lastError: null,
      },
    });
    if (claimed.count !== 1) {
      this.logger.logger.info({ notificationId }, 'Notification already claimed or completed.');
      return;
    }

    const notification = await this.prisma.notification.findUnique({
      where: { id: notificationId },
      include: {
        user: {
          select: {
            email: true,
            pushDevices: { where: { isActive: true }, select: { token: true } },
          },
        },
      },
    });

    if (!notification) {
      return;
    }

    try {
      switch (notification.channel) {
        case 'IN_APP':
          break;
        case 'EMAIL': {
          const recipientEmail = notification.recipientEmail ?? notification.user?.email;
          if (!recipientEmail) {
            throw new Error('EMAIL notification has no recipient email address');
          }
          await this.emailProvider.send({
            to: recipientEmail,
            subject: notification.title,
            text: notification.body ?? notification.title,
          });
          break;
        }
        case 'PUSH': {
          const deviceTokens = notification.user?.pushDevices.map((device) => device.token) ?? [];
          if (deviceTokens.length === 0) {
            throw new Error('PUSH notification has no active registered device');
          }
          await Promise.all(
            deviceTokens.map((token) =>
              this.pushProvider.send({
                token,
                title: notification.title,
                body: notification.body ?? notification.title,
              }),
            ),
          );
          break;
        }
      }

      await this.prisma.notification.update({
        where: { id: notificationId },
        data: {
          status: 'SENT',
          sentAt: new Date(),
          processedAt: new Date(),
          lastError: null,
        },
      });
    } catch (error) {
      const message = error instanceof Error ? error.message : 'Notification delivery failed';
      await this.prisma.notification.update({
        where: { id: notificationId },
        data: {
          status: 'FAILED',
          processedAt: new Date(),
          lastError: message,
        },
      });
      throw error;
    }
  }
}
