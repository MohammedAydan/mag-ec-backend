import { Controller, Get, Inject } from '@nestjs/common';
import { HealthCheck, type HealthCheckResult } from '@nestjs/terminus';
import { SkipThrottle } from '@nestjs/throttler';

import { AppHealthService } from './health.service';

@SkipThrottle()
@Controller('health')
export class HealthController {
  constructor(@Inject(AppHealthService) private readonly appHealthService: AppHealthService) {}

  @Get('liveness')
  getLiveness(): Record<string, string> {
    return {
      status: 'ok',
    };
  }

  @Get('readiness')
  @HealthCheck()
  async getReadiness(): Promise<HealthCheckResult> {
    return this.appHealthService.getReadiness();
  }
}
