# OpenAPI Settings Audit

## Goal

Ensure the NestJS OpenAPI bootstrap, served documentation endpoints, generated contract, and route metadata are correctly configured for reliable API documentation and client generation.

## Acceptance Criteria

- OpenAPI is configured through `@nestjs/swagger` using the official NestJS `DocumentBuilder`, `SwaggerModule.createDocument`, and `SwaggerModule.setup` flow.
- Swagger UI and raw JSON contract endpoints are mounted predictably without conflicting with `/api/v1` REST routes or `/admin` static assets.
- Generated OpenAPI output includes stable operation IDs, documented bearer authentication, API versioning, and server metadata appropriate for local client generation.
- Existing OpenAPI generation/check scripts run successfully.
- Any incorrect settings or metadata warnings discovered during audit are fixed.

## Approach

- Compare the local Swagger bootstrap and generation scripts with the official NestJS OpenAPI introduction documentation.
- Inspect package dependencies, app bootstrap, OpenAPI helper modules, generated contract, and scripts.
- Fix configuration defects first, then route-level annotation issues that affect generation quality.
- Regenerate and validate the OpenAPI contract.

## Scope

### In Scope

- NestJS OpenAPI configuration and Swagger setup.
- OpenAPI generation/check scripts.
- Route metadata that causes invalid or degraded OpenAPI output.
- Planning and session-log closeout for this audit.

### Out of Scope

- Changing business behavior of API endpoints.
- Adding new API domains.
- Reworking dashboard UI or Flutter client code unless required by OpenAPI correctness.

## Dependencies

- Official NestJS OpenAPI documentation: `https://docs.nestjs.com/openapi/introduction`.
- Existing `@nestjs/swagger` package and generated contract under `packages/contracts/openapi/openapi.json`.

## Estimated Complexity

M
