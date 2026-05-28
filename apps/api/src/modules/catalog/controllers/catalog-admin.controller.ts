import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Inject,
  Param,
  Patch,
  Query,
  Post,
  UseGuards,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';


import {
  AttachMediaDto,
  CreateAttributeDto,
  CreateBrandDto,
  CreateCategoryDto,
  CreateCollectionDto,
  CreateMediaUploadIntentDto,
  CreateProductDto,
  CreateProductTypeDto,
  CreateProductVariantDto,
  ListCatalogProductsAdminQueryDto,
  CreateTagDto,
  UpdateProductDto,
  UpdateProductVariantDto,
} from '../dto/catalog-admin.dto';
import { CatalogAdminService } from '../services/catalog-admin.service';
import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';

@ApiTags('Catalog Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['catalog.write'])
@Controller('catalog/admin')
export class CatalogAdminController {
  constructor(@Inject(CatalogAdminService) private readonly catalogAdminService: CatalogAdminService) {}

  @Get('products')
  @RequirePermissions(['catalog.read'])
  listProducts(@Query() query: ListCatalogProductsAdminQueryDto) {
    return this.catalogAdminService.listProducts(query);
  }

  @Get('products/:productId')
  @RequirePermissions(['catalog.read'])
  getProduct(@Param('productId') productId: string) {
    return this.catalogAdminService.getProduct(productId);
  }

  @Get('product-types')
  @RequirePermissions(['catalog.read'])
  listProductTypes() {
    return this.catalogAdminService.listProductTypes();
  }

  @Get('brands')
  @RequirePermissions(['catalog.read'])
  listBrands() {
    return this.catalogAdminService.listBrands();
  }

  @Get('categories')
  @RequirePermissions(['catalog.read'])
  listCategories() {
    return this.catalogAdminService.listCategories();
  }

  @Get('collections')
  @RequirePermissions(['catalog.read'])
  listCollections() {
    return this.catalogAdminService.listCollections();
  }

  @Get('tags')
  @RequirePermissions(['catalog.read'])
  listTags() {
    return this.catalogAdminService.listTags();
  }

  @Get('attributes')
  @RequirePermissions(['catalog.read'])
  listAttributes() {
    return this.catalogAdminService.listAttributes();
  }

  @Post('product-types')
  createProductType(@Body() dto: CreateProductTypeDto) {
    return this.catalogAdminService.createProductType(dto);
  }

  @Post('brands')
  createBrand(@Body() dto: CreateBrandDto) {
    return this.catalogAdminService.createBrand(dto);
  }

  @Post('categories')
  createCategory(@Body() dto: CreateCategoryDto) {
    return this.catalogAdminService.createCategory(dto);
  }

  @Post('collections')
  createCollection(@Body() dto: CreateCollectionDto) {
    return this.catalogAdminService.createCollection(dto);
  }

  @Post('tags')
  createTag(@Body() dto: CreateTagDto) {
    return this.catalogAdminService.createTag(dto);
  }

  @Post('attributes')
  createAttribute(@Body() dto: CreateAttributeDto) {
    return this.catalogAdminService.createAttribute(dto);
  }

  @Post('product-types/:productTypeId/publish')
  @HttpCode(HttpStatus.OK)
  publishProductType(@Param('productTypeId') productTypeId: string) {
    return this.catalogAdminService.publishProductType(productTypeId);
  }

  @Post('product-types/:productTypeId/archive')
  @HttpCode(HttpStatus.OK)
  archiveProductType(@Param('productTypeId') productTypeId: string) {
    return this.catalogAdminService.archiveProductType(productTypeId);
  }

  @Post('brands/:brandId/publish')
  @HttpCode(HttpStatus.OK)
  publishBrand(@Param('brandId') brandId: string) {
    return this.catalogAdminService.publishBrand(brandId);
  }

  @Post('brands/:brandId/archive')
  @HttpCode(HttpStatus.OK)
  archiveBrand(@Param('brandId') brandId: string) {
    return this.catalogAdminService.archiveBrand(brandId);
  }

  @Post('categories/:categoryId/publish')
  @HttpCode(HttpStatus.OK)
  publishCategory(@Param('categoryId') categoryId: string) {
    return this.catalogAdminService.publishCategory(categoryId);
  }

  @Post('categories/:categoryId/archive')
  @HttpCode(HttpStatus.OK)
  archiveCategory(@Param('categoryId') categoryId: string) {
    return this.catalogAdminService.archiveCategory(categoryId);
  }

  @Post('collections/:collectionId/publish')
  @HttpCode(HttpStatus.OK)
  publishCollection(@Param('collectionId') collectionId: string) {
    return this.catalogAdminService.publishCollection(collectionId);
  }

  @Post('collections/:collectionId/archive')
  @HttpCode(HttpStatus.OK)
  archiveCollection(@Param('collectionId') collectionId: string) {
    return this.catalogAdminService.archiveCollection(collectionId);
  }

  @Post('tags/:tagId/publish')
  @HttpCode(HttpStatus.OK)
  publishTag(@Param('tagId') tagId: string) {
    return this.catalogAdminService.publishTag(tagId);
  }

  @Post('tags/:tagId/archive')
  @HttpCode(HttpStatus.OK)
  archiveTag(@Param('tagId') tagId: string) {
    return this.catalogAdminService.archiveTag(tagId);
  }

  @Post('products')
  createProduct(@Body() dto: CreateProductDto) {
    return this.catalogAdminService.createProduct(dto);
  }

  @Patch('products/:productId')
  updateProduct(@Param('productId') productId: string, @Body() dto: UpdateProductDto) {
    return this.catalogAdminService.updateProduct(productId, dto);
  }

  @Post('products/:productId/variants')
  createProductVariant(
    @Param('productId') productId: string,
    @Body() dto: CreateProductVariantDto,
  ) {
    return this.catalogAdminService.createProductVariant(productId, dto);
  }

  @Patch('variants/:variantId')
  updateProductVariant(
    @Param('variantId') variantId: string,
    @Body() dto: UpdateProductVariantDto,
  ) {
    return this.catalogAdminService.updateProductVariant(variantId, dto);
  }

  @Post('variants/:variantId/publish')
  @HttpCode(HttpStatus.OK)
  publishProductVariant(@Param('variantId') variantId: string) {
    return this.catalogAdminService.publishProductVariant(variantId);
  }

  @Post('variants/:variantId/archive')
  @HttpCode(HttpStatus.OK)
  archiveProductVariant(@Param('variantId') variantId: string) {
    return this.catalogAdminService.archiveProductVariant(variantId);
  }

  @Post('products/:productId/publish')
  @HttpCode(HttpStatus.OK)
  publishProduct(@Param('productId') productId: string) {
    return this.catalogAdminService.publishProduct(productId);
  }

  @Post('products/:productId/archive')
  @HttpCode(HttpStatus.OK)
  archiveProduct(@Param('productId') productId: string) {
    return this.catalogAdminService.archiveProduct(productId);
  }

  @Post('products/:productId/media/upload-intents')
  issueMediaUploadIntent(
    @Param('productId') productId: string,
    @Body() dto: CreateMediaUploadIntentDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.catalogAdminService.issueMediaUploadIntent(productId, currentUser.sub, dto);
  }

  @Post('products/:productId/media/attach')
  attachMedia(
    @Param('productId') productId: string,
    @Body() dto: AttachMediaDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.catalogAdminService.attachMedia(productId, currentUser.sub, dto);
  }
}
