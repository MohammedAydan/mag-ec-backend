import { ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsInt, IsOptional, IsString, Max, Min } from 'class-validator';

export class CatalogBrowseQueryDto {
  @ApiPropertyOptional({ type: 'integer', minimum: 1, default: 1 })
  @Type(() => Number)
  @IsOptional()
  @IsInt()
  @Min(1)
  page?: number = 1;

  @ApiPropertyOptional({ type: 'integer', minimum: 1, maximum: 50, default: 12 })
  @Type(() => Number)
  @IsOptional()
  @IsInt()
  @Min(1)
  @Max(50)
  pageSize?: number = 12;

  @ApiPropertyOptional({ type: String, default: 'en' })
  @IsOptional()
  @IsString()
  locale?: string = 'en';

  @ApiPropertyOptional({ type: String })
  @IsOptional()
  @IsString()
  brandSlug?: string;

  @ApiPropertyOptional({ type: String })
  @IsOptional()
  @IsString()
  categorySlug?: string;

  @ApiPropertyOptional({ type: String })
  @IsOptional()
  @IsString()
  collectionSlug?: string;

  @ApiPropertyOptional({ type: String })
  @IsOptional()
  @IsString()
  tagSlug?: string;

  @ApiPropertyOptional({ type: String })
  @IsOptional()
  @IsString()
  productTypeKey?: string;

  @ApiPropertyOptional({ type: String, description: 'Comma-separated attribute option keys' })
  @IsOptional()
  @IsString()
  optionKeys?: string;
}
