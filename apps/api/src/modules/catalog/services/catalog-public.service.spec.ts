import { Test, type TestingModule } from '@nestjs/testing';

import { PrismaService } from '../../persistence/services/prisma.service';
import { ObjectStorageService } from '../../storage/object-storage.service';
import { CatalogLocalizationService } from './catalog-localization.service';
import { CatalogPublicService } from './catalog-public.service';

describe('CatalogPublicService', () => {
  let service: CatalogPublicService;
  let prisma: PrismaService;

  const storage = {
    createCatalogPublicUrl: jest.fn((key: string) => `https://cdn.example/${key}`),
  };

  const mockPrismaService = {
    catalogProduct: {
      count: jest.fn().mockResolvedValue(1),
      findMany: jest.fn().mockResolvedValue([
        {
          id: 'product_1',
          sku: 'SKU-1',
          status: 'PUBLISHED',
          productType: {
            key: 'perfume',
            translations: [{ locale: 'en', name: 'Perfume', slug: 'perfume' }],
          },
          brand: null,
          translations: [{ locale: 'en', name: 'Gold Oud', slug: 'gold-oud' }],
          categoryLinks: [],
          collectionLinks: [],
          tagLinks: [],
          media: [],
          variants: [],
        },
      ]),
      findFirst: jest.fn().mockResolvedValue(null),
    },
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        CatalogPublicService,
        CatalogLocalizationService,
        { provide: PrismaService, useValue: mockPrismaService },
        { provide: ObjectStorageService, useValue: storage },
      ],
    }).compile();

    service = module.get<CatalogPublicService>(CatalogPublicService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('always filters browse results to published products', async () => {
    await service.browseProducts({ locale: 'en', page: 1, pageSize: 12 });

    expect(prisma.catalogProduct.findMany).toHaveBeenCalledWith(
      expect.objectContaining({
        where: expect.objectContaining({
          status: 'PUBLISHED',
        }),
      }),
    );
  });

  it('applies option-key filters to the browse query', async () => {
    await service.browseProducts({
      locale: 'en',
      page: 1,
      pageSize: 12,
      optionKeys: 'xl,gold',
    });

    expect(prisma.catalogProduct.findMany).toHaveBeenCalledWith(
      expect.objectContaining({
        where: expect.objectContaining({
          variants: {
            some: {
              status: 'PUBLISHED',
              price: { isNot: null },
              optionValues: {
                some: {
                  option: {
                    key: {
                      in: ['xl', 'gold'],
                    },
                  },
                },
              },
            },
          },
        }),
      }),
    );
  });
});
