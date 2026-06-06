import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

// ─── Response DTOs ────────────────────────────────────────────────────────────

export class WishlistItemResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  variantId!: string;

  @ApiProperty({ type: String })
  addedAt!: string;
}

export class WishlistResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  userId!: string;

  @ApiProperty({ type: () => [WishlistItemResponseDto] })
  items!: WishlistItemResponseDto[];

  @ApiPropertyOptional({ type: Number })
  itemCount?: number;
}

// ─── Request DTOs ──────────────────────────────────────────────────────────────

export class AddWishlistItemDto {
  @ApiProperty({ type: String, description: 'Product variant ID to add to wishlist' })
  @IsString()
  @IsNotEmpty()
  variantId!: string;
}
