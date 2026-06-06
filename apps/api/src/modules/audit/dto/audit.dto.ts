import { ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsInt, IsOptional, IsString, Max, Min } from 'class-validator';

export class ListAuditLogsQueryDto {
  @ApiPropertyOptional({ type: String, description: 'Pagination cursor' })
  @IsOptional()
  @IsString()
  cursor?: string;

  @ApiPropertyOptional({ type: 'integer', minimum: 1, maximum: 100, description: 'Page size (1-100)' })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number;

  @ApiPropertyOptional({ type: String, description: 'Filter by audit-log category' })
  @IsOptional()
  @IsString()
  category?: string;

  @ApiPropertyOptional({ type: String, description: 'Filter by audit-log action' })
  @IsOptional()
  @IsString()
  action?: string;

  @ApiPropertyOptional({ type: String, description: 'Filter by entity type' })
  @IsOptional()
  @IsString()
  entityType?: string;
}
