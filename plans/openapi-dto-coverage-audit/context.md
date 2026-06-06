# OpenAPI DTO Coverage Audit Context

## Created

- 2026-05-31

## User Concern

The user pasted generated Swagger plugin metadata from `apps/api/src/metadata.js` and asked whether all features, inputs, outputs, and DTO settings are present and correct for `apps/api/src/modules`.

## Files To Inspect

- `packages/contracts/openapi/openapi.json`
- `apps/api/src/modules/**/*.controller.ts`
- `apps/api/src/modules/**/*.dto.ts`
- `apps/api/src/openapi/openapi.config.ts`
- OpenAPI/Flutter audit scripts

## Expected Files To Modify

- `apps/api/src/modules/carts/controllers/cart.controller.ts` - documented optional `Authorization` and `x-guest-cart-token` headers.
- `apps/api/src/modules/checkout/controllers/checkout.controller.ts` - documented optional `Authorization`, `x-guest-cart-token`, and `idempotency-key` headers; reads idempotency key from the request header map.
- `apps/api/src/modules/runtime/controllers/maintenance.controller.ts` - removed duplicated generated/manual authorization header metadata by reading the secret from `@Req()`.
- `packages/contracts/openapi/openapi.json` - regenerated after header metadata fixes.

## Notes

- `apps/api/src/metadata.js` is generated Swagger plugin metadata. It may be verbose and include dynamic imports, but correctness must be judged from the generated OpenAPI contract and source decorators/DTOs.

## Audit Findings

- OpenAPI contract exposes 141 operations across 30 tags with 200 schemas.
- Feature tags present: Authentication, Identity, Identity Admin, Catalog Admin, Catalog Public, Pricing Admin, Pricing Public, Promotions Admin, Inventory Admin, Carts, Commerce Support Admin, Wishlist, Checkout, Orders, Orders Admin, Payments Admin, Fulfillment, Fulfillment Admin, Returns, Returns Admin, Reviews, Reviews Admin, Notifications, Notifications Admin, Reporting Admin, Audit Admin, Content, Content Admin, System Maintenance, Health.
- Internal modules without public controller tags are expected: persistence, queue, storage.
- Stripe webhook controller is intentionally excluded from OpenAPI with `@ApiExcludeController()` because it is provider-callback infrastructure, not a Flutter/admin client operation.
- Initial audit found duplicate maintenance `Authorization` header docs and missing cart/checkout operational header docs; both were fixed.

## Verification

- `pnpm.cmd --filter @ecommerce/api lint` - passed.
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed.
- `pnpm.cmd openapi:verify` - passed and stable.
- `pnpm.cmd flutter:client:audit` - passed with 0 errors and 0 warnings.
- Custom OpenAPI sanity audit - passed: no path parameter mismatches, duplicate header parameters, missing request bodies, or missing success schemas.
- `pnpm.cmd --filter @ecommerce/api test` - passed: 32 suites / 151 tests.
