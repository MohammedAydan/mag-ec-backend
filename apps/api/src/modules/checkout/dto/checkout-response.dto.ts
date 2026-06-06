import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { SerializedOrderDto } from '../../orders/dto/order-response.dto';

export class CheckoutPaymentReadinessDto {
  @ApiProperty({ type: Boolean })
  cashOnDeliveryAvailable!: boolean;

  @ApiProperty({ type: Boolean })
  onlinePaymentAvailable!: boolean;
}

export class CheckoutPreviewAppliedPromotionDto {
  @ApiProperty({ type: String })
  promotionId!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;

  @ApiProperty({ type: String })
  rewardType!: string;

  @ApiProperty({ type: Number })
  discountAmount!: number;

  @ApiProperty({ type: Boolean })
  freeShipping!: boolean;

  @ApiProperty({ type: String })
  source!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  couponCode!: string | null;
}

export class CheckoutPreviewItemStockDto {
  @ApiProperty({ type: Number })
  availableQuantity!: number;

  @ApiProperty({ type: Boolean })
  isAvailable!: boolean;
}

export class CheckoutPreviewItemResponseDto {
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

  @ApiProperty({ type: () => CheckoutPreviewItemStockDto })
  stockAvailability!: CheckoutPreviewItemStockDto;
}

export class CheckoutPreviewShippingMethodDto {
  @ApiProperty({ type: String })
  methodId!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;

  @ApiProperty({ type: Number })
  amount!: number;

  @ApiPropertyOptional({ type: Number, nullable: true })
  estimatedMinDays!: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  estimatedMaxDays!: number | null;

  @ApiProperty({ type: Number })
  totalAmount!: number;
}

export class CheckoutPreviewResponseDto {
  @ApiProperty({ type: String })
  cartId!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  reservationKey!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  reservationExpiresAt!: string | null;

  @ApiProperty({ type: () => CheckoutPaymentReadinessDto })
  paymentReadiness!: CheckoutPaymentReadinessDto;

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

  @ApiProperty({ type: () => [CheckoutPreviewAppliedPromotionDto] })
  appliedPromotions!: CheckoutPreviewAppliedPromotionDto[];

  @ApiProperty({ type: [String] })
  rejectedPromotions!: string[];

  @ApiProperty({ type: () => [CheckoutPreviewItemResponseDto] })
  items!: CheckoutPreviewItemResponseDto[];

  @ApiProperty({ type: () => [CheckoutPreviewShippingMethodDto] })
  shippingMethods!: CheckoutPreviewShippingMethodDto[];
}

export class CheckoutPaymentAttemptDto {
  @ApiProperty({ type: String })
  attemptId!: string;

  @ApiProperty({ type: String })
  provider!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  clientSecret!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  checkoutUrl!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  providerPaymentId!: string | null;
}

export class CheckoutPlaceOrderResponseDto extends SerializedOrderDto {
  @ApiPropertyOptional({ type: () => CheckoutPaymentAttemptDto })
  payment?: CheckoutPaymentAttemptDto;
}
