import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { CartService } from '../../src/modules/carts/services/cart.service';
import { CheckoutController } from '../../src/modules/checkout/controllers/checkout.controller';
import { CheckoutPlacementService } from '../../src/modules/checkout/services/checkout-placement.service';
import { CheckoutPreviewService } from '../../src/modules/checkout/services/checkout-preview.service';
import { CustomerOrdersController } from '../../src/modules/orders/controllers/customer-orders.controller';
import { AdminOrdersController } from '../../src/modules/orders/controllers/admin-orders.controller';
import { OrderService } from '../../src/modules/orders/services/order.service';
import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { CustomerGuard } from '../../src/modules/identity/guards/customer.guard';
import { PermissionsGuard } from '../../src/modules/identity/guards/permissions.guard';
import { AdminGuard } from '../../src/modules/identity/guards/admin.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';
import { PrismaService } from '../../src/modules/persistence/services/prisma.service';

describe('Orders and checkout placement (e2e)', () => {
  let app: NestFastifyApplication;

  const mockCartService = {
    getCartOrThrow: jest.fn().mockResolvedValue({
      id: 'cart_1',
      guestToken: 'guest-token',
      userId: null,
      items: [{ variantId: 'variant_1', quantity: 2 }],
    }),
    assertCartAccess: jest.fn(),
  };

  const mockCheckoutPreviewService = {
    previewFromCart: jest.fn(),
  };

  const mockCheckoutPlacementService = {
    placeOrder: jest.fn().mockResolvedValue({
      id: 'order_1',
      orderNumber: 'ORD-20260525-ABCD1234',
    }),
  };

  const mockOrderService = {
    listCustomerOrders: jest.fn().mockResolvedValue([{ id: 'order_1' }]),
    getCustomerOrder: jest.fn().mockResolvedValue({ id: 'order_1' }),
    listAdminOrders: jest.fn().mockResolvedValue([{ id: 'order_1' }]),
    getAdminOrder: jest.fn().mockResolvedValue({ id: 'order_1' }),
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
          permissions: ['orders.read'],
        };
      }

      throw new Error('invalid token');
    }),
  };

  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      controllers: [CheckoutController, CustomerOrdersController, AdminOrdersController],
      providers: [
        AuthGuard,
        AdminGuard,
        CustomerGuard,
        PermissionsGuard,
        { provide: CartService, useValue: mockCartService },
        { provide: CheckoutPreviewService, useValue: mockCheckoutPreviewService },
        { provide: CheckoutPlacementService, useValue: mockCheckoutPlacementService },
        { provide: OrderService, useValue: mockOrderService },
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

  it('places a guest order when an idempotency key and guest token are supplied', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/checkout/place')
      .set('Idempotency-Key', 'idem-key')
      .set('x-guest-cart-token', 'guest-token')
      .send({
        cartId: 'cart_1',
        currencyCode: 'USD',
        countryCode: 'US',
        customerEmail: 'guest@example.com',
        shippingMethodKey: 'standard',
        paymentMethod: 'cash_on_delivery',
        shippingAddress: {
          recipientName: 'Guest User',
          phoneNumber: '+15551230000',
          countryCode: 'US',
          city: 'New York',
          addressLine1: '1 Example St',
        },
      })
      .expect(201)
      .expect(({ body }: { body: { id: string } }) => {
        expect(body.id).toBe('order_1');
      });

    expect(mockCheckoutPlacementService.placeOrder).toHaveBeenCalledWith(
      expect.objectContaining({
        cartId: 'cart_1',
      }),
      expect.objectContaining({
        guestToken: 'guest-token',
        idempotencyKey: 'idem-key',
      }),
    );
  });

  it('returns authenticated customer orders', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/orders/me')
      .set('Authorization', 'Bearer customer-token')
      .expect(200)
      .expect(({ body }: { body: Array<{ id: string }> }) => {
        expect(body[0]?.id).toBe('order_1');
      });
  });

  it('allows admins with orders.read permission to list orders', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/orders/admin')
      .set('Authorization', 'Bearer admin-token')
      .expect(200)
      .expect(({ body }: { body: Array<{ id: string }> }) => {
        expect(body[0]?.id).toBe('order_1');
      });
  });

  it('forbids customer tokens from the admin order listing route', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/orders/admin')
      .set('Authorization', 'Bearer customer-token')
      .expect(403);
  });

  it('forbids admin tokens on customer order routes', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/orders/me')
      .set('Authorization', 'Bearer admin-token')
      .expect(403);

    await request(app.getHttpServer())
      .get('/api/v1/orders/me/order_1')
      .set('Authorization', 'Bearer admin-token')
      .expect(403);
  });
});
