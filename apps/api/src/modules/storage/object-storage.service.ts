import { Inject, Injectable, ServiceUnavailableException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import {
  S3StorageClient,
  type StoredObjectMetadata,
} from '../../../../../packages/domain-shared/dist/index.js';

import type { AppConfig } from '../../config/app.config';

@Injectable()
export class ObjectStorageService {
  private readonly storage: S3StorageClient | null;
  private readonly config: AppConfig;

  constructor(@Inject(ConfigService) configService: ConfigService) {
    this.config = configService.getOrThrow<AppConfig>('app');
    this.storage = this.isConfigured()
      ? new S3StorageClient({
          endpoint: this.config.s3Endpoint,
          region: this.config.s3Region,
          accessKeyId: this.config.s3AccessKeyId,
          secretAccessKey: this.config.s3SecretAccessKey,
          publicBucket: this.config.s3BucketPublic,
          privateBucket: this.config.s3BucketPrivate,
          publicBaseUrl: this.config.s3PublicBaseUrl,
        })
      : null;
  }

  createCatalogUploadUrl(objectKey: string, contentType: string): string {
    return this.requireStorage().createPresignedPutUrl(
      this.config.s3BucketPublic,
      objectKey,
      contentType,
    );
  }

  createCatalogPublicUrl(objectKey: string): string {
    return this.requireStorage().createPublicObjectUrl(objectKey);
  }

  verifyCatalogObject(objectKey: string): Promise<StoredObjectMetadata | null> {
    return this.requireStorage().headObject(this.config.s3BucketPublic, objectKey);
  }

  createPrivateDownloadUrl(objectKey: string): string {
    return this.requireStorage().createPresignedGetUrl(this.config.s3BucketPrivate, objectKey);
  }

  get usesObjectStorage(): boolean {
    return this.config.reportStorageMode === 's3';
  }

  async putPrivateObject(objectKey: string, content: string, contentType: string): Promise<void> {
    await this.requireStorage().putObject(
      this.config.s3BucketPrivate,
      objectKey,
      content,
      contentType,
    );
  }

  private isConfigured(): boolean {
    return [
      this.config.s3Endpoint,
      this.config.s3Region,
      this.config.s3BucketPublic,
      this.config.s3BucketPrivate,
      this.config.s3AccessKeyId,
      this.config.s3SecretAccessKey,
    ].every((value) => value.trim().length > 0);
  }

  private requireStorage(): S3StorageClient {
    if (!this.storage) {
      throw new ServiceUnavailableException('Object storage is not configured');
    }

    return this.storage;
  }
}
