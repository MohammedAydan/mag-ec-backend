import { Controller, Get, Headers, Inject, Post, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { ApiHeader, ApiOperation, ApiTags } from '@nestjs/swagger';
import { SkipThrottle } from '@nestjs/throttler';

import type { AppConfig } from '../../../config/app.config';
import { DirectRuntimeService } from '../services/direct-runtime.service';

@ApiTags('System Maintenance')
@SkipThrottle()
@Controller('system/maintenance')
export class MaintenanceController {
  private readonly config: AppConfig;

  constructor(
    @Inject(ConfigService) configService: ConfigService,
    @Inject(DirectRuntimeService) private readonly runtime: DirectRuntimeService,
  ) {
    this.config = configService.getOrThrow<AppConfig>('app');
  }

  @Get('run')
  @ApiOperation({ summary: 'Execute direct-mode maintenance from a protected cron invocation' })
  @ApiHeader({
    name: 'Authorization',
    required: true,
    description: 'Bearer CRON_SECRET or MAINTENANCE_SECRET',
  })
  runCron(@Headers('authorization') authorization?: string) {
    this.assertSecret(authorization);
    return this.runtime.runMaintenance();
  }

  @Post('run')
  @ApiOperation({ summary: 'Execute direct-mode maintenance manually from operations tooling' })
  @ApiHeader({
    name: 'Authorization',
    required: true,
    description: 'Bearer MAINTENANCE_SECRET or CRON_SECRET',
  })
  runManual(@Headers('authorization') authorization?: string) {
    this.assertSecret(authorization);
    return this.runtime.runMaintenance();
  }

  private assertSecret(authorization?: string): void {
    const accepted = [this.config.maintenanceSecret, this.config.cronSecret]
      .filter((value, index, values) => value.length > 0 && values.indexOf(value) === index)
      .map((value) => `Bearer ${value}`);

    if (!authorization || !accepted.includes(authorization)) {
      throw new UnauthorizedException('Invalid maintenance secret');
    }
  }
}
