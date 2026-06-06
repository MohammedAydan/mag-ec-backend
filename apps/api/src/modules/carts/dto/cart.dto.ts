import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsInt, IsNotEmpty, IsOptional, IsString, Matches, Min } from 'class-validator';

// ─── Response DTOs ────────────────────────────────────────────────────────────

export class CartItemResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  variantId!: string;

  @ApiProperty({ type: Number })
  quantity!: number;
}

export class CartResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  guestToken!: string | null;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  couponCode!: string | null;

  @ApiProperty({ type: () => [CartItemResponseDto] })
  items!: CartItemResponseDto[];

  @ApiPropertyOptional({ type: String, nullable: true })
  userId!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

// ─── Request DTOs ────────────────────────────────────────────────────────────

export class CreateCartDto {
  @ApiPropertyOptional({ type: String, description: 'Anonymous cart token in UUIDv4 format (omit for authenticated users)' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @Matches(
    /^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i,
    { message: 'guestToken must be a valid UUIDv4' },
  )
  guestToken?: string;
}

export class AddCartItemDto {
  @ApiProperty({ type: String, description: 'Product variant ID to add' })
  @IsString()
  @IsNotEmpty()
  variantId!: string;

  @ApiProperty({ type: Number, description: 'Quantity (minimum 1)' })
  @IsInt()
  @Min(1)
  quantity!: number;
}

export class UpdateCartItemDto {
  @ApiProperty({ type: Number, description: 'New quantity (minimum 1)' })
  @IsInt()
  @Min(1)
  quantity!: number;
}

export class ApplyCouponDto {
  @ApiProperty({ type: String, description: 'Coupon code to apply' })
  @IsString()
  @IsNotEmpty()
  couponCode!: string;
}

export class MergeCartDto {
  @ApiProperty({ type: String, description: 'Guest token from source (anonymous) cart' })
  @IsString()
  @IsNotEmpty()
  sourceGuestToken!: string;
}
