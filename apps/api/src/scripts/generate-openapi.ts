import { mkdir, writeFile } from 'node:fs/promises';
import path from 'node:path';

import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

async function generateOpenApiDocument(): Promise<void> {
  process.env.DATABASE_URL ??= 'mysql://root:root@localhost:3306/ecommerce';
  process.env.REDIS_URL ??= 'redis://localhost:6379';
  process.env.OPENAPI_ENABLED = 'false';
  process.env.EXECUTION_MODE = 'direct';
  process.env.QUEUE_ENABLED = 'false';

  const { createApiApplication } = await import('../bootstrap/create-api-application.js');

  const app = await createApiApplication();

  const document = SwaggerModule.createDocument(
    app,
    new DocumentBuilder()
      .setTitle('Universal E-Commerce API')
      .setDescription('Phase 00 foundation contract for the headless commerce backend.')
      .setVersion('1.0.0')
      .addServer('/api/v1')
      .addBearerAuth()
      .build(),
  );

  const outputDirectory = path.resolve(process.cwd(), '../../packages/contracts/openapi');
  const outputFile = path.join(outputDirectory, 'openapi.json');

  await mkdir(outputDirectory, { recursive: true });
  await writeFile(outputFile, JSON.stringify(document, null, 2) + '\n', 'utf8');
  await app.close();
}

void generateOpenApiDocument();
