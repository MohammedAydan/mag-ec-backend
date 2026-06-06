import { randomUUID } from 'node:crypto';
import { existsSync } from 'node:fs';
import { readFile } from 'node:fs/promises';
import type { IncomingMessage } from 'node:http';
import path from 'node:path';
import { pathToFileURL } from 'node:url';

import helmet from '@fastify/helmet';
import cors from '@fastify/cors';
import fastifyStatic from '@fastify/static';
import { ValidationPipe } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import type { FastifyReply } from 'fastify';
import { SwaggerModule } from '@nestjs/swagger';
import { Logger } from 'nestjs-pino';

import { AppModule } from '../app.module';
import { type AppConfig } from '../config/app.config';
import { HttpExceptionFilter } from '../common/filters/http-exception.filter';
import { normalizeResponsePayload } from '../common/serialization/response-normalizer';
import { buildOpenApiConfig, buildOpenApiDocumentOptions } from '../openapi/openapi.config';
import { PrismaSchemaGuardService } from '../modules/persistence/services/prisma-schema-guard.service';

type SwaggerPluginMetadata = Parameters<typeof SwaggerModule.loadPluginMetadata>[0];

export async function createApiApplication(): Promise<NestFastifyApplication> {
  // Pre-load NestJS Swagger plugin metadata so that tsx (esbuild) has type information
  // for every @ApiProperty decorator before NestJS scans modules.
  const metadataPath = path.resolve(__dirname, '../metadata.js');
  if (existsSync(metadataPath)) {
    try {
      const metadataModule: unknown = await import(pathToFileURL(metadataPath).href);
      const moduleRecord = asRecord(metadataModule);
      const wrapped = moduleRecord?.default ?? metadataModule;
      const wrappedRecord = asRecord(wrapped);
      const pluginFn: unknown =
        typeof wrappedRecord?.default === 'function' ? wrappedRecord.default : wrapped;
      if (typeof pluginFn === 'function') {
        await SwaggerModule.loadPluginMetadata(pluginFn as SwaggerPluginMetadata);
      }
    } catch {
      // Silently ignore — metadata is optional in dev.
    }
  }

  const adapter = new FastifyAdapter({
    genReqId: (request: IncomingMessage & { headers: IncomingMessage['headers'] }) => {
      const headerValue = request.headers['x-request-id'];

      return typeof headerValue === 'string' && headerValue.length > 0 ? headerValue : randomUUID();
    },
    requestIdHeader: 'x-request-id',
    bodyLimit: 1024 * 1024,
  });

  const app = await NestFactory.create<NestFastifyApplication>(AppModule, adapter, {
    bufferLogs: true,
    rawBody: true,
  });

  const config = app.get(ConfigService).getOrThrow<AppConfig>('app');
  await app.get(PrismaSchemaGuardService).assertSchemaIsCurrent();

  app.useLogger(app.get(Logger));
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      transform: true,
      forbidNonWhitelisted: true,
    }),
  );
  app.useGlobalFilters(new HttpExceptionFilter());
  app.setGlobalPrefix(config.apiPrefix);
  app.enableShutdownHooks();

  await app.register(helmet, {
    global: true,
  });
  await app.register(cors, {
    origin: [...config.adminAllowedOrigins, ...config.storeAllowedOrigins].length
      ? [...new Set([...config.adminAllowedOrigins, ...config.storeAllowedOrigins])]
      : false,
  });

  app
    .getHttpAdapter()
    .getInstance()
    .addHook('onRequest', async (request, reply) => {
      reply.header('x-request-id', request.id);
    });

  app
    .getHttpAdapter()
    .getInstance()
    .addHook('preSerialization', async (_request, _reply, payload) => {
      return normalizeResponsePayload(payload);
    });

  if (config.dashboardEnabled) {
    const candidateRoots = [
      path.resolve(__dirname, '../../public/admin'),
      path.resolve(process.cwd(), 'public/admin'),
      path.resolve(process.cwd(), 'apps/api/public/admin'),
    ];
    const dashboardRoot = candidateRoots.find((candidate) =>
      existsSync(path.join(candidate, 'index.html')),
    );

    if (dashboardRoot) {
      const indexHtml = await readFile(path.join(dashboardRoot, 'index.html'), 'utf8');
      const fastify = app.getHttpAdapter().getInstance();

      await app.register(fastifyStatic, {
        root: dashboardRoot,
        prefix: '/admin/',
        decorateReply: false,
        maxAge: '1h',
        immutable: false,
      });

      const renderDashboard = async (_request: unknown, reply: FastifyReply) =>
        reply.type('text/html; charset=utf-8').send(indexHtml);

      fastify.get('/admin', renderDashboard);
      fastify.get('/admin/', renderDashboard);
      fastify.get('/admin/index.html', renderDashboard);
    }
  }

  if (config.openapiEnabled) {
    const documentFactory = () =>
      SwaggerModule.createDocument(app, buildOpenApiConfig(), buildOpenApiDocumentOptions());

    SwaggerModule.setup(`${config.apiPrefix}/docs`, app, documentFactory, {
      jsonDocumentUrl: `${config.apiPrefix}/docs/json`,
      raw: ['json'],
      ui: true,
    });
  }

  return app;
}

function asRecord(value: unknown): Record<string, unknown> | undefined {
  return typeof value === 'object' && value !== null ? (value as Record<string, unknown>) : undefined;
}

