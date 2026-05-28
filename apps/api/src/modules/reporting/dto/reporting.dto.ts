import { IsIn, IsInt, IsObject, IsOptional, IsString, Max, Min } from 'class-validator';
import { Type } from 'class-transformer';

const reportTypes = [
  'sales_summary',
  'top_products',
  'promotion_performance',
  'inventory_kpis',
] as const;

export class CreateReportExportDto {
  @IsString()
  @IsIn(reportTypes)
  reportType!: (typeof reportTypes)[number];

  @IsOptional()
  @IsObject()
  parameters?: Record<string, unknown>;
}

export class ListReportExportsQueryDto {
  @IsOptional()
  @IsString()
  cursor?: string;

  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number;
}
