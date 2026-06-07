import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';

import { createApiApplication } from './bootstrap/create-api-application';
import type { AppConfig } from './config/app.config';

// Vercel's NestJS builder statically detects entrypoints by scanning this file.
void NestFactory;

async function bootstrap(): Promise<void> {
  const app = await createApiApplication();
  const config = app.get(ConfigService).getOrThrow<AppConfig>('app');

  await app.listen(config.port, '0.0.0.0');
}

void bootstrap();
