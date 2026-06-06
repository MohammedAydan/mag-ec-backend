# Feature: OpenAPI Annotations — Group E (payments, fulfillment, returns, notifications)

## Goal
Fix missing OpenAPI annotations and endpoint quality issues across 10 controllers and 4 DTO files in payments, fulfillment, returns, and notifications modules.

## Acceptance Criteria
- Every endpoint method has `@ApiOperation({ summary: '...' })`
- Error response decorators (`@ApiUnauthorizedResponse`, `@ApiForbiddenResponse`, `@ApiBadRequestResponse`, `@ApiNotFoundResponse`) are present where applicable
- Explicit method return types (e.g., `Promise<ReturnRequestResponseDto>`)
- Missing `@ApiParam` decorators on path parameters (`:orderId`, `:returnRequestId`, `:notificationId`, `:deviceId`, `:shipmentId`)
- Empty descriptions in `@ApiOkResponse`/`@ApiCreatedResponse` are filled with descriptive strings
- All request DTOs have `@ApiProperty()` or `@ApiPropertyOptional()` decorators alongside class-validator decorators
- `pnpm --filter @ecommerce/api typecheck` passes

## Scope
- **IN**: 9 controllers (excluding already-correct webhook controller), 4 DTO files
- **OUT**: Webhook controller (already `@ApiExcludeController`), other modules, test changes

## Estimated Complexity: L
