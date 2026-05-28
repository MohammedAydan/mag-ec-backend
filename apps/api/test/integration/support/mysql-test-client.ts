import path from 'node:path';

import { PrismaMariaDb } from '@prisma/adapter-mariadb';
import { PrismaClient } from '@prisma/client/index';
import { config as loadEnv } from 'dotenv';

loadEnv({ path: path.resolve(process.cwd(), '../../.env'), quiet: true });
loadEnv({ path: path.resolve(process.cwd(), '.env'), quiet: true });

const defaultDatabaseUrl = 'mysql://root:root@localhost:3306/ecommerce';

export function createMysqlTestPrismaClient(): PrismaClient {
  const databaseUrl = process.env.DATABASE_URL ?? defaultDatabaseUrl;
  const url = new URL(databaseUrl);
  const adapter = new PrismaMariaDb({
    host: url.hostname,
    port: Number.parseInt(url.port || '3306', 10),
    user: decodeURIComponent(url.username),
    password: decodeURIComponent(url.password),
    database: url.pathname.replace(/^\//, ''),
    connectionLimit: 5,
  });

  return new PrismaClient({ adapter });
}

export async function assertMysqlDatabaseAvailable(
  prisma: PrismaClient,
  context: string,
  timeoutMs = 10_000,
): Promise<void> {
  try {
    await Promise.race([
      prisma.$queryRaw`SELECT 1`,
      new Promise((_, reject) => setTimeout(() => reject(new Error('timeout')), timeoutMs)),
    ]);
  } catch (error) {
    const message = error instanceof Error ? error.message : 'unknown error';
    throw new Error(
      `MySQL integration is enabled for ${context}, but the database is unavailable: ${message}`,
      {
        cause: error,
      },
    );
  }
}
