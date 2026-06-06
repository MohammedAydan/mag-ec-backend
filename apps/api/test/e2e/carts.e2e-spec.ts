import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { CartController } from '../../src/modules/carts/controllers/cart.controller';
import { CartService } from '../../src/modules/carts/services/cart.service';
import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { CustomerGuard } from '../../src/modules/identity/guards/customer.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';
import { PrismaService } from '../../src/modules/persistence/services/prisma.service';

describe('Carts (e2e)', () => {
  let app: NestFastifyApplication;

  const mockCartService = {
    getOrCreateCart: jest.fn().mockResolvedValue({
      id: 'cart_1',
      guestToken: 'guest-token',
      userId: null,
      items: [],
    }),
    getCartOrThrow: jest.fn().mockResolvedValue({
      id: 'cart_1',
      guestToken: 'guest-token',
      userId: null,
      items: [],
    }),
    assertCartAccess: jest.fn(),
    addItem: jest.fn(),
    updateItemQuantity: jest.fn(),
    removeItem: jest.fn(),
    applyCoupon: jest.fn(),
    removeCoupon: jest.fn(),
    mergeGuestCartIntoUserCart: jest.fn().mockResolvedValue({
      id: 'cart_2',
      userId: 'user_1',
      items: [],
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
      controllers: [CartController],
      providers: [
        AuthGuard,
        CustomerGuard,
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
    await app.close();
  });

  it('creates or returns a guest cart', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/carts')
      .send({})
      .expect(201)
      .expect(({ body }: { body: { id: string } }) => {
        expect(body.id).toBe('cart_1');
      });
  });

  it('rejects unauthenticated merge requests', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/carts/merge')
      .send({ sourceGuestToken: 'guest-token' })
      .expect(401);
  });

  it('merges a guest cart into an authenticated cart', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/carts/merge')
      .set('Authorization', 'Bearer customer-token')
      .send({ sourceGuestToken: 'guest-token' })
      .expect(200)
      .expect(({ body }: { body: { userId: string } }) => {
        expect(body.userId).toBe('user_1');
      });
  });

  it('forbids admin tokens on cart merge route', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/carts/merge')
      .set('Authorization', 'Bearer admin-token')
      .send({ sourceGuestToken: 'guest-token' })
      .expect(403);
  });
});
