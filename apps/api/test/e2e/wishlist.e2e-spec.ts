import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { WishlistController } from '../../src/modules/wishlist/controllers/wishlist.controller';
import { WishlistService } from '../../src/modules/wishlist/services/wishlist.service';
import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';

describe('Wishlist (e2e)', () => {
  let app: NestFastifyApplication;

  const mockWishlistService = {
    getWishlist: jest.fn().mockResolvedValue({
      id: 'wishlist_1',
      userId: 'user_1',
      items: [],
    }),
    addItem: jest.fn().mockResolvedValue({
      id: 'wishlist_1',
      userId: 'user_1',
      items: [{ variantId: 'variant_1' }],
    }),
    removeItem: jest.fn().mockResolvedValue({
      id: 'wishlist_1',
      userId: 'user_1',
      items: [],
    }),
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
      throw new Error('invalid token');
    }),
  };

  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      controllers: [WishlistController],
      providers: [
        AuthGuard,
        { provide: WishlistService, useValue: mockWishlistService },
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

  it('rejects unauthenticated wishlist reads', async () => {
    await request(app.getHttpServer()).get('/api/v1/wishlist').expect(401);
  });

  it('returns the authenticated user wishlist', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/wishlist')
      .set('Authorization', 'Bearer customer-token')
      .expect(200)
      .expect(({ body }: { body: { id: string } }) => {
        expect(body.id).toBe('wishlist_1');
      });
  });

  it('adds an item to the wishlist', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/wishlist/items')
      .set('Authorization', 'Bearer customer-token')
      .send({ variantId: 'variant_1' })
      .expect(201)
      .expect(({ body }: { body: { items: Array<{ variantId: string }> } }) => {
        expect(body.items[0]?.variantId).toBe('variant_1');
      });
  });
});
