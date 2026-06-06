import { Controller, Inject, Post, Req, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { ApiExcludeController } from '@nestjs/swagger';
import type { FastifyRequest } from 'fastify';

import type { AppConfig } from '../../../config/app.config';
import { DirectRuntimeService } from '../services/direct-runtime.service';

/**
 * Operational maintenance endpoint.
 *
 * This controller is excluded from the public OpenAPI surface and is NOT
 * throttled at the global rate-limiter — it uses the application-level
 * global throttle ({{@link THROTTLE_LIMIT}} requests per
 * {{@link THROTTLE_TTL_MS}} ms window).
 *
 * ## Security hardening recommendations
 *
 * - Deploy this endpoint behind a reverse-proxy or firewall IP allowlist so
 *   that only known operational IP addresses (or an internal VPC CIDR) can
 *   reach `POST /api/v1/system/maintenance/run`.
 * - Rotate `MAINTENANCE_SECRET` and `CRON_SECRET` on a regular cadence and
 *   store them in a secrets manager (e.g., HashiCorp Vault, AWS Secrets
 *   Manager, or Doppler).
 * - Consider HMAC-signed request bodies (with a timestamp window) as a
 *   stronger alternative to shared-secret Bearer auth for maintenance
 *   invocations from external tooling.
 */
@ApiExcludeController()
@Controller('system/maintenance')
export class MaintenanceController {
  private readonly config: AppConfig;

  constructor(
    @Inject(ConfigService) configService: ConfigService,
    @Inject(DirectRuntimeService) private readonly runtime: DirectRuntimeService,
  ) {
    this.config = configService.getOrThrow<AppConfig>('app');
  }

  @Post('run')
  runManual(@Req() request: FastifyRequest) {
    this.assertSecret(this.readAuthorizationHeader(request));
    return this.runtime.runMaintenance();
  }

  private readAuthorizationHeader(request: FastifyRequest): string | undefined {
    const authorization = request.headers.authorization as string | string[] | undefined;
    return Array.isArray(authorization) ? authorization[0] : authorization;
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
