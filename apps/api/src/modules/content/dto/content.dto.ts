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
  @IsString()
  @IsNotEmpty()
  @MaxLength(255)
  slug!: string;

  @IsString()
  @IsNotEmpty()
  title!: string;

  @IsString()
  @IsNotEmpty()
  body!: string;

  @IsString()
  @IsIn(contentStatuses)
  status!: (typeof contentStatuses)[number];

  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(0)
  sortOrder?: number;

  @IsOptional()
  @IsBoolean()
  isLegal?: boolean;

  @IsOptional()
  @IsString()
  @MaxLength(8)
  locale?: string;
}

export class UpdateLegalReferencesDto {
  @IsOptional()
  @IsString()
  @MaxLength(255)
  termsPageKey?: string | null;

  @IsOptional()
  @IsString()
  @MaxLength(255)
  privacyPageKey?: string | null;

  @IsOptional()
  @IsString()
  @MaxLength(255)
  returnsPageKey?: string | null;

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

export interface PublicLegalReferenceDto {
  key: string;
  slug: string;
  title: string;
  updatedAt: Date;
}

export interface PublicLegalReferencesDto {
  references: {
    terms: PublicLegalReferenceDto | null;
    privacy: PublicLegalReferenceDto | null;
    returns: PublicLegalReferenceDto | null;
    shipping: PublicLegalReferenceDto | null;
  };
}
