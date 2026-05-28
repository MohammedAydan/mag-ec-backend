import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { StorageModule } from '../storage/storage.module';
import { CatalogAdminController } from './controllers/catalog-admin.controller';
import { CatalogPublicController } from './controllers/catalog-public.controller';
import { CatalogAdminService } from './services/catalog-admin.service';
import { CatalogLocalizationService } from './services/catalog-localization.service';
import { CatalogMediaService } from './services/catalog-media.service';
import { CatalogPublicService } from './services/catalog-public.service';

@Module({
  imports: [IdentityModule, StorageModule],
  controllers: [CatalogAdminController, CatalogPublicController],
  providers: [
    CatalogLocalizationService,
    CatalogMediaService,
    CatalogAdminService,
    CatalogPublicService,
  ],
  exports: [
    CatalogLocalizationService,
    CatalogMediaService,
    CatalogAdminService,
    CatalogPublicService,
  ],
})
export class CatalogModule {}
