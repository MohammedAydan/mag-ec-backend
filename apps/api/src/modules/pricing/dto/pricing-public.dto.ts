import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  ArrayMinSize,
  IsArray,
  IsNotEmpty,
  IsOptional,
  IsString,
  MaxLength,
  Min,
  ValidateNested,
} from 'class-validator';
import { IsInt } from 'class-validator';

export class CheckoutPreviewItemDto {
  @ApiProperty({ description: 'Catalog variant identifier' })
  @IsString()
  @IsNotEmpty()
  variantId!: string;

  @ApiProperty({ description: 'Quantity to add (minimum 1)' })
  @IsInt()
  @Min(1)
  quantity!: number;
}

export class CheckoutPreviewDto {
  @ApiProperty({ description: 'ISO 4217 currency code (e.g. USD)' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  currencyCode!: string;

  @ApiProperty({ description: 'ISO 3166-1 alpha-2 country code for tax and shipping' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(2)
  countryCode!: string;

  @ApiPropertyOptional({ description: 'Locale for translated output (e.g. en-US)' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  customerLocale?: string;

  @ApiPropertyOptional({ description: 'Customer identifier for personalised pricing' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  customerId?: string;

  @ApiPropertyOptional({ description: 'Coupon codes to apply during preview', type: [String] })
  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  couponCodes?: string[];

  @ApiProperty({ description: 'Line items to include in the preview', type: () => [CheckoutPreviewItemDto] })
  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested({ each: true })
  @Type(() => CheckoutPreviewItemDto)
  items!: CheckoutPreviewItemDto[];
}
