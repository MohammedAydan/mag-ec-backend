import { Body, Controller, Get, Inject, Param, Patch, Query, UseGuards } from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { ListReviewsQueryDto, ReviewModerationDto } from '../dto/reviews.dto';
import { ReviewResponseDto, PaginatedReviewsDto } from '../dto/reviews-response.dto';
import { ReviewsService } from '../services/reviews.service';

@ApiTags('Reviews Admin')
@ApiBearerAuth()
@ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
@ApiForbiddenResponse({ description: 'Insufficient permissions' })
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['reviews.read'])
@Controller('reviews/admin')
export class AdminReviewsController {
  constructor(@Inject(ReviewsService) private readonly reviewsService: ReviewsService) {}

  @Get()
  @ApiOperation({ summary: 'List all reviews with pagination and filters' })
  @ApiOkResponse({ type: PaginatedReviewsDto, description: 'Paginated list of reviews' })
  @ApiBadRequestResponse({ description: 'Invalid query parameters' })
  async listReviews(@Query() query: ListReviewsQueryDto) {
    return this.reviewsService.listAdminReviews(query);
  }

  @Get(':reviewId')
  @ApiOperation({ summary: 'Get a single review by ID' })
  @ApiParam({ name: 'reviewId', description: 'Review ID', type: String })
  @ApiOkResponse({ type: ReviewResponseDto, description: 'Review details' })
  @ApiNotFoundResponse({ description: 'Review not found' })
  async getReview(@Param('reviewId') reviewId: string) {
    return this.reviewsService.getAdminReview(reviewId);
  }

  @Patch(':reviewId/moderate')
  @RequirePermissions(['reviews.moderate'])
  @ApiOperation({ summary: 'Moderate a review (approve, reject, flag, or hide)' })
  @ApiParam({ name: 'reviewId', description: 'Review ID', type: String })
  @ApiOkResponse({ type: ReviewResponseDto, description: 'Review moderation result' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Review not found' })
  async moderateReview(
    @Param('reviewId') reviewId: string,
    @Body() dto: ReviewModerationDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.reviewsService.moderateReview(reviewId, dto, currentUser.sub);
  }
}

