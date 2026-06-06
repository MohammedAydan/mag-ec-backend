# Plan: Endpoint & OpenAPI Consistency Audit

## Goal
Audit all 32 controllers across 22 modules for correctness of endpoint definitions, decorators, guards, DTOs, and OpenAPI annotation completeness.

## Approach
Launch 5 parallel subagents, each auditing a module group. Each subagent reads controllers/services/DTOs, checks OpenAPI decorator correctness, validates the generated `openapi.json` for their group, and reports findings/issues.

## Scope: IN
- All controller endpoint correctness (paths, methods, decorators)
- OpenAPI annotation completeness (@ApiTags, @ApiOperation, @ApiResponse, @ApiBody, @ApiParam, @ApiQuery, @ApiBearerAuth)
- Response DTO alignment (serializer vs. @ApiResponse type)
- Guard consistency (AuthGuard, AdminGuard, PermissionsGuard)
- Path uniqueness check

## Scope: OUT
- Business logic correctness
- Unit test coverage
- Performance
- Frontend code

## Module Groups
| Group | Modules | Agent |
|-------|---------|-------|
| A | identity (3 ctrls), runtime (1), health (1) | Subagent 1 |
| B | catalog (2), content (2), promotions (1), reviews (2) | Subagent 2 |
| C | pricing (2), inventory (1), reporting (1), audit (1) | Subagent 3 |
| D | carts (2), checkout (1), wishlist (1), orders (2) | Subagent 4 |
| E | payments (4), fulfillment (2), returns (2), notifications (2) | Subagent 5 |
