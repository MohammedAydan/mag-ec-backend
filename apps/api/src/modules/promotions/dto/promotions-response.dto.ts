import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CouponResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  promotionId!: string;

  @ApiProperty({ type: String })
  code!: string;

  @ApiProperty({ type: String })
  normalizedCode!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  startsAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  endsAt!: string | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  totalUsageLimit!: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  perCustomerUsageLimit!: number | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

export class PromotionResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  description!: string | null;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: String })
  trigger!: string;

  @ApiProperty({ type: String })
  rewardType!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  currencyCode!: string | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  fixedAmount!: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  percentageBps!: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  maxDiscountAmount!: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  minSubtotalAmount!: number | null;

  @ApiProperty({ type: Boolean })
  isCombinable!: boolean;

  @ApiProperty({ type: Number })
  priority!: number;

  @ApiPropertyOptional({ type: String, nullable: true })
  startsAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  endsAt!: string | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  totalUsageLimit!: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  perCustomerUsageLimit!: number | null;

  @ApiProperty({ type: Number })
  maxApplicationsPerOrder!: number;

  @ApiProperty({ type: Number })
  reservedCount!: number;

  @ApiProperty({ type: Number })
  redeemedCount!: number;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;
}
