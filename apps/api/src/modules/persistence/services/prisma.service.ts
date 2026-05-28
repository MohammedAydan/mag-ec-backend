import { URL } from 'node:url';

import { Inject, Injectable, OnModuleDestroy } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PrismaMariaDb } from '@prisma/adapter-mariadb';
import { PrismaClient } from '@prisma/client/index';

import type { AppConfig } from '../../../config/app.config';

function createMariaDbAdapter(databaseUrl: string): PrismaMariaDb {
  const url = new URL(databaseUrl);

  return new PrismaMariaDb({
    host: url.hostname,
    port: Number.parseInt(url.port || '3306', 10),
    user: decodeURIComponent(url.username),
    password: decodeURIComponent(url.password),
    database: url.pathname.replace(/^\//, ''),
    connectionLimit: Number.parseInt(url.searchParams.get('connection_limit') ?? '10', 10),
  });
}

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleDestroy {
  constructor(@Inject(ConfigService) configService: ConfigService) {
    const config = configService.getOrThrow<AppConfig>('app');

    super({
      adapter: createMariaDbAdapter(config.databaseUrl),
    });
  }

  async onModuleDestroy(): Promise<void> {
    await this.$disconnect();
  }
}
