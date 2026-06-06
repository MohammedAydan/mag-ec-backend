import { URL } from 'node:url';
import { PrismaMariaDb } from '@prisma/adapter-mariadb';
import { PrismaClient } from '@prisma/client/index';
import * as dotenv from 'dotenv';
import * as path from 'path';

dotenv.config({ path: path.resolve(process.cwd(), '.env') });

const adminProductInclude = {
  translations: true,
  productType: { include: { translations: true } },
  brand: { include: { translations: true } },
  variants: {
    include: {
      translations: true,
      price: true,
      optionValues: {
        include: {
          attribute: { include: { translations: true } },
          option: { include: { translations: true } },
        },
      },
    },
    orderBy: [{ position: 'asc' as const }, { createdAt: 'asc' as const }],
  },
  categoryLinks: { include: { category: { include: { translations: true } } } },
  collectionLinks: { include: { collection: { include: { translations: true } } } },
  tagLinks: { include: { tag: { include: { translations: true } } } },
  media: {
    select: {
      id: true,
      objectKey: true,
      status: true,
      mediaType: true,
      role: true,
      mimeType: true,
      sizeBytes: true,
      variantId: true,
      checksum: true,
      attachedAt: true,
      sortOrder: true,
      translations: true,
      createdAt: true,
      updatedAt: true,
    },
    orderBy: [{ sortOrder: 'asc' as const }, { createdAt: 'asc' as const }],
  },
};

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

async function main() {
  const databaseUrl = process.env.DATABASE_URL;
  if (!databaseUrl) {
    throw new Error('DATABASE_URL is not set in environment');
  }

  const adapter = createMariaDbAdapter(databaseUrl);
  const prisma = new PrismaClient({
    adapter,
    log: ['query', 'info', 'warn', 'error'],
  });

  try {
    console.log('Connecting to database...');
    await prisma.$connect();
    console.log('Connected. Running query...');

    const products = await prisma.catalogProduct.findMany({
      where: {},
      include: adminProductInclude,
      orderBy: [{ updatedAt: 'desc' }, { id: 'desc' }],
      take: 51,
    });

    console.log(`Success! Retrieved ${products.length} products.`);
  } catch (error) {
    console.error('Error occurred running the query:');
    console.error(error);
  } finally {
    await prisma.$disconnect();
  }
}

main();
