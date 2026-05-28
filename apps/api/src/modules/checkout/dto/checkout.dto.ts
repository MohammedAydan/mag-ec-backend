import { Type } from 'class-transformer';
import {
  IsBoolean,
  IsEmail,
  IsEnum,
  IsNotEmpty,
  IsOptional,
  IsString,
  MaxLength,
  ValidateNested,
} from 'class-validator';

export class CheckoutCartPreviewDto {
  @IsString()
  @IsNotEmpty()
  cartId!: string;

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
  @IsBoolean()
  reserveStockOnPreview?: boolean;
}

export enum CheckoutPaymentMethod {
  CASH_ON_DELIVERY = 'cash_on_delivery',
  ONLINE_CARD = 'online_card',
}

export class CheckoutAddressDto {
  @IsString()
  @IsNotEmpty()
  recipientName!: string;

  @IsString()
  @IsNotEmpty()
  phoneNumber!: string;

  @IsString()
  @IsNotEmpty()
  @MaxLength(2)
  countryCode!: string;

  @IsString()
  @IsNotEmpty()
  city!: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  state?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  postalCode?: string;

  @IsString()
  @IsNotEmpty()
  addressLine1!: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  addressLine2?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  company?: string;
}

export class CheckoutPlaceOrderDto {
  @IsString()
  @IsNotEmpty()
  cartId!: string;

  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  currencyCode!: string;

  @IsString()
  @IsNotEmpty()
  @MaxLength(2)
  countryCode!: string;

  @IsEmail()
  customerEmail!: string;

  @IsString()
  @IsNotEmpty()
  shippingMethodKey!: string;

  @IsEnum(CheckoutPaymentMethod)
  paymentMethod!: CheckoutPaymentMethod;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  customerLocale?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  reservationKey?: string;

  @ValidateNested()
  @Type(() => CheckoutAddressDto)
  shippingAddress!: CheckoutAddressDto;

  @IsOptional()
  @ValidateNested()
  @Type(() => CheckoutAddressDto)
  billingAddress?: CheckoutAddressDto;
}
