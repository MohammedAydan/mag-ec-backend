import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { AuthController } from '../../src/modules/identity/controllers/auth.controller';
import { IdentityController } from '../../src/modules/identity/controllers/identity.controller';
import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { PermissionsGuard } from '../../src/modules/identity/guards/permissions.guard';
import { AdminGuard } from '../../src/modules/identity/guards/admin.guard';
import { AuthService } from '../../src/modules/identity/services/auth.service';
import { IdentityPolicyService } from '../../src/modules/identity/services/identity-policy.service';
import { TokenService } from '../../src/modules/identity/services/token.service';
import { UserService } from '../../src/modules/identity/services/user.service';
import { PrismaService } from '../../src/modules/persistence/services/prisma.service';

interface LoginResponseBody {
  accessToken: string;
}

interface ProfileResponseBody {
  id: string;
}

describe('Identity and auth (e2e)', () => {
  let app: NestFastifyApplication;

  const mockAuthService = {
    login: jest.fn(),
    getCurrentUserProfile: jest.fn(),
  };

  const mockTokenService = {
    verifyAccessToken: jest.fn((token: string) => {
      if (token === 'customer-token') {
        return {
          sub: 'customer_1',
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
          permissions: ['identity.read'],
        };
      }

      throw new Error('invalid token');
    }),
  };

  const mockUserService = {
    getUserProfileById: jest.fn((userId: string) => ({
      id: userId,
      email: `${userId}@example.com`,
      displayName: 'Test User',
      userType: 'CUSTOMER',
      status: 'ACTIVE',
      emailVerifiedAt: null,
      lastLoginAt: null,
      roles: [],
      permissions: [],
    })),
  };

  const mockPrismaService = {
    user: {
      findUnique: jest.fn().mockResolvedValue({ id: 'customer_1', tokenVersion: undefined, status: 'ACTIVE', deletedAt: null }),
    },
  };

  beforeAll(async () => {
    mockAuthService.login.mockResolvedValue({
      accessToken: 'access-token',
      refreshToken: 'refresh-token',
      user: {
        id: 'customer_1',
        email: 'customer@example.com',
        displayName: 'Customer User',
        userType: 'CUSTOMER',
      },
    });

    mockAuthService.getCurrentUserProfile.mockImplementation((userId: string) => ({
      id: userId,
      email: 'customer@example.com',
      displayName: 'Customer User',
      userType: 'CUSTOMER',
      status: 'ACTIVE',
      emailVerifiedAt: null,
      lastLoginAt: null,
      roles: ['customer'],
      permissions: [],
    }));

    const moduleRef = await Test.createTestingModule({
      controllers: [AuthController, IdentityController],
      providers: [
        AuthGuard,
        AdminGuard,
        PermissionsGuard,
        IdentityPolicyService,
        Reflector,
        { provide: AuthService, useValue: mockAuthService },
        { provide: PrismaService, useValue: mockPrismaService },
        { provide: TokenService, useValue: mockTokenService },
        { provide: UserService, useValue: mockUserService },
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

  it('allows a login request with valid credentials', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/auth/login')
      .send({
        email: 'customer@example.com',
        password: 'password123',
      })
      .expect(200)
      .expect(({ body }: { body: LoginResponseBody }) => {
        expect(body.accessToken).toBe('access-token');
      });
  });

  it('rejects protected profile access without a bearer token', async () => {
    await request(app.getHttpServer()).get('/api/v1/auth/me').expect(401);
  });

  it('rejects privilege escalation on the admin access-check route', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/identity/admin/access-check')
      .set('Authorization', 'Bearer customer-token')
      .expect(403);
  });

  it('rejects BOLA access to another customer profile', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/identity/users/customer_2/profile')
      .set('Authorization', 'Bearer customer-token')
      .expect(403);
  });

  it('allows a customer to read their own profile', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/identity/users/customer_1/profile')
      .set('Authorization', 'Bearer customer-token')
      .expect(200)
      .expect(({ body }: { body: ProfileResponseBody }) => {
        expect(body.id).toBe('customer_1');
      });
  });

  it('allows an admin with the required role and permission', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/identity/admin/access-check')
      .set('Authorization', 'Bearer admin-token')
      .expect(200)
      .expect({
        allowed: true,
      });
  });
});
