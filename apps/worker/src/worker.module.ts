import path from 'node:path';

import { Module } from '@nestjs/common';
import { BullModule } from '@nestjs/bullmq';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { LoggerModule } from 'nestjs-pino';

import type { WorkerConfig } from './config/worker.config';
import { buildWorkerConfig } from './config/worker.config';
import { PrismaService } from './persistence/prisma.service';
import { InventoryExpiryProcessor } from './processors/inventory-expiry.processor';
import { MaintenanceProcessor } from './processors/maintenance.processor';
import { NotificationDispatchProcessor } from './processors/notification-dispatch.processor';
import { ReportExportProcessor } from './processors/report-export.processor';
import { OutboxDispatchScheduler } from './processors/outbox-dispatch.scheduler';
import { EmailProviderService } from './notifications/email-provider.service';
import { PushProviderService } from './notifications/push-provider.service';
import { WorkerStorageService } from './storage/worker-storage.service';
import { StripePaymentLifecycleService } from './payments/stripe-payment-lifecycle.service';

const INVENTORY_EXPIRY_QUEUE = 'inventory-expiry';
const MAINTENANCE_QUEUE = 'maintenance';
const NOTIFICATION_DISPATCH_QUEUE = 'notification-dispatch';
const REPORT_EXPORT_QUEUE = 'report-export';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      cache: true,
      envFilePath: [
        path.resolve(process.cwd(), '.env'),
        path.resolve(process.cwd(), '../../.env'),
        path.resolve(__dirname, '../../../.env'),
      ],
      load: [buildWorkerConfig],
    }),
    LoggerModule.forRootAsync({
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => {
        const config = configService.getOrThrow<WorkerConfig>('worker');

        return {
          pinoHttp: {
            level: config.logLevel,
          },
        };
      },
    }),
    BullModule.forRootAsync({
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => {
        const config = configService.getOrThrow<WorkerConfig>('worker');
        const redisUrl = new URL(config.redisUrl);

        return {
          connection: {
            host: redisUrl.hostname,
            port: Number.parseInt(redisUrl.port || '6379', 10),
            username: redisUrl.username || undefined,
            password: redisUrl.password || undefined,
            db: Number.parseInt(redisUrl.pathname.replace('/', '') || '0', 10),
          },
          prefix: config.queuePrefix,
        };
      },
    }),
    BullModule.registerQueue({ name: MAINTENANCE_QUEUE }),
    BullModule.registerQueue({ name: INVENTORY_EXPIRY_QUEUE }),
    BullModule.registerQueue({ name: NOTIFICATION_DISPATCH_QUEUE }),
    BullModule.registerQueue({ name: REPORT_EXPORT_QUEUE }),
  ],
  providers: [
    PrismaService,
    WorkerStorageService,
    EmailProviderService,
    PushProviderService,
    StripePaymentLifecycleService,
    OutboxDispatchScheduler,
    MaintenanceProcessor,
    InventoryExpiryProcessor,
    NotificationDispatchProcessor,
    ReportExportProcessor,
  ],
})
export class WorkerModule {}
