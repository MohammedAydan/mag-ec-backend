import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  ArrayUnique,
  IsArray,
  IsBoolean,
  IsIn,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsString,
  Max,
  MaxLength,
  Min,
} from 'class-validator';
import { Type } from 'class-transformer';

const promotionStatuses = ['DRAFT', 'ACTIVE', 'ARCHIVED'] as const;
const promotionTriggers = ['AUTOMATIC', 'COUPON'] as const;
const promotionRewardTypes = ['FIXED_AMOUNT', 'PERCENTAGE', 'FREE_SHIPPING'] as const;
const couponStatuses = ['ACTIVE', 'DISABLED', 'ARCHIVED'] as const;

export class UpsertPromotionDto {
  @ApiProperty({ description: 'Human-readable promotion name' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(128)
  name!: string;

  @ApiPropertyOptional({ description: 'Promotion description' })
  @IsOptional()
  @IsString()
  description?: string;

  @ApiProperty({ enum: promotionStatuses, description: 'Promotion status' })
  @IsString()
  @IsIn(promotionStatuses)
  status!: (typeof promotionStatuses)[number];

  @ApiProperty({ enum: promotionTriggers, description: 'How the promotion is triggered' })
  @IsString()
  @IsIn(promotionTriggers)
  trigger!: (typeof promotionTriggers)[number];

  @ApiProperty({ enum: promotionRewardTypes, description: 'Type of discount reward' })
  @IsString()
  @IsIn(promotionRewardTypes)
  rewardType!: (typeof promotionRewardTypes)[number];

  @ApiPropertyOptional({ description: 'ISO 4217 currency code' })
  @IsOptional()
  @IsString()
  @MaxLength(3)
  currencyCode?: string;

  @ApiPropertyOptional({ description: 'Fixed discount amount in minor units' })
  @IsOptional()
  @IsInt()
  @Min(0)
  fixedAmount?: number;

  @ApiPropertyOptional({ description: 'Percentage discount in basis points (e.g. 1000 = 10%)' })
  @IsOptional()
  @IsInt()
  @Min(0)
  @Max(100000)
  percentageBps?: number;

  @ApiPropertyOptional({ description: 'Maximum discount amount in minor units' })
  @IsOptional()
  @IsInt()
  @Min(0)
  maxDiscountAmount?: number;

  @ApiPropertyOptional({ description: 'Minimum subtotal required in minor units' })
  @IsOptional()
  @IsInt()
  @Min(0)
  minSubtotalAmount?: number;

  @ApiPropertyOptional({ description: 'Whether this promotion can combine with others' })
  @IsOptional()
  @IsBoolean()
  isCombinable?: boolean;

  @ApiPropertyOptional({ description: 'Evaluation priority (higher = evaluated first)' })
  @IsOptional()
  @IsInt()
  @Min(0)
  priority?: number;

  @ApiPropertyOptional({ description: 'Start date (ISO 8601)' })
  @IsOptional()
  @Type(() => Date)
  startsAt?: Date;

  @ApiPropertyOptional({ description: 'End date (ISO 8601)' })
  @IsOptional()
  @Type(() => Date)
  endsAt?: Date;

  @ApiPropertyOptional({ description: 'Maximum number of total redemptions' })
  @IsOptional()
  @IsInt()
  @Min(1)
  totalUsageLimit?: number;

  @ApiPropertyOptional({ description: 'Maximum redemptions per customer' })
  @IsOptional()
  @IsInt()
  @Min(1)
  perCustomerUsageLimit?: number;

  @ApiPropertyOptional({ description: 'Maximum applications per order' })
  @IsOptional()
  @IsInt()
  @Min(1)
  maxApplicationsPerOrder?: number;

  @ApiPropertyOptional({ description: 'Promotion IDs excluded from stacking', type: [String] })
  @IsOptional()
  @IsArray()
  @ArrayUnique()
  @IsString({ each: true })
  excludedPromotionIds?: string[];
}

export class UpsertCouponDto {
  @ApiProperty({ description: 'Unique coupon code' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(64)
  code!: string;

  @ApiProperty({ enum: couponStatuses, description: 'Coupon status' })
  @IsString()
  @IsIn(couponStatuses)
  status!: (typeof couponStatuses)[number];

  @ApiPropertyOptional({ description: 'Start date (ISO 8601)' })
  @IsOptional()
  @Type(() => Date)
  startsAt?: Date;

  @ApiPropertyOptional({ description: 'End date (ISO 8601)' })
  @IsOptional()
  @Type(() => Date)
  endsAt?: Date;

  @ApiPropertyOptional({ description: 'Maximum number of total redemptions for this coupon' })
  @IsOptional()
  @IsInt()
  @Min(1)
  totalUsageLimit?: number;

  @ApiPropertyOptional({ description: 'Maximum redemptions per customer for this coupon' })
  @IsOptional()
  @IsInt()
  @Min(1)
  perCustomerUsageLimit?: number;
}
