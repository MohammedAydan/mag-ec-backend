# Official Docs Notes

## Official OpenAPI Features Used

### 1. Document Creation Options
- **`SwaggerModule.createDocument(app, config, options)`**:
  - `ignoreGlobalPrefix: false`: Ensures global API prefixes (like `/api/v1`) are included in generated routes so path URLs align with production routing.
  - `deepScanRoutes: true`: Performs deep scanning of imported routes across Nest modules.
  - `operationIdFactory`: Set to `(controllerKey: string, methodKey: string) => `${stripControllerSuffix(controllerKey)}_${methodKey}`` to generate clean, stable, deterministic method names for the generated SDK client.

### 2. Swagger CLI Plugin Programmatic Metadata Generation
- In dev and script contexts running via `tsx` (which uses `esbuild` internally), standard AST transformations from TypeScript compiler plugins cannot execute.
- We resolve this by running `@nestjs/cli`'s `PluginMetadataGenerator` to serialize AST metadata from controllers and DTOs into a static file (e.g. `src/swagger/metadata.ts`), and load it at bootstrap using `SwaggerModule.loadPluginMetadata(metadata)` before generating the OpenAPI document.

### 3. Route Parameter and Query Annotations
- **`@ApiParam({ name: 'slug', required: true, type: String })`**: Explicitly documents path parameters matching `{slug}`, `{id}`, `{userId}`, etc.
- **`@ApiQuery({ name: 'limit', required: false, type: Number })`**: Explicitly documents route queries.
- **`@ApiBody({ type: CreateProductDto })`**: Explicitly defines request payload structures for mutation routes.

### 4. Typed Success and Failure Responses
- **`@ApiOkResponse({ type: ProductDto })` / `@ApiCreatedResponse({ type: ProductDto })`**: Explicitly defines return types for successful operations so client methods return typed objects instead of generic `Response<void>`.
- **`@ApiNoContentResponse()`**: Used when an operation returns a 204 status with no content.
- **`@ApiBadRequestResponse({ type: ApiErrorResponseDto })` / `@ApiNotFoundResponse(...)`**: Documents standard error formats.

### 5. Security & Authentication Configuration
- **`DocumentBuilder.addBearerAuth()`**: Registers a security scheme named `bearer` for JWT authentication.
- **`@ApiBearerAuth('bearer')`**: Applied to protected controllers/endpoints requiring JWT bearer headers.

### 6. Generic and Paginated Models
- **`@ApiExtraModels(PaginatedResponseDto, ProductDto)`** & **`getSchemaPath(PaginatedResponseDto)`**: Configures Swagger to support generic/paginated envelopes.

## Dart/Dio Generator Configuration
- Uses `dart-dio` generator with options configured in `packages/contracts/openapi/dart-dio-config.yaml`.
- Pinned to Swagger Generator `7.22.0` and `@openapitools/openapi-generator-cli@2.34.0`.
- Ensures generated models and client APIs support strict Dart types, null-safety, and use of JSON serialization builders.
