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
  @IsString()
  @IsNotEmpty()
  @MaxLength(128)
  name!: string;

  @IsOptional()
  @IsString()
  description?: string;

  @IsString()
  @IsIn(promotionStatuses)
  status!: (typeof promotionStatuses)[number];

  @IsString()
  @IsIn(promotionTriggers)
  trigger!: (typeof promotionTriggers)[number];

  @IsString()
  @IsIn(promotionRewardTypes)
  rewardType!: (typeof promotionRewardTypes)[number];

  @IsOptional()
  @IsString()
  @MaxLength(3)
  currencyCode?: string;

  @IsOptional()
  @IsInt()
  @Min(0)
  fixedAmount?: number;

  @IsOptional()
  @IsInt()
  @Min(0)
  @Max(100000)
  percentageBps?: number;

  @IsOptional()
  @IsInt()
  @Min(0)
  maxDiscountAmount?: number;

  @IsOptional()
  @IsInt()
  @Min(0)
  minSubtotalAmount?: number;

  @IsOptional()
  @IsBoolean()
  isCombinable?: boolean;

  @IsOptional()
  @IsInt()
  @Min(0)
  priority?: number;

  @IsOptional()
  @Type(() => Date)
  startsAt?: Date;

  @IsOptional()
  @Type(() => Date)
  endsAt?: Date;

  @IsOptional()
  @IsInt()
  @Min(1)
  totalUsageLimit?: number;

  @IsOptional()
  @IsInt()
  @Min(1)
  perCustomerUsageLimit?: number;

  @IsOptional()
  @IsInt()
  @Min(1)
  maxApplicationsPerOrder?: number;

  @IsOptional()
  @IsArray()
  @ArrayUnique()
  @IsString({ each: true })
  excludedPromotionIds?: string[];
}

export class UpsertCouponDto {
  @IsString()
  @IsNotEmpty()
  @MaxLength(64)
  code!: string;

  @IsString()
  @IsIn(couponStatuses)
  status!: (typeof couponStatuses)[number];

  @IsOptional()
  @Type(() => Date)
  startsAt?: Date;

  @IsOptional()
  @Type(() => Date)
  endsAt?: Date;

  @IsOptional()
  @IsInt()
  @Min(1)
  totalUsageLimit?: number;

  @IsOptional()
  @IsInt()
  @Min(1)
  perCustomerUsageLimit?: number;
}
