import { ContentService } from './content.service';
import type { PrismaService } from '../../persistence/services/prisma.service';
import type { UpdateLegalReferencesDto, UpsertContentPageDto } from '../dto/content.dto';

const makePrismaMock = () => ({
  contentPage: {
    findMany: jest.fn(),
    findFirst: jest.fn(),
    upsert: jest.fn(),
  },
  contentPageTranslation: { upsert: jest.fn() },
  storeSetting: { findUnique: jest.fn(), upsert: jest.fn() },
  $transaction: jest.fn(),
});

describe('ContentService', () => {
  it('gets public content page and throws if not found', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.contentPage.findFirst as jest.Mock).mockResolvedValue(null);

    const svc = new ContentService(prisma);

    await expect(svc.getPublicContentPage('missing')).rejects.toThrow();
  });

  it('upserts content page and translation', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.$transaction as jest.Mock).mockImplementation((cb: (tx: unknown) => unknown) => {
      const tx = {
        contentPageTranslation: { upsert: jest.fn().mockResolvedValue({}) },
        contentPage: {
          upsert: jest.fn().mockResolvedValue({ id: 'p-1' }),
          findUniqueOrThrow: jest.fn().mockResolvedValue({ id: 'p-1', translations: [] }),
        },
      };

      return cb(tx);
    });

    const svc = new ContentService(prisma);
    const dto: UpsertContentPageDto = {
      slug: 'terms',
      title: 'Terms',
      body: 'T',
      locale: 'en',
      status: 'PUBLISHED',
    };

    const result = await svc.upsertContentPage('terms', dto);

    expect(result).toBeDefined();
    expect(result.id).toBe('p-1');
  });

  it('returns public legal references from configured published pages', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.storeSetting.findUnique as jest.Mock).mockResolvedValue({
      value: {
        termsPageKey: 'terms',
      },
    });
    (prisma.contentPage.findMany as jest.Mock).mockResolvedValue([
      {
        key: 'terms',
        slug: 'terms',
        updatedAt: new Date('2026-05-26T00:00:00.000Z'),
        translations: [{ title: 'Terms of Service', locale: 'en' }],
      },
    ]);

    const svc = new ContentService(prisma);
    const result = await svc.getPublicLegalReferences();

    expect(result.references.terms).toMatchObject({
      key: 'terms',
      slug: 'terms',
      title: 'Terms of Service',
    });
    expect(result.references.privacy).toBeNull();
  });

  it('rejects legal references that point to non-legal pages', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.contentPage.findMany as jest.Mock).mockResolvedValue([
      { key: 'terms', isLegal: false },
    ]);

    const svc = new ContentService(prisma);
    const dto: UpdateLegalReferencesDto = { termsPageKey: 'terms' };

    await expect(svc.updateLegalReferences(dto)).rejects.toThrow('is not marked as legal content');
  });
});
