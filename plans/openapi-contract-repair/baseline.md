# Baseline OpenAPI SDK Contract Audit

## Commands Executed
```bash
pnpm flutter:client:generate --audit-only
```

## Exit Code
`1`

## Operation Statistics
- **Operations**: 141
- **Typed request bodies**: 0
- **Typed success responses**: 1
- **Valid path parameters**: 0

## Failure Categories

### 1. Missing Request Body Schemas (All POST/PUT/PATCH writes)
Nearly all state-changing endpoints (e.g. login, register, refresh, cart operations, pricing settings, order placement) lack a request body schema in the contract.
Example:
- `POST /api/v1/auth/register`
- `POST /api/v1/auth/login`
- `POST /api/v1/checkout/preview`
- `POST /api/v1/carts`

### 2. Missing Typed Success Responses (Resulting in `Response<void>`)
Almost all successful endpoints (excluding one) do not declare response schemas, resulting in empty/void responses in the SDK client.
Example:
- `GET /api/v1/auth/me`
- `GET /api/v1/catalog/products`
- `GET /api/v1/carts/{id}`

### 3. Missing Path Parameter Schemas
Every route parameter placeholder (e.g., `{userId}`, `{slug}`, `{id}`, `{orderId}`) is not documented as an OpenAPI path parameter with a schema.
Example:
- `GET /api/v1/identity/users/{userId}/profile`
- `GET /api/v1/catalog/products/{slug}`
- `GET /api/v1/carts/{id}`
