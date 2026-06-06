import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { CustomerReviewsController } from '../../src/modules/reviews/controllers/customer-reviews.controller';
import { ReviewsService } from '../../src/modules/reviews/services/reviews.service';
import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { CustomerGuard } from '../../src/modules/identity/guards/customer.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';
import { PrismaService } from '../../src/modules/persistence/services/prisma.service';

describe('Customer Reviews (e2e)', () => {
  let app: NestFastifyApplication;

  const mockReviewsService = {
    createVerifiedReview: jest.fn().mockResolvedValue({
      id: 'review_1',
      rating: 5,
      title: 'Great product',
      body: 'Really enjoyed it',
      status: 'PENDING',
    }),
    listMyReviews: jest.fn().mockResolvedValue({
      items: [{ id: 'review_1', rating: 5 }],
      nextCursor: null,
    }),
    getMyReview: jest.fn().mockResolvedValue({
      id: 'review_1',
      rating: 5,
      title: 'Great product',
      body: 'Really enjoyed it',
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
      controllers: [CustomerReviewsController],
      providers: [
        AuthGuard,
        CustomerGuard,
        { provide: ReviewsService, useValue: mockReviewsService },
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

  it('rejects unauthenticated review reads', async () => {
    await request(app.getHttpServer()).get('/api/v1/reviews/me').expect(401);
  });

  it('returns the authenticated user reviews', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/reviews/me')
      .set('Authorization', 'Bearer customer-token')
      .expect(200)
      .expect(({ body }: { body: { items: Array<{ id: string }> } }) => {
        expect(body.items[0]?.id).toBe('review_1');
      });
  });

  it('creates a verified purchase review', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/reviews/order-lines/line_1')
      .set('Authorization', 'Bearer customer-token')
      .send({ rating: 5, title: 'Great product', body: 'Really enjoyed it' })
      .expect(201)
      .expect(({ body }: { body: { id: string } }) => {
        expect(body.id).toBe('review_1');
      });
  });

  it('forbids admin tokens on customer review routes', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/reviews/me')
      .set('Authorization', 'Bearer admin-token')
      .expect(403);

    await request(app.getHttpServer())
      .get('/api/v1/reviews/me/review_1')
      .set('Authorization', 'Bearer admin-token')
      .expect(403);

    await request(app.getHttpServer())
      .post('/api/v1/reviews/order-lines/line_1')
      .set('Authorization', 'Bearer admin-token')
      .send({ rating: 5, title: 'Great product', body: 'Really enjoyed it' })
      .expect(403);
  });
});
