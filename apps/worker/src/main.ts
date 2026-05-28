import 'reflect-metadata';

import { NestFactory } from '@nestjs/core';
import { Logger, PinoLogger } from 'nestjs-pino';

import { WorkerModule } from './worker.module';

async function bootstrapWorker(): Promise<void> {
  const app = await NestFactory.createApplicationContext(WorkerModule, {
    bufferLogs: true,
  });
  const logger = app.get(PinoLogger);

  app.useLogger(app.get(Logger));
  logger.info(
    {
      status: 'ready',
    },
    'Worker bootstrap is ready for queue processors.',
  );
}

void bootstrapWorker();
