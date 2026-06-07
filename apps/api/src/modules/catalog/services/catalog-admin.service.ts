import { BadRequestException, Inject, Injectable, NotFoundException } from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { coercePositiveInt } from '../../../common/http/query-int';
import type {
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
import { PrismaService } from '../../persistence/services/prisma.service';
import { CatalogMediaService } from './catalog-media.service';

const adminProductInclude = {
  translations: true,
  productType: { include: { translations: true } },
  brand: { include: { translations: true } },
  variants: {
    include: {
      translations: true,
      price: true,
      optionValues: {
        include: {
          attribute: { include: { translations: true } },
          option: { include: { translations: true } },
        },
      },
    },
    orderBy: [{ position: 'asc' as const }, { createdAt: 'asc' as const }],
  },
  categoryLinks: { include: { category: { include: { translations: true } } } },
  collectionLinks: { include: { collection: { include: { translations: true } } } },
  tagLinks: { include: { tag: { include: { translations: true } } } },
  media: {
    select: {
      id: true,
      objectKey: true,
      status: true,
      mediaType: true,
      role: true,
      mimeType: true,
      sizeBytes: true,
      variantId: true,
      checksum: true,
      attachedAt: true,
      sortOrder: true,
      translations: true,
      createdAt: true,
      updatedAt: true,
    },
    orderBy: [{ sortOrder: 'asc' as const }, { createdAt: 'asc' as const }],
  },
} satisfies Prisma.CatalogProductInclude;

@Injectable()
export class CatalogAdminService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(CatalogMediaService) private readonly catalogMediaService: CatalogMediaService,
  ) {}

  async listProducts(query: ListCatalogProductsAdminQueryDto) {
    const limit = coercePositiveInt(query.limit, 20);
    const search = query.search?.trim();
    const products = await this.prisma.catalogProduct.findMany({
      where: {
        ...(query.status ? { status: query.status } : {}),
        ...(search
          ? {
              OR: [
                { sku: { contains: search } },
                { translations: { some: { name: { contains: search } } } },
              ],
            }
          : {}),
      },
      include: adminProductInclude,
      orderBy: [{ updatedAt: 'desc' }, { id: 'desc' }],
      ...(query.cursor ? { cursor: { id: query.cursor }, skip: 1 } : {}),
      take: limit + 1,
    });
    const hasMore = products.length > limit;
    const items = hasMore ? products.slice(0, limit) : products;
    const lastItem = items[items.length - 1];
    return { items, nextCursor: hasMore ? (lastItem?.id ?? null) : null };
  }

  async getProduct(productId: string) {
    const product = await this.prisma.catalogProduct.findUnique({
      where: { id: productId },
      include: adminProductInclude,
    });
    if (!product) {
      throw new NotFoundException('Catalog product not found');
    }
    return product;
  }

  listProductTypes() {
    return this.prisma.catalogProductType.findMany({
      include: { translations: true, attributes: true },
      orderBy: [{ sortOrder: 'asc' }, { key: 'asc' }],
    });
  }

  listBrands() {
    return this.prisma.catalogBrand.findMany({
      include: { translations: true },
      orderBy: [{ key: 'asc' }],
    });
  }

  listCategories() {
    return this.prisma.catalogCategory.findMany({
      include: { translations: true },
      orderBy: [{ sortOrder: 'asc' }, { key: 'asc' }],
    });
  }

  listCollections() {
    return this.prisma.catalogCollection.findMany({
      include: { translations: true },
      orderBy: [{ sortOrder: 'asc' }, { key: 'asc' }],
    });
  }

  listTags() {
    return this.prisma.catalogTag.findMany({
      include: { translations: true },
      orderBy: [{ key: 'asc' }],
    });
  }

  listAttributes() {
    return this.prisma.catalogAttribute.findMany({
      include: { translations: true, options: { include: { translations: true } } },
      orderBy: [{ sortOrder: 'asc' }, { key: 'asc' }],
    });
  }

  async createProductType(dto: CreateProductTypeDto) {
    return this.prisma.catalogProductType.create({
      data: {
        key: dto.key.trim(),
        sortOrder: dto.sortOrder ?? 0,
        translations: {
          create: dto.translations.map((translation) => ({
            locale: translation.locale.trim().toLowerCase(),
            name: translation.name.trim(),
            slug: translation.slug.trim().toLowerCase(),
            description: translation.description?.trim(),
          })),
        },
        attributes: dto.attributes
          ? {
              create: dto.attributes.map((attribute) => ({
                attributeId: attribute.attributeId,
                isRequired: attribute.isRequired ?? false,
                sortOrder: attribute.sortOrder ?? 0,
              })),
            }
          : undefined,
      },
      include: {
        translations: true,
        attributes: true,
      },
    });
  }

  async createBrand(dto: CreateBrandDto) {
    return this.prisma.catalogBrand.create({
      data: {
        key: dto.key.trim(),
        translations: {
          create: dto.translations.map((translation) => ({
            locale: translation.locale.trim().toLowerCase(),
            name: translation.name.trim(),
            slug: translation.slug.trim().toLowerCase(),
            description: translation.description?.trim(),
          })),
        },
      },
      include: { translations: true },
    });
  }

  async createCategory(dto: CreateCategoryDto) {
    return this.prisma.catalogCategory.create({
      data: {
        key: dto.key.trim(),
        parentId: dto.parentId,
        sortOrder: dto.sortOrder ?? 0,
        translations: {
          create: dto.translations.map((translation) => ({
            locale: translation.locale.trim().toLowerCase(),
            name: translation.name.trim(),
            slug: translation.slug.trim().toLowerCase(),
            description: translation.description?.trim(),
          })),
        },
      },
      include: { translations: true },
    });
  }

  async createCollection(dto: CreateCollectionDto) {
    return this.prisma.catalogCollection.create({
      data: {
        key: dto.key.trim(),
        sortOrder: dto.sortOrder ?? 0,
        translations: {
          create: dto.translations.map((translation) => ({
            locale: translation.locale.trim().toLowerCase(),
            name: translation.name.trim(),
            slug: translation.slug.trim().toLowerCase(),
            description: translation.description?.trim(),
          })),
        },
      },
      include: { translations: true },
    });
  }

  async createTag(dto: CreateTagDto) {
    return this.prisma.catalogTag.create({
      data: {
        key: dto.key.trim(),
        translations: {
          create: dto.translations.map((translation) => ({
            locale: translation.locale.trim().toLowerCase(),
            name: translation.name.trim(),
            slug: translation.slug.trim().toLowerCase(),
          })),
        },
      },
      include: { translations: true },
    });
  }

  async publishProductType(productTypeId: string) {
    await this.findProductTypeOrThrow(productTypeId);
    return this.prisma.catalogProductType.update({
      where: { id: productTypeId },
      data: { status: 'PUBLISHED' },
    });
  }

  async archiveProductType(productTypeId: string) {
    await this.findProductTypeOrThrow(productTypeId);
    return this.prisma.catalogProductType.update({
      where: { id: productTypeId },
      data: { status: 'ARCHIVED' },
    });
  }

  async publishBrand(brandId: string) {
    await this.findBrandOrThrow(brandId);
    return this.prisma.catalogBrand.update({
      where: { id: brandId },
      data: { status: 'PUBLISHED' },
    });
  }

  async archiveBrand(brandId: string) {
    await this.findBrandOrThrow(brandId);
    return this.prisma.catalogBrand.update({
      where: { id: brandId },
      data: { status: 'ARCHIVED' },
    });
  }

  async publishCategory(categoryId: string) {
    await this.findCategoryOrThrow(categoryId);
    return this.prisma.catalogCategory.update({
      where: { id: categoryId },
      data: { status: 'PUBLISHED' },
    });
  }

  async archiveCategory(categoryId: string) {
    await this.findCategoryOrThrow(categoryId);
    return this.prisma.catalogCategory.update({
      where: { id: categoryId },
      data: { status: 'ARCHIVED' },
    });
  }

  async publishCollection(collectionId: string) {
    await this.findCollectionOrThrow(collectionId);
    return this.prisma.catalogCollection.update({
      where: { id: collectionId },
      data: { status: 'PUBLISHED' },
    });
  }

  async archiveCollection(collectionId: string) {
    await this.findCollectionOrThrow(collectionId);
    return this.prisma.catalogCollection.update({
      where: { id: collectionId },
      data: { status: 'ARCHIVED' },
    });
  }

  async publishTag(tagId: string) {
    await this.findTagOrThrow(tagId);
    return this.prisma.catalogTag.update({ where: { id: tagId }, data: { status: 'PUBLISHED' } });
  }

  async archiveTag(tagId: string) {
    await this.findTagOrThrow(tagId);
    return this.prisma.catalogTag.update({ where: { id: tagId }, data: { status: 'ARCHIVED' } });
  }

  async createAttribute(dto: CreateAttributeDto) {
    return this.prisma.catalogAttribute.create({
      data: {
        key: dto.key.trim(),
        inputType: dto.inputType,
        isFilterable: dto.isFilterable ?? false,
        isVariantDefining: dto.isVariantDefining ?? false,
        sortOrder: dto.sortOrder ?? 0,
        translations: {
          create: dto.translations.map((translation) => ({
            locale: translation.locale.trim().toLowerCase(),
            name: translation.name.trim(),
            description: translation.description?.trim(),
          })),
        },
        options: dto.options
          ? {
              create: dto.options.map((option) => ({
                key: option.key.trim(),
                sortOrder: option.sortOrder ?? 0,
                colorHex: option.colorHex?.startsWith('#')
                  ? option.colorHex
                  : option.colorHex
                    ? `#${option.colorHex}`
                    : undefined,
                translations: {
                  create: option.translations.map((translation) => ({
                    locale: translation.locale.trim().toLowerCase(),
                    label: translation.label.trim(),
                  })),
                },
              })),
            }
          : undefined,
      },
      include: {
        translations: true,
        options: {
          include: {
            translations: true,
          },
        },
      },
    });
  }

  async createProduct(dto: CreateProductDto) {
    const variants = dto.variants ?? [];
    if (variants.length > 0) {
      await this.assertVariantDefinitions(dto.productTypeId, variants);
    }

    return this.prisma.catalogProduct.create({
      data: {
        productTypeId: dto.productTypeId,
        brandId: dto.brandId,
        sku: dto.sku.trim(),
        isFeatured: dto.isFeatured ?? false,
        translations: {
          create: dto.translations.map((translation) => ({
            locale: translation.locale.trim().toLowerCase(),
            name: translation.name.trim(),
            slug: translation.slug.trim().toLowerCase(),
            shortDescription: translation.shortDescription?.trim(),
            description: translation.description?.trim(),
            metaTitle: translation.metaTitle?.trim(),
            metaDescription: translation.metaDescription?.trim(),
          })),
        },
        variants: variants.length > 0 ? {
          create: variants.map((variant, index) => ({
            sku: variant.sku.trim(),
            position: variant.position ?? index,
            isDefault: variant.isDefault ?? index === 0,
            translations: {
              create: variant.translations.map((translation) => ({
                locale: translation.locale.trim().toLowerCase(),
                name: translation.name.trim(),
              })),
            },
            optionValues: {
              create: variant.optionValues.map((optionValue) => ({
                attributeId: optionValue.attributeId,
                optionId: optionValue.optionId,
              })),
            },
          })),
        } : undefined,
        categoryLinks: dto.categoryIds
          ? {
              create: dto.categoryIds.map((categoryId, index) => ({
                categoryId,
                sortOrder: index,
              })),
            }
          : undefined,
        collectionLinks: dto.collectionIds
          ? {
              create: dto.collectionIds.map((collectionId, index) => ({
                collectionId,
                sortOrder: index,
              })),
            }
          : undefined,
        tagLinks: dto.tagIds
          ? {
              create: dto.tagIds.map((tagId) => ({
                tagId,
              })),
            }
          : undefined,
      },
      include: {
        translations: true,
        variants: {
          include: {
            translations: true,
            optionValues: true,
          },
        },
      },
    });
  }

  async updateProduct(productId: string, dto: UpdateProductDto) {
    await this.findProductOrThrow(productId);

    return this.prisma.$transaction(async (tx) => {
      if (dto.categoryIds) {
        await tx.catalogProductCategory.deleteMany({ where: { productId } });
      }
      if (dto.collectionIds) {
        await tx.catalogProductCollection.deleteMany({ where: { productId } });
      }
      if (dto.tagIds) {
        await tx.catalogProductTag.deleteMany({ where: { productId } });
      }
      if (dto.translations) {
        await tx.catalogProductTranslation.deleteMany({ where: { productId } });
      }

      return tx.catalogProduct.update({
        where: { id: productId },
        data: {
          brandId: dto.brandId === null ? null : dto.brandId,
          isFeatured: dto.isFeatured,
          categoryLinks: dto.categoryIds
            ? {
                create: dto.categoryIds.map((categoryId, index) => ({
                  categoryId,
                  sortOrder: index,
                })),
              }
            : undefined,
          collectionLinks: dto.collectionIds
            ? {
                create: dto.collectionIds.map((collectionId, index) => ({
                  collectionId,
                  sortOrder: index,
                })),
              }
            : undefined,
          tagLinks: dto.tagIds
            ? {
                create: dto.tagIds.map((tagId) => ({
                  tagId,
                })),
              }
            : undefined,
          translations: dto.translations
            ? {
                create: dto.translations.map((translation) => ({
                  locale: translation.locale.trim().toLowerCase(),
                  name: translation.name.trim(),
                  slug: translation.slug.trim().toLowerCase(),
                  shortDescription: translation.shortDescription?.trim(),
                  description: translation.description?.trim(),
                  metaTitle: translation.metaTitle?.trim(),
                  metaDescription: translation.metaDescription?.trim(),
                })),
              }
            : undefined,
        },
        include: {
          translations: true,
        },
      });
    });
  }

  async createProductVariant(productId: string, dto: CreateProductVariantDto) {
    const product = await this.findProductOrThrow(productId);
    await this.assertVariantDefinitions(product.productTypeId, [dto]);
    await this.assertUniqueVariantCombination(productId, dto.optionValues);

    return this.prisma.$transaction(async (tx) => {
      if (dto.isDefault) {
        await tx.catalogProductVariant.updateMany({
          where: { productId, isDefault: true },
          data: { isDefault: false },
        });
      }

      return tx.catalogProductVariant.create({
        data: {
          productId,
          sku: dto.sku.trim(),
          position: dto.position ?? 0,
          isDefault: dto.isDefault ?? false,
          translations: {
            create: dto.translations.map((translation) => ({
              locale: translation.locale.trim().toLowerCase(),
              name: translation.name.trim(),
            })),
          },
          optionValues: {
            create: dto.optionValues.map((optionValue) => ({
              attributeId: optionValue.attributeId,
              optionId: optionValue.optionId,
            })),
          },
        },
        include: { translations: true, optionValues: true, price: true },
      });
    });
  }

  async updateProductVariant(variantId: string, dto: UpdateProductVariantDto) {
    const variant = await this.findVariantOrThrow(variantId);

    if (dto.isDefault === false && variant.isDefault) {
      throw new BadRequestException(
        'Set another default variant before clearing the current default variant',
      );
    }

    if (dto.optionValues) {
      await this.assertVariantDefinitions(variant.product.productTypeId, [
        {
          sku: dto.sku ?? variant.sku,
          optionValues: dto.optionValues,
        },
      ]);
      await this.assertUniqueVariantCombination(variant.productId, dto.optionValues, variantId);
    }

    return this.prisma.$transaction(async (tx) => {
      if (dto.isDefault) {
        await tx.catalogProductVariant.updateMany({
          where: { productId: variant.productId, isDefault: true, id: { not: variantId } },
          data: { isDefault: false },
        });
      }
      if (dto.translations) {
        await tx.catalogProductVariantTranslation.deleteMany({ where: { variantId } });
      }
      if (dto.optionValues) {
        await tx.catalogProductVariantOptionValue.deleteMany({ where: { variantId } });
      }

      return tx.catalogProductVariant.update({
        where: { id: variantId },
        data: {
          sku: dto.sku?.trim(),
          position: dto.position,
          isDefault: dto.isDefault,
          translations: dto.translations
            ? {
                create: dto.translations.map((translation) => ({
                  locale: translation.locale.trim().toLowerCase(),
                  name: translation.name.trim(),
                })),
              }
            : undefined,
          optionValues: dto.optionValues
            ? {
                create: dto.optionValues.map((optionValue) => ({
                  attributeId: optionValue.attributeId,
                  optionId: optionValue.optionId,
                })),
              }
            : undefined,
        },
        include: { translations: true, optionValues: true, price: true },
      });
    });
  }

  async publishProductVariant(variantId: string) {
    const variant = await this.findVariantOrThrow(variantId);
    if (!variant.price) {
      throw new BadRequestException('A variant must have a price before it can be published');
    }

    return this.prisma.catalogProductVariant.update({
      where: { id: variantId },
      data: { status: 'PUBLISHED' },
    });
  }

  async archiveProductVariant(variantId: string) {
    const variant = await this.findVariantOrThrow(variantId);
    if (variant.product.status === 'PUBLISHED') {
      const publishedCount = await this.prisma.catalogProductVariant.count({
        where: { productId: variant.productId, status: 'PUBLISHED' },
      });
      if (variant.status === 'PUBLISHED' && publishedCount <= 1) {
        throw new BadRequestException(
          'A published product must retain at least one published variant',
        );
      }
    }

    return this.prisma.catalogProductVariant.update({
      where: { id: variantId },
      data: { status: 'ARCHIVED', isDefault: false },
    });
  }

  async publishProduct(productId: string) {
    const product = await this.prisma.catalogProduct.findUnique({
      where: { id: productId },
      include: {
        productType: true,
        brand: true,
        variants: { include: { price: true } },
      },
    });
    if (!product) {
      throw new NotFoundException('Catalog product not found');
    }
    if (product.productType.status !== 'PUBLISHED') {
      throw new BadRequestException(
        'The product type must be published before publishing a product',
      );
    }
    if (product.brand && product.brand.status !== 'PUBLISHED') {
      throw new BadRequestException(
        'The product brand must be published before publishing a product',
      );
    }
    const publishableVariants = product.variants.filter((variant) => variant.status !== 'ARCHIVED');
    if (publishableVariants.length === 0) {
      throw new BadRequestException(
        'A product must have at least one active variant before publication',
      );
    }
    if (publishableVariants.some((variant) => !variant.price)) {
      throw new BadRequestException(
        'Every active variant must have a price before product publication',
      );
    }

    return this.prisma.$transaction(async (tx) => {
      await tx.catalogProductVariant.updateMany({
        where: { productId, status: 'DRAFT' },
        data: { status: 'PUBLISHED' },
      });
      return tx.catalogProduct.update({
        where: { id: productId },
        data: {
          status: 'PUBLISHED',
          publishedAt: new Date(),
          archivedAt: null,
        },
      });
    });
  }

  async archiveProduct(productId: string) {
    await this.findProductOrThrow(productId);

    return this.prisma.catalogProduct.update({
      where: { id: productId },
      data: {
        status: 'ARCHIVED',
        archivedAt: new Date(),
      },
    });
  }

  async issueMediaUploadIntent(
    productId: string,
    actorUserId: string,
    dto: CreateMediaUploadIntentDto,
  ) {
    await this.findProductOrThrow(productId);

    if (dto.variantId) {
      const variant = await this.prisma.catalogProductVariant.findUnique({
        where: { id: dto.variantId },
      });
      if (!variant || variant.productId !== productId) {
        throw new NotFoundException('Variant not found for this product');
      }
    }

    return this.catalogMediaService.issueUploadIntent({
      productId,
      actorUserId,
      variantId: dto.variantId,
      mediaType: dto.mediaType,
      role: dto.role,
      mimeType: dto.mimeType,
      sizeBytes: dto.sizeBytes,
    });
  }

  async attachMedia(productId: string, actorUserId: string, dto: AttachMediaDto) {
    await this.findProductOrThrow(productId);

    return this.catalogMediaService.attachUploadedMedia({
      productId,
      actorUserId,
      mediaId: dto.mediaId,
      uploadToken: dto.uploadToken,
      checksum: dto.checksum,
      translations: dto.translations,
    });
  }

  private async findProductTypeOrThrow(productTypeId: string) {
    const productType = await this.prisma.catalogProductType.findUnique({
      where: { id: productTypeId },
    });
    if (!productType) throw new NotFoundException('Catalog product type not found');
    return productType;
  }

  private async findBrandOrThrow(brandId: string) {
    const brand = await this.prisma.catalogBrand.findUnique({ where: { id: brandId } });
    if (!brand) throw new NotFoundException('Catalog brand not found');
    return brand;
  }

  private async findCategoryOrThrow(categoryId: string) {
    const category = await this.prisma.catalogCategory.findUnique({ where: { id: categoryId } });
    if (!category) throw new NotFoundException('Catalog category not found');
    return category;
  }

  private async findCollectionOrThrow(collectionId: string) {
    const collection = await this.prisma.catalogCollection.findUnique({
      where: { id: collectionId },
    });
    if (!collection) throw new NotFoundException('Catalog collection not found');
    return collection;
  }

  private async findTagOrThrow(tagId: string) {
    const tag = await this.prisma.catalogTag.findUnique({ where: { id: tagId } });
    if (!tag) throw new NotFoundException('Catalog tag not found');
    return tag;
  }

  private async findProductOrThrow(productId: string) {
    const product = await this.prisma.catalogProduct.findUnique({
      where: { id: productId },
    });

    if (!product) {
      throw new NotFoundException('Catalog product not found');
    }

    return product;
  }

  private async findVariantOrThrow(variantId: string) {
    const variant = await this.prisma.catalogProductVariant.findUnique({
      where: { id: variantId },
      include: { product: true, price: true },
    });
    if (!variant) {
      throw new NotFoundException('Catalog product variant not found');
    }
    return variant;
  }

  private async assertUniqueVariantCombination(
    productId: string,
    optionValues: Array<{ attributeId: string; optionId: string }>,
    excludedVariantId?: string,
  ) {
    const signature = this.variantOptionSignature(optionValues);
    const existingVariants = await this.prisma.catalogProductVariant.findMany({
      where: { productId, ...(excludedVariantId ? { id: { not: excludedVariantId } } : {}) },
      include: { optionValues: true },
    });
    if (
      existingVariants.some(
        (variant) => this.variantOptionSignature(variant.optionValues) === signature,
      )
    ) {
      throw new BadRequestException('A variant with the same option combination already exists');
    }
  }

  private variantOptionSignature(optionValues: Array<{ attributeId: string; optionId: string }>) {
    return optionValues
      .map((optionValue) => `${optionValue.attributeId}:${optionValue.optionId}`)
      .sort()
      .join('|');
  }

  private async assertVariantDefinitions(
    productTypeId: string,
    variants: Array<{
      sku: string;
      optionValues: Array<{ attributeId: string; optionId: string }>;
    }>,
  ) {
    const variantAttributes = await this.prisma.catalogProductTypeAttribute.findMany({
      where: { productTypeId, attribute: { isVariantDefining: true } },
    });
    const allowedAttributeIds = new Set(
      variantAttributes.map((attribute) => attribute.attributeId),
    );
    const optionIds = [
      ...new Set(
        variants.flatMap((variant) => variant.optionValues.map((value) => value.optionId)),
      ),
    ];
    const options = await this.prisma.catalogAttributeOption.findMany({
      where: { id: { in: optionIds } },
      select: { id: true, attributeId: true },
    });
    const optionAttributeMap = new Map(options.map((option) => [option.id, option.attributeId]));
    const combinationSignatures = new Set<string>();

    for (const variant of variants) {
      const providedAttributeIds = new Set(
        variant.optionValues.map((optionValue) => optionValue.attributeId),
      );
      if (providedAttributeIds.size !== variant.optionValues.length) {
        throw new BadRequestException(`Variant ${variant.sku} has duplicate attribute selections`);
      }
      for (const attributeId of providedAttributeIds) {
        if (!allowedAttributeIds.has(attributeId)) {
          throw new BadRequestException(
            `Variant ${variant.sku} uses an attribute not configured for its product type`,
          );
        }
      }
      for (const optionValue of variant.optionValues) {
        if (optionAttributeMap.get(optionValue.optionId) !== optionValue.attributeId) {
          throw new BadRequestException(
            `Variant ${variant.sku} has an invalid attribute option selection`,
          );
        }
      }
      for (const requiredAttributeId of allowedAttributeIds) {
        if (!providedAttributeIds.has(requiredAttributeId)) {
          throw new BadRequestException(
            `Variant ${variant.sku} is missing a variant-defining attribute selection`,
          );
        }
      }
      const signature = this.variantOptionSignature(variant.optionValues);
      if (combinationSignatures.has(signature)) {
        throw new BadRequestException('Product variants cannot use duplicate option combinations');
      }
      combinationSignatures.add(signature);
    }
  }
}
