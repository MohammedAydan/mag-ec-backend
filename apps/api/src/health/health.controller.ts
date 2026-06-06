import { Controller, Get, Inject } from '@nestjs/common';
import {
  ApiExtraModels,
  ApiOkResponse,
  ApiOperation,
  ApiServiceUnavailableResponse,
  ApiTags,
  getSchemaPath,
} from '@nestjs/swagger';
import { SkipThrottle } from '@nestjs/throttler';

import {
  HealthIndicatorDetailDto,
  HealthLivenessResponseDto,
  HealthReadinessResponseDto,
} from './health-response.dto';
import { AppHealthService } from './health.service';

@SkipThrottle()
@ApiExtraModels(HealthIndicatorDetailDto, HealthReadinessResponseDto)
@ApiTags('Health')
@Controller('health')
export class HealthController {
  constructor(@Inject(AppHealthService) private readonly appHealthService: AppHealthService) {}

  @Get('liveness')
  @ApiOperation({ summary: 'Check API process liveness' })
  @ApiOkResponse({ type: HealthLivenessResponseDto, description: 'API process is alive' })
  getLiveness(): HealthLivenessResponseDto {
    return {
      status: 'ok',
    };
  }

  @Get('readiness')
  @ApiOperation({ summary: 'Check API readiness including downstream dependencies' })
  @ApiOkResponse({
    description: 'The Health Check is successful',
    schema: { $ref: getSchemaPath(HealthReadinessResponseDto) },
  })
  @ApiServiceUnavailableResponse({
    description: 'The Health Check is not successful',
    schema: { $ref: getSchemaPath(HealthReadinessResponseDto) },
  })
  async getReadiness(): Promise<HealthReadinessResponseDto> {
    const result = await this.appHealthService.getReadiness();

    return {
      status: result.status,
      info: (result.info ?? null) as Record<string, HealthIndicatorDetailDto> | null,
      error: (result.error ?? null) as Record<string, HealthIndicatorDetailDto> | null,
      details: result.details,
    };
  }
}
