# Context

## Files to inspect first
- `packages/contracts/openapi/generate-typescript-client.ts`
- `packages/contracts/openapi/generate-flutter-client.ts`
- `package.json`

## Files likely to change
- `packages/contracts/openapi/generate-typescript-client.ts`
- `packages/contracts/openapi/generate-flutter-client.ts`
- `plans/openapi-generator-command-hardening/*`
- `plans/context.md`
- `plans/SESSION_LOG.md`

## New dependencies
- None planned

## Environment / commands
- Reproduced failure with `pnpm.cmd typescript:client:generate`
- Failure mode: `npx.cmd --yes @openapitools/openapi-generator-cli@2.34.0 validate ...` hits `EPERM` under `C:\Users\moham\AppData\Local\npm-cache\_cacache\tmp`

## Open questions
- Whether isolating only npm cache is sufficient, or whether additional npm config paths must also be forced into the temp workspace

## Outcome notes
- Isolating both npm cache and npm userconfig inside the temporary OpenAPI CLI directory resolved the `EPERM` failure from the global npm cache during both TypeScript and Flutter generation.
- The TypeScript generated-package quality path also needed pnpm workspace isolation so `pnpm install` would run against the generated SDK package instead of the root workspace.
- The Flutter quality path on this machine required `dart.bat` rather than `dart.cmd`.
- The current `dart-dio` generator emits an unused `built_value/json_object.dart` import in generated API files, so the wrapper now strips that deterministic dead import before `dart analyze`.
