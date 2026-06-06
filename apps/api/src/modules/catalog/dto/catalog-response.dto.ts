import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CatalogStatusResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  publishedAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  archivedAt!: string | null;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

export class MediaUploadHeadersDto {
  @ApiProperty({ type: String })
  'content-type'!: string;
}

export class MediaUploadIntentResponseDto {
  @ApiProperty({ type: String })
  mediaId!: string;

  @ApiProperty({ type: String })
  objectKey!: string;

  @ApiProperty({ type: String })
  uploadUrl!: string;

  @ApiProperty({ type: String })
  publicUrl!: string;

  @ApiProperty({ type: String })
  uploadToken!: string;

  @ApiProperty({ type: String })
  expiresAt!: string;

  @ApiProperty({ type: () => MediaUploadHeadersDto })
  headers!: MediaUploadHeadersDto;
}

export class AttachedMediaTranslationDto {
  @ApiProperty({ type: String })
  mediaId!: string;

  @ApiProperty({ type: String })
  locale!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  altText!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  title!: string | null;
}

export class AttachedMediaResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  productId!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  variantId!: string | null;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: String })
  mediaType!: string;

  @ApiProperty({ type: String })
  role!: string;

  @ApiProperty({ type: String })
  mimeType!: string;

  @ApiProperty({ type: String })
  objectKey!: string;

  @ApiProperty({ type: String })
  publicUrl!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  checksum!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  attachedAt!: string | null;

  @ApiProperty({ type: () => [AttachedMediaTranslationDto] })
  translations!: AttachedMediaTranslationDto[];
}

export class CatalogVariantPriceDto {
  @ApiProperty({ type: String })
  currencyCode!: string;

  @ApiProperty({ type: Number })
  baseAmount!: number;

  @ApiPropertyOptional({ type: Number, nullable: true })
  saleAmount!: number | null;
}

export class AdminCatalogTranslationDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  locale!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  name!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  label!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  slug!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  description!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  shortDescription!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  metaTitle!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  metaDescription!: string | null;
}

export class AdminCatalogProductTypeAttributeDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  attributeId!: string;

  @ApiProperty({ type: Boolean })
  isRequired!: boolean;

  @ApiProperty({ type: Number })
  sortOrder!: number;
}

export class AdminCatalogProductTypeDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: Number })
  sortOrder!: number;

  @ApiProperty({ type: () => [AdminCatalogTranslationDto] })
  translations!: AdminCatalogTranslationDto[];

  @ApiPropertyOptional({ type: () => [AdminCatalogProductTypeAttributeDto] })
  attributes?: AdminCatalogProductTypeAttributeDto[];
}

export class AdminCatalogBrandDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: () => [AdminCatalogTranslationDto] })
  translations!: AdminCatalogTranslationDto[];
}

export class AdminCatalogCategoryDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  parentId!: string | null;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: Number })
  sortOrder!: number;

  @ApiProperty({ type: () => [AdminCatalogTranslationDto] })
  translations!: AdminCatalogTranslationDto[];
}

export class AdminCatalogCollectionDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: Number })
  sortOrder!: number;

  @ApiProperty({ type: () => [AdminCatalogTranslationDto] })
  translations!: AdminCatalogTranslationDto[];
}

export class AdminCatalogTagDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: () => [AdminCatalogTranslationDto] })
  translations!: AdminCatalogTranslationDto[];
}

export class AdminCatalogAttributeOptionDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: Number })
  sortOrder!: number;

  @ApiPropertyOptional({ type: String, nullable: true })
  colorHex!: string | null;

  @ApiProperty({ type: () => [AdminCatalogTranslationDto] })
  translations!: AdminCatalogTranslationDto[];
}

export class AdminCatalogAttributeDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  inputType!: string;

  @ApiProperty({ type: Boolean })
  isFilterable!: boolean;

  @ApiProperty({ type: Boolean })
  isVariantDefining!: boolean;

  @ApiProperty({ type: Number })
  sortOrder!: number;

  @ApiProperty({ type: () => [AdminCatalogTranslationDto] })
  translations!: AdminCatalogTranslationDto[];

  @ApiProperty({ type: () => [AdminCatalogAttributeOptionDto] })
  options!: AdminCatalogAttributeOptionDto[];
}

export class AdminCatalogProductVariantOptionValueDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  attributeId!: string;

  @ApiProperty({ type: String })
  optionId!: string;

  @ApiPropertyOptional({ type: () => AdminCatalogAttributeDto })
  attribute?: AdminCatalogAttributeDto;

  @ApiPropertyOptional({ type: () => AdminCatalogAttributeOptionDto })
  option?: AdminCatalogAttributeOptionDto;
}

export class AdminCatalogVariantDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  productId!: string;

  @ApiProperty({ type: String })
  sku!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: Boolean })
  isDefault!: boolean;

  @ApiProperty({ type: Number })
  position!: number;

  @ApiProperty({ type: () => [AdminCatalogTranslationDto] })
  translations!: AdminCatalogTranslationDto[];

  @ApiPropertyOptional({ type: () => [AdminCatalogProductVariantOptionValueDto] })
  optionValues?: AdminCatalogProductVariantOptionValueDto[];

  @ApiPropertyOptional({ type: () => CatalogVariantPriceDto, nullable: true })
  price?: CatalogVariantPriceDto | null;
}

export class AdminCatalogMediaDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  objectKey!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: String })
  mediaType!: string;

  @ApiProperty({ type: String })
  role!: string;

  @ApiProperty({ type: String })
  mimeType!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  variantId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  checksum!: string | null;

  @ApiProperty({ type: Number })
  sortOrder!: number;

  @ApiProperty({ type: () => [AttachedMediaTranslationDto] })
  translations!: AttachedMediaTranslationDto[];
}

export class AdminCatalogRelationLinkDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: Number })
  sortOrder!: number;

  @ApiPropertyOptional({ type: () => AdminCatalogCategoryDto })
  category?: AdminCatalogCategoryDto;

  @ApiPropertyOptional({ type: () => AdminCatalogCollectionDto })
  collection?: AdminCatalogCollectionDto;

  @ApiPropertyOptional({ type: () => AdminCatalogTagDto })
  tag?: AdminCatalogTagDto;
}

export class AdminCatalogProductDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  productTypeId!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  brandId!: string | null;

  @ApiProperty({ type: String })
  sku!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: Boolean })
  isFeatured!: boolean;

  @ApiPropertyOptional({ type: String, nullable: true })
  publishedAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  archivedAt!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;

  @ApiProperty({ type: () => [AdminCatalogTranslationDto] })
  translations!: AdminCatalogTranslationDto[];

  @ApiPropertyOptional({ type: () => AdminCatalogProductTypeDto })
  productType?: AdminCatalogProductTypeDto;

  @ApiPropertyOptional({ type: () => AdminCatalogBrandDto, nullable: true })
  brand?: AdminCatalogBrandDto | null;

  @ApiPropertyOptional({ type: () => [AdminCatalogVariantDto] })
  variants?: AdminCatalogVariantDto[];

  @ApiPropertyOptional({ type: () => [AdminCatalogRelationLinkDto] })
  categoryLinks?: AdminCatalogRelationLinkDto[];

  @ApiPropertyOptional({ type: () => [AdminCatalogRelationLinkDto] })
  collectionLinks?: AdminCatalogRelationLinkDto[];

  @ApiPropertyOptional({ type: () => [AdminCatalogRelationLinkDto] })
  tagLinks?: AdminCatalogRelationLinkDto[];

  @ApiPropertyOptional({ type: () => [AdminCatalogMediaDto] })
  media?: AdminCatalogMediaDto[];
}

export class AdminPaginatedCatalogProductsDto {
  @ApiProperty({ type: () => [AdminCatalogProductDto] })
  items!: AdminCatalogProductDto[];

  @ApiPropertyOptional({ type: String, nullable: true })
  nextCursor!: string | null;
}

export class CatalogVariantOptionSummaryDto {
  @ApiProperty({ type: String })
  attributeKey!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  attributeName!: string | null;

  @ApiProperty({ type: String })
  optionKey!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  optionLabel!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  colorHex!: string | null;
}

export class CatalogVariantSummaryDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  sku!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  name!: string | null;

  @ApiProperty({ type: Boolean })
  isDefault!: boolean;

  @ApiPropertyOptional({ type: () => CatalogVariantPriceDto, nullable: true })
  price!: CatalogVariantPriceDto | null;

  @ApiProperty({ type: () => [CatalogVariantOptionSummaryDto] })
  options!: CatalogVariantOptionSummaryDto[];
}

export class CatalogLocalizedReferenceDto {
  @ApiProperty({ type: String })
  key!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  name!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  slug!: string | null;
}

export class CatalogMediaSummaryDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  objectKey!: string;

  @ApiProperty({ type: String })
  publicUrl!: string;

  @ApiProperty({ type: String })
  role!: string;

  @ApiProperty({ type: String })
  mediaType!: string;

  @ApiProperty({ type: String })
  mimeType!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  altText!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  title!: string | null;
}

export class CatalogProductSummaryDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  sku!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  name!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  slug!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  shortDescription!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  description!: string | null;

  @ApiPropertyOptional({ type: () => CatalogLocalizedReferenceDto, nullable: true })
  brand!: CatalogLocalizedReferenceDto | null;

  @ApiProperty({ type: () => CatalogLocalizedReferenceDto })
  productType!: CatalogLocalizedReferenceDto;

  @ApiProperty({ type: () => [CatalogLocalizedReferenceDto] })
  categories!: CatalogLocalizedReferenceDto[];

  @ApiProperty({ type: () => [CatalogLocalizedReferenceDto] })
  collections!: CatalogLocalizedReferenceDto[];

  @ApiProperty({ type: () => [CatalogLocalizedReferenceDto] })
  tags!: CatalogLocalizedReferenceDto[];

  @ApiProperty({ type: () => [CatalogMediaSummaryDto] })
  media!: CatalogMediaSummaryDto[];

  @ApiProperty({ type: () => [CatalogVariantSummaryDto] })
  variants!: CatalogVariantSummaryDto[];
}

export class PaginatedCatalogProductsDto {
  @ApiProperty({ type: () => [CatalogProductSummaryDto] })
  items!: CatalogProductSummaryDto[];

  @ApiProperty({ type: 'integer' })
  total!: number;

  @ApiProperty({ type: 'integer' })
  page!: number;

  @ApiProperty({ type: 'integer' })
  pageSize!: number;
}
