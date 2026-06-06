import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsIn, IsInt, IsObject, IsOptional, IsString, Max, Min } from 'class-validator';
import { Type } from 'class-transformer';

const reportTypes = [
  'sales_summary',
  'top_products',
  'promotion_performance',
  'inventory_kpis',
] as const;

export class CreateReportExportDto {
  @ApiProperty({ description: 'Report type identifier (sales_summary, top_products, promotion_performance, inventory_kpis)' })
  @IsString()
  @IsIn(reportTypes)
  reportType!: (typeof reportTypes)[number];

  @ApiPropertyOptional({ description: 'Optional parameters to constrain the report scope' })
  @IsOptional()
  @IsObject()
  parameters?: Record<string, unknown>;
}

export class ListReportExportsQueryDto {
  @ApiPropertyOptional({ description: 'Cursor for the next page of results' })
  @IsOptional()
  @IsString()
  cursor?: string;

  @ApiPropertyOptional({ type: 'integer', minimum: 1, maximum: 100, description: 'Results per page (1-100)' })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number;
}
