import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class ReviewProductTranslationDto {
  @ApiProperty({ type: String })
  locale!: string;

  @ApiProperty({ type: String })
  name!: string;
}

export class ReviewProductDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  sku!: string;

  @ApiProperty({ type: () => [ReviewProductTranslationDto] })
  translations!: ReviewProductTranslationDto[];
}

export class ReviewOrderLineDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  orderId!: string;

  @ApiProperty({ type: String })
  productId!: string;

  @ApiProperty({ type: String })
  variantId!: string;

  @ApiProperty({ type: String })
  sku!: string;

  @ApiProperty({ type: String })
  productName!: string;

  @ApiProperty({ type: String })
  variantName!: string;

  @ApiProperty({ type: Number })
  quantity!: number;
}

export class ReviewModerationActionDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  reviewId!: string;

  @ApiProperty({ type: String })
  moderatorUserId!: string;

  @ApiProperty({ type: String })
  actionType!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  reason!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;
}

export class ReviewResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  productId!: string;

  @ApiProperty({ type: String })
  userId!: string;

  @ApiProperty({ type: String })
  orderLineId!: string;

  @ApiProperty({ type: Number })
  rating!: number;

  @ApiProperty({ type: String })
  title!: string;

  @ApiProperty({ type: String })
  body!: string;

  @ApiProperty({ type: Boolean })
  isVerifiedPurchase!: boolean;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  rejectionReason!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;

  @ApiProperty({ type: () => ReviewProductDto })
  product!: ReviewProductDto;

  @ApiProperty({ type: () => ReviewOrderLineDto })
  orderLine!: ReviewOrderLineDto;

  @ApiProperty({ type: () => [ReviewModerationActionDto] })
  moderationActions!: ReviewModerationActionDto[];
}

export class PaginatedReviewsDto {
  @ApiProperty({ type: () => [ReviewResponseDto] })
  items!: ReviewResponseDto[];

  @ApiPropertyOptional({ type: String, nullable: true })
  nextCursor!: string | null;
}
