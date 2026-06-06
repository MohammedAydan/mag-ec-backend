import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
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
  @ApiProperty({ type: String, description: 'Cart ID to evaluate for checkout' })
  @IsString()
  @IsNotEmpty()
  cartId!: string;

  @ApiProperty({ type: String, description: 'ISO 4217 currency code (e.g. SAR, EGP)' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  currencyCode!: string;

  @ApiProperty({ type: String, description: 'ISO 3166-1 alpha-2 country code (e.g. SA, EG)' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(2)
  countryCode!: string;

  @ApiPropertyOptional({ type: String, description: 'Customer locale in BCP-47 format (e.g. ar-SA)' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  customerLocale?: string;

  @ApiPropertyOptional({ type: Boolean, description: 'Whether to hold inventory during preview (default false)' })
  @IsOptional()
  @IsBoolean()
  reserveStockOnPreview?: boolean;
}

export enum CheckoutPaymentMethod {
  CASH_ON_DELIVERY = 'cash_on_delivery',
  ONLINE_CARD = 'online_card',
}

export class CheckoutAddressDto {
  @ApiProperty({ type: String, description: 'Full name of the recipient' })
  @IsString()
  @IsNotEmpty()
  recipientName!: string;

  @ApiProperty({ type: String, description: 'Phone number' })
  @IsString()
  @IsNotEmpty()
  phoneNumber!: string;

  @ApiProperty({ type: String, description: 'ISO 3166-1 alpha-2 country code' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(2)
  countryCode!: string;

  @ApiProperty({ type: String, description: 'City name' })
  @IsString()
  @IsNotEmpty()
  city!: string;

  @ApiPropertyOptional({ type: String, description: 'State / province / region' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  state?: string;

  @ApiPropertyOptional({ type: String, description: 'Postal / ZIP code' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  postalCode?: string;

  @ApiProperty({ type: String, description: 'First line of the street address' })
  @IsString()
  @IsNotEmpty()
  addressLine1!: string;

  @ApiPropertyOptional({ type: String, description: 'Second line of the street address' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  addressLine2?: string;

  @ApiPropertyOptional({ type: String, description: 'Company or organisation name' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  company?: string;
}

export class CheckoutPlaceOrderDto {
  @ApiProperty({ type: String, description: 'Cart ID to place the order from' })
  @IsString()
  @IsNotEmpty()
  cartId!: string;

  @ApiProperty({ type: String, description: 'ISO 4217 currency code' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(3)
  currencyCode!: string;

  @ApiProperty({ type: String, description: 'ISO 3166-1 alpha-2 country code' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(2)
  countryCode!: string;

  @ApiProperty({ type: String, description: 'Customer email address' })
  @IsEmail()
  customerEmail!: string;

  @ApiProperty({ type: String, description: 'Selected shipping-method key' })
  @IsString()
  @IsNotEmpty()
  shippingMethodKey!: string;

  @ApiProperty({ enum: CheckoutPaymentMethod, description: 'Payment method' })
  @IsEnum(CheckoutPaymentMethod)
  paymentMethod!: CheckoutPaymentMethod;

  @ApiPropertyOptional({ type: String, description: 'Customer locale' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  customerLocale?: string;

  @ApiPropertyOptional({ type: String, description: 'Reservation key from a prior /checkout/reserve call' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  reservationKey?: string;

  @ApiProperty({ type: () => CheckoutAddressDto, description: 'Shipping destination address' })
  @ValidateNested()
  @Type(() => CheckoutAddressDto)
  shippingAddress!: CheckoutAddressDto;

  @ApiPropertyOptional({ type: () => CheckoutAddressDto, description: 'Billing address (if different from shipping)' })
  @IsOptional()
  @ValidateNested()
  @Type(() => CheckoutAddressDto)
  billingAddress?: CheckoutAddressDto;
}
