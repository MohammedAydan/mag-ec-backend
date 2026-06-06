import { createHash, randomBytes, timingSafeEqual } from 'node:crypto';

import { BadRequestException, Inject, Injectable, UnauthorizedException } from '@nestjs/common';

import { PrismaService } from '../../persistence/services/prisma.service';
import { ObjectStorageService } from '../../storage/object-storage.service';

type CatalogMediaTypeValue = 'IMAGE' | 'VIDEO' | 'FILE';
type CatalogMediaRoleValue = 'PRIMARY' | 'GALLERY' | 'SWATCH' | 'DETAIL';

const allowedMimeTypesByMediaType: Record<CatalogMediaTypeValue, string[]> = {
  IMAGE: ['image/jpeg', 'image/png', 'image/webp'],
  VIDEO: ['video/mp4'],
  FILE: ['application/pdf'],
};

const maxBytesByMediaType: Record<CatalogMediaTypeValue, number> = {
  IMAGE: 10 * 1024 * 1024,
  VIDEO: 100 * 1024 * 1024,
  FILE: 20 * 1024 * 1024,
};

@Injectable()
export class CatalogMediaService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(ObjectStorageService) private readonly storage: ObjectStorageService,
  ) {}

  hashToken(token: string): string {
    return createHash('sha256').update(token).digest('hex');
  }

  async issueUploadIntent(input: {
    productId: string;
    variantId?: string;
    actorUserId: string;
    mediaType: CatalogMediaTypeValue;
    role: CatalogMediaRoleValue;
    mimeType: string;
    sizeBytes: number;
  }) {
    const allowedMimeTypes = allowedMimeTypesByMediaType[input.mediaType];
    if (!allowedMimeTypes.includes(input.mimeType)) {
      throw new BadRequestException('Unsupported media content type');
    }

    if (input.sizeBytes < 1 || input.sizeBytes > maxBytesByMediaType[input.mediaType]) {
      throw new BadRequestException('Media file size is outside the allowed range');
    }

    const rawToken = randomBytes(24).toString('base64url');
    const uploadTokenHash = this.hashToken(rawToken);
    const expiresAt = new Date(Date.now() + 15 * 60 * 1000);
    const extension = this.extensionFromMimeType(input.mimeType);
    const objectKey = `catalog/${input.productId}/${Date.now()}-${randomBytes(8).toString('hex')}.${extension}`;

    const media = await this.prisma.catalogMedia.create({
      data: {
        productId: input.productId,
        variantId: input.variantId,
        uploadedByUserId: input.actorUserId,
        objectKey,
        status: 'PENDING_UPLOAD',
        mediaType: input.mediaType,
        role: input.role,
        mimeType: input.mimeType,
        sizeBytes: input.sizeBytes,
        uploadTokenHash,
        uploadExpiresAt: expiresAt,
      },
    });

    return {
      mediaId: media.id,
      objectKey,
      uploadUrl: this.storage.createCatalogUploadUrl(objectKey, input.mimeType),
      publicUrl: this.storage.createCatalogPublicUrl(objectKey),
      uploadToken: rawToken,
      expiresAt,
      headers: {
        'content-type': input.mimeType,
      },
    };
  }

  async attachUploadedMedia(input: {
    productId: string;
    mediaId: string;
    uploadToken: string;
    actorUserId: string;
    checksum?: string;
    translations?: Array<{ locale: string; altText?: string; title?: string }>;
  }) {
    const media = await this.prisma.catalogMedia.findUnique({
      where: { id: input.mediaId },
    });

    if (!media || media.productId !== input.productId) {
      throw new UnauthorizedException('Media upload intent was not found for this product');
    }

    if (media.uploadedByUserId !== input.actorUserId) {
      throw new UnauthorizedException('Only the issuing actor can attach this media');
    }

    if (media.status !== 'PENDING_UPLOAD' || media.uploadExpiresAt <= new Date()) {
      throw new UnauthorizedException('Media upload intent is expired or already consumed');
    }

    if (!this.isValidUploadToken(media.uploadTokenHash, input.uploadToken)) {
      throw new UnauthorizedException('Media upload token is invalid');
    }

    const storedObject = await this.storage.verifyCatalogObject(media.objectKey);
    if (!storedObject) {
      throw new BadRequestException('Uploaded media object could not be found');
    }

    if (storedObject.contentLength !== media.sizeBytes) {
      throw new BadRequestException('Uploaded media object size does not match the upload intent');
    }

    if (storedObject.contentType?.split(';')[0]?.trim().toLowerCase() !== media.mimeType) {
      throw new BadRequestException(
        'Uploaded media object content type does not match the upload intent',
      );
    }

    // SEC-019: Verify caller-provided checksum against the stored object's ETag.
    // This prevents storing a mismatched checksum and ensures upload integrity.
    if (input.checksum?.trim()) {
      const expectedChecksum = input.checksum.trim();
      if (!storedObject.etag || storedObject.etag !== expectedChecksum) {
        throw new BadRequestException(
          'Provided checksum does not match the uploaded media object; upload may be corrupted',
        );
      }
    }

    return this.prisma.$transaction(async (tx) => {
      const claimed = await tx.catalogMedia.updateMany({
        where: {
          id: media.id,
          status: 'PENDING_UPLOAD',
          uploadTokenHash: this.hashToken(input.uploadToken),
          uploadExpiresAt: { gt: new Date() },
        },
        data: {
          status: 'ATTACHED',
          attachedAt: new Date(),
          checksum: storedObject.etag ?? input.checksum?.trim() ?? null,
        },
      });

      if (claimed.count !== 1) {
        throw new UnauthorizedException('Media upload intent is expired or already consumed');
      }

      if (input.translations?.length) {
        for (const translation of input.translations) {
          await tx.catalogMediaTranslation.upsert({
            where: {
              mediaId_locale: {
                mediaId: media.id,
                locale: translation.locale.trim().toLowerCase(),
              },
            },
            update: {
              altText: translation.altText?.trim(),
              title: translation.title?.trim(),
            },
            create: {
              mediaId: media.id,
              locale: translation.locale.trim().toLowerCase(),
              altText: translation.altText?.trim(),
              title: translation.title?.trim(),
            },
          });
        }
      }

      const attached = await tx.catalogMedia.findUniqueOrThrow({
        where: { id: media.id },
        include: { translations: true },
      });

      return {
        ...attached,
        publicUrl: this.storage.createCatalogPublicUrl(attached.objectKey),
      };
    });
  }

  private isValidUploadToken(expectedHash: string, rawToken: string): boolean {
    const actualHash = this.hashToken(rawToken);
    const expected = Buffer.from(expectedHash, 'hex');
    const actual = Buffer.from(actualHash, 'hex');
    return expected.length === actual.length && timingSafeEqual(expected, actual);
  }

  private extensionFromMimeType(mimeType: string): string {
    switch (mimeType) {
      case 'image/jpeg':
        return 'jpg';
      case 'image/png':
        return 'png';
      case 'image/webp':
        return 'webp';
      case 'video/mp4':
        return 'mp4';
      case 'application/pdf':
        return 'pdf';
      default:
        throw new BadRequestException('Unsupported media content type');
    }
  }
}
