import { Type } from 'class-transformer';
import {
  IsIn,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsString,
  Max,
  MaxLength,
  Min,
} from 'class-validator';

const reviewModerationDecisions = ['APPROVE', 'REJECT', 'FLAG', 'HIDE'] as const;
const reviewStatuses = ['PENDING', 'APPROVED', 'REJECTED', 'FLAGGED', 'HIDDEN'] as const;

export class CreateReviewDto {
  @IsInt()
  @Min(1)
  @Max(5)
  rating!: number;

  @IsString()
  @IsNotEmpty()
  @MaxLength(255)
  title!: string;

  @IsString()
  @IsNotEmpty()
  body!: string;
}

export class ReviewModerationDto {
  @IsString()
  @IsIn(reviewModerationDecisions)
  decision!: (typeof reviewModerationDecisions)[number];

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  reason?: string;
}

export class ListReviewsQueryDto {
  @IsOptional()
  @IsString()
  cursor?: string;

  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number;

  @IsOptional()
  @IsString()
  @IsIn(reviewStatuses)
  status?: (typeof reviewStatuses)[number];

  @IsOptional()
  @IsString()
  productId?: string;

  @IsOptional()
  @IsString()
  userId?: string;
}
