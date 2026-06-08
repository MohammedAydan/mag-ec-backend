import 'dotenv/config';

import { defineConfig } from 'prisma/config';

// ── Detect database provider from DATABASE_URL scheme ──
// Supported: mysql:// → MySQL (default), postgresql:// or postgres:// → PostgreSQL
function detectProvider(url: string): 'mysql' | 'postgresql' {
  if (/^postgres(ql)?:\/\//i.test(url)) return 'postgresql';
  return 'mysql';
}

// ── Fail-closed: require explicit DATABASE_URL in production / staging ──
const nodeEnv = (process.env.NODE_ENV ?? 'development').toLowerCase();
const vercelEnv = (process.env.VERCEL_ENV ?? '').toLowerCase();
const isProdOrStaging =
  nodeEnv === 'production' ||
  nodeEnv === 'staging' ||
  vercelEnv === 'production';
const rawUrl = process.env.DATABASE_URL?.trim();
if (isProdOrStaging && (!rawUrl || rawUrl.length === 0)) {
  throw new Error('DATABASE_URL is required in production and staging environments');
}
const databaseUrl = rawUrl ?? 'mysql://root:root@localhost:3306/ecommerce';
const provider = detectProvider(databaseUrl);

export default defineConfig({
  schema: provider === 'postgresql' ? 'prisma/schema.postgresql.prisma' : 'prisma/schema.prisma',
  migrations: {
    path: provider === 'postgresql' ? 'prisma/migrations-postgresql' : 'prisma/migrations',
    seed: 'tsx prisma/seed.ts',
  },
  datasource: {
    url: databaseUrl,
  },
});
