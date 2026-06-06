import { Inject, Injectable, NotFoundException } from '@nestjs/common';

import { coercePositiveInt } from '../../../common/http/query-int';
import { PrismaService } from '../../persistence/services/prisma.service';
import type { CatalogBrowseQueryDto } from '../dto/catalog-public.dto';
import { ObjectStorageService } from '../../storage/object-storage.service';
import { CatalogLocalizationService } from './catalog-localization.service';

interface LocalizedNameTranslation {
  locale: string;
  name: string;
  slug: string;
}

interface LocalizedLabelTranslation {
  locale: string;
  label: string;
}

interface LocalizedMediaTranslation {
  locale: string;
  altText?: string | null;
  title?: string | null;
}

interface LocalizedProductTranslation extends LocalizedNameTranslation {
  shortDescription?: string | null;
  description?: string | null;
}

interface PublicCatalogProductRecord {
  id: string;
  sku: string;
  status: string;
  productType: { key: string; translations: LocalizedNameTranslation[] };
  brand: null | { key: string; translations: LocalizedNameTranslation[] };
  translations: LocalizedProductTranslation[];
  categoryLinks: Array<{ category: { key: string; translations: LocalizedNameTranslation[] } }>;
  collectionLinks: Array<{ collection: { key: string; translations: LocalizedNameTranslation[] } }>;
  tagLinks: Array<{ tag: { key: string; translations: LocalizedNameTranslation[] } }>;
  media: Array<{
    id: string;
    objectKey: string;
    role: string;
    mediaType: string;
    mimeType: string;
    translations: LocalizedMediaTranslation[];
  }>;
  variants: Array<{
    id: string;
    sku: string;
    isDefault: boolean;
    price: null | {
      currencyCode: string;
      baseAmount: number;
      saleAmount: number | null;
      saleStartsAt: Date | null;
      saleEndsAt: Date | null;
    };
    translations: Array<{ locale: string; name: string }>;
    optionValues: Array<{
      attribute: { key: string; translations: Array<{ locale: string; name: string }> };
      option: { key: string; colorHex?: string | null; translations: LocalizedLabelTranslation[] };
    }>;
  }>;
}

interface CatalogPublicPrismaClient {
  catalogProduct: {
    count(args: unknown): Promise<number>;
    findMany(args: unknown): Promise<PublicCatalogProductRecord[]>;
    findFirst(args: unknown): Promise<PublicCatalogProductRecord | null>;
  };
}

@Injectable()
export class CatalogPublicService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(CatalogLocalizationService)
    private readonly localizationService: CatalogLocalizationService,
    @Inject(ObjectStorageService)
    private readonly storage: ObjectStorageService,
  ) {}

  private get prismaClient(): CatalogPublicPrismaClient {
    return this.prisma as unknown as CatalogPublicPrismaClient;
  }

  async browseProducts(query: CatalogBrowseQueryDto) {
    const page = coercePositiveInt(query.page, 1);
    const pageSize = coercePositiveInt(query.pageSize, 12);
    const locale = query.locale ?? 'en';
    const optionKeys = query.optionKeys
      ? query.optionKeys
          .split(',')
          .map((entry) => entry.trim())
          .filter((entry) => entry.length > 0)
      : [];

    const where = {
      status: 'PUBLISHED',
      variants: {
        some: {
          status: 'PUBLISHED',
          price: { isNot: null },
          ...(optionKeys.length > 0
            ? {
                optionValues: {
                  some: { option: { key: { in: optionKeys } } },
                },
              }
            : {}),
        },
      },
      ...(query.brandSlug
        ? {
            brand: {
              status: 'PUBLISHED',
              translations: { some: { slug: query.brandSlug } },
            },
          }
        : {}),
      ...(query.categorySlug
        ? {
            categoryLinks: {
              some: {
                category: {
                  status: 'PUBLISHED',
                  translations: { some: { slug: query.categorySlug } },
                },
              },
            },
          }
        : {}),
      ...(query.collectionSlug
        ? {
            collectionLinks: {
              some: {
                collection: {
                  status: 'PUBLISHED',
                  translations: { some: { slug: query.collectionSlug } },
                },
              },
            },
          }
        : {}),
      ...(query.tagSlug
        ? {
            tagLinks: {
              some: {
                tag: {
                  status: 'PUBLISHED',
                  translations: { some: { slug: query.tagSlug } },
                },
              },
            },
          }
        : {}),
      ...(query.productTypeKey
        ? { productType: { key: query.productTypeKey, status: 'PUBLISHED' } }
        : {}),
    };

    const include = {
      productType: { include: { translations: true } },
      brand: { include: { translations: true } },
      translations: true,
      variants: {
        where: { status: 'PUBLISHED', price: { isNot: null } },
        include: {
          price: true,
          translations: true,
          optionValues: {
            include: {
              attribute: { include: { translations: true } },
              option: { include: { translations: true } },
            },
          },
        },
      },
      media: {
        where: { status: 'ATTACHED' },
        include: { translations: true },
      },
      categoryLinks: {
        where: { category: { status: 'PUBLISHED' } },
        include: { category: { include: { translations: true } } },
      },
      collectionLinks: {
        where: { collection: { status: 'PUBLISHED' } },
        include: { collection: { include: { translations: true } } },
      },
      tagLinks: {
        where: { tag: { status: 'PUBLISHED' } },
        include: { tag: { include: { translations: true } } },
      },
    };

    const [total, products] = await Promise.all([
      this.prismaClient.catalogProduct.count({ where }),
      this.prismaClient.catalogProduct.findMany({
        where,
        include,
        orderBy: [{ isFeatured: 'desc' }, { sortOrder: 'asc' }, { publishedAt: 'desc' }],
        skip: (page - 1) * pageSize,
        take: pageSize,
      }),
    ]);

    return {
      page,
      pageSize,
      total,
      items: products.map((product) => this.mapProduct(product, locale)),
    };
  }

  async getPublishedProductBySlug(slug: string, locale: string) {
    const product = await this.prismaClient.catalogProduct.findFirst({
      where: {
        status: 'PUBLISHED',
        translations: { some: { slug } },
        variants: { some: { status: 'PUBLISHED', price: { isNot: null } } },
      },
      include: {
        productType: { include: { translations: true } },
        brand: { include: { translations: true } },
        translations: true,
        variants: {
          where: { status: 'PUBLISHED', price: { isNot: null } },
          include: {
            price: true,
            translations: true,
            optionValues: {
              include: {
                attribute: { include: { translations: true } },
                option: { include: { translations: true } },
              },
            },
          },
        },
        media: {
          where: { status: 'ATTACHED' },
          include: { translations: true },
        },
        categoryLinks: {
          where: { category: { status: 'PUBLISHED' } },
          include: { category: { include: { translations: true } } },
        },
        collectionLinks: {
          where: { collection: { status: 'PUBLISHED' } },
          include: { collection: { include: { translations: true } } },
        },
        tagLinks: {
          where: { tag: { status: 'PUBLISHED' } },
          include: { tag: { include: { translations: true } } },
        },
      },
    });

    if (!product) {
      throw new NotFoundException('Published catalog product not found');
    }

    return this.mapProduct(product, locale);
  }

  private mapProduct(product: PublicCatalogProductRecord, locale: string) {
    const productTranslation = this.localizationService.pickTranslation(
      product.translations,
      locale,
    );
    const brandTranslation = product.brand
      ? this.localizationService.pickTranslation(product.brand.translations, locale)
      : null;
    const typeTranslation = this.localizationService.pickTranslation(
      product.productType.translations,
      locale,
    );

    return {
      id: product.id,
      sku: product.sku,
      status: product.status,
      name: productTranslation?.name ?? null,
      slug: productTranslation?.slug ?? null,
      shortDescription: productTranslation?.shortDescription ?? null,
      description: productTranslation?.description ?? null,
      brand: product.brand
        ? {
            key: product.brand.key,
            name: brandTranslation?.name ?? null,
            slug: brandTranslation?.slug ?? null,
          }
        : null,
      productType: {
        key: product.productType.key,
        name: typeTranslation?.name ?? null,
        slug: typeTranslation?.slug ?? null,
      },
      categories: product.categoryLinks.map((link) => {
        const translation = this.localizationService.pickTranslation(
          link.category.translations,
          locale,
        );
        return {
          key: link.category.key,
          name: translation?.name ?? null,
          slug: translation?.slug ?? null,
        };
      }),
      collections: product.collectionLinks.map((link) => {
        const translation = this.localizationService.pickTranslation(
          link.collection.translations,
          locale,
        );
        return {
          key: link.collection.key,
          name: translation?.name ?? null,
          slug: translation?.slug ?? null,
        };
      }),
      tags: product.tagLinks.map((link) => {
        const translation = this.localizationService.pickTranslation(link.tag.translations, locale);
        return {
          key: link.tag.key,
          name: translation?.name ?? null,
          slug: translation?.slug ?? null,
        };
      }),
      media: product.media.map((media) => {
        const translation = this.localizationService.pickTranslation(media.translations, locale);
        return {
          id: media.id,
          objectKey: media.objectKey,
          publicUrl: this.storage.createCatalogPublicUrl(media.objectKey),
          role: media.role,
          mediaType: media.mediaType,
          mimeType: media.mimeType,
          altText: translation?.altText ?? null,
          title: translation?.title ?? null,
        };
      }),
      variants: product.variants.map((variant) => {
        const variantTranslation = this.localizationService.pickTranslation(
          variant.translations,
          locale,
        );

        return {
          id: variant.id,
          sku: variant.sku,
          isDefault: variant.isDefault,
          name: variantTranslation?.name ?? null,
          price: variant.price
            ? {
                currencyCode: variant.price.currencyCode,
                baseAmount: variant.price.baseAmount,
                saleAmount: variant.price.saleAmount,
              }
            : null,
          options: variant.optionValues.map((optionValue) => {
            const attributeTranslation = this.localizationService.pickTranslation(
              optionValue.attribute.translations,
              locale,
            );
            const optionTranslation = this.localizationService.pickTranslation(
              optionValue.option.translations,
              locale,
            );

            return {
              attributeKey: optionValue.attribute.key,
              attributeName: attributeTranslation?.name ?? null,
              optionKey: optionValue.option.key,
              optionLabel: optionTranslation?.label ?? null,
              colorHex: optionValue.option.colorHex ?? null,
            };
          }),
        };
      }),
    };
  }
}
