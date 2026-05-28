import { Inject, Injectable, OnModuleDestroy } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import IORedis from 'ioredis';

import type { AppConfig } from '../../config/app.config';

@Injectable()
export class QueueHealthService implements OnModuleDestroy {
  private readonly redis: IORedis | null;
  private readonly queueEnabled: boolean;

  constructor(@Inject(ConfigService) configService: ConfigService) {
    const config = configService.getOrThrow<AppConfig>('app');

    this.queueEnabled = config.executionMode === 'queue';
    this.redis = this.queueEnabled
      ? new IORedis(config.redisUrl, {
          lazyConnect: true,
          maxRetriesPerRequest: 1,
        })
      : null;
  }

  async ping(): Promise<void> {
    if (!this.queueEnabled || !this.redis) {
      return;
    }

    if (this.redis.status === 'wait') {
      await this.redis.connect();
    }

    await this.redis.ping();
  }

  async onModuleDestroy(): Promise<void> {
    if (!this.redis) {
      return;
    }

    if (this.redis.status === 'ready') {
      await this.redis.quit();
      return;
    }

    this.redis.disconnect();
  }
}
