import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { PermissionsGuard } from '../../src/modules/identity/guards/permissions.guard';
import { AdminGuard } from '../../src/modules/identity/guards/admin.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';
import { PromotionsAdminController } from '../../src/modules/promotions/controllers/promotions-admin.controller';
import { PromotionAdminService } from '../../src/modules/promotions/services/promotion-admin.service';

describe('Promotions admin (e2e)', () => {
  let app: NestFastifyApplication;

  const mockPromotionAdminService = {
    upsertPromotion: jest.fn().mockResolvedValue({ key: 'summer-sale' }),
  };

  const mockTokenService = {
    verifyAccessToken: jest.fn((token: string) => {
      if (token === 'admin-token') {
        return {
          sub: 'admin_1',
          email: 'admin@example.com',
          userType: 'ADMIN' as const,
          roles: ['super_admin'],
          permissions: ['promotions.write'],
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
      controllers: [PromotionsAdminController],
      providers: [
        AuthGuard,
        AdminGuard,
        PermissionsGuard,
        Reflector,
        { provide: PromotionAdminService, useValue: mockPromotionAdminService },
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

  it('rejects promotion admin writes without authentication', async () => {
    await request(app.getHttpServer())
      .put('/api/v1/promotions/admin/summer-sale')
      .send({
        name: 'Summer Sale',
        status: 'ACTIVE',
        trigger: 'AUTOMATIC',
        rewardType: 'PERCENTAGE',
        percentageBps: 1000,
      })
      .expect(401);
  });

  it('rejects promotion admin writes without the required role and permission', async () => {
    await request(app.getHttpServer())
      .put('/api/v1/promotions/admin/summer-sale')
      .set('Authorization', 'Bearer limited-token')
      .send({
        name: 'Summer Sale',
        status: 'ACTIVE',
        trigger: 'AUTOMATIC',
        rewardType: 'PERCENTAGE',
        percentageBps: 1000,
      })
      .expect(403);
  });

  it('allows an authorized admin to upsert a promotion', async () => {
    await request(app.getHttpServer())
      .put('/api/v1/promotions/admin/summer-sale')
      .set('Authorization', 'Bearer admin-token')
      .send({
        name: 'Summer Sale',
        status: 'ACTIVE',
        trigger: 'AUTOMATIC',
        rewardType: 'PERCENTAGE',
        percentageBps: 1000,
      })
      .expect(200)
      .expect(({ body }: { body: { key: string } }) => {
        expect(body.key).toBe('summer-sale');
      });
  });
});
