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
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiExtension,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

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
import {
  AttachedMediaResponseDto,
  AdminCatalogAttributeDto,
  AdminCatalogBrandDto,
  AdminCatalogCategoryDto,
  AdminCatalogCollectionDto,
  AdminCatalogProductDto,
  AdminCatalogProductTypeDto,
  AdminCatalogTagDto,
  AdminCatalogVariantDto,
  AdminPaginatedCatalogProductsDto,
  CatalogStatusResponseDto,
  MediaUploadIntentResponseDto,
} from '../dto/catalog-response.dto';

@ApiTags('Catalog Admin')
@ApiBearerAuth()
@ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
@ApiForbiddenResponse({ description: 'Insufficient permissions' })
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['catalog.write'])
@Controller('catalog/admin')
export class CatalogAdminController {
  constructor(@Inject(CatalogAdminService) private readonly catalogAdminService: CatalogAdminService) {}

  @Get('products')
  @RequirePermissions(['catalog.read'])
  @ApiOperation({ summary: 'List all products with pagination and filters' })
  @ApiOkResponse({ type: AdminPaginatedCatalogProductsDto, description: 'Paginated product list' })
  @ApiBadRequestResponse({ description: 'Invalid query parameters' })
  async listProducts(@Query() query: ListCatalogProductsAdminQueryDto) {
    return this.catalogAdminService.listProducts(query);
  }

  @Get('products/:productId')
  @RequirePermissions(['catalog.read'])
  @ApiOperation({ summary: 'Get a single product by ID' })
  @ApiParam({ name: 'productId', description: 'Product ID', type: String })
  @ApiOkResponse({ type: AdminCatalogProductDto, description: 'Product details' })
  @ApiNotFoundResponse({ description: 'Product not found' })
  async getProduct(@Param('productId') productId: string) {
    return this.catalogAdminService.getProduct(productId);
  }

  @Get('product-types')
  @RequirePermissions(['catalog.read'])
  @ApiOperation({ summary: 'List all product types' })
  @ApiOkResponse({ type: [AdminCatalogProductTypeDto], description: 'All product types' })
  async listProductTypes() {
    return this.catalogAdminService.listProductTypes();
  }

  @Get('brands')
  @RequirePermissions(['catalog.read'])
  @ApiOperation({ summary: 'List all brands' })
  @ApiOkResponse({ type: [AdminCatalogBrandDto], description: 'All brands' })
  async listBrands() {
    return this.catalogAdminService.listBrands();
  }

  @Get('categories')
  @RequirePermissions(['catalog.read'])
  @ApiOperation({ summary: 'List all categories' })
  @ApiOkResponse({ type: [AdminCatalogCategoryDto], description: 'All categories' })
  async listCategories() {
    return this.catalogAdminService.listCategories();
  }

  @Get('collections')
  @RequirePermissions(['catalog.read'])
  @ApiOperation({ summary: 'List all collections' })
  @ApiOkResponse({ type: [AdminCatalogCollectionDto], description: 'All collections' })
  async listCollections() {
    return this.catalogAdminService.listCollections();
  }

  @Get('tags')
  @RequirePermissions(['catalog.read'])
  @ApiOperation({ summary: 'List all tags' })
  @ApiOkResponse({ type: [AdminCatalogTagDto], description: 'All tags' })
  async listTags() {
    return this.catalogAdminService.listTags();
  }

  @Get('attributes')
  @RequirePermissions(['catalog.read'])
  @ApiOperation({ summary: 'List all attributes' })
  @ApiOkResponse({ type: [AdminCatalogAttributeDto], description: 'All attributes' })
  async listAttributes() {
    return this.catalogAdminService.listAttributes();
  }

  @Post('product-types')
  @ApiOperation({ summary: 'Create a new product type' })
  @ApiCreatedResponse({ type: AdminCatalogProductTypeDto, description: 'Product type created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async createProductType(@Body() dto: CreateProductTypeDto) {
    return this.catalogAdminService.createProductType(dto);
  }

  @Post('brands')
  @ApiOperation({ summary: 'Create a new brand' })
  @ApiCreatedResponse({ type: AdminCatalogBrandDto, description: 'Brand created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async createBrand(@Body() dto: CreateBrandDto) {
    return this.catalogAdminService.createBrand(dto);
  }

  @Post('categories')
  @ApiOperation({ summary: 'Create a new category' })
  @ApiCreatedResponse({ type: AdminCatalogCategoryDto, description: 'Category created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async createCategory(@Body() dto: CreateCategoryDto) {
    return this.catalogAdminService.createCategory(dto);
  }

  @Post('collections')
  @ApiOperation({ summary: 'Create a new collection' })
  @ApiCreatedResponse({ type: AdminCatalogCollectionDto, description: 'Collection created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async createCollection(@Body() dto: CreateCollectionDto) {
    return this.catalogAdminService.createCollection(dto);
  }

  @Post('tags')
  @ApiOperation({ summary: 'Create a new tag' })
  @ApiCreatedResponse({ type: AdminCatalogTagDto, description: 'Tag created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async createTag(@Body() dto: CreateTagDto) {
    return this.catalogAdminService.createTag(dto);
  }

  @Post('attributes')
  @ApiOperation({ summary: 'Create a new attribute' })
  @ApiCreatedResponse({ type: AdminCatalogAttributeDto, description: 'Attribute created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async createAttribute(@Body() dto: CreateAttributeDto) {
    return this.catalogAdminService.createAttribute(dto);
  }

  @Post('product-types/:productTypeId/publish')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Publish a product type' })
  @ApiParam({ name: 'productTypeId', description: 'Product type ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Product type published' })
  @ApiNotFoundResponse({ description: 'Product type not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async publishProductType(@Param('productTypeId') productTypeId: string) {
    return this.catalogAdminService.publishProductType(productTypeId);
  }

  @Post('product-types/:productTypeId/archive')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Archive a product type' })
  @ApiParam({ name: 'productTypeId', description: 'Product type ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Product type archived' })
  @ApiNotFoundResponse({ description: 'Product type not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async archiveProductType(@Param('productTypeId') productTypeId: string) {
    return this.catalogAdminService.archiveProductType(productTypeId);
  }

  @Post('brands/:brandId/publish')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Publish a brand' })
  @ApiParam({ name: 'brandId', description: 'Brand ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Brand published' })
  @ApiNotFoundResponse({ description: 'Brand not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async publishBrand(@Param('brandId') brandId: string) {
    return this.catalogAdminService.publishBrand(brandId);
  }

  @Post('brands/:brandId/archive')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Archive a brand' })
  @ApiParam({ name: 'brandId', description: 'Brand ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Brand archived' })
  @ApiNotFoundResponse({ description: 'Brand not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async archiveBrand(@Param('brandId') brandId: string) {
    return this.catalogAdminService.archiveBrand(brandId);
  }

  @Post('categories/:categoryId/publish')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Publish a category' })
  @ApiParam({ name: 'categoryId', description: 'Category ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Category published' })
  @ApiNotFoundResponse({ description: 'Category not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async publishCategory(@Param('categoryId') categoryId: string) {
    return this.catalogAdminService.publishCategory(categoryId);
  }

  @Post('categories/:categoryId/archive')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Archive a category' })
  @ApiParam({ name: 'categoryId', description: 'Category ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Category archived' })
  @ApiNotFoundResponse({ description: 'Category not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async archiveCategory(@Param('categoryId') categoryId: string) {
    return this.catalogAdminService.archiveCategory(categoryId);
  }

  @Post('collections/:collectionId/publish')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Publish a collection' })
  @ApiParam({ name: 'collectionId', description: 'Collection ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Collection published' })
  @ApiNotFoundResponse({ description: 'Collection not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async publishCollection(@Param('collectionId') collectionId: string) {
    return this.catalogAdminService.publishCollection(collectionId);
  }

  @Post('collections/:collectionId/archive')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Archive a collection' })
  @ApiParam({ name: 'collectionId', description: 'Collection ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Collection archived' })
  @ApiNotFoundResponse({ description: 'Collection not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async archiveCollection(@Param('collectionId') collectionId: string) {
    return this.catalogAdminService.archiveCollection(collectionId);
  }

  @Post('tags/:tagId/publish')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Publish a tag' })
  @ApiParam({ name: 'tagId', description: 'Tag ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Tag published' })
  @ApiNotFoundResponse({ description: 'Tag not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async publishTag(@Param('tagId') tagId: string) {
    return this.catalogAdminService.publishTag(tagId);
  }

  @Post('tags/:tagId/archive')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Archive a tag' })
  @ApiParam({ name: 'tagId', description: 'Tag ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Tag archived' })
  @ApiNotFoundResponse({ description: 'Tag not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async archiveTag(@Param('tagId') tagId: string) {
    return this.catalogAdminService.archiveTag(tagId);
  }

  @Post('products')
  @ApiOperation({ summary: 'Create a new product' })
  @ApiCreatedResponse({ type: AdminCatalogProductDto, description: 'Product created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async createProduct(@Body() dto: CreateProductDto) {
    return this.catalogAdminService.createProduct(dto);
  }

  @Patch('products/:productId')
  @ApiOperation({ summary: 'Update a product' })
  @ApiParam({ name: 'productId', description: 'Product ID', type: String })
  @ApiOkResponse({ type: AdminCatalogProductDto, description: 'Product updated' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Product not found' })
  async updateProduct(@Param('productId') productId: string, @Body() dto: UpdateProductDto) {
    return this.catalogAdminService.updateProduct(productId, dto);
  }

  @Post('products/:productId/variants')
  @ApiOperation({ summary: 'Create a new product variant' })
  @ApiParam({ name: 'productId', description: 'Product ID', type: String })
  @ApiCreatedResponse({ type: AdminCatalogVariantDto, description: 'Product variant created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Product not found' })
  async createProductVariant(
    @Param('productId') productId: string,
    @Body() dto: CreateProductVariantDto,
  ) {
    return this.catalogAdminService.createProductVariant(productId, dto);
  }

  @Patch('variants/:variantId')
  @ApiOperation({ summary: 'Update a product variant' })
  @ApiParam({ name: 'variantId', description: 'Variant ID', type: String })
  @ApiOkResponse({ type: AdminCatalogVariantDto, description: 'Product variant updated' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Variant not found' })
  async updateProductVariant(
    @Param('variantId') variantId: string,
    @Body() dto: UpdateProductVariantDto,
  ) {
    return this.catalogAdminService.updateProductVariant(variantId, dto);
  }

  @Post('variants/:variantId/publish')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Publish a product variant' })
  @ApiParam({ name: 'variantId', description: 'Variant ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Variant published' })
  @ApiNotFoundResponse({ description: 'Variant not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async publishProductVariant(@Param('variantId') variantId: string) {
    return this.catalogAdminService.publishProductVariant(variantId);
  }

  @Post('variants/:variantId/archive')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Archive a product variant' })
  @ApiParam({ name: 'variantId', description: 'Variant ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Variant archived' })
  @ApiNotFoundResponse({ description: 'Variant not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async archiveProductVariant(@Param('variantId') variantId: string) {
    return this.catalogAdminService.archiveProductVariant(variantId);
  }

  @Post('products/:productId/publish')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Publish a product' })
  @ApiParam({ name: 'productId', description: 'Product ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Product published' })
  @ApiNotFoundResponse({ description: 'Product not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async publishProduct(@Param('productId') productId: string) {
    return this.catalogAdminService.publishProduct(productId);
  }

  @Post('products/:productId/archive')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Archive a product' })
  @ApiParam({ name: 'productId', description: 'Product ID', type: String })
  @ApiOkResponse({ type: CatalogStatusResponseDto, description: 'Product archived' })
  @ApiNotFoundResponse({ description: 'Product not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async archiveProduct(@Param('productId') productId: string) {
    return this.catalogAdminService.archiveProduct(productId);
  }

  @Post('products/:productId/media/upload-intents')
  @ApiOperation({ summary: 'Issue a media upload intent for a product' })
  @ApiParam({ name: 'productId', description: 'Product ID', type: String })
  @ApiCreatedResponse({
    type: MediaUploadIntentResponseDto,
    description: 'Media upload intent created',
  })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Product not found' })
  async issueMediaUploadIntent(
    @Param('productId') productId: string,
    @Body() dto: CreateMediaUploadIntentDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.catalogAdminService.issueMediaUploadIntent(productId, currentUser.sub, dto);
  }

  @Post('products/:productId/media/attach')
  @ApiOperation({ summary: 'Attach uploaded media to a product' })
  @ApiParam({ name: 'productId', description: 'Product ID', type: String })
  @ApiCreatedResponse({ type: AttachedMediaResponseDto, description: 'Media attached successfully' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Product not found' })
  async attachMedia(
    @Param('productId') productId: string,
    @Body() dto: AttachMediaDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.catalogAdminService.attachMedia(productId, currentUser.sub, dto);
  }
}
