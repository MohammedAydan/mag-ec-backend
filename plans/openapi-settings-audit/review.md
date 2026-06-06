# OpenAPI Settings Audit Review

## What Was Fixed

- Runtime Swagger setup now matches generated-contract setup and no longer advertises `/api/v1` in both `servers[].url` and operation paths.
- OpenAPI configuration is centralized in `apps/api/src/openapi/openapi.config.ts` so runtime docs and generated artifacts use the same title, description, bearer scheme, global-prefix handling, deep route scan, and operation ID factory.
- Swagger setup now uses the official NestJS `DocumentBuilder`, `SwaggerModule.createDocument`, and `SwaggerModule.setup` pattern with a document factory.
- Stale `swagger-ui-express` was removed because the project uses Fastify with `@nestjs/swagger`.
- Catalog admin endpoints now expose typed success schemas, clearing the SDK audit failures.
- Public catalog response DTOs now better match the actual mapped public catalog response shape.
- OpenAPI generation scripts no longer emit debug metadata import logs and avoid loose `any` typing.

## Edge Cases Handled

- The generated contract keeps `/api/v1` in operation paths and leaves `servers` empty so generated clients do not compose `/api/v1/api/v1`.
- The Swagger JSON route remains explicitly mounted at `api/v1/docs/json` when `OPENAPI_ENABLED=true`.
- Empty request-body actions remain intentionally marked with `x-sdk-allow-empty-request-body`.
- SDK audit confirms no 2xx response is missing a schema unless explicitly allowed.

## Known Limitations / Follow-Ups

- Root `pnpm.cmd lint` timed out while invoking dashboard lint after earlier package lint steps had completed. Running `pnpm.cmd --filter @atelier/admin-dashboard lint` separately passed, so no lint failure remains.
- Full Flutter client generation was not rerun because the contract audit was sufficient for OpenAPI settings and schema correctness in this slice.
