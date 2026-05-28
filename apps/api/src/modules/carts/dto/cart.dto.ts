import { IsInt, IsNotEmpty, IsOptional, IsString, Min } from 'class-validator';

export class CreateCartDto {
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  guestToken?: string;
}

export class AddCartItemDto {
  @IsString()
  @IsNotEmpty()
  variantId!: string;

  @IsInt()
  @Min(1)
  quantity!: number;
}

export class UpdateCartItemDto {
  @IsInt()
  @Min(1)
  quantity!: number;
}

export class ApplyCouponDto {
  @IsString()
  @IsNotEmpty()
  couponCode!: string;
}

export class MergeCartDto {
  @IsString()
  @IsNotEmpty()
  sourceGuestToken!: string;
}
