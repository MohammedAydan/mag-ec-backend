import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
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
  @ApiProperty({ description: 'Rating from 1 to 5', minimum: 1, maximum: 5 })
  @IsInt()
  @Min(1)
  @Max(5)
  rating!: number;

  @ApiProperty({ description: 'Review title' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(255)
  title!: string;

  @ApiProperty({ description: 'Review body text' })
  @IsString()
  @IsNotEmpty()
  body!: string;
}

export class ReviewModerationDto {
  @ApiProperty({ enum: reviewModerationDecisions, description: 'Moderation decision' })
  @IsString()
  @IsIn(reviewModerationDecisions)
  decision!: (typeof reviewModerationDecisions)[number];

  @ApiPropertyOptional({ description: 'Reason for the moderation decision' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  reason?: string;
}

export class ListReviewsQueryDto {
  @ApiPropertyOptional({ description: 'Pagination cursor' })
  @IsOptional()
  @IsString()
  cursor?: string;

  @ApiPropertyOptional({ type: 'integer', description: 'Page size (max 100)', minimum: 1, maximum: 100, default: 20 })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number;

  @ApiPropertyOptional({ enum: reviewStatuses, description: 'Filter by review status' })
  @IsOptional()
  @IsString()
  @IsIn(reviewStatuses)
  status?: (typeof reviewStatuses)[number];

  @ApiPropertyOptional({ description: 'Filter by product ID' })
  @IsOptional()
  @IsString()
  productId?: string;

  @ApiPropertyOptional({ description: 'Filter by user ID (ignored for /me endpoint)' })
  @IsOptional()
  @IsString()
  userId?: string;
}
