# Context: OpenAPI Contract Repair & Flutter SDK Generation

## Files to Create / Modify
- `plans/openapi-contract-repair/official-docs-notes.md` (NEW) - Official documentation notes
- `apps/api/src/generate-metadata.ts` (NEW) - Programmable metadata generator script
- `apps/api/src/scripts/generate-openapi.ts` (MODIFY) - Load Swagger metadata programmatically
- `apps/api/src/main.ts` (MODIFY) - Load Swagger metadata on bootstrap
- `apps/api/src/modules/**/*.controller.ts` (MODIFY) - Add route & param/query decorators where needed
- `apps/api/src/modules/**/*.dto.ts` (MODIFY) - Add property decorators / type annotations
- `packages/contracts/openapi/openapi.json` (MODIFY/REGENERATE) - Target OpenAPI contract
- `packages/contracts/generated/flutter/**` (MODIFY/REGENERATE) - Target generated Flutter SDK

## Dependencies
- `@nestjs/cli` (added as a devDependency in `@ecommerce/api`)

## Env Vars
- None (standard config is sufficient)

## Open Questions
- None.
