# Flutter Client Runtime Hardening Review

## What Was Built

- Fixed Pricing Admin OpenAPI request bodies so generated Dart APIs use concrete DTO request models instead of `JsonObject`.
- Added named health response DTOs for liveness/readiness and normalized readiness output to a stable DTO shape.
- Replaced structured reporting aggregate `Object` schemas with named count/sum DTOs for cleaner generated models.
- Extended the Flutter generator audit to reject `components.schemas.Function`, empty object DTO schemas, inline object response schemas, and empty request body schemas.
- Added deterministic generated Dart runtime tests that assert Pricing Admin method body types and round-trip representative DTOs across all feature areas.

## Edge Cases Handled

- Health readiness failure (`503`) and success (`200`) now share the same named response schema.
- Optional readiness `info` / `error` fields normalize to `null` so the documented schema and runtime payload are consistent.
- Reporting sums allow nullable numeric aggregate values, matching database aggregate behavior when no rows exist.
- The generated test covers nested built_value lists, maps, nullable fields, enums, DateTime parsing, free-form JSON fields, and operation DTO method signatures.

## Verification

- `pnpm.cmd openapi:generate` - passed, 141 operations.
- `pnpm.cmd flutter:client:audit` - passed, 0 errors / 0 warnings.
- `pnpm.cmd flutter:client:generate` - passed; generated Dart analyze and 6 generated runtime tests passed.
- `pnpm.cmd openapi:verify` - passed, contract stable.
- `pnpm.cmd flutter:client:verify` - passed, generated output up to date and generated runtime tests passed.
- `pnpm.cmd --filter @ecommerce/api lint` - passed.
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed.
- `pnpm.cmd --filter @ecommerce/api test` - passed, 32 suites and 151 tests.

## Known Limitations / Follow-Ups

- Free-form JSON remains intentional for audit metadata/diff, report export parameters, and store setting values.
- OpenAPI Generator still logs non-fatal default-server warnings because the contract intentionally keeps paths prefixed with `/api/v1` and leaves `servers` empty for host-only client base URLs.
- `npx`-backed generation still requires npm cache access outside the workspace sandbox in this environment.
