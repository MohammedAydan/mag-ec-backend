import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class OrderAddressDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  type!: string; // SHIPPING or BILLING

  @ApiProperty({ type: String })
  recipientName!: string;

  @ApiProperty({ type: String })
  phoneNumber!: string;

  @ApiProperty({ type: String })
  countryCode!: string;

  @ApiProperty({ type: String })
  city!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  state!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  postalCode!: string | null;

  @ApiProperty({ type: String })
  addressLine1!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  addressLine2!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  company!: string | null;
}

export class OrderLineItemDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  productId!: string;

  @ApiProperty({ type: String })
  variantId!: string;

  @ApiProperty({ type: String })
  sku!: string;

  @ApiProperty({ type: String })
  productName!: string;

  @ApiProperty({ type: String })
  variantName!: string;

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
}

export class OrderAppliedPromotionDto {
  @ApiProperty({ type: String })
  id!: string;

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

export class OrderShipmentItemDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  orderLineId!: string;

  @ApiProperty({ type: Number })
  quantity!: number;
}

export class OrderShipmentDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  shipmentNumber!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  carrierKey!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  carrierName!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  trackingNumber!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  trackingUrl!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  notes!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  shippedAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  deliveredAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  cancelledAt!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;

  @ApiProperty({ type: () => [OrderShipmentItemDto] })
  items!: OrderShipmentItemDto[];
}

export class OrderReturnRequestItemDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  orderLineId!: string;

  @ApiProperty({ type: Number })
  quantity!: number;

  @ApiProperty({ type: String })
  requestedDisposition!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  finalDisposition!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  warehouseId!: string | null;

  @ApiProperty({ type: Number })
  receivedQuantity!: number;

  @ApiPropertyOptional({ type: String, nullable: true })
  reason!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  conditionNotes!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  restockedAt!: string | null;
}

export class OrderRefundDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  returnRequestId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  paymentAttemptId!: string | null;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: Number })
  amount!: number;

  @ApiProperty({ type: String })
  currencyCode!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  reason!: string | null;

  @ApiProperty({ type: String })
  provider!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  providerRefundId!: string | null;

  @ApiProperty({ type: String })
  requestedAt!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  processedAt!: string | null;
}

export class OrderReturnRequestDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  returnNumber!: string;

  @ApiProperty({ type: String })
  requestedByUserId!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  reviewedByUserId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  receivedByUserId!: string | null;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: String })
  reason!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  notes!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  reviewNotes!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  rejectionReason!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  approvedAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  rejectedAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  receivedAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  closedAt!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;

  @ApiProperty({ type: () => [OrderReturnRequestItemDto] })
  items!: OrderReturnRequestItemDto[];

  @ApiProperty({ type: () => [OrderRefundDto] })
  refunds!: OrderRefundDto[];
}

export class OrderShippingMethodDetailsDto {
  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;

  @ApiProperty({ type: String })
  rateType!: string;

  @ApiPropertyOptional({ type: Number, nullable: true })
  estimatedMinDays!: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  estimatedMaxDays!: number | null;
}

export class SerializedOrderDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  orderNumber!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  userId!: string | null;

  @ApiProperty({ type: String })
  cartId!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: String })
  paymentMethod!: string;

  @ApiProperty({ type: String })
  paymentStatus!: string;

  @ApiProperty({ type: String })
  fulfillmentStatus!: string;

  @ApiProperty({ type: String })
  customerEmail!: string;

  @ApiProperty({ type: String })
  customerName!: string;

  @ApiProperty({ type: String })
  customerPhone!: string;

  @ApiProperty({ type: String })
  currencyCode!: string;

  @ApiProperty({ type: String })
  countryCode!: string;

  @ApiProperty({ type: () => OrderShippingMethodDetailsDto })
  shippingMethod!: OrderShippingMethodDetailsDto;

  @ApiPropertyOptional({ type: String, nullable: true })
  couponCode!: string | null;

  @ApiProperty({ type: Number })
  subtotalAmount!: number;

  @ApiProperty({ type: Number })
  subtotalDiscountAmount!: number;

  @ApiProperty({ type: Number })
  discountedSubtotalAmount!: number;

  @ApiProperty({ type: Number })
  shippingAmount!: number;

  @ApiProperty({ type: Number })
  taxAmount!: number;

  @ApiProperty({ type: Number })
  grandTotalAmount!: number;

  @ApiPropertyOptional({ type: String, nullable: true })
  paidAt!: string | null;

  @ApiProperty({ type: String })
  placedAt!: string;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;

  @ApiProperty({ type: () => [OrderAddressDto] })
  addresses!: OrderAddressDto[];

  @ApiProperty({ type: () => [OrderLineItemDto] })
  items!: OrderLineItemDto[];

  @ApiProperty({ type: () => [OrderAppliedPromotionDto] })
  appliedPromotions!: OrderAppliedPromotionDto[];

  @ApiProperty({ type: () => [OrderShipmentDto] })
  shipments!: OrderShipmentDto[];

  @ApiProperty({ type: () => [OrderReturnRequestDto] })
  returnRequests!: OrderReturnRequestDto[];

  @ApiProperty({ type: () => [OrderRefundDto] })
  refunds!: OrderRefundDto[];
}
