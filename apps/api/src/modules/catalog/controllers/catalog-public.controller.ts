import {
  Controller,
  Get,
  Inject,
  Optional,
  Param,
  Query,
  ServiceUnavailableException,
} from '@nestjs/common';
import { ModuleRef } from '@nestjs/core';
import { ApiTags } from '@nestjs/swagger';

import { CatalogBrowseQueryDto } from '../dto/catalog-public.dto';
import { CatalogPublicService } from '../services/catalog-public.service';

@ApiTags('Catalog Public')
@Controller('catalog')
export class CatalogPublicController {
  constructor(
    @Optional() private readonly catalogPublicService?: CatalogPublicService,
    @Optional() @Inject(ModuleRef) private readonly moduleRef?: ModuleRef,
  ) {
    this.browseProducts = this.browseProducts.bind(this);
    this.getProductBySlug = this.getProductBySlug.bind(this);
  }

  private resolveCatalogPublicService(): CatalogPublicService {
    const service =
      this.catalogPublicService ?? this.moduleRef?.get(CatalogPublicService, { strict: false });
    if (!service) {
      throw new ServiceUnavailableException('Catalog public service is unavailable');
    }

    return service;
  }

  @Get('products')
  browseProducts(@Query() query: CatalogBrowseQueryDto) {
    return this.resolveCatalogPublicService().browseProducts(query);
  }

  @Get('products/:slug')
  getProductBySlug(@Param('slug') slug: string, @Query('locale') locale?: string) {
    return this.resolveCatalogPublicService().getPublishedProductBySlug(slug, locale ?? 'en');
  }
}
