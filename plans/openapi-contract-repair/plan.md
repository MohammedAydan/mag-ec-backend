# Plan: OpenAPI Contract Repair & Flutter SDK Generation

## Goal
Repair the NestJS OpenAPI contract so it is fully typed and compliant, and generate a robust, fully typed Flutter REST SDK using the `dart-dio` generator, resolving all current audit failures without altering runtime API logic.

## Acceptance Criteria
- Zero errors in the OpenAPI contract audit run (`pnpm run flutter:client:generate --audit-only`).
- The base path prefix `/api/v1` is not duplicated between server URL and paths.
- Paths with parameters (e.g. `{id}`, `{slug}`, `{orderId}`) have corresponding required `in: path` parameter definitions with schemas.
- All request bodies (such as register, login, refresh, checkout, cart operations, admin writes) have typed request schemas in the OpenAPI document.
- Successful responses that return data (not 204) have typed content schemas, preventing generic `Response<void>` methods in the SDK.
- Bearer security schemes and `@ApiBearerAuth` are correctly documented only on protected routes.
- The Flutter client is generated successfully into `packages/contracts/generated/flutter` and compiles without errors using `dart analyze`.
- Build, test, typecheck, and lint remain fully green.

## Approach
1. **Analyze Metadata Path**: Use `@nestjs/cli`'s programmatic `PluginMetadataGenerator` to scan controllers and DTOs to generate a serialized `metadata.ts` file, and load it using `SwaggerModule.loadPluginMetadata(metadata)` before creating the Swagger document in the generator and main bootstrap.
2. **Explicit Metadata Auditing & Repair**:
   - For all parameters in route paths, add `@ApiParam()` or ensure the parameter DTO/decorator is recognized.
   - For all success responses, verify and add typed response decorators (e.g. `@ApiOkResponse({ type: ... })` or `@ApiCreatedResponse({ type: ... })`).
   - Standardize pagination/generic responses with reusable generic DTO helper patterns or explicit extra models.
   - Ensure the server URLs do not contain the `/api/v1` prefix to prevent prefix duplication.
3. **Quality Gate Validation**: Ensure the audit runs with zero errors.
4. **Flutter SDK Generation**: Run the generator script with quality checks (`dart pub get`, `dart run build_runner build`, `dart format`, `dart analyze`) and check the result.

## Scope
- **IN**: All NestJS API controller endpoints (public and admin). All DTOs, parameters, and success responses. OpenAPI generation pipeline repair. Quality gates. Flutter client regeneration.
- **OUT**: Changing actual runtime behavior, database schemas, and business logic. Creating frontend dashboard views or pages.

## Dependencies
- NestJS API modules (`CatalogModule`, `IdentityModule`, `CartsModule`, etc.).
- OpenAPI CLI Generator tooling (requires Java/Docker, falling back to Java/NPX).

## Complexity
- **Estimated Complexity**: L (Large)
