import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { PersistenceModule } from '../persistence/persistence.module';
import { AdminContentController } from './controllers/admin-content.controller';
import { PublicContentController } from './controllers/public-content.controller';
import { ContentService } from './services/content.service';

@Module({
  imports: [IdentityModule, PersistenceModule],
  controllers: [AdminContentController, PublicContentController],
  providers: [ContentService],
  exports: [ContentService],
})
export class ContentModule {}
