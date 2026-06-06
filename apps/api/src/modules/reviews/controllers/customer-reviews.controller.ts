import { Body, Controller, Get, Inject, Param, Post, Query, UseGuards } from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { CustomerGuard } from '../../identity/guards/customer.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { CreateReviewDto, ListReviewsQueryDto } from '../dto/reviews.dto';
import { ReviewResponseDto, PaginatedReviewsDto } from '../dto/reviews-response.dto';
import { ReviewsService } from '../services/reviews.service';

@ApiTags('Reviews')
@ApiBearerAuth()
@ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
@ApiForbiddenResponse({ description: 'Customer-only resource; admin/staff tokens are rejected' })
@UseGuards(AuthGuard, CustomerGuard)
@Controller('reviews')
export class CustomerReviewsController {
  constructor(@Inject(ReviewsService) private readonly reviewsService: ReviewsService) {}

  @Post('order-lines/:orderLineId')
  @ApiOperation({ summary: 'Create a verified purchase review for an order line' })
  @ApiParam({ name: 'orderLineId', description: 'Order line ID', type: String })
  @ApiCreatedResponse({ type: ReviewResponseDto, description: 'Review created successfully' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Order line not found' })
  async createReview(
    @Param('orderLineId') orderLineId: string,
    @Body() dto: CreateReviewDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.reviewsService.createVerifiedReview(orderLineId, currentUser.sub, dto);
  }

  @Get('me')
  @ApiOperation({ summary: 'List reviews written by the authenticated customer' })
  @ApiOkResponse({ type: PaginatedReviewsDto, description: 'Paginated list of my reviews' })
  @ApiBadRequestResponse({ description: 'Invalid query parameters' })
  async listMyReviews(
    @Query() query: ListReviewsQueryDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.reviewsService.listMyReviews(currentUser.sub, query);
  }

  @Get('me/:reviewId')
  @ApiOperation({ summary: 'Get a single review written by the authenticated customer' })
  @ApiParam({ name: 'reviewId', description: 'Review ID', type: String })
  @ApiOkResponse({ type: ReviewResponseDto, description: 'Review details' })
  @ApiNotFoundResponse({ description: 'Review not found' })
  async getMyReview(
    @Param('reviewId') reviewId: string,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.reviewsService.getMyReview(reviewId, currentUser.sub);
  }
}

