import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsArray,
  IsBoolean,
  IsInt,
  IsIn,
  IsNotEmpty,
  IsOptional,
  IsString,
  Matches,
  Max,
  Min,
  ValidateNested,
} from 'class-validator';

const catalogAttributeInputTypes = [
  'TEXT',
  'SELECT',
  'MULTI_SELECT',
  'COLOR',
  'SIZE',
  'BOOLEAN',
  'NUMBER',
] as const;
const catalogMediaRoles = ['PRIMARY', 'GALLERY', 'SWATCH', 'DETAIL'] as const;
const catalogMediaTypes = ['IMAGE', 'VIDEO', 'FILE'] as const;

class TranslationDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  locale!: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  name!: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  slug!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  description?: string;
}

class ProductTranslationDto extends TranslationDto {
  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  shortDescription?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  metaTitle?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  metaDescription?: string;
}

class ProductVariantTranslationDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  locale!: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  name!: string;
}

class AttributeTranslationDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  locale!: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  name!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  description?: string;
}

class AttributeOptionTranslationDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  locale!: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  label!: string;
}

class AttributeOptionDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  key!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;

  @ApiPropertyOptional()
  @IsOptional()
  @Matches(/^#?[A-Fa-f0-9]{6}$/)
  colorHex?: string;

  @ApiProperty({ type: [AttributeOptionTranslationDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => AttributeOptionTranslationDto)
  translations!: AttributeOptionTranslationDto[];
}

class ProductTypeAttributeLinkDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  attributeId!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsBoolean()
  isRequired?: boolean;

  @ApiPropertyOptional()
  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;
}

class VariantOptionValueDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  attributeId!: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  optionId!: string;
}

export class ProductVariantDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  sku!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsBoolean()
  isDefault?: boolean;

  @ApiPropertyOptional()
  @IsOptional()
  @IsInt()
  @Min(0)
  position?: number;

  @ApiProperty({ type: [ProductVariantTranslationDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ProductVariantTranslationDto)
  translations!: ProductVariantTranslationDto[];

  @ApiProperty({ type: [VariantOptionValueDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => VariantOptionValueDto)
  optionValues!: VariantOptionValueDto[];
}

class MediaTranslationDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  locale!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  altText?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  title?: string;
}

export class CreateProductTypeDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  key!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;

  @ApiProperty({ type: [TranslationDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => TranslationDto)
  translations!: TranslationDto[];

  @ApiPropertyOptional({ type: [ProductTypeAttributeLinkDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ProductTypeAttributeLinkDto)
  attributes?: ProductTypeAttributeLinkDto[];
}

export class CreateBrandDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  key!: string;

  @ApiProperty({ type: [TranslationDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => TranslationDto)
  translations!: TranslationDto[];
}

export class CreateCategoryDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  key!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  parentId?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;

  @ApiProperty({ type: [TranslationDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => TranslationDto)
  translations!: TranslationDto[];
}

export class CreateCollectionDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  key!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;

  @ApiProperty({ type: [TranslationDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => TranslationDto)
  translations!: TranslationDto[];
}

export class CreateTagDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  key!: string;

  @ApiProperty({ type: [TranslationDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => TranslationDto)
  translations!: TranslationDto[];
}

export class CreateAttributeDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  key!: string;

  @ApiProperty({ enum: catalogAttributeInputTypes })
  @IsIn(catalogAttributeInputTypes)
  inputType!: (typeof catalogAttributeInputTypes)[number];

  @ApiPropertyOptional()
  @IsOptional()
  @IsBoolean()
  isFilterable?: boolean;

  @ApiPropertyOptional()
  @IsOptional()
  @IsBoolean()
  isVariantDefining?: boolean;

  @ApiPropertyOptional()
  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;

  @ApiProperty({ type: [AttributeTranslationDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => AttributeTranslationDto)
  translations!: AttributeTranslationDto[];

  @ApiPropertyOptional({ type: [AttributeOptionDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => AttributeOptionDto)
  options?: AttributeOptionDto[];
}

export class CreateProductDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  productTypeId!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  brandId?: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  sku!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsBoolean()
  isFeatured?: boolean;

  @ApiPropertyOptional({ type: [String] })
  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  @IsNotEmpty({ each: true })
  categoryIds?: string[];

  @ApiPropertyOptional({ type: [String] })
  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  @IsNotEmpty({ each: true })
  collectionIds?: string[];

  @ApiPropertyOptional({ type: [String] })
  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  @IsNotEmpty({ each: true })
  tagIds?: string[];

  @ApiProperty({ type: [ProductTranslationDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ProductTranslationDto)
  translations!: ProductTranslationDto[];

  @ApiProperty({ type: [ProductVariantDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ProductVariantDto)
  variants!: ProductVariantDto[];
}

export class CreateProductVariantDto extends ProductVariantDto {}

export class UpdateProductVariantDto {
  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  sku?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsBoolean()
  isDefault?: boolean;

  @ApiPropertyOptional()
  @IsOptional()
  @IsInt()
  @Min(0)
  position?: number;

  @ApiPropertyOptional({ type: [ProductVariantTranslationDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ProductVariantTranslationDto)
  translations?: ProductVariantTranslationDto[];

  @ApiPropertyOptional({ type: [VariantOptionValueDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => VariantOptionValueDto)
  optionValues?: VariantOptionValueDto[];
}

export class UpdateProductDto {
  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  brandId?: string | null;

  @ApiPropertyOptional()
  @IsOptional()
  @IsBoolean()
  isFeatured?: boolean;

  @ApiPropertyOptional({ type: [String] })
  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  @IsNotEmpty({ each: true })
  categoryIds?: string[];

  @ApiPropertyOptional({ type: [String] })
  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  @IsNotEmpty({ each: true })
  collectionIds?: string[];

  @ApiPropertyOptional({ type: [String] })
  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  @IsNotEmpty({ each: true })
  tagIds?: string[];

  @ApiPropertyOptional({ type: [ProductTranslationDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ProductTranslationDto)
  translations?: ProductTranslationDto[];
}

export class CreateMediaUploadIntentDto {
  @ApiProperty({ enum: catalogMediaTypes })
  @IsIn(catalogMediaTypes)
  mediaType!: (typeof catalogMediaTypes)[number];

  @ApiProperty({ enum: catalogMediaRoles })
  @IsIn(catalogMediaRoles)
  role!: (typeof catalogMediaRoles)[number];

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  mimeType!: string;

  @ApiProperty()
  @IsInt()
  @Min(1)
  @Max(100 * 1024 * 1024)
  sizeBytes!: number;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  variantId?: string;
}

export class AttachMediaDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  mediaId!: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  uploadToken!: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  checksum?: string;

  @ApiPropertyOptional({ type: [MediaTranslationDto] })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => MediaTranslationDto)
  translations?: MediaTranslationDto[];
}

const catalogStatuses = ['DRAFT', 'PUBLISHED', 'ARCHIVED'] as const;

export class ListCatalogProductsAdminQueryDto {
  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  cursor?: string;

  @ApiPropertyOptional({ default: 20, maximum: 100 })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number;

  @ApiPropertyOptional({ enum: catalogStatuses })
  @IsOptional()
  @IsIn(catalogStatuses)
  status?: (typeof catalogStatuses)[number];

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  search?: string;
}
