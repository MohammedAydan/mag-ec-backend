# OpenAPI DTO Coverage Audit Review

## What Was Audited

- Every generated OpenAPI operation under `packages/contracts/openapi/openapi.json`.
- All exposed module feature tags under `apps/api/src/modules`.
- Request bodies, success response schemas, path parameters, header parameters, bearer/security metadata, and SDK empty-body extensions.

## Result

All exposed client-facing features are present in the OpenAPI contract and SDK-safe after this pass.

- 141 operations
- 30 feature tags
- 200 component schemas
- 0 path-parameter mismatches
- 0 duplicate header parameters
- 0 missing write request-body definitions except explicitly allowed empty-body actions
- 0 missing typed success responses
- 0 Flutter SDK audit errors or warnings

## Fixes Made

- Documented optional cart headers:
  - `Authorization`
  - `x-guest-cart-token`
- Documented optional checkout headers:
  - `Authorization`
  - `x-guest-cart-token`
  - `idempotency-key` on `POST /api/v1/checkout/place`
- Removed duplicate maintenance authorization header metadata by reading the header through `@Req()` and keeping one explicit `@ApiHeader`.
- Regenerated the OpenAPI contract.

## Intentional Exclusions

- `PaymentsWebhookController` remains excluded with `@ApiExcludeController()` because `/api/v1/payments/webhooks/stripe` is a Stripe provider callback, not a generated Flutter/admin client route.
- Internal infrastructure modules such as persistence, queue, and storage do not expose OpenAPI tags directly.

## Verification

- `pnpm.cmd --filter @ecommerce/api lint`
- `pnpm.cmd --filter @ecommerce/api typecheck`
- `pnpm.cmd openapi:verify`
- `pnpm.cmd flutter:client:audit`
- custom OpenAPI sanity audit
- `pnpm.cmd --filter @ecommerce/api test`
