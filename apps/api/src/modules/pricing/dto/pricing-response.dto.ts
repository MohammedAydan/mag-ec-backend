import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

// ─── Store Setting (currency / behavior) ─────────────────────────────────────

export class StoreSettingResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ description: 'Arbitrary JSON value stored for this setting', type: Object })
  value!: unknown;

  @ApiPropertyOptional({ type: String, nullable: true })
  description!: string | null;

  @ApiProperty({ type: Boolean })
  isPublic!: boolean;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

// ─── Variant Price ────────────────────────────────────────────────────────────

export class VariantPriceResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  variantId!: string;

  @ApiProperty({ type: String })
  currencyCode!: string;

  @ApiProperty({ type: Number })
  baseAmount!: number;

  @ApiPropertyOptional({ type: Number, nullable: true })
  saleAmount!: number | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  saleStartsAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  saleEndsAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  taxClassId!: string | null;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

// ─── Tax Class ────────────────────────────────────────────────────────────────

export class TaxClassResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;

  @ApiProperty({ type: Boolean })
  isDefault!: boolean;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

// ─── Manual Tax Rate ──────────────────────────────────────────────────────────

export class ManualTaxRateResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  taxClassId!: string;

  @ApiProperty({ type: String })
  countryCode!: string;

  @ApiProperty({ type: Number })
  rateBps!: number;

  @ApiProperty({ type: Boolean })
  isIncludedInPrice!: boolean;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

// ─── Shipping Method ──────────────────────────────────────────────────────────

export class ShippingMethodResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  zoneId!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;

  @ApiProperty({ type: Boolean })
  isActive!: boolean;

  @ApiProperty({ type: String })
  rateType!: string;

  @ApiProperty({ type: String })
  currencyCode!: string;

  @ApiPropertyOptional({ type: Number, nullable: true })
  flatAmount!: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  percentageBps!: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  estimatedMinDays!: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  estimatedMaxDays!: number | null;

  @ApiProperty({ type: Number })
  sortOrder!: number;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

// ─── Shipping Zone ────────────────────────────────────────────────────────────

export class ShippingZoneResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;

  @ApiProperty({ type: Boolean })
  isActive!: boolean;

  @ApiProperty({ type: [String] })
  countryCodes!: string[];

  @ApiProperty({ type: String })
  updatedAt!: string;
}

// ─── Pricing Checkout Preview ─────────────────────────────────────────────────

export class PricingPreviewLineItemDto {
  @ApiProperty({ type: String })
  variantId!: string;

  @ApiProperty({ type: String })
  sku!: string;

  @ApiProperty({ type: Number })
  quantity!: number;

  @ApiProperty({ type: String })
  currencyCode!: string;

  @ApiProperty({ type: Number })
  unitBaseAmount!: number;

  @ApiPropertyOptional({ type: Number, nullable: true })
  unitSaleAmount!: number | null;

  @ApiProperty({ type: Number })
  effectiveUnitAmount!: number;

  @ApiProperty({ type: Number })
  lineSubtotalAmount!: number;

  @ApiProperty({ type: Number })
  taxAmount!: number;

  @ApiProperty({ type: Number })
  taxRateBps!: number;

  @ApiProperty({ type: Boolean })
  taxIncludedInPrice!: boolean;
}

export class PricingPreviewAppliedPromotionDto {
  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;

  @ApiProperty({ type: Number })
  subtotalDiscountAmount!: number;

  @ApiProperty({ type: Boolean })
  freeShipping!: boolean;
}

export class PricingPreviewShippingMethodDto {
  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;

  @ApiProperty({ type: String })
  rateType!: string;

  @ApiProperty({ type: Number })
  amount!: number;

  @ApiProperty({ type: Number })
  totalAmount!: number;
}

export class PricingPreviewResponseDto {
  @ApiProperty({ type: String })
  currencyCode!: string;

  @ApiProperty({ type: String })
  countryCode!: string;

  @ApiProperty({ type: Number })
  subtotalAmount!: number;

  @ApiProperty({ type: Number })
  subtotalDiscountAmount!: number;

  @ApiProperty({ type: Number })
  discountedSubtotalAmount!: number;

  @ApiProperty({ type: Number })
  taxAmount!: number;

  @ApiProperty({ type: Number })
  grandTotalExcludingShippingAmount!: number;

  @ApiProperty({ type: () => [PricingPreviewLineItemDto] })
  items!: PricingPreviewLineItemDto[];

  @ApiProperty({ type: () => [PricingPreviewAppliedPromotionDto] })
  appliedPromotions!: PricingPreviewAppliedPromotionDto[];

  @ApiProperty({ type: [String] })
  rejectedPromotions!: string[];

  @ApiProperty({ type: () => [PricingPreviewShippingMethodDto] })
  shippingMethods!: PricingPreviewShippingMethodDto[];
}
