import 'dotenv/config';

import { defineConfig } from 'prisma/config';

// ── Fail-closed: require explicit DATABASE_URL in production / staging ──
const nodeEnv = (process.env.NODE_ENV ?? 'development').toLowerCase();
const isProdOrStaging = nodeEnv === 'production' || nodeEnv === 'staging';
const rawUrl = process.env.DATABASE_URL?.trim();
if (isProdOrStaging && (!rawUrl || rawUrl.length === 0)) {
  throw new Error('DATABASE_URL is required in production and staging environments');
}
const databaseUrl = rawUrl ?? 'mysql://root:root@localhost:3306/ecommerce';

export default defineConfig({
  schema: 'prisma/schema.prisma',
  migrations: {
    path: 'prisma/migrations',
    seed: 'tsx prisma/seed.ts',
  },
  datasource: {
    url: databaseUrl,
  },
});
