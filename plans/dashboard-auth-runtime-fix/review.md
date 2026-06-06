# Dashboard Auth Runtime Fix Review

## What was built

- Added a Prisma schema guard so the API now fails fast on pending local migrations instead of starting and returning hidden 500s during login.
- Added a shared query-integer coercion helper and applied it across affected paginated admin and review/reporting handlers so string query params no longer reach Prisma as invalid `take` or pagination values.
- Added a shared response normalizer for `Date`, `Prisma.Decimal`, and `bigint` payload values before Fastify serialization.
- Simplified the embedded dashboard shell and login surface to use a more stock HeroUI presentation with less custom visual treatment.

## Edge cases handled

- Local login/runtime drift now reports the exact pending migration name at startup.
- Paginated admin routes now remain stable even if runtime query coercion metadata does not fire for `limit`, `page`, or `pageSize`.
- Shared response normalization prevents schema/serializer friction for raw Prisma values returned by admin list endpoints.

## Verification

- `pnpm.cmd --filter @ecommerce/api test -- query-int.spec.ts response-normalizer.spec.ts prisma-schema-guard.service.spec.ts`
- `pnpm.cmd --filter @ecommerce/api typecheck`
- `pnpm.cmd --filter @ecommerce/api build`
- `pnpm.cmd --filter @atelier/admin-dashboard typecheck`
- `pnpm.cmd --filter @atelier/admin-dashboard build`
- Live HTTP smoke against `http://127.0.0.1:3003`:
  - `POST /api/v1/auth/login` -> `200`
  - `GET /api/v1/payments/admin/attempts?limit=6` -> `200`
  - `GET /api/v1/audit/admin?limit=25` -> `200`
  - `GET /api/v1/inventory/admin/movements?limit=20` -> `200`
  - `GET /api/v1/inventory/admin/reservations?limit=20` -> `200`
  - `GET /api/v1/catalog/admin/products?limit=10` -> `200`

## Remaining follow-ups

- The dashboard production bundle still emits the existing large-chunk warning; this remains a performance follow-up rather than a runtime blocker.
