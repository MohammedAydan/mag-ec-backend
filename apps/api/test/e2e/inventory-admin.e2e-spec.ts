import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { InventoryAdminController } from '../../src/modules/inventory/controllers/inventory-admin.controller';
import { InventoryCoreService } from '../../src/modules/inventory/services/inventory-core.service';
import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { PermissionsGuard } from '../../src/modules/identity/guards/permissions.guard';
import { AdminGuard } from '../../src/modules/identity/guards/admin.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';
import { PrismaService } from '../../src/modules/persistence/services/prisma.service';

describe('Inventory admin (e2e)', () => {
  let app: NestFastifyApplication;

  const mockInventoryCoreService = {
    adjustStock: jest.fn().mockResolvedValue({
      stockLevel: { id: 'sl_1', quantityOnHand: 110, quantityReserved: 0 },
      movement: { id: 'sm_1', type: 'RECEIPT', quantityChanged: 10 },
    }),
  };

  const mockPrismaService = {
    user: {
      findUnique: jest.fn().mockResolvedValue({ id: 'admin_1', tokenVersion: undefined, status: 'ACTIVE', deletedAt: null }),
    },
    stockLevel: {
      findMany: jest
        .fn()
        .mockResolvedValue([
          {
            id: 'sl_1',
            warehouseId: 'wh_1',
            variantId: 'var_1',
            quantityOnHand: 100,
            quantityReserved: 5,
          },
        ]),
    },
    stockMovement: {
      findMany: jest
        .fn()
        .mockResolvedValue([
          {
            id: 'sm_1',
            warehouseId: 'wh_1',
            variantId: 'var_1',
            quantityChanged: 100,
            type: 'RECEIPT',
            createdAt: new Date(),
          },
        ]),
      count: jest.fn().mockResolvedValue(1),
    },
  };

  const mockTokenService = {
    verifyAccessToken: jest.fn((token: string) => {
      if (token === 'admin-token') {
        return {
          sub: 'admin_1',
          email: 'admin@example.com',
          userType: 'ADMIN' as const,
          roles: ['super_admin'],
          permissions: ['inventory.read', 'inventory.write'],
        };
      }
      if (token === 'readonly-token') {
        return {
          sub: 'admin_2',
          email: 'readonly@example.com',
          userType: 'ADMIN' as const,
          roles: ['super_admin'],
          permissions: ['inventory.read'],
        };
      }
      if (token === 'no-inv-token') {
        return {
          sub: 'admin_3',
          email: 'noinv@example.com',
          userType: 'ADMIN' as const,
          roles: ['catalog_manager'],
          permissions: ['catalog.read'],
        };
      }
      throw new Error('invalid token');
    }),
  };

  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      controllers: [InventoryAdminController],
      providers: [
        AuthGuard,
        AdminGuard,
        PermissionsGuard,
        Reflector,
        { provide: InventoryCoreService, useValue: mockInventoryCoreService },
        { provide: PrismaService, useValue: mockPrismaService },
        { provide: TokenService, useValue: mockTokenService },
      ],
    }).compile();

    app = moduleRef.createNestApplication<NestFastifyApplication>(new FastifyAdapter());
    app.setGlobalPrefix('api/v1');
    app.useGlobalPipes(
      new ValidationPipe({
        whitelist: true,
        transform: true,
        forbidNonWhitelisted: true,
      }),
    );

    await app.init();
    await app.getHttpAdapter().getInstance().ready();
  });

  afterAll(async () => {
    await app.close();
  });

  // --- POST /adjustments ---
  describe('POST /api/v1/inventory/admin/adjustments', () => {
    it('rejects unauthenticated requests', async () => {
      await request(app.getHttpServer())
        .post('/api/v1/inventory/admin/adjustments')
        .send({ warehouseId: 'wh_1', variantId: 'var_1', quantityChanged: 10, type: 'RECEIPT' })
        .expect(401);
    });

    it('rejects users without inventory.write permission', async () => {
      await request(app.getHttpServer())
        .post('/api/v1/inventory/admin/adjustments')
        .set('Authorization', 'Bearer no-inv-token')
        .send({ warehouseId: 'wh_1', variantId: 'var_1', quantityChanged: 10, type: 'RECEIPT' })
        .expect(403);
    });

    it('rejects invalid payload — quantityChanged = 0', async () => {
      await request(app.getHttpServer())
        .post('/api/v1/inventory/admin/adjustments')
        .set('Authorization', 'Bearer admin-token')
        .send({ warehouseId: 'wh_1', variantId: 'var_1', quantityChanged: 0, type: 'RECEIPT' })
        .expect(400);
    });

    it('rejects invalid movement type', async () => {
      await request(app.getHttpServer())
        .post('/api/v1/inventory/admin/adjustments')
        .set('Authorization', 'Bearer admin-token')
        .send({ warehouseId: 'wh_1', variantId: 'var_1', quantityChanged: 5, type: 'INVALID_TYPE' })
        .expect(400);
    });

    it('allows an authorized admin to create a stock adjustment', async () => {
      await request(app.getHttpServer())
        .post('/api/v1/inventory/admin/adjustments')
        .set('Authorization', 'Bearer admin-token')
        .send({ warehouseId: 'wh_1', variantId: 'var_1', quantityChanged: 10, type: 'RECEIPT' })
        .expect(201)
        .expect(({ body }: { body: { stockLevel: { quantityOnHand: number } } }) => {
          expect(body.stockLevel.quantityOnHand).toBe(110);
        });
    });
  });

  // --- GET /levels ---
  describe('GET /api/v1/inventory/admin/levels', () => {
    it('rejects unauthenticated requests', async () => {
      await request(app.getHttpServer()).get('/api/v1/inventory/admin/levels').expect(401);
    });

    it('rejects users without inventory.read permission', async () => {
      await request(app.getHttpServer())
        .get('/api/v1/inventory/admin/levels')
        .set('Authorization', 'Bearer no-inv-token')
        .expect(403);
    });

    it('returns stock levels for authorized admin', async () => {
      await request(app.getHttpServer())
        .get('/api/v1/inventory/admin/levels')
        .set('Authorization', 'Bearer readonly-token')
        .expect(200)
        .expect(({ body }: { body: Array<{ id: string }> }) => {
          expect(Array.isArray(body)).toBe(true);
          expect(body.length).toBeGreaterThan(0);
        });
    });
  });

  // --- GET /movements ---
  describe('GET /api/v1/inventory/admin/movements', () => {
    it('rejects unauthenticated requests', async () => {
      await request(app.getHttpServer()).get('/api/v1/inventory/admin/movements').expect(401);
    });

    it('returns paginated movements for authorized admin', async () => {
      await request(app.getHttpServer())
        .get('/api/v1/inventory/admin/movements?page=1&limit=10')
        .set('Authorization', 'Bearer admin-token')
        .expect(200)
        .expect(({ body }: { body: { items: unknown[]; pagination: { total: number } } }) => {
          expect(Array.isArray(body.items)).toBe(true);
          expect(body.pagination.total).toBe(1);
        });
    });
  });
});
