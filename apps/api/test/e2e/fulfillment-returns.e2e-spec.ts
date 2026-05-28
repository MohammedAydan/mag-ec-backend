import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { PermissionsGuard } from '../../src/modules/identity/guards/permissions.guard';
import { AdminGuard } from '../../src/modules/identity/guards/admin.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';
import { AdminFulfillmentController } from '../../src/modules/fulfillment/controllers/admin-fulfillment.controller';
import { CustomerFulfillmentController } from '../../src/modules/fulfillment/controllers/customer-fulfillment.controller';
import { FulfillmentService } from '../../src/modules/fulfillment/services/fulfillment.service';
import { AdminReturnsController } from '../../src/modules/returns/controllers/admin-returns.controller';
import { CustomerReturnsController } from '../../src/modules/returns/controllers/customer-returns.controller';
import { ReturnsService } from '../../src/modules/returns/services/returns.service';

describe('Fulfillment and returns (e2e)', () => {
  let app: NestFastifyApplication;

  const mockFulfillmentService = {
    listCustomerShipments: jest.fn().mockResolvedValue([{ id: 'shipment_1' }]),
    listAdminShipments: jest.fn().mockResolvedValue([{ id: 'shipment_1' }]),
    createShipment: jest.fn().mockResolvedValue({ id: 'shipment_1' }),
    updateShipmentStatus: jest.fn().mockResolvedValue({ id: 'shipment_1', status: 'SHIPPED' }),
  };

  const mockReturnsService = {
    listCustomerReturns: jest.fn().mockResolvedValue([{ id: 'return_1' }]),
    getCustomerReturn: jest.fn().mockResolvedValue({ id: 'return_1' }),
    createCustomerReturn: jest.fn().mockResolvedValue({ id: 'return_1' }),
    listAdminReturns: jest.fn().mockResolvedValue([{ id: 'return_1' }]),
    getAdminReturn: jest.fn().mockResolvedValue({ id: 'return_1' }),
    reviewReturnRequest: jest.fn().mockResolvedValue({ id: 'return_1', status: 'APPROVED' }),
    receiveReturnRequest: jest.fn().mockResolvedValue({ id: 'return_1', status: 'RECEIVED' }),
    executeReturnRefund: jest.fn().mockResolvedValue({ id: 'return_1', status: 'CLOSED' }),
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
          permissions: [
            'orders.read',
            'orders.write',
            'returns.read',
            'returns.write',
            'inventory.write',
          ],
        };
      }

      throw new Error('invalid token');
    }),
  };

  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      controllers: [
        CustomerFulfillmentController,
        AdminFulfillmentController,
        CustomerReturnsController,
        AdminReturnsController,
      ],
      providers: [
        AuthGuard,
        AdminGuard,
        PermissionsGuard,
        { provide: FulfillmentService, useValue: mockFulfillmentService },
        { provide: ReturnsService, useValue: mockReturnsService },
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

  it('returns customer shipments for an owned order', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/orders/me/order_1/shipments')
      .set('Authorization', 'Bearer customer-token')
      .expect(200)
      .expect(({ body }: { body: Array<{ id: string }> }) => {
        expect(body[0]?.id).toBe('shipment_1');
      });
  });

  it('forbids customer tokens from creating admin shipments', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/orders/admin/order_1/shipments')
      .set('Authorization', 'Bearer customer-token')
      .send({
        carrierName: 'Manual Carrier',
        items: [{ orderLineId: 'line_1', quantity: 1 }],
      })
      .expect(403);
  });

  it('allows admins to review return requests', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/returns/admin/return_1/review')
      .set('Authorization', 'Bearer admin-token')
      .send({
        decision: 'approve',
      })
      .expect(201)
      .expect(({ body }: { body: { status: string } }) => {
        expect(body.status).toBe('APPROVED');
      });
  });

  it('lists authenticated customer returns', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/returns/me')
      .set('Authorization', 'Bearer customer-token')
      .expect(200)
      .expect(({ body }: { body: Array<{ id: string }> }) => {
        expect(body[0]?.id).toBe('return_1');
      });
  });
});
