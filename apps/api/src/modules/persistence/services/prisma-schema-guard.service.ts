import { existsSync } from 'node:fs';
import { readdir } from 'node:fs/promises';
import path from 'node:path';

import { Inject, Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Prisma } from '@prisma/client';

import type { AppConfig } from '../../../config/app.config';
import { PrismaService } from './prisma.service';

interface AppliedMigrationRow {
  migration_name: string | null;
}

@Injectable()
export class PrismaSchemaGuardService {
  private readonly logger = new Logger(PrismaSchemaGuardService.name);

  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(ConfigService) private readonly configService: ConfigService,
  ) {}

  async assertSchemaIsCurrent(): Promise<void> {
    const config = this.configService.getOrThrow<AppConfig>('app');
    if (!config.schemaGuardEnabled) {
      return;
    }

    const pendingMigrations = await this.findPendingMigrationNames();

    if (pendingMigrations.length === 0) {
      return;
    }

    const migrationList = pendingMigrations.join(', ');
    this.logger.error(`Pending Prisma migrations detected: ${migrationList}`);

    throw new Error(
      `Database schema is behind the checked-out code. Pending Prisma migrations: ${migrationList}. ` +
        'Apply them before starting the API, for example with `pnpm.cmd prisma migrate deploy`.',
    );
  }

  async findPendingMigrationNames(): Promise<string[]> {
    const migrationsRoot = resolveMigrationsRoot();
    if (!migrationsRoot) {
      return [];
    }

    const localMigrationNames = await listLocalMigrationNames(migrationsRoot);
    if (localMigrationNames.length === 0) {
      return [];
    }

    try {
      const appliedRows = await this.prisma.$queryRawUnsafe<AppliedMigrationRow[]>(
        'SELECT migration_name FROM _prisma_migrations WHERE finished_at IS NOT NULL AND rolled_back_at IS NULL',
      );

      return findPendingMigrationNames(
        localMigrationNames,
        appliedRows.map((row) => row.migration_name).filter((name): name is string => !!name),
      );
    } catch (error) {
      // `prisma db push` does not create the _prisma_migrations table.
      // In that case there are no tracked migrations — treat as fully in sync.
      if (
        error instanceof Prisma.PrismaClientKnownRequestError &&
        (error.code === 'P2021' || error.code === 'P2010')
      ) {
        return [];
      }

      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        throw new Error(
          `Unable to verify Prisma migration state against the current database: ${error.message}`,
          { cause: error },
        );
      }

      throw error;
    }
  }
}

export function findPendingMigrationNames(
  localMigrationNames: string[],
  appliedMigrationNames: string[],
): string[] {
  const applied = new Set(appliedMigrationNames);
  return localMigrationNames.filter((migrationName) => !applied.has(migrationName));
}

function resolveMigrationsRoot(): string | null {
  const candidates = [
    path.resolve(process.cwd(), 'prisma/migrations'),
    path.resolve(__dirname, '../../../../../../prisma/migrations'),
  ];

  return candidates.find((candidate) => existsSync(candidate)) ?? null;
}

async function listLocalMigrationNames(migrationsRoot: string): Promise<string[]> {
  const entries = await readdir(migrationsRoot, { withFileTypes: true });

  return entries
    .filter((entry) => entry.isDirectory())
    .map((entry) => entry.name)
    .sort((left, right) => left.localeCompare(right));
}
