# Phase 07 Context

## Files to Create / Modify

- `apps/api/src/modules/carts/**`
- `apps/api/src/modules/checkout/**`
- `apps/api/src/modules/wishlist/**`
- `apps/api/src/app.module.ts`
- `docs/domain/**`
- `prisma/schema.prisma`
- `prisma/migrations/20260525_07_carts_wishlist_checkout_preview/migration.sql`
- `apps/api/test/e2e/*.e2e-spec.ts`

## New Dependencies to Add

- None expected

## Env Vars Needed

- None expected

## Open Questions

- Guest carts are persisted server-side only and addressed through opaque client-held guest tokens
- Wishlist sharing is out of scope unless later approved
