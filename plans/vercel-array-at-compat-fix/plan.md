# Plan: Vercel Array.at Compatibility Fix

## Goal
Remove `Array.prototype.at()` from API source so Vercel's postbuild TypeScript scan succeeds even when it uses a narrower library target.

## Acceptance Criteria
- [ ] No API source uses `.at()`
- [ ] Cursor pagination still returns the last item id only when a next page exists
- [ ] API typecheck passes locally
- [ ] API build passes locally
- [ ] Session state documents the Vercel compiler compatibility issue

## Approach
1. Replace `.at(-1)` cursor extraction with indexed access.
2. Scan for other modern collection methods likely to fail under Vercel's scan settings.
3. Verify the API compile path.
4. Update review and session state.

## Scope: IN
- `apps/api/src/modules/catalog/services/catalog-admin.service.ts`
- `apps/api/src/modules/payments/services/payment-admin.service.ts`
- Deployment plan/session documentation

## Scope: OUT
- Changing runtime pagination behavior
- Raising global TypeScript target/lib settings
- Dashboard source changes

## Dependencies
- Existing cursor pagination behavior
- Vercel postbuild scanner behavior shown in the 2026-06-07 08:01 UTC log

## Estimated Complexity: S
