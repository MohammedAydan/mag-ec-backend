import { readFileSync } from 'node:fs';
import path from 'node:path';

type OpenApiSpec = {
  paths: Record<string, Record<string, { responses?: Record<string, unknown>; parameters?: Array<{ name: string; in: string; schema?: Record<string, unknown> }>; security?: unknown[]; [key: string]: unknown }>>;
};

function readSpec(): OpenApiSpec {
  const specPath = path.resolve(__dirname, '../../../../packages/contracts/openapi/openapi.json');
  return JSON.parse(readFileSync(specPath, 'utf8')) as OpenApiSpec;
}

function getOperation(spec: OpenApiSpec, routePath: string, method: 'get' | 'post' | 'put' | 'patch' | 'delete') {
  const operation = spec.paths[routePath]?.[method];
  expect(operation).toBeDefined();
  return operation!;
}

describe('OpenAPI contract', () => {
  it('uses the explicit promotions by-key route and removes the conflicting templated path', () => {
    const spec = readSpec();

    expect(spec.paths['/api/v1/promotions/admin/by-key/{promotionKey}']?.put).toBeDefined();
    expect(spec.paths['/api/v1/promotions/admin/{promotionKey}']).toBeUndefined();
  });

  it('documents pagination query parameters as integers with minimum bounds', () => {
    const spec = readSpec();
    const cases: Array<[string, 'get', string]> = [
      ['/api/v1/catalog/admin/products', 'get', 'limit'],
      ['/api/v1/catalog/products', 'get', 'page'],
      ['/api/v1/catalog/products', 'get', 'pageSize'],
      ['/api/v1/inventory/admin/movements', 'get', 'page'],
      ['/api/v1/inventory/admin/movements', 'get', 'limit'],
      ['/api/v1/inventory/admin/reservations', 'get', 'limit'],
      ['/api/v1/payments/admin/attempts', 'get', 'limit'],
      ['/api/v1/payments/admin/webhook-events', 'get', 'limit'],
      ['/api/v1/payments/admin/refunds', 'get', 'limit'],
      ['/api/v1/reports/admin/exports', 'get', 'limit'],
      ['/api/v1/audit/admin', 'get', 'limit'],
      ['/api/v1/reviews/admin', 'get', 'limit'],
      ['/api/v1/reviews/me', 'get', 'limit'],
    ];

    for (const [routePath, method, parameterName] of cases) {
      const operation = getOperation(spec, routePath, method);
      const parameter = operation.parameters?.find(
        (candidate) => candidate.in === 'query' && candidate.name === parameterName,
      );

      expect(parameter).toBeDefined();
      expect(parameter?.schema?.type).toBe('integer');
      expect(parameter?.schema?.minimum).toBeGreaterThanOrEqual(1);
    }
  });

  it('documents 401 and 403 on protected customer order cancellation', () => {
    const spec = readSpec();
    const operation = getOperation(spec, '/api/v1/orders/me/{orderId}/cancel', 'post');

    expect(operation.security?.length).toBeGreaterThan(0);
    expect(operation.responses?.['401']).toBeDefined();
    expect(operation.responses?.['403']).toBeDefined();
  });

  it('uses 200 for preview and mutation-result endpoints that do not create standalone resources', () => {
    const spec = readSpec();
    const cases: Array<[string, 'post']> = [
      ['/api/v1/carts/{id}/coupon', 'post'],
      ['/api/v1/carts/merge', 'post'],
      ['/api/v1/checkout/preview', 'post'],
      ['/api/v1/checkout/reserve', 'post'],
      ['/api/v1/pricing/checkout/preview', 'post'],
      ['/api/v1/returns/admin/{returnRequestId}/review', 'post'],
      ['/api/v1/returns/admin/{returnRequestId}/receive', 'post'],
      ['/api/v1/returns/admin/{returnRequestId}/refund', 'post'],
    ];

    for (const [routePath, method] of cases) {
      const operation = getOperation(spec, routePath, method);
      expect(operation.responses?.['200']).toBeDefined();
      expect(operation.responses?.['201']).toBeUndefined();
    }
  });

  it('marks intentional empty-body POST actions with the SDK extension', () => {
    const spec = readSpec();
    const cases: Array<[string, 'post']> = [
      ['/api/v1/catalog/admin/brands/{brandId}/publish', 'post'],
      ['/api/v1/catalog/admin/brands/{brandId}/archive', 'post'],
      ['/api/v1/identity/admin/staff/{staffId}/resend-invitation', 'post'],
      ['/api/v1/auth/verification/request', 'post'],
      ['/api/v1/notifications/admin/{notificationId}/retry', 'post'],
    ];

    for (const [routePath, method] of cases) {
      const operation = getOperation(spec, routePath, method);
      expect(operation.requestBody).toBeUndefined();
      expect(operation['x-sdk-allow-empty-request-body']).toBe(true);
    }
  });
});
