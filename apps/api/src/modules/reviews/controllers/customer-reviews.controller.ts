import { Body, Controller, Get, Inject, Param, Post, Query, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { CreateReviewDto, ListReviewsQueryDto } from '../dto/reviews.dto';
import { ReviewsService } from '../services/reviews.service';

@ApiTags('Reviews')
@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('reviews')
export class CustomerReviewsController {
  constructor(@Inject(ReviewsService) private readonly reviewsService: ReviewsService) {}

  @Post('order-lines/:orderLineId')
  createReview(
    @Param('orderLineId') orderLineId: string,
    @Body() dto: CreateReviewDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.reviewsService.createVerifiedReview(orderLineId, currentUser.sub, dto);
  }

  @Get('me')
  listMyReviews(
    @Query() query: ListReviewsQueryDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.reviewsService.listMyReviews(currentUser.sub, query);
  }

  @Get('me/:reviewId')
  getMyReview(@Param('reviewId') reviewId: string, @CurrentUser() currentUser: AccessTokenPayload) {
    return this.reviewsService.getMyReview(reviewId, currentUser.sub);
  }
}
