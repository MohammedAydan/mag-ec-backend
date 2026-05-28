import { Body, Controller, Get, Inject, Param, Patch, Query, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { ListReviewsQueryDto, ReviewModerationDto } from '../dto/reviews.dto';
import { ReviewsService } from '../services/reviews.service';

@ApiTags('Reviews Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['reviews.read'])
@Controller('reviews/admin')
export class AdminReviewsController {
  constructor(@Inject(ReviewsService) private readonly reviewsService: ReviewsService) {}

  @Get()
  listReviews(@Query() query: ListReviewsQueryDto) {
    return this.reviewsService.listAdminReviews(query);
  }

  @Get(':reviewId')
  getReview(@Param('reviewId') reviewId: string) {
    return this.reviewsService.getAdminReview(reviewId);
  }

  @Patch(':reviewId/moderate')
  @RequirePermissions(['reviews.moderate'])
  moderateReview(
    @Param('reviewId') reviewId: string,
    @Body() dto: ReviewModerationDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.reviewsService.moderateReview(reviewId, dto, currentUser.sub);
  }
}
