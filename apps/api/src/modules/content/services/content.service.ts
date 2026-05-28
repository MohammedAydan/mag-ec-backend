import { BadRequestException, Inject, Injectable, NotFoundException } from '@nestjs/common';
import { Prisma } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';
import type {
  LegalReferencesDto,
  PublicLegalReferenceDto,
  PublicLegalReferencesDto,
  UpdateLegalReferencesDto,
  UpsertContentPageDto,
} from '../dto/content.dto';

const legalReferencesSettingKey = 'content.legal-references';

type LegalReferenceKey = 'termsPageKey' | 'privacyPageKey' | 'returnsPageKey' | 'shippingPageKey';

const defaultLegalReferencesValue: LegalReferencesDto = {
  termsPageKey: null,
  privacyPageKey: null,
  returnsPageKey: null,
  shippingPageKey: null,
};

const contentPageInclude = {
  translations: {
    orderBy: [{ locale: 'asc' as const }],
  },
} satisfies Prisma.ContentPageInclude;

type ContentPageRecord = Prisma.ContentPageGetPayload<{ include: typeof contentPageInclude }>;

@Injectable()
export class ContentService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
  ) {}

  async listContentPages() {
    return this.prisma.contentPage.findMany({
      include: contentPageInclude,
      orderBy: [{ sortOrder: 'asc' }, { createdAt: 'asc' }],
    });
  }

  async getPublicContentPage(slug: string) {
    const normalizedSlug = slug.trim().toLowerCase();
    const page = await this.prisma.contentPage.findFirst({
      where: {
        status: 'PUBLISHED',
        OR: [
          { slug: normalizedSlug },
          {
            translations: {
              some: {
                slug: normalizedSlug,
              },
            },
          },
        ],
      },
      include: contentPageInclude,
    });

    if (!page) {
      throw new NotFoundException(`Content page "${slug}" was not found`);
    }

    return page;
  }

  async upsertContentPage(key: string, dto: UpsertContentPageDto) {
    return this.prisma.$transaction(async (tx) => {
      const page = await tx.contentPage.upsert({
        where: { key: key.trim().toLowerCase() },
        update: {
          slug: dto.slug.trim().toLowerCase(),
          status: dto.status,
          sortOrder: dto.sortOrder ?? 0,
          isLegal: dto.isLegal ?? false,
        },
        create: {
          key: key.trim().toLowerCase(),
          slug: dto.slug.trim().toLowerCase(),
          status: dto.status,
          sortOrder: dto.sortOrder ?? 0,
          isLegal: dto.isLegal ?? false,
        },
      });

      await tx.contentPageTranslation.upsert({
        where: {
          contentPageId_locale: {
            contentPageId: page.id,
            locale: dto.locale?.trim().toLowerCase() ?? 'en',
          },
        },
        update: {
          title: dto.title.trim(),
          slug: dto.slug.trim().toLowerCase(),
          body: dto.body.trim(),
        },
        create: {
          contentPageId: page.id,
          locale: dto.locale?.trim().toLowerCase() ?? 'en',
          title: dto.title.trim(),
          slug: dto.slug.trim().toLowerCase(),
          body: dto.body.trim(),
        },
      });

      return tx.contentPage.findUniqueOrThrow({
        where: { id: page.id },
        include: contentPageInclude,
      });
    });
  }

  async getAdminLegalReferences(): Promise<LegalReferencesDto> {
    const setting = await this.prisma.storeSetting.findUnique({
      where: { key: legalReferencesSettingKey },
    });

    return this.serializeLegalReferences(setting?.value);
  }

  async getPublicLegalReferences(): Promise<PublicLegalReferencesDto> {
    const legalReferences = await this.getAdminLegalReferences();
    const referencedKeys = Object.values(legalReferences).filter(
      (value): value is string => typeof value === 'string' && value.length > 0,
    );

    if (referencedKeys.length === 0) {
      return {
        references: {
          terms: null,
          privacy: null,
          returns: null,
          shipping: null,
        },
      };
    }

    const pages = await this.prisma.contentPage.findMany({
      where: {
        key: {
          in: referencedKeys,
        },
        isLegal: true,
        status: 'PUBLISHED',
      },
      include: contentPageInclude,
    });

    const pageByKey = new Map(pages.map((page) => [page.key, page]));

    return {
      references: {
        terms: this.serializeLegalReference(pageByKey.get(legalReferences.termsPageKey ?? '')),
        privacy: this.serializeLegalReference(pageByKey.get(legalReferences.privacyPageKey ?? '')),
        returns: this.serializeLegalReference(pageByKey.get(legalReferences.returnsPageKey ?? '')),
        shipping: this.serializeLegalReference(
          pageByKey.get(legalReferences.shippingPageKey ?? ''),
        ),
      },
    };
  }

  async updateLegalReferences(dto: UpdateLegalReferencesDto): Promise<LegalReferencesDto> {
    const normalized = this.normalizeLegalReferencesDto(dto);
    const referencedKeys = Object.values(normalized).filter(
      (value): value is string => typeof value === 'string' && value.length > 0,
    );

    if (referencedKeys.length > 0) {
      const pages = await this.prisma.contentPage.findMany({
        where: {
          key: {
            in: referencedKeys,
          },
        },
        select: {
          key: true,
          isLegal: true,
        },
      });

      const pageByKey = new Map(pages.map((page) => [page.key, page]));

      for (const pageKey of referencedKeys) {
        const page = pageByKey.get(pageKey);

        if (!page) {
          throw new BadRequestException(`Legal reference page "${pageKey}" does not exist`);
        }

        if (!page.isLegal) {
          throw new BadRequestException(`Content page "${pageKey}" is not marked as legal content`);
        }
      }
    }

    await this.prisma.storeSetting.upsert({
      where: { key: legalReferencesSettingKey },
      update: {
        value: normalized as unknown as Prisma.InputJsonValue,
        description: 'Maps legal surfaces to content page keys.',
        isPublic: true,
      },
      create: {
        key: legalReferencesSettingKey,
        value: normalized as unknown as Prisma.InputJsonValue,
        description: 'Maps legal surfaces to content page keys.',
        isPublic: true,
      },
    });

    return normalized;
  }

  private normalizeLegalReferencesDto(dto: UpdateLegalReferencesDto): LegalReferencesDto {
    return {
      termsPageKey: this.normalizeNullableKey(dto.termsPageKey),
      privacyPageKey: this.normalizeNullableKey(dto.privacyPageKey),
      returnsPageKey: this.normalizeNullableKey(dto.returnsPageKey),
      shippingPageKey: this.normalizeNullableKey(dto.shippingPageKey),
    };
  }

  private normalizeNullableKey(value: string | null | undefined) {
    if (value === undefined || value === null) {
      return null;
    }

    const normalized = value.trim().toLowerCase();
    return normalized.length > 0 ? normalized : null;
  }

  private serializeLegalReferences(value: Prisma.JsonValue | null | undefined): LegalReferencesDto {
    if (!value || typeof value !== 'object' || Array.isArray(value)) {
      return defaultLegalReferencesValue;
    }

    const record = value as Record<LegalReferenceKey, Prisma.JsonValue>;

    return {
      termsPageKey: this.readLegalReferenceValue(record.termsPageKey),
      privacyPageKey: this.readLegalReferenceValue(record.privacyPageKey),
      returnsPageKey: this.readLegalReferenceValue(record.returnsPageKey),
      shippingPageKey: this.readLegalReferenceValue(record.shippingPageKey),
    };
  }

  private readLegalReferenceValue(value: Prisma.JsonValue | undefined) {
    return typeof value === 'string' && value.trim().length > 0 ? value.trim().toLowerCase() : null;
  }

  private serializeLegalReference(
    page: ContentPageRecord | undefined,
  ): PublicLegalReferenceDto | null {
    if (!page) {
      return null;
    }

    return {
      key: page.key,
      slug: page.slug,
      title: page.translations[0]?.title ?? page.key,
      updatedAt: page.updatedAt,
    };
  }
}
