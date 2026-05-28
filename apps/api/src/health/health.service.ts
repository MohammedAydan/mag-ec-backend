import { Inject, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import {
  HealthCheckService,
  MemoryHealthIndicator,
  type HealthCheckResult,
} from '@nestjs/terminus';

import { PrismaService } from '../modules/persistence/services/prisma.service';
import { QueueHealthService } from '../modules/queue/queue-health.service';
import type { AppConfig } from '../config/app.config';

@Injectable()
export class AppHealthService {
  constructor(
    @Inject(HealthCheckService)
    private readonly health: HealthCheckService,
    @Inject(MemoryHealthIndicator)
    private readonly memory: MemoryHealthIndicator,
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
    @Inject(QueueHealthService)
    private readonly queueHealthService: QueueHealthService,
    @Inject(ConfigService) private readonly configService: ConfigService,
  ) {}

  async getReadiness(): Promise<HealthCheckResult> {
    return this.health.check([
      async () => this.memory.checkHeap('memory_heap', 300 * 1024 * 1024),
      async () => this.memory.checkRSS('memory_rss', 512 * 1024 * 1024),
      async () => {
        await this.prisma.$queryRaw`SELECT 1`;

        return {
          database: {
            status: 'up',
          },
        };
      },
      async () => {
        await this.queueHealthService.ping();

        const config = this.configService.getOrThrow<AppConfig>('app');
        return {
          taskExecution: {
            status: 'up',
            mode: config.executionMode,
            redisRequired: config.executionMode === 'queue',
          },
        };
      },
    ]);
  }
}
