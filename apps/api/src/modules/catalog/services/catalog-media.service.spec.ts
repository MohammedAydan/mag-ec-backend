import { BadRequestException, UnauthorizedException } from '@nestjs/common';
import { Test, type TestingModule } from '@nestjs/testing';

import { PrismaService } from '../../persistence/services/prisma.service';
import { ObjectStorageService } from '../../storage/object-storage.service';
import { CatalogMediaService } from './catalog-media.service';

describe('CatalogMediaService', () => {
  let service: CatalogMediaService;

  const tx = {
    catalogMedia: { updateMany: jest.fn(), findUniqueOrThrow: jest.fn() },
    catalogMediaTranslation: { upsert: jest.fn() },
  };
  const prisma = {
    catalogMedia: { create: jest.fn(), findUnique: jest.fn() },
    $transaction: jest.fn(async (callback: (input: typeof tx) => Promise<unknown>) => callback(tx)),
  };
  const storage = {
    createCatalogUploadUrl: jest.fn().mockReturnValue('https://storage.example/upload'),
    createCatalogPublicUrl: jest.fn().mockReturnValue('https://cdn.example/catalog/object.jpg'),
    verifyCatalogObject: jest.fn(),
  };

  beforeEach(async () => {
    jest.clearAllMocks();
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        CatalogMediaService,
        { provide: PrismaService, useValue: prisma },
        { provide: ObjectStorageService, useValue: storage },
      ],
    }).compile();
    service = module.get(CatalogMediaService);
  });

  it('issues a presigned media upload intent while persisting only a token digest', async () => {
    prisma.catalogMedia.create.mockResolvedValue({ id: 'media_1' });
    const result = await service.issueUploadIntent({
      productId: 'product_1',
      actorUserId: 'user_1',
      mediaType: 'IMAGE',
      role: 'GALLERY',
      mimeType: 'image/jpeg',
      sizeBytes: 1024,
    });
    expect(result.mediaId).toBe('media_1');
    expect(result.uploadUrl).toBe('https://storage.example/upload');
    expect(prisma.catalogMedia.create).toHaveBeenCalledWith({
      data: expect.objectContaining({
        uploadTokenHash: expect.any(String),
        status: 'PENDING_UPLOAD',
      }),
    });
  });

  it('rejects unsupported media content types', async () => {
    await expect(
      service.issueUploadIntent({
        productId: 'product_1',
        actorUserId: 'user_1',
        mediaType: 'IMAGE',
        role: 'GALLERY',
        mimeType: 'application/octet-stream',
        sizeBytes: 1024,
      }),
    ).rejects.toThrow(BadRequestException);
  });

  it('rejects attach requests from an actor who did not issue the upload intent', async () => {
    prisma.catalogMedia.findUnique.mockResolvedValue({
      id: 'media_1',
      productId: 'product_1',
      uploadedByUserId: 'user_1',
      status: 'PENDING_UPLOAD',
      uploadExpiresAt: new Date(Date.now() + 60_000),
      uploadTokenHash: service.hashToken('upload-token'),
    });
    await expect(
      service.attachUploadedMedia({
        productId: 'product_1',
        mediaId: 'media_1',
        uploadToken: 'upload-token',
        actorUserId: 'user_2',
      }),
    ).rejects.toThrow(UnauthorizedException);
  });

  it('verifies the stored object and atomically consumes the upload intent', async () => {
    prisma.catalogMedia.findUnique.mockResolvedValue({
      id: 'media_1',
      productId: 'product_1',
      uploadedByUserId: 'user_1',
      status: 'PENDING_UPLOAD',
      objectKey: 'catalog/product_1/object.jpg',
      mimeType: 'image/jpeg',
      sizeBytes: 1024,
      uploadExpiresAt: new Date(Date.now() + 60_000),
      uploadTokenHash: service.hashToken('upload-token'),
    });
    storage.verifyCatalogObject.mockResolvedValue({
      contentLength: 1024,
      contentType: 'image/jpeg',
      etag: 'etag',
    });
    tx.catalogMedia.updateMany.mockResolvedValue({ count: 1 });
    tx.catalogMedia.findUniqueOrThrow.mockResolvedValue({
      id: 'media_1',
      objectKey: 'catalog/product_1/object.jpg',
    });

    await expect(
      service.attachUploadedMedia({
        productId: 'product_1',
        mediaId: 'media_1',
        uploadToken: 'upload-token',
        actorUserId: 'user_1',
      }),
    ).resolves.toMatchObject({
      id: 'media_1',
      publicUrl: 'https://cdn.example/catalog/object.jpg',
    });
    expect(tx.catalogMedia.updateMany).toHaveBeenCalledWith(
      expect.objectContaining({
        where: expect.objectContaining({ status: 'PENDING_UPLOAD' }),
        data: expect.objectContaining({ status: 'ATTACHED', checksum: 'etag' }),
      }),
    );
  });

  // ── SEC-019: Checksum verification ──

  it('accepts a matching caller-provided checksum', async () => {
    prisma.catalogMedia.findUnique.mockResolvedValue({
      id: 'media_1',
      productId: 'product_1',
      uploadedByUserId: 'user_1',
      status: 'PENDING_UPLOAD',
      objectKey: 'catalog/product_1/object.jpg',
      mimeType: 'image/jpeg',
      sizeBytes: 1024,
      uploadExpiresAt: new Date(Date.now() + 60_000),
      uploadTokenHash: service.hashToken('upload-token'),
    });
    storage.verifyCatalogObject.mockResolvedValue({
      contentLength: 1024,
      contentType: 'image/jpeg',
      etag: '"d41d8cd98f00b204e9800998ecf8427e"',
    });
    tx.catalogMedia.updateMany.mockResolvedValue({ count: 1 });
    tx.catalogMedia.findUniqueOrThrow.mockResolvedValue({
      id: 'media_1',
      objectKey: 'catalog/product_1/object.jpg',
    });

    await expect(
      service.attachUploadedMedia({
        productId: 'product_1',
        mediaId: 'media_1',
        uploadToken: 'upload-token',
        actorUserId: 'user_1',
        checksum: '"d41d8cd98f00b204e9800998ecf8427e"',
      }),
    ).resolves.toMatchObject({
      id: 'media_1',
      publicUrl: 'https://cdn.example/catalog/object.jpg',
    });

    expect(tx.catalogMedia.updateMany).toHaveBeenCalledWith(
      expect.objectContaining({
        data: expect.objectContaining({
          checksum: '"d41d8cd98f00b204e9800998ecf8427e"',
        }),
      }),
    );
  });

  it('rejects a mismatched caller-provided checksum', async () => {
    prisma.catalogMedia.findUnique.mockResolvedValue({
      id: 'media_1',
      productId: 'product_1',
      uploadedByUserId: 'user_1',
      status: 'PENDING_UPLOAD',
      objectKey: 'catalog/product_1/object.jpg',
      mimeType: 'image/jpeg',
      sizeBytes: 1024,
      uploadExpiresAt: new Date(Date.now() + 60_000),
      uploadTokenHash: service.hashToken('upload-token'),
    });
    storage.verifyCatalogObject.mockResolvedValue({
      contentLength: 1024,
      contentType: 'image/jpeg',
      etag: '"abc123"',
    });
    tx.catalogMedia.updateMany.mockResolvedValue({ count: 1 });
    tx.catalogMedia.findUniqueOrThrow.mockResolvedValue({
      id: 'media_1',
      objectKey: 'catalog/product_1/object.jpg',
    });

    await expect(
      service.attachUploadedMedia({
        productId: 'product_1',
        mediaId: 'media_1',
        uploadToken: 'upload-token',
        actorUserId: 'user_1',
        checksum: '"mismatched"',
      }),
    ).rejects.toThrow(BadRequestException);
  });

  it('rejects a provided checksum when the stored object has no ETag', async () => {
    prisma.catalogMedia.findUnique.mockResolvedValue({
      id: 'media_1',
      productId: 'product_1',
      uploadedByUserId: 'user_1',
      status: 'PENDING_UPLOAD',
      objectKey: 'catalog/product_1/object.jpg',
      mimeType: 'image/jpeg',
      sizeBytes: 1024,
      uploadExpiresAt: new Date(Date.now() + 60_000),
      uploadTokenHash: service.hashToken('upload-token'),
    });
    // No etag returned
    storage.verifyCatalogObject.mockResolvedValue({
      contentLength: 1024,
      contentType: 'image/jpeg',
      etag: null,
    });
    tx.catalogMedia.updateMany.mockResolvedValue({ count: 1 });
    tx.catalogMedia.findUniqueOrThrow.mockResolvedValue({
      id: 'media_1',
      objectKey: 'catalog/product_1/object.jpg',
    });

    await expect(
      service.attachUploadedMedia({
        productId: 'product_1',
        mediaId: 'media_1',
        uploadToken: 'upload-token',
        actorUserId: 'user_1',
        checksum: '"expected-hash"',
      }),
    ).rejects.toThrow(BadRequestException);
  });
});
