import { Inject, Injectable, OnModuleDestroy } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Queue } from 'bullmq';

import type { AppConfig } from '../../config/app.config';
import {
  INVENTORY_EXPIRY_QUEUE,
  NOTIFICATION_DISPATCH_QUEUE,
  REPORT_EXPORT_QUEUE,
} from './queue.constants';

@Injectable()
export class TaskDispatcherService implements OnModuleDestroy {
  private readonly config: AppConfig;
  private readonly queues = new Map<string, Queue>();

  constructor(@Inject(ConfigService) configService: ConfigService) {
    this.config = configService.getOrThrow<AppConfig>('app');
  }

  get mode(): AppConfig['executionMode'] {
    return this.config.executionMode;
  }

  get usesQueue(): boolean {
    return this.config.executionMode === 'queue';
  }

  async scheduleReservationExpiry(reservationId: string, expiresAt: Date): Promise<boolean> {
    if (!this.usesQueue) return false;
    await this.queue(INVENTORY_EXPIRY_QUEUE).add(
      'expire-reservation',
      { reservationId },
      { delay: Math.max(0, expiresAt.getTime() - Date.now()), jobId: `expire-${reservationId}` },
    );
    return true;
  }

  async dispatchNotification(notificationId: string, retry = false): Promise<boolean> {
    if (!this.usesQueue) return false;
    await this.queue(NOTIFICATION_DISPATCH_QUEUE).add(
      'dispatch-notification',
      { notificationId },
      {
        jobId: retry
          ? `notification:retry:${notificationId}:${Date.now()}`
          : `notification:${notificationId}`,
        attempts: 5,
        backoff: { type: 'exponential', delay: 1_000 },
        removeOnComplete: 100,
        removeOnFail: 1_000,
      },
    );
    return true;
  }

  async generateReportExport(reportExportId: string): Promise<boolean> {
    if (!this.usesQueue) return false;
    await this.queue(REPORT_EXPORT_QUEUE).add(
      'generate-report-export',
      { reportExportId },
      { jobId: `report-export:${reportExportId}` },
    );
    return true;
  }

  async onModuleDestroy(): Promise<void> {
    await Promise.all([...this.queues.values()].map((queue) => queue.close()));
  }

  private queue(name: string): Queue {
    const existing = this.queues.get(name);
    if (existing) return existing;
    const redisUrl = new URL(this.config.redisUrl);
    const queue = new Queue(name, {
      connection: {
        host: redisUrl.hostname,
        port: Number.parseInt(redisUrl.port || '6379', 10),
        username: redisUrl.username || undefined,
        password: redisUrl.password || undefined,
        db: Number.parseInt(redisUrl.pathname.replace('/', '') || '0', 10),
        maxRetriesPerRequest: 1,
      },
      prefix: this.config.queuePrefix,
    });
    this.queues.set(name, queue);
    return queue;
  }
}
