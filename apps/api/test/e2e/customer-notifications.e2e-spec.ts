import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { CustomerNotificationsController } from '../../src/modules/notifications/controllers/customer-notifications.controller';
import { NotificationsService } from '../../src/modules/notifications/services/notifications.service';
import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { CustomerGuard } from '../../src/modules/identity/guards/customer.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';
import { PrismaService } from '../../src/modules/persistence/services/prisma.service';

describe('Customer Notifications (e2e)', () => {
  let app: NestFastifyApplication;

  const mockNotificationsService = {
    listMyNotifications: jest.fn().mockResolvedValue({
      items: [{ id: 'notif_1', eventType: 'ORDER_PLACED', status: 'SENT', channel: 'EMAIL', title: 'Order Placed', deduplicationKey: 'dk_1', attempts: 1, createdAt: new Date().toISOString(), updatedAt: new Date().toISOString() }],
      nextCursor: null,
    }),
    getMyPreference: jest.fn().mockResolvedValue({
      id: 'pref_1',
      userId: 'user_1',
      channel: 'EMAIL',
      orderConfirmations: true,
      orderShipments: true,
      orderDeliveries: false,
      returnStatusUpdates: true,
      reviewReplies: false,
      backInStock: true,
      lowStockAlerts: false,
      promotionalMessages: false,
      createdAt: new Date(),
      updatedAt: new Date(),
    }),
    upsertMyPreference: jest.fn().mockResolvedValue({
      id: 'pref_1',
      userId: 'user_1',
      channel: 'EMAIL',
      orderConfirmations: true,
      orderShipments: true,
      orderDeliveries: false,
      returnStatusUpdates: true,
      reviewReplies: false,
      backInStock: false,
      lowStockAlerts: false,
      promotionalMessages: true,
      createdAt: new Date(),
      updatedAt: new Date(),
    }),
    registerMyPushDevice: jest.fn().mockResolvedValue({
      id: 'device_1',
      platform: 'ios',
      token: 'abc123',
    }),
    unregisterMyPushDevice: jest.fn().mockResolvedValue({
      id: 'device_1',
      platform: 'ios',
      removed: true,
    }),
  };

  const mockPrismaService = {
    user: {
      findUnique: jest.fn().mockResolvedValue({ id: 'user_1', tokenVersion: undefined, status: 'ACTIVE', deletedAt: null }),
    },
  };

  const mockTokenService = {
    verifyAccessToken: jest.fn((token: string) => {
      if (token === 'customer-token') {
        return {
          sub: 'user_1',
          email: 'customer@example.com',
          userType: 'CUSTOMER' as const,
          roles: ['customer'],
          permissions: [],
        };
      }

      if (token === 'admin-token') {
        return {
          sub: 'admin_1',
          email: 'admin@example.com',
          userType: 'ADMIN' as const,
          roles: ['super_admin'],
          permissions: [],
        };
      }

      throw new Error('invalid token');
    }),
  };

  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      controllers: [CustomerNotificationsController],
      providers: [
        AuthGuard,
        CustomerGuard,
        { provide: NotificationsService, useValue: mockNotificationsService },
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

  it('rejects unauthenticated notification reads', async () => {
    await request(app.getHttpServer()).get('/api/v1/notifications/me').expect(401);
  });

  it('returns the authenticated user notifications', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/notifications/me')
      .set('Authorization', 'Bearer customer-token')
      .expect(200)
      .expect(({ body }: { body: { items: Array<{ id: string }> } }) => {
        expect(body.items[0]?.id).toBe('notif_1');
      });
  });

  it('returns notification preferences for the authenticated user', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/notifications/me/preferences')
      .set('Authorization', 'Bearer customer-token')
      .expect(200)
      .expect(({ body }: { body: { channel: string; orderConfirmations: boolean } }) => {
        expect(body.channel).toBe('EMAIL');
        expect(body.orderConfirmations).toBe(true);
      });
  });

  it('upserts notification preferences', async () => {
    await request(app.getHttpServer())
      .put('/api/v1/notifications/me/preferences')
      .set('Authorization', 'Bearer customer-token')
      .send({ channel: 'EMAIL', promotionalMessages: true, backInStock: false })
      .expect(200)
      .expect(({ body }: { body: { promotionalMessages: boolean } }) => {
        expect(body.promotionalMessages).toBe(true);
      });
  });

  it('registers a push device', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/notifications/me/push-devices')
      .set('Authorization', 'Bearer customer-token')
      .send({ platform: 'ios', token: 'abc123' })
      .expect(201)
      .expect(({ body }: { body: { id: string } }) => {
        expect(body.id).toBe('device_1');
      });
  });

  it('forbids admin tokens on customer notification routes', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/notifications/me')
      .set('Authorization', 'Bearer admin-token')
      .expect(403);

    await request(app.getHttpServer())
      .get('/api/v1/notifications/me/preferences')
      .set('Authorization', 'Bearer admin-token')
      .expect(403);

    await request(app.getHttpServer())
      .put('/api/v1/notifications/me/preferences')
      .set('Authorization', 'Bearer admin-token')
      .send({ channel: 'EMAIL', promotionalMessages: false })
      .expect(403);

    await request(app.getHttpServer())
      .post('/api/v1/notifications/me/push-devices')
      .set('Authorization', 'Bearer admin-token')
      .send({ platform: 'ios', token: 'abc123' })
      .expect(403);

    await request(app.getHttpServer())
      .delete('/api/v1/notifications/me/push-devices/device_1')
      .set('Authorization', 'Bearer admin-token')
      .expect(403);
  });
});
