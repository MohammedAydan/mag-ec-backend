import { InjectQueue } from '@nestjs/bullmq';
import { Injectable, type OnModuleInit } from '@nestjs/common';
import type { Queue } from 'bullmq';

const MAINTENANCE_QUEUE = 'maintenance';

@Injectable()
export class OutboxDispatchScheduler implements OnModuleInit {
  constructor(@InjectQueue(MAINTENANCE_QUEUE) private readonly maintenanceQueue: Queue) {}

  async onModuleInit(): Promise<void> {
    await this.maintenanceQueue.upsertJobScheduler(
      'outbox-dispatch-every-five-seconds',
      { every: 5_000 },
      { name: 'dispatch-outbox', data: {} },
    );
  }
}
