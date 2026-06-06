# Review: OpenAPI Contract Accuracy Audit

## What was built
- Repaired the promotions admin route conflict by moving key-based upsert from `PUT /api/v1/promotions/admin/{promotionKey}` to `PUT /api/v1/promotions/admin/by-key/{promotionKey}`.
- Corrected OpenAPI integer query schemas for audited pagination inputs across audit, catalog, inventory, payments, reporting, and reviews.
- Added the missing `403` documentation to `POST /api/v1/orders/me/{orderId}/cancel`.
- Corrected documented success codes from `201` to `200` where the endpoint computes or mutates existing resources instead of creating a standalone resource.
- Strengthened the contract verifier to fail on duplicate templated paths, duplicate or invalid `operationId`s, missing path parameters, missing `401`/`403` on secured operations, missing empty-body SDK extensions, integer query regressions, and unresolved local refs.
- Added a committed OpenAPI contract test that locks the repaired invariants into `openapi.json`.

## Endpoint changes
- Route change: `PUT /api/v1/promotions/admin/by-key/{promotionKey}` replaces `PUT /api/v1/promotions/admin/{promotionKey}`.
- Response documentation change: `POST /api/v1/orders/me/{orderId}/cancel` now documents `403`.
- Status code/documentation changes:
  - `POST /api/v1/carts/{id}/coupon` -> `200`
  - `POST /api/v1/carts/merge` -> `200`
  - `POST /api/v1/checkout/preview` -> `200`
  - `POST /api/v1/checkout/reserve` -> `200`
  - `POST /api/v1/pricing/checkout/preview` -> `200`
  - `POST /api/v1/returns/admin/{returnRequestId}/review` -> `200`
  - `POST /api/v1/returns/admin/{returnRequestId}/receive` -> `200`
  - `POST /api/v1/returns/admin/{returnRequestId}/refund` -> `200`

## Edge cases handled
- OpenAPI templated-path normalization now catches same-position parameter collisions even when the parameter names differ.
- Integer pagination fields now carry minimum bounds consistently, including endpoints that previously emitted `number` without `maximum` metadata in OpenAPI.
- Empty-body POST endpoints remain SDK-callable through `x-sdk-allow-empty-request-body: true`; no new gaps were introduced.

## Verification
- `pnpm.cmd openapi:generate`
- `pnpm.cmd openapi:contract:verify`
- `pnpm.cmd --filter @ecommerce/api typecheck`
- `pnpm.cmd --filter @ecommerce/api test -- openapi-contract.spec.ts`
- `pnpm.cmd --filter @ecommerce/api test:e2e -- promotions-admin.e2e-spec.ts carts.e2e-spec.ts checkout-preview.e2e-spec.ts fulfillment-returns.e2e-spec.ts`
- `pnpm.cmd clients:audit`
- `pnpm.cmd typescript:client:generate:fast`
- `pnpm.cmd flutter:client:generate:fast`
- `pnpm.cmd typescript:client:verify:fast`
- `pnpm.cmd flutter:client:verify:fast`

## Known limitations / follow-ups
- `clients:audit` still reports pre-existing warnings about public or inherited security intent and body-bearing `DELETE` success responses. They are warnings only; both SDK audits returned `0` errors.
- The client generator scripts required a determinism repair so staged verification writes canonical manifest paths and Flutter replacement tolerates Windows `EBUSY` rename failures.
- The promotions route rename is a breaking API change for any caller still using the old key-based path.
