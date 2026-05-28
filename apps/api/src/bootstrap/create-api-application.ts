import { randomUUID } from 'node:crypto';
import { existsSync } from 'node:fs';
import { readFile } from 'node:fs/promises';
import type { IncomingMessage } from 'node:http';
import path from 'node:path';

import helmet from '@fastify/helmet';
import cors from '@fastify/cors';
import fastifyStatic from '@fastify/static';
import { ValidationPipe } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import type { FastifyReply } from 'fastify';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { Logger } from 'nestjs-pino';

import { AppModule } from '../app.module';
import { type AppConfig } from '../config/app.config';
import { HttpExceptionFilter } from '../common/filters/http-exception.filter';

export async function createApiApplication(): Promise<NestFastifyApplication> {
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
        root: path.join(dashboardRoot, 'assets'),
        prefix: '/admin/assets/',
        decorateReply: false,
        maxAge: '1h',
        immutable: false,
      });

      const renderDashboard = async (_request: unknown, reply: FastifyReply) =>
        reply.type('text/html; charset=utf-8').send(indexHtml);

      fastify.get('/admin', renderDashboard);
      fastify.get('/admin/', renderDashboard);
    }
  }

  const swaggerConfig = new DocumentBuilder()
    .setTitle('Universal E-Commerce API')
    .setDescription('Phase 00 foundation contract for the headless commerce backend.')
    .setVersion('1.0.0')
    .addServer(`/${config.apiPrefix}`)
    .addBearerAuth()
    .build();

  const document = SwaggerModule.createDocument(app, swaggerConfig);

  if (config.openapiEnabled) {
    SwaggerModule.setup(`${config.apiPrefix}/docs`, app, document, {
      jsonDocumentUrl: `${config.apiPrefix}/docs/json`,
    });
  }

  return app;
}
