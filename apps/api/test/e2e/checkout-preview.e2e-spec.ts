import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { CartService } from '../../src/modules/carts/services/cart.service';
import { CheckoutController } from '../../src/modules/checkout/controllers/checkout.controller';
import { CheckoutPlacementService } from '../../src/modules/checkout/services/checkout-placement.service';
import { CheckoutPreviewService } from '../../src/modules/checkout/services/checkout-preview.service';
import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { CustomerGuard } from '../../src/modules/identity/guards/customer.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';
import { PrismaService } from '../../src/modules/persistence/services/prisma.service';

describe('Checkout preview (e2e)', () => {
  let app: NestFastifyApplication;

  const mockCheckoutPreviewService = {
    previewFromCart: jest.fn().mockResolvedValue({
      cartId: 'cart_1',
      reservationKey: null,
      reservationExpiresAt: null,
      items: [],
      shippingMethods: [],
      paymentReadiness: {
        cashOnDeliveryAvailable: true,
        onlinePaymentAvailable: false,
      },
    }),
  };

  const mockCartService = {
    getCartOrThrow: jest.fn().mockResolvedValue({
      id: 'cart_1',
      guestToken: 'guest-token',
      userId: null,
      items: [],
    }),
    assertCartAccess: jest.fn(),
  };

  const mockCheckoutPlacementService = {
    placeOrder: jest.fn(),
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
      controllers: [CheckoutController],
      providers: [
        AuthGuard,
        CustomerGuard,
        { provide: CheckoutPreviewService, useValue: mockCheckoutPreviewService },
        { provide: CheckoutPlacementService, useValue: mockCheckoutPlacementService },
        { provide: CartService, useValue: mockCartService },
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
    if (app) {
      await app.close();
    }
  });

  it('returns a guest checkout preview when a valid guest cart token is supplied', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/checkout/preview')
      .set('x-guest-cart-token', 'guest-token')
      .send({ cartId: 'cart_1', currencyCode: 'USD', countryCode: 'US' })
      .expect(200)
      .expect(({ body }: { body: { cartId: string } }) => {
        expect(body.cartId).toBe('cart_1');
      });
  });

  it('rejects unauthenticated reservation requests', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/checkout/reserve')
      .send({ cartId: 'cart_1', currencyCode: 'USD', countryCode: 'US' })
      .expect(401);
  });

  it('creates an authenticated reservation preview', async () => {
    mockCartService.getCartOrThrow.mockResolvedValueOnce({
      id: 'cart_1',
      guestToken: null,
      userId: 'user_1',
      items: [],
    });
    mockCheckoutPreviewService.previewFromCart.mockResolvedValueOnce({
      cartId: 'cart_1',
      reservationKey: 'checkout-preview-cart_1-123',
      reservationExpiresAt: new Date().toISOString(),
      items: [],
      shippingMethods: [],
      paymentReadiness: {
        cashOnDeliveryAvailable: true,
        onlinePaymentAvailable: false,
      },
    });

    await request(app.getHttpServer())
      .post('/api/v1/checkout/reserve')
      .set('Authorization', 'Bearer customer-token')
      .send({ cartId: 'cart_1', currencyCode: 'USD', countryCode: 'US' })
      .expect(200)
      .expect(({ body }: { body: { reservationKey: string } }) => {
        expect(body.reservationKey).toBe('checkout-preview-cart_1-123');
      });
  });

  it('forbids admin tokens on checkout reserve route', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/checkout/reserve')
      .set('Authorization', 'Bearer admin-token')
      .send({ cartId: 'cart_1', currencyCode: 'USD', countryCode: 'US' })
      .expect(403);
  });
});
