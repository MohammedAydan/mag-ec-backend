# Affected Files

- apps/api/src/modules/catalog/controllers/catalog-public.controller.ts
- scripts/test-all-openapi-endpoints.mjs (new)
- scripts/smoke-test-endpoints.mjs
- apps/api/src/modules/identity/guards/permissions.guard.ts
- apps/api/src/modules/identity/guards/roles.guard.ts
- apps/api/src/modules/storage/object-storage.service.ts
- apps/api/src/modules/catalog/services/catalog-admin.service.ts
- apps/api/src/modules/inventory/services/inventory-core.service.ts
- apps/api/src/modules/payments/services/stripe-payment-gateway.service.ts
- apps/worker/src/storage/worker-storage.service.ts
- apps/worker/src/payments/stripe-payment-lifecycle.service.ts
- apps/worker/src/processors/inventory-expiry.processor.ts
- packages/domain-shared/src/s3-storage.ts

# Runtime Inputs

- API base URL: http://localhost:3000
- OpenAPI: packages/contracts/openapi/openapi.json

# Constraints

- No Docker usage.
- Keep changes minimal and non-destructive.
- Prefer fixing server-side runtime 500 errors first.

# Validation

- `pnpm build` passes.
- `pnpm test` passes.
- `pnpm test:e2e` passes.
- Smoke probe and OpenAPI probe both pass against the local dev server.

# Notes

- Existing smoke test showed `GET /api/v1/catalog/products` => 500 due to undefined `catalogPublicService` in controller context.
- The controller fallback was hardened and the endpoint now returns 200 in smoke tests.
