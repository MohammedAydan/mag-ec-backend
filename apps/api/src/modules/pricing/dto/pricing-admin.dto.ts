import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
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
  @ApiProperty({ description: 'ISO 4217 currency code (e.g. USD)' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  currencyCode!: string;

  @ApiProperty({ description: 'Currency symbol (e.g. $)' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(8)
  symbol!: string;

  @ApiProperty({ description: 'Number of decimal minor units (e.g. 2 for cents)' })
  @IsInt()
  @Min(0)
  @Max(4)
  minorUnit!: number;
}

export class UpdatePricingBehaviorDto {
  @ApiProperty({ description: 'Whether displayed prices include tax by default' })
  @IsBoolean()
  pricesIncludeTax!: boolean;

  @ApiPropertyOptional({ description: 'Default ISO 3166-1 alpha-2 country code for tax calculation' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(2)
  defaultTaxCountryCode?: string;

  @ApiPropertyOptional({ description: 'Default ISO 4217 currency code for shipping charges' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  shippingCurrencyCode?: string;
}

export class UpsertVariantPriceDto {
  @ApiProperty({ description: 'ISO 4217 currency code for this price' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  currencyCode!: string;

  @ApiProperty({ description: 'Base price in minor currency units' })
  @IsInt()
  @Min(0)
  baseAmount!: number;

  @ApiPropertyOptional({ description: 'Optional sale price in minor currency units' })
  @IsOptional()
  @IsInt()
  @Min(0)
  saleAmount?: number;

  @ApiPropertyOptional({ description: 'Sale start date-time' })
  @IsOptional()
  @Type(() => Date)
  saleStartsAt?: Date;

  @ApiPropertyOptional({ description: 'Sale end date-time' })
  @IsOptional()
  @Type(() => Date)
  saleEndsAt?: Date;

  @ApiPropertyOptional({ description: 'Tax class identifier for this price entry' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  taxClassId?: string;
}

export class UpsertTaxClassDto {
  @ApiProperty({ description: 'Display name of the tax class' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(64)
  name!: string;

  @ApiPropertyOptional({ description: 'Whether this class is the store default' })
  @IsOptional()
  @IsBoolean()
  isDefault?: boolean;
}

export class UpsertManualTaxRateDto {
  @ApiProperty({ description: 'Tax rate in basis points (e.g. 850 = 8.50%)' })
  @IsInt()
  @Min(0)
  @Max(100000)
  rateBps!: number;

  @ApiPropertyOptional({ description: 'Whether this tax rate is included in the displayed price' })
  @IsOptional()
  @IsBoolean()
  isIncludedInPrice?: boolean;
}

export class UpsertShippingZoneDto {
  @ApiProperty({ description: 'Display name of the shipping zone' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(64)
  name!: string;

  @ApiPropertyOptional({ description: 'Whether this zone is active for checkout' })
  @IsOptional()
  @IsBoolean()
  isActive?: boolean;

  @ApiProperty({ description: 'ISO 3166-1 alpha-2 country codes in this zone', type: [String] })
  @IsArray()
  @ArrayMinSize(1)
  @IsString({ each: true })
  countryCodes!: string[];
}

export class UpsertShippingMethodDto {
  @ApiProperty({ description: 'Display name of the shipping method' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(64)
  name!: string;

  @ApiPropertyOptional({ description: 'Whether this method is available at checkout' })
  @IsOptional()
  @IsBoolean()
  isActive?: boolean;

  @ApiProperty({ description: 'Rate calculation type: FLAT or PERCENTAGE_OF_SUBTOTAL' })
  @IsString()
  @IsIn(shippingRateTypes)
  rateType!: (typeof shippingRateTypes)[number];

  @ApiProperty({ description: 'ISO 4217 currency code for shipping charges' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  currencyCode!: string;

  @ApiPropertyOptional({ description: 'Flat shipping amount in minor currency units' })
  @IsOptional()
  @IsInt()
  @Min(0)
  flatAmount?: number;

  @ApiPropertyOptional({ description: 'Percentage rate in basis points (e.g. 500 = 5.00%)' })
  @IsOptional()
  @IsInt()
  @Min(0)
  @Max(100000)
  percentageBps?: number;

  @ApiPropertyOptional({ description: 'Minimum subtotal required for this method' })
  @IsOptional()
  @IsInt()
  @Min(0)
  minSubtotalAmount?: number;

  @ApiPropertyOptional({ description: 'Maximum subtotal allowed for this method' })
  @IsOptional()
  @IsInt()
  @Min(0)
  maxSubtotalAmount?: number;

  @ApiPropertyOptional({ description: 'Minimum item quantity required' })
  @IsOptional()
  @IsInt()
  @Min(1)
  minItemQuantity?: number;

  @ApiPropertyOptional({ description: 'Maximum item quantity allowed' })
  @IsOptional()
  @IsInt()
  @Min(1)
  maxItemQuantity?: number;

  @ApiPropertyOptional({ description: 'Estimated minimum delivery days' })
  @IsOptional()
  @IsInt()
  @Min(0)
  estimatedMinDays?: number;

  @ApiPropertyOptional({ description: 'Estimated maximum delivery days' })
  @IsOptional()
  @IsInt()
  @Min(0)
  estimatedMaxDays?: number;

  @ApiPropertyOptional({ description: 'Sort order for display purposes' })
  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;
}
