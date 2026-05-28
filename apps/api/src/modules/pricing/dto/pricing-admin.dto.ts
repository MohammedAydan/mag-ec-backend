import {
  ArrayMinSize,
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

const shippingRateTypes = ['FLAT', 'PERCENTAGE_OF_SUBTOTAL'] as const;

export class UpdateStoreCurrencyDto {
  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  currencyCode!: string;

  @IsString()
  @IsNotEmpty()
  @MaxLength(8)
  symbol!: string;

  @IsInt()
  @Min(0)
  @Max(4)
  minorUnit!: number;
}

export class UpdatePricingBehaviorDto {
  @IsBoolean()
  pricesIncludeTax!: boolean;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(2)
  defaultTaxCountryCode?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  shippingCurrencyCode?: string;
}

export class UpsertVariantPriceDto {
  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  currencyCode!: string;

  @IsInt()
  @Min(0)
  baseAmount!: number;

  @IsOptional()
  @IsInt()
  @Min(0)
  saleAmount?: number;

  @IsOptional()
  @Type(() => Date)
  saleStartsAt?: Date;

  @IsOptional()
  @Type(() => Date)
  saleEndsAt?: Date;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  taxClassId?: string;
}

export class UpsertTaxClassDto {
  @IsString()
  @IsNotEmpty()
  @MaxLength(64)
  name!: string;

  @IsOptional()
  @IsBoolean()
  isDefault?: boolean;
}

export class UpsertManualTaxRateDto {
  @IsInt()
  @Min(0)
  @Max(100000)
  rateBps!: number;

  @IsOptional()
  @IsBoolean()
  isIncludedInPrice?: boolean;
}

export class UpsertShippingZoneDto {
  @IsString()
  @IsNotEmpty()
  @MaxLength(64)
  name!: string;

  @IsOptional()
  @IsBoolean()
  isActive?: boolean;

  @IsArray()
  @ArrayMinSize(1)
  @IsString({ each: true })
  countryCodes!: string[];
}

export class UpsertShippingMethodDto {
  @IsString()
  @IsNotEmpty()
  @MaxLength(64)
  name!: string;

  @IsOptional()
  @IsBoolean()
  isActive?: boolean;

  @IsString()
  @IsIn(shippingRateTypes)
  rateType!: (typeof shippingRateTypes)[number];

  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  currencyCode!: string;

  @IsOptional()
  @IsInt()
  @Min(0)
  flatAmount?: number;

  @IsOptional()
  @IsInt()
  @Min(0)
  @Max(100000)
  percentageBps?: number;

  @IsOptional()
  @IsInt()
  @Min(0)
  minSubtotalAmount?: number;

  @IsOptional()
  @IsInt()
  @Min(0)
  maxSubtotalAmount?: number;

  @IsOptional()
  @IsInt()
  @Min(1)
  minItemQuantity?: number;

  @IsOptional()
  @IsInt()
  @Min(1)
  maxItemQuantity?: number;

  @IsOptional()
  @IsInt()
  @Min(0)
  estimatedMinDays?: number;

  @IsOptional()
  @IsInt()
  @Min(0)
  estimatedMaxDays?: number;

  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;
}
