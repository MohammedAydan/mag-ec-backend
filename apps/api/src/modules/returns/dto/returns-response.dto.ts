import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { OrderRefundDto } from '../../orders/dto/order-response.dto';

export class ReturnRequestItemResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  orderLineId!: string;

  @ApiProperty({ type: Number })
  quantity!: number;

  @ApiProperty({ type: Number })
  receivedQuantity!: number;

  @ApiProperty({ type: String })
  requestedDisposition!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  finalDisposition!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  warehouseId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  reason!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  conditionNotes!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  restockedAt!: string | null;

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

export class ReturnRequestResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  orderId!: string;

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

  @ApiProperty({ type: () => [ReturnRequestItemResponseDto] })
  items!: ReturnRequestItemResponseDto[];

  @ApiProperty({ type: () => [OrderRefundDto] })
  refunds!: OrderRefundDto[];
}
