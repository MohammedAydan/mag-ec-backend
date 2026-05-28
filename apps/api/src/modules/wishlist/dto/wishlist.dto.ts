import { IsNotEmpty, IsString } from 'class-validator';

export class AddWishlistItemDto {
  @IsString()
  @IsNotEmpty()
  variantId!: string;
}
