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
import {
  ApiBadRequestResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiQuery,
  ApiTags,
} from '@nestjs/swagger';

import { CatalogBrowseQueryDto } from '../dto/catalog-public.dto';
import { CatalogPublicService } from '../services/catalog-public.service';
import {
  CatalogProductSummaryDto,
  PaginatedCatalogProductsDto,
} from '../dto/catalog-response.dto';

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
  @ApiOperation({ summary: 'Browse published products with optional filters' })
  @ApiOkResponse({ type: PaginatedCatalogProductsDto, description: 'Product browse results' })
  @ApiBadRequestResponse({ description: 'Invalid query parameters' })
  async browseProducts(
    @Query() query: CatalogBrowseQueryDto,
  ): Promise<PaginatedCatalogProductsDto> {
    return this.resolveCatalogPublicService().browseProducts(query);
  }

  @Get('products/:slug')
  @ApiOperation({ summary: 'Get a published product by its translated slug' })
  @ApiParam({ name: 'slug', description: 'Translated product slug', type: String })
  @ApiQuery({ name: 'locale', required: false, description: 'Locale code for translations (default: en)' })
  @ApiOkResponse({ type: CatalogProductSummaryDto, description: 'Published product detail' })
  @ApiNotFoundResponse({ description: 'Product not found' })
  @ApiBadRequestResponse({ description: 'Invalid locale parameter' })
  async getProductBySlug(
    @Param('slug') slug: string,
    @Query('locale') locale?: string,
  ): Promise<CatalogProductSummaryDto> {
    return this.resolveCatalogPublicService().getPublishedProductBySlug(slug, locale ?? 'en');
  }
}
