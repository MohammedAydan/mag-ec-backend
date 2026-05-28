import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { PersistenceModule } from '../persistence/persistence.module';
import { AdminReviewsController } from './controllers/admin-reviews.controller';
import { CustomerReviewsController } from './controllers/customer-reviews.controller';
import { ReviewsService } from './services/reviews.service';

@Module({
  imports: [IdentityModule, PersistenceModule],
  controllers: [CustomerReviewsController, AdminReviewsController],
  providers: [ReviewsService],
  exports: [ReviewsService],
})
export class ReviewsModule {}
