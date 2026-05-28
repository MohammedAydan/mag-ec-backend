import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { CatalogAdminController } from '../../src/modules/catalog/controllers/catalog-admin.controller';
import { CatalogAdminService } from '../../src/modules/catalog/services/catalog-admin.service';
import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { PermissionsGuard } from '../../src/modules/identity/guards/permissions.guard';
import { AdminGuard } from '../../src/modules/identity/guards/admin.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';

describe('Catalog admin (e2e)', () => {
  let app: NestFastifyApplication;

  const mockCatalogAdminService = {
    createProductType: jest.fn().mockResolvedValue({ id: 'type_1', key: 'perfume' }),
  };

  const mockTokenService = {
    verifyAccessToken: jest.fn((token: string) => {
      if (token === 'admin-token') {
        return {
          sub: 'admin_1',
          email: 'admin@example.com',
          userType: 'ADMIN' as const,
          roles: ['super_admin'],
          permissions: ['catalog.write'],
        };
      }

      if (token === 'limited-token') {
        return {
          sub: 'admin_2',
          email: 'limited@example.com',
          userType: 'ADMIN' as const,
          roles: ['catalog_manager'],
          permissions: [],
        };
      }

      throw new Error('invalid token');
    }),
  };

  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      controllers: [CatalogAdminController],
      providers: [
        AuthGuard,
        AdminGuard,
        PermissionsGuard,
        Reflector,
        { provide: CatalogAdminService, useValue: mockCatalogAdminService },
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

  it('rejects admin writes without authentication', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/catalog/admin/product-types')
      .send({
        key: 'perfume',
        translations: [{ locale: 'en', name: 'Perfume', slug: 'perfume' }],
      })
      .expect(401);
  });

  it('rejects admin writes without the required role/permission', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/catalog/admin/product-types')
      .set('Authorization', 'Bearer limited-token')
      .send({
        key: 'perfume',
        translations: [{ locale: 'en', name: 'Perfume', slug: 'perfume' }],
      })
      .expect(403);
  });

  it('allows an authorized admin to create a product type', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/catalog/admin/product-types')
      .set('Authorization', 'Bearer admin-token')
      .send({
        key: 'perfume',
        translations: [{ locale: 'en', name: 'Perfume', slug: 'perfume' }],
      })
      .expect(201)
      .expect(({ body }: { body: { id: string } }) => {
        expect(body.id).toBe('type_1');
      });
  });
});
