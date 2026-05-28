import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { S3StorageClient } from '../../../../packages/domain-shared/dist/index.js';

import type { WorkerConfig } from '../config/worker.config';

@Injectable()
export class WorkerStorageService {
  private readonly storage: S3StorageClient | null;
  private readonly config: WorkerConfig;

  constructor(configService: ConfigService) {
    this.config = configService.getOrThrow<WorkerConfig>('worker');
    this.storage = this.config.s3Endpoint
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

  get usesObjectStorage(): boolean {
    return this.config.reportStorageMode === 's3';
  }

  async putPrivateObject(key: string, content: string, contentType: string): Promise<void> {
    if (!this.storage) {
      throw new Error('Object storage is not configured for report exports');
    }

    await this.storage.putObject(this.config.s3BucketPrivate, key, content, contentType);
  }
}
