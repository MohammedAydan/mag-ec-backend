import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { PricingAdminController } from '../../src/modules/pricing/controllers/pricing-admin.controller';
import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { PermissionsGuard } from '../../src/modules/identity/guards/permissions.guard';
import { AdminGuard } from '../../src/modules/identity/guards/admin.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';
import { PricingAdminService } from '../../src/modules/pricing/services/pricing-admin.service';

describe('Pricing admin (e2e)', () => {
  let app: NestFastifyApplication;

  const mockPricingAdminService = {
    updateStoreCurrency: jest.fn().mockResolvedValue({ key: 'store.currency' }),
  };

  const mockTokenService = {
    verifyAccessToken: jest.fn((token: string) => {
      if (token === 'admin-token') {
        return {
          sub: 'admin_1',
          email: 'admin@example.com',
          userType: 'ADMIN' as const,
          roles: ['super_admin'],
          permissions: ['pricing.write'],
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
      controllers: [PricingAdminController],
      providers: [
        AuthGuard,
        AdminGuard,
        PermissionsGuard,
        Reflector,
        { provide: PricingAdminService, useValue: mockPricingAdminService },
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

  it('rejects pricing admin writes without authentication', async () => {
    await request(app.getHttpServer())
      .put('/api/v1/pricing/admin/settings/currency')
      .send({ currencyCode: 'USD', symbol: '$', minorUnit: 2 })
      .expect(401);
  });

  it('rejects pricing admin writes without the required role and permission', async () => {
    await request(app.getHttpServer())
      .put('/api/v1/pricing/admin/settings/currency')
      .set('Authorization', 'Bearer limited-token')
      .send({ currencyCode: 'USD', symbol: '$', minorUnit: 2 })
      .expect(403);
  });

  it('allows an authorized admin to update store currency settings', async () => {
    await request(app.getHttpServer())
      .put('/api/v1/pricing/admin/settings/currency')
      .set('Authorization', 'Bearer admin-token')
      .send({ currencyCode: 'USD', symbol: '$', minorUnit: 2 })
      .expect(200)
      .expect(({ body }: { body: { key: string } }) => {
        expect(body.key).toBe('store.currency');
      });
  });
});
