import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class FulfillmentItemDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  orderLineId!: string;

  @ApiProperty({ type: Number })
  quantity!: number;

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
}

export class FulfillmentResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  orderId!: string;

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

  @ApiProperty({ type: () => [FulfillmentItemDto] })
  items!: FulfillmentItemDto[];
}
