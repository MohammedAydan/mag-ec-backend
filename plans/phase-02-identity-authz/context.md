# Phase 02 Context

## Files to Create / Modify

- `apps/api/src/modules/identity/**`
- `apps/api/test/**`
- `docs/api/authentication.md`
- `docs/security/control-matrix.md`
- `packages/contracts/openapi/openapi.json`
- `prisma/schema.prisma`
- `prisma/migrations/20260525_02_identity_account_tokens/migration.sql`

## New Dependencies to Add

- None required. Phase 02 reused `@nestjs/jwt`, Argon2, Prisma, and existing Nest test tooling already installed earlier.

## Env Vars Needed

- JWT access secret and TTL
- JWT refresh secret and TTL
- Optional password reset or verification URL bases

## Files Created in This Phase

- `apps/api/src/modules/identity/controllers/identity.controller.ts`
- `apps/api/src/modules/identity/services/account-action-token.service.ts`
- `apps/api/src/modules/identity/services/account-action-token.service.spec.ts`
- `apps/api/src/modules/identity/services/identity-policy.service.ts`
- `apps/api/src/modules/identity/services/identity-policy.service.spec.ts`
- `apps/api/test/e2e/identity-authz.e2e-spec.ts`
- `apps/api/test/integration/identity.integration.spec.ts`
- `docs/api/authentication.md`
- `plans/phase-02-identity-authz/review.md`
- `prisma/migrations/20260525_02_identity_account_tokens/migration.sql`

## Open Questions

- Whether admin and customer authentication should eventually use split JWT audiences
- Whether email verification should become mandatory before storefront checkout in a later phase
- Which delivery provider will carry verification and reset links when notification adapters are introduced
