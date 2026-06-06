import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
import { Test } from '@nestjs/testing';

import { AdminAuditController } from '../../src/modules/audit/controllers/admin-audit.controller';
import { AuditService } from '../../src/modules/audit/services/audit.service';
import { AdminContentController } from '../../src/modules/content/controllers/admin-content.controller';
import { ContentService } from '../../src/modules/content/services/content.service';
import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
import { PermissionsGuard } from '../../src/modules/identity/guards/permissions.guard';
import { AdminGuard } from '../../src/modules/identity/guards/admin.guard';
import { TokenService } from '../../src/modules/identity/services/token.service';
import { AdminNotificationsController } from '../../src/modules/notifications/controllers/admin-notifications.controller';
import { NotificationsService } from '../../src/modules/notifications/services/notifications.service';
import { AdminReportingController } from '../../src/modules/reporting/controllers/admin-reporting.controller';
import { ReportingService } from '../../src/modules/reporting/services/reporting.service';
import { AdminReviewsController } from '../../src/modules/reviews/controllers/admin-reviews.controller';
import { ReviewsService } from '../../src/modules/reviews/services/reviews.service';
import { PrismaService } from '../../src/modules/persistence/services/prisma.service';

const adminPermissions = [
  'audit.read',
  'content.read',
  'content.write',
  'notifications.read',
  'reports.read',
  'reports.write',
  'reviews.read',
  'reviews.moderate',
];

describe('Phase 11 admin security (e2e)', () => {
  let app: NestFastifyApplication;

  const mockAuditService = {
    listAuditLogs: jest.fn().mockResolvedValue({ items: [], nextCursor: null }),
  };
  const mockContentService = {
    listContentPages: jest.fn().mockResolvedValue([]),
    getAdminLegalReferences: jest.fn().mockResolvedValue({
      termsPageKey: null,
      privacyPageKey: null,
      returnsPageKey: null,
      shippingPageKey: null,
    }),
    upsertContentPage: jest.fn().mockResolvedValue({ key: 'terms' }),
    updateLegalReferences: jest.fn().mockResolvedValue({
      termsPageKey: 'terms',
      privacyPageKey: null,
      returnsPageKey: null,
      shippingPageKey: null,
    }),
  };
  const mockNotificationsService = {
    listAdminNotifications: jest.fn().mockResolvedValue({ items: [], nextCursor: null }),
  };
  const mockReportingService = {
    getSalesSummary: jest.fn().mockResolvedValue({ orders: { _count: { _all: 0 } } }),
    createExport: jest.fn().mockResolvedValue({ id: 'export_1', reportType: 'sales_summary' }),
  };
  const mockReviewsService = {
    listAdminReviews: jest.fn().mockResolvedValue({ items: [], nextCursor: null }),
    moderateReview: jest.fn().mockResolvedValue({ id: 'review_1', status: 'APPROVED' }),
  };

  const mockTokenService = {
    verifyAccessToken: jest.fn((token: string) => {
      if (token === 'admin-token') {
        return {
          sub: 'admin_1',
          email: 'admin@example.com',
          userType: 'ADMIN' as const,
          roles: ['super_admin'],
          permissions: adminPermissions,
        };
      }

      if (token === 'read-only-token') {
        return {
          sub: 'admin_2',
          email: 'readonly@example.com',
          userType: 'ADMIN' as const,
          roles: ['super_admin'],
          permissions: ['reports.read', 'content.read', 'reviews.read'],
        };
      }

      if (token === 'limited-token') {
        return {
          sub: 'admin_3',
          email: 'limited@example.com',
          userType: 'ADMIN' as const,
          roles: ['support_agent'],
          permissions: [],
        };
      }

      throw new Error('invalid token');
    }),
  };

  const mockPrismaService = {
    user: {
      findUnique: jest.fn().mockResolvedValue({ id: 'admin_1', tokenVersion: undefined, status: 'ACTIVE', deletedAt: null }),
    },
  };

  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      controllers: [
        AdminAuditController,
        AdminContentController,
        AdminNotificationsController,
        AdminReportingController,
        AdminReviewsController,
      ],
      providers: [
        AuthGuard,
        AdminGuard,
        PermissionsGuard,
        Reflector,
        { provide: AuditService, useValue: mockAuditService },
        { provide: ContentService, useValue: mockContentService },
        { provide: NotificationsService, useValue: mockNotificationsService },
        { provide: ReportingService, useValue: mockReportingService },
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

  it('rejects phase-11 admin reads without authentication', async () => {
    await request(app.getHttpServer()).get('/api/v1/reports/admin/sales-summary').expect(401);
    await request(app.getHttpServer()).get('/api/v1/audit/admin').expect(401);
    await request(app.getHttpServer()).get('/api/v1/content/admin/pages').expect(401);
    await request(app.getHttpServer()).get('/api/v1/notifications/admin').expect(401);
    await request(app.getHttpServer()).get('/api/v1/reviews/admin').expect(401);
  });

  it('rejects phase-11 admin reads without the required role', async () => {
    await request(app.getHttpServer())
      .get('/api/v1/reports/admin/sales-summary')
      .set('Authorization', 'Bearer limited-token')
      .expect(403);
  });

  it('rejects phase-11 admin writes without write permissions', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/reports/admin/exports')
      .set('Authorization', 'Bearer read-only-token')
      .send({ reportType: 'sales_summary', parameters: {} })
      .expect(403);

    await request(app.getHttpServer())
      .put('/api/v1/content/admin/pages/terms')
      .set('Authorization', 'Bearer read-only-token')
      .send({
        slug: 'terms',
        title: 'Terms',
        body: 'Terms body',
        status: 'PUBLISHED',
        isLegal: true,
      })
      .expect(403);

    await request(app.getHttpServer())
      .patch('/api/v1/reviews/admin/review_1/moderate')
      .set('Authorization', 'Bearer read-only-token')
      .send({ decision: 'APPROVE' })
      .expect(403);
  });

  it('rejects invalid report export types before service execution', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/reports/admin/exports')
      .set('Authorization', 'Bearer admin-token')
      .send({ reportType: 'full_customer_pii_dump', parameters: {} })
      .expect(400);

    expect(mockReportingService.createExport).not.toHaveBeenCalled();
  });

  it('allows fully authorized phase-11 admin actions', async () => {
    await request(app.getHttpServer())
      .post('/api/v1/reports/admin/exports')
      .set('Authorization', 'Bearer admin-token')
      .send({ reportType: 'sales_summary', parameters: {} })
      .expect(201);

    await request(app.getHttpServer())
      .patch('/api/v1/reviews/admin/review_1/moderate')
      .set('Authorization', 'Bearer admin-token')
      .send({ decision: 'APPROVE' })
      .expect(200);
  });
});
