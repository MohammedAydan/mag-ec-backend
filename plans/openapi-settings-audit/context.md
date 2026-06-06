# OpenAPI Settings Audit Context

## Created

- 2026-05-31

## Files To Inspect

- `package.json`
- `apps/api/src/main.ts`
- `apps/api/src/openapi/**`
- `apps/api/src/**/*.controller.ts`
- `scripts/**openapi**`
- `packages/contracts/openapi/openapi.json`

## Files Modified

- `apps/api/src/openapi/openapi.config.ts` - added shared OpenAPI config and document options.
- `apps/api/src/bootstrap/create-api-application.ts` - uses the shared OpenAPI config, removes duplicated `/api/v1` server metadata, and serves raw JSON only plus UI when enabled.
- `apps/api/src/scripts/generate-openapi.ts` - uses the shared OpenAPI config and removes debug/loose metadata handling.
- `apps/api/src/scripts/generate-metadata.ts` - cleaned up metadata generation typing and post-processing.
- `apps/api/src/modules/catalog/controllers/catalog-admin.controller.ts` - added typed success schemas for catalog admin operations.
- `apps/api/src/modules/catalog/dto/catalog-response.dto.ts` - added admin response DTOs and corrected public catalog response DTOs.
- `apps/api/src/modules/audit/dto/audit-response.dto.ts` - replaced `any` metadata types with `Record<string, unknown>`.
- `apps/api/src/modules/reporting/dto/reporting-response.dto.ts` - replaced `any` report-parameter type with `Record<string, unknown>`.
- `apps/api/src/modules/checkout/controllers/checkout.controller.ts` - removed unused OpenAPI import.
- `apps/api/src/modules/content/dto/content-response.dto.ts` - removed unused OpenAPI import.
- `apps/api/package.json` and `pnpm-lock.yaml` - removed stale `swagger-ui-express` dependency.
- `packages/contracts/openapi/openapi.json` - regenerated after DTO/config corrections.

## New Dependencies

- None. Removed stale `swagger-ui-express`; runtime OpenAPI uses `@nestjs/swagger` only.

## Env Vars Needed

- None expected for contract generation; local generation should not require MySQL or Redis.

## Open Questions

- None for this audit. `pnpm.cmd flutter:client:audit` now reports `errors: 0` and `warnings: 0`.

## Official Documentation Notes

- NestJS documents installing `@nestjs/swagger`, creating a `DocumentBuilder`, generating the document with `SwaggerModule.createDocument(app, config)`, and mounting docs with `SwaggerModule.setup(path, app, documentOrFactory, options)`.
- NestJS documents custom JSON document routes through `jsonDocumentUrl` and notes that raw definitions can be controlled independently from Swagger UI through setup options.

## Verification

- `pnpm.cmd --filter @ecommerce/api lint` - passed.
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed.
- `pnpm.cmd openapi:verify` - passed; 141 operations and stable regeneration.
- `pnpm.cmd flutter:client:audit` - passed; 141 operations, 140 typed success responses, 70 valid path parameters, 0 errors, 0 warnings.
- `pnpm.cmd typecheck` - passed at workspace root.
- `pnpm.cmd --filter @atelier/admin-dashboard lint` - passed. The earlier root `pnpm.cmd lint` run timed out at the dashboard lint step after domain/api/worker lint had completed; rerunning dashboard lint alone passed.
