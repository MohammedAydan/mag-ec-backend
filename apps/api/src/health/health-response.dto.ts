import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class HealthIndicatorDetailDto {
  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String })
  message?: string;

  @ApiPropertyOptional({ type: String })
  mode?: string;

  @ApiPropertyOptional({ type: Boolean })
  redisRequired?: boolean;
}

export class HealthLivenessResponseDto {
  @ApiProperty({ type: String, example: 'ok' })
  status!: string;
}

export class HealthReadinessResponseDto {
  @ApiProperty({ type: String, example: 'ok' })
  status!: string;

  @ApiPropertyOptional({
    type: 'object',
    additionalProperties: { $ref: '#/components/schemas/HealthIndicatorDetailDto' },
    nullable: true,
  })
  info!: Record<string, HealthIndicatorDetailDto> | null;

  @ApiPropertyOptional({
    type: 'object',
    additionalProperties: { $ref: '#/components/schemas/HealthIndicatorDetailDto' },
    nullable: true,
  })
  error!: Record<string, HealthIndicatorDetailDto> | null;

  @ApiProperty({
    type: 'object',
    additionalProperties: { $ref: '#/components/schemas/HealthIndicatorDetailDto' },
  })
  details!: Record<string, HealthIndicatorDetailDto>;
}
