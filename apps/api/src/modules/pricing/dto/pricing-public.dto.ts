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
  @IsString()
  @IsNotEmpty()
  variantId!: string;

  @IsInt()
  @Min(1)
  quantity!: number;
}

export class CheckoutPreviewDto {
  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  currencyCode!: string;

  @IsString()
  @IsNotEmpty()
  @MaxLength(2)
  countryCode!: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  customerLocale?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  customerId?: string;

  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  couponCodes?: string[];

  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested({ each: true })
  @Type(() => CheckoutPreviewItemDto)
  items!: CheckoutPreviewItemDto[];
}
