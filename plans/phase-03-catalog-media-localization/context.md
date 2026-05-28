# Phase 03 Context

## Files to Create / Modify

- `apps/api/src/modules/catalog/**`
- `apps/api/test/e2e/**`
- `apps/api/test/integration/**`
- `apps/api/src/app.module.ts`
- `prisma/schema.prisma`
- `prisma/migrations/**`
- `prisma/seed.ts`
- `docs/domain/catalog-model.md`
- `docs/implementation-status.md`
- `docs/security/control-matrix.md`
- `plans/PATTERNS.md`
- `plans/context.md`
- `plans/SESSION_LOG.md`
- `packages/contracts/openapi/openapi.json`

## New Dependencies to Add

- Prefer no new dependency unless a real S3 presigner is required for the upload-intent contract

## Env Vars Needed

- Public/private storage bucket settings
- Public media base URL settings

## Open Questions

- Product type templates remain schema-level only for now; richer admin UX scaffolding is deferred to a later phase.
- Image derivative generation is deferred; phase 03 stores media metadata and attachment rules only.
- Text search remains filter and slug driven until a dedicated search adapter phase exists.

## Completion Notes

- Incremental catalog migration SQL was generated with `prisma migrate diff` against a temporary pre-catalog schema because no local MySQL runtime was available.
- Admin catalog routes are protected with the existing identity guards and `catalog.write` permission, and the catalog module now imports `IdentityModule` so real app boot resolves guard dependencies correctly.
- Representative bilingual fashion and perfume seeds now cover product types, attributes, options, brands, categories, collections, tags, products, variants, and product associations.
