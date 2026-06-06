import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsBoolean,
  IsIn,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsString,
  MaxLength,
  Min,
} from 'class-validator';
import { Type } from 'class-transformer';

const contentStatuses = ['DRAFT', 'PUBLISHED', 'ARCHIVED'] as const;

export class UpsertContentPageDto {
  @ApiProperty({ description: 'URL-friendly page slug' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(255)
  slug!: string;

  @ApiProperty({ description: 'Page title' })
  @IsString()
  @IsNotEmpty()
  title!: string;

  @ApiProperty({ description: 'Page body content' })
  @IsString()
  @IsNotEmpty()
  body!: string;

  @ApiProperty({ enum: contentStatuses, description: 'Publishing status' })
  @IsString()
  @IsIn(contentStatuses)
  status!: (typeof contentStatuses)[number];

  @ApiPropertyOptional({ description: 'Display order' })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(0)
  sortOrder?: number;

  @ApiPropertyOptional({ description: 'Whether this page is a legal reference target' })
  @IsOptional()
  @IsBoolean()
  isLegal?: boolean;

  @ApiPropertyOptional({ description: 'Locale code (e.g. en, ar)' })
  @IsOptional()
  @IsString()
  @MaxLength(8)
  locale?: string;
}

export class UpdateLegalReferencesDto {
  @ApiPropertyOptional({ description: 'Key of the terms-of-service page (null to unset)' })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  termsPageKey?: string | null;

  @ApiPropertyOptional({ description: 'Key of the privacy-policy page (null to unset)' })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  privacyPageKey?: string | null;

  @ApiPropertyOptional({ description: 'Key of the returns-policy page (null to unset)' })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  returnsPageKey?: string | null;

  @ApiPropertyOptional({ description: 'Key of the shipping-policy page (null to unset)' })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  shippingPageKey?: string | null;
}

export interface LegalReferencesDto {
  termsPageKey: string | null;
  privacyPageKey: string | null;
  returnsPageKey: string | null;
  shippingPageKey: string | null;
}
