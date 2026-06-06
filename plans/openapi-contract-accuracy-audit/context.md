# Context

## Files to inspect first
- `apps/api/src/modules/promotions/**`
- `apps/api/src/modules/catalog/**`
- `apps/api/src/modules/orders/**`
- `apps/api/src/modules/carts/**`
- `apps/api/src/modules/checkout/**`
- `apps/api/src/modules/pricing/**`
- `apps/api/src/modules/returns/**`
- `apps/api/src/modules/fulfillment/**`
- `apps/api/src/modules/inventory/**`
- `apps/api/src/modules/payments/**`
- `apps/api/src/modules/reviews/**`
- `apps/api/src/modules/notifications/**`
- `apps/api/src/modules/reporting/**`
- `apps/api/src/openapi/**`
- `packages/contracts/openapi/openapi.json`
- `packages/contracts/openapi/verify-openapi-contract.ts`
- `apps/api/test/e2e/**`

## Files likely to change
- Promotions controllers/DTOs/tests for the key-based route conflict
- Shared pagination/query DTOs and controller decorators across catalog, pricing, orders, inventory, reporting, reviews, notifications, returns, and related admin/public list endpoints
- Protected controller decorators for missing `401` and `403` docs
- Audited action endpoints around checkout, carts, returns, fulfillment, and payments for success status metadata
- OpenAPI verification tests or scripts if they do not currently assert the new invariants
- `packages/contracts/openapi/openapi.json`
- New audit artifacts under this feature folder

## New dependencies
- None planned

## Environment / commands
- Prefer `pnpm.cmd` from the workspace root
- OpenAPI generation path: `pnpm.cmd openapi:generate`
- Contract verification path: `pnpm.cmd openapi:contract:verify`
- SDK verification path: `pnpm.cmd clients:verify`

## Open questions
- Whether any existing generated-client or downstream tests assume the conflicting promotions path or the current action-endpoint status codes
- Whether empty-body POST handling is enforced via a custom OpenAPI extension in generation code or via explicit document post-processing

## Outcome notes
- The conflicting promotions key-based path was updated in controller code, tests, dashboard route wiring, CLI smoke script, and the domain documentation note.
- Empty-body POST handling was already implemented via explicit `@ApiExtension('x-sdk-allow-empty-request-body', true)` decorators; no new runtime hook was needed.
- The strengthened verifier now covers the core contract invariants that were previously manual audit steps.
