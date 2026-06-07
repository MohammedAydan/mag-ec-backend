import { URL } from 'node:url';
import { Injectable, OnModuleDestroy } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PrismaMariaDb } from '@prisma/adapter-mariadb';
import { PrismaPg } from '@prisma/adapter-pg';
import { PrismaClient } from '@prisma/client';

import type { WorkerConfig } from '../config/worker.config';

function isPostgresUrl(url: string): boolean {
  return /^postgres(ql)?:\/\//i.test(url);
}

function createMariaDbAdapter(databaseUrl: string): PrismaMariaDb {
  const url = new URL(databaseUrl);

  return new PrismaMariaDb({
    host: url.hostname,
    port: Number.parseInt(url.port || '3306', 10),
    user: decodeURIComponent(url.username),
    password: decodeURIComponent(url.password),
    database: url.pathname.replace(/^\//, ''),
    connectionLimit: Number.parseInt(url.searchParams.get('connection_limit') ?? '5', 10),
  });
}

function createPgAdapter(databaseUrl: string): PrismaPg {
  return new PrismaPg({
    connectionString: databaseUrl,
  });
}

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleDestroy {
  constructor(configService: ConfigService) {
    const config = configService.getOrThrow<WorkerConfig>('worker');
    const dbUrl = config.databaseUrl;

    super({
      adapter: isPostgresUrl(dbUrl) ? createPgAdapter(dbUrl) : createMariaDbAdapter(dbUrl),
    });
  }

  async onModuleDestroy(): Promise<void> {
    await this.$disconnect();
  }
}
