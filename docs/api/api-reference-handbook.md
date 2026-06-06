# API Reference Handbook

Source of truth: `packages/contracts/openapi/openapi.json` as of 2026-06-07.

## Overview

- Base API prefix: `/api/v1`
- Operations documented here: **139**
- OpenAPI tags documented here: **29**
- Primary auth model: bearer JWT for protected routes
- Main client types supported by the backend: customer storefront clients and admin dashboard clients
- Canonical machine-readable contract: `packages/contracts/openapi/openapi.json`

## How To Use The API

### Common Request Rules

- Send JSON bodies with `Content-Type: application/json` unless the endpoint states otherwise.
- For protected endpoints, send `Authorization: Bearer <access_token>`.
- All paths are already versioned under `/api/v1`; clients should not prepend another version segment.
- Read OpenAPI schema names in this handbook exactly as contract DTO names; that makes generated-client cross-referencing straightforward.

### Authentication And Session

- Access token transport: `Authorization: Bearer <jwt>`.
- Refresh flow: `POST /api/v1/auth/refresh` rotates refresh tokens and returns a new token set.
- Session introspection: `GET /api/v1/auth/me`.
- Logout: `POST /api/v1/auth/logout` revokes the refresh-session family for the submitted refresh token.

### Error Envelope

Typical non-2xx responses follow this shape:

```json
{
  "error": "Human-readable summary",
  "code": "MACHINE_READABLE_CODE",
  "details": [],
  "requestId": "uuid",
  "path": "/api/v1/...",
  "timestamp": "2026-05-25T00:00:00.000Z"
}
```

Common codes include `BAD_REQUEST`, `UNAUTHORIZED`, `FORBIDDEN`, `NOT_FOUND`, `RATE_LIMIT_EXCEEDED`, and `INTERNAL_SERVER_ERROR`.

### Idempotency

- `POST /api/v1/checkout/place` expects an `Idempotency-Key` header to protect against duplicate order placement.
- The same key with the same normalized payload replays the stored response.
- The same key with a different payload returns `409 Conflict`.

### Pagination And Filtering

- This API uses both page-based and cursor-based pagination depending on the endpoint.
- Read the parameter tables per endpoint carefully; common names include `page`, `pageSize`, `limit`, and `cursor`.
- Admin list endpoints usually expose optional filter parameters as query strings.

## API Areas

- **Audit Admin**: 1 endpoint
- **Authentication**: 9 endpoints
- **Carts**: 8 endpoints
- **Catalog Admin**: 34 endpoints
- **Catalog Public**: 2 endpoints
- **Checkout**: 3 endpoints
- **Commerce Support Admin**: 2 endpoints
- **Content**: 2 endpoints
- **Content Admin**: 4 endpoints
- **Fulfillment**: 1 endpoint
- **Fulfillment Admin**: 3 endpoints
- **Health**: 2 endpoints
- **Identity**: 2 endpoints
- **Identity Admin**: 10 endpoints
- **Inventory Admin**: 4 endpoints
- **Notifications**: 5 endpoints
- **Notifications Admin**: 2 endpoints
- **Orders**: 3 endpoints
- **Orders Admin**: 3 endpoints
- **Payments Admin**: 3 endpoints
- **Pricing Admin**: 7 endpoints
- **Pricing Public**: 1 endpoint
- **Promotions Admin**: 4 endpoints
- **Reporting Admin**: 7 endpoints
- **Returns**: 3 endpoints
- **Returns Admin**: 5 endpoints
- **Reviews**: 3 endpoints
- **Reviews Admin**: 3 endpoints
- **Wishlist**: 3 endpoints

## Example Application Page Split

The backend supports both a customer-facing storefront and an admin dashboard. The tables below show a practical way to divide the application into pages and map APIs onto each page.

### Example Storefront Pages

| Page | Purpose | Main APIs |
| --- | --- | --- |
| Register / Login | Customer account creation and sign-in | POST /api/v1/auth/register<br>POST /api/v1/auth/login<br>POST /api/v1/auth/refresh<br>GET /api/v1/auth/me |
| Catalog Listing | Browse published products | GET /api/v1/catalog/products |
| Product Detail | Read one product and create cart or wishlist actions | GET /api/v1/catalog/products/{slug}<br>POST /api/v1/carts<br>POST /api/v1/carts/{id}/items<br>POST /api/v1/wishlist/items |
| Cart | Review items and apply coupons | GET /api/v1/carts/{id}<br>PATCH /api/v1/carts/{id}/items/{variantId}<br>DELETE /api/v1/carts/{id}/items/{variantId}<br>POST /api/v1/carts/{id}/coupon<br>DELETE /api/v1/carts/{id}/coupon |
| Checkout | Preview totals, reserve stock, and place the order | POST /api/v1/checkout/preview<br>POST /api/v1/checkout/reserve<br>POST /api/v1/checkout/place |
| My Orders | View personal order history and order details | GET /api/v1/orders/me<br>GET /api/v1/orders/me/{orderId}<br>POST /api/v1/orders/me/{orderId}/cancel<br>GET /api/v1/orders/me/{orderId}/shipments |
| Returns | Create and track return requests | POST /api/v1/returns/me/orders/{orderId}<br>GET /api/v1/returns/me<br>GET /api/v1/returns/me/{returnRequestId} |
| Wishlist | View and maintain saved items | GET /api/v1/wishlist<br>POST /api/v1/wishlist/items<br>DELETE /api/v1/wishlist/items/{variantId} |
| Reviews | Create and read the customer's own reviews | POST /api/v1/reviews/order-lines/{orderLineId}<br>GET /api/v1/reviews/me<br>GET /api/v1/reviews/me/{reviewId} |
| Notifications & Preferences | Device registration and user notification settings | GET /api/v1/notifications/me<br>GET /api/v1/notifications/me/preferences<br>PUT /api/v1/notifications/me/preferences<br>POST /api/v1/notifications/me/push-devices<br>DELETE /api/v1/notifications/me/push-devices/{deviceId} |
| Static Content / Legal | Render content and policy pages | GET /api/v1/content/pages/{slug}<br>GET /api/v1/content/legal-references |

### Example Admin Pages

| Page | Purpose | Main APIs |
| --- | --- | --- |
| Login | Admin sign-in and session recovery | POST /api/v1/auth/login<br>POST /api/v1/auth/refresh<br>GET /api/v1/auth/me<br>POST /api/v1/auth/logout |
| Home / Overview | Headline KPIs and operational health | GET /api/v1/reports/admin/sales-summary<br>GET /api/v1/reports/admin/inventory-kpis<br>GET /api/v1/health/liveness<br>GET /api/v1/health/readiness |
| Catalog | List and manage products and variants | GET /api/v1/catalog/admin/products<br>POST /api/v1/catalog/admin/products<br>GET /api/v1/catalog/admin/products/{productId}<br>PATCH /api/v1/catalog/admin/products/{productId}<br>POST /api/v1/catalog/admin/products/{productId}/publish<br>POST /api/v1/catalog/admin/products/{productId}/archive<br>POST /api/v1/catalog/admin/products/{productId}/variants<br>PATCH /api/v1/catalog/admin/variants/{variantId} |
| Product Detail | Single-product editing, media, and variant maintenance | GET /api/v1/catalog/admin/products/{productId}<br>POST /api/v1/catalog/admin/products/{productId}/media/upload-intents<br>POST /api/v1/catalog/admin/products/{productId}/media/attach<br>POST /api/v1/catalog/admin/products/{productId}/variants<br>PATCH /api/v1/catalog/admin/variants/{variantId}<br>POST /api/v1/catalog/admin/variants/{variantId}/publish<br>POST /api/v1/catalog/admin/variants/{variantId}/archive |
| Taxonomy | Manage brands, categories, collections, tags, attributes, and product types | GET/POST /api/v1/catalog/admin/brands<br>GET/POST /api/v1/catalog/admin/categories<br>GET/POST /api/v1/catalog/admin/collections<br>GET/POST /api/v1/catalog/admin/tags<br>GET/POST /api/v1/catalog/admin/attributes<br>GET/POST /api/v1/catalog/admin/product-types |
| Inventory | View stock levels, movements, and reservations; perform adjustments | GET /api/v1/inventory/admin/levels<br>GET /api/v1/inventory/admin/movements<br>GET /api/v1/inventory/admin/reservations<br>POST /api/v1/inventory/admin/adjustments |
| Orders | Search orders and perform admin cancellation | GET /api/v1/orders/admin<br>GET /api/v1/orders/admin/{orderId}<br>POST /api/v1/orders/admin/{orderId}/cancel |
| Order Detail | Inspect one order and operate on shipments | GET /api/v1/orders/admin/{orderId}<br>GET /api/v1/orders/admin/{orderId}/shipments<br>POST /api/v1/orders/admin/{orderId}/shipments<br>PATCH /api/v1/orders/admin/{orderId}/shipments/{shipmentId}/status |
| Fulfillment / Returns | Review returns, receive goods, and execute refunds | GET /api/v1/returns/admin<br>GET /api/v1/returns/admin/{returnRequestId}<br>POST /api/v1/returns/admin/{returnRequestId}/review<br>POST /api/v1/returns/admin/{returnRequestId}/receive<br>POST /api/v1/returns/admin/{returnRequestId}/refund |
| Pricing | Store pricing settings, taxes, shipping, and variant prices | PUT /api/v1/pricing/admin/settings/behavior<br>PUT /api/v1/pricing/admin/settings/currency<br>PUT /api/v1/pricing/admin/tax-classes/{key}<br>PUT /api/v1/pricing/admin/tax-classes/{taxClassId}/rates/{countryCode}<br>PUT /api/v1/pricing/admin/shipping-zones/{key}<br>PUT /api/v1/pricing/admin/shipping-zones/{zoneId}/methods/{key}<br>PUT /api/v1/pricing/admin/variants/{variantId}/price<br>POST /api/v1/pricing/checkout/preview |
| Payments | Monitor payment attempts, refunds, and webhook ingestion history | GET /api/v1/payments/admin/attempts<br>GET /api/v1/payments/admin/refunds<br>GET /api/v1/payments/admin/webhook-events |
| Promotions | Maintain promotions and coupon codes | GET /api/v1/promotions/admin<br>GET /api/v1/promotions/admin/{promotionId}<br>PUT /api/v1/promotions/admin/by-key/{promotionKey}<br>PUT /api/v1/promotions/admin/{promotionId}/coupons/{code} |
| Reviews | Moderate customer reviews | GET /api/v1/reviews/admin<br>GET /api/v1/reviews/admin/{reviewId}<br>PATCH /api/v1/reviews/admin/{reviewId}/moderate |
| Notifications | Inspect and retry notification deliveries | GET /api/v1/notifications/admin<br>POST /api/v1/notifications/admin/{notificationId}/retry |
| Reports | Read aggregates and request exports | GET /api/v1/reports/admin/sales-summary<br>GET /api/v1/reports/admin/top-products<br>GET /api/v1/reports/admin/promotion-performance<br>GET /api/v1/reports/admin/inventory-kpis<br>GET /api/v1/reports/admin/exports<br>POST /api/v1/reports/admin/exports<br>GET /api/v1/reports/admin/exports/{exportId}/download |
| Content | Manage CMS pages and legal-reference mappings | GET /api/v1/content/admin/pages<br>PUT /api/v1/content/admin/pages/{key}<br>GET /api/v1/content/admin/legal-references<br>PUT /api/v1/content/admin/legal-references |
| Staff & Access | Manage staff invitations, roles, permissions, and status | GET /api/v1/identity/admin/staff<br>POST /api/v1/identity/admin/staff/invitations<br>POST /api/v1/identity/admin/staff/{staffId}/resend-invitation<br>PATCH /api/v1/identity/admin/staff/{staffId}/roles<br>PATCH /api/v1/identity/admin/staff/{staffId}/status<br>GET /api/v1/identity/admin/roles<br>POST /api/v1/identity/admin/roles<br>PATCH /api/v1/identity/admin/roles/{roleId}/permissions<br>GET /api/v1/identity/admin/permissions<br>GET /api/v1/identity/admin/access-check |
| System / Audit | Observe platform health and privileged audit events | GET /api/v1/health/liveness<br>GET /api/v1/health/readiness<br>GET /api/v1/audit/admin |

## Endpoint Reference

## Audit Admin

### GET /api/v1/audit/admin

- Summary: List audit log entries with optional filters and cursor pagination
- Operation ID: `AdminAudit_listAuditLogs`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| cursor | query | string | no | Pagination cursor |
| limit | query | integer | no | Page size (1-100) |
| category | query | string | no | Filter by audit-log category |
| action | query | string | no | Filter by audit-log action |
| entityType | query | string | no | Filter by entity type |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Cursor-paginated audit log entries | PaginatedAuditLogsDto | items: array<AuditLogResponseDto> required; nextCursor: string |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

## Authentication

### POST /api/v1/auth/login

- Summary: Authenticate user credentials and issue session tokens
- Operation ID: `Auth_login`
- Auth: Public or guest-accessible

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `LoginDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| email | string (email) | yes | User email address |
| password | string | yes | User password |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Login successful | AuthResponseDto | accessToken: string required; refreshToken: string required; user: AuthUserDto required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Invalid credentials |

### POST /api/v1/auth/logout

- Summary: Revoke active refresh token session family
- Operation ID: `Auth_logout`
- Auth: Public or guest-accessible

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `LogoutDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| refreshToken | string | yes | Active refresh token to revoke |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 204 | Logout successful | None | No response body |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |

### GET /api/v1/auth/me

- Summary: Return the authenticated user profile and access summary
- Operation ID: `Auth_getCurrentUser`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Authenticated user profile returned | UserProfileDto | id: string required; email: string required; displayName: string required; userType: string required; status: string required; emailVerifiedAt: string; lastLoginAt: string; createdAt: string required; roles: array<UserRoleDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/auth/password-reset/confirm

- Summary: Consume a password-reset token and change the user password
- Operation ID: `Auth_resetPassword`
- Auth: Public or guest-accessible

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `ResetPasswordDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| token | string | yes | Password-reset token from the verification channel |
| newPassword | string | yes | New password |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Password reset completed | PasswordResetConfirmResponseDto | passwordReset: boolean required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Invalid or expired password-reset token |

### POST /api/v1/auth/password-reset/request

- Summary: Create a password-reset request without disclosing account existence
- Operation ID: `Auth_requestPasswordReset`
- Auth: Public or guest-accessible

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `RequestPasswordResetDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| email | string (email) | yes | User email address |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Password-reset request accepted | PasswordResetRequestResponseDto | accepted: boolean required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |

### POST /api/v1/auth/refresh

- Summary: Exchange an active refresh token for a new token set (rotation)
- Operation ID: `Auth_refresh`
- Auth: Public or guest-accessible

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `RefreshTokenDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| refreshToken | string | yes | Rotating refresh token |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Tokens successfully rotated | AuthResponseDto | accessToken: string required; refreshToken: string required; user: AuthUserDto required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Invalid or rotated refresh token |

### POST /api/v1/auth/register

- Summary: Register a new customer account
- Operation ID: `Auth_register`
- Auth: Public or guest-accessible

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `RegisterDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| email | string (email) | yes | User email address |
| displayName | string | yes | User display name |
| password | string | yes | Secure password |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | User successfully registered | RegisterResponseDto | id: string required; email: string required; displayName: string required; userType: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 409 | Email already exists |

### POST /api/v1/auth/verification/confirm

- Summary: Consume an email-verification token and mark the account verified
- Operation ID: `Auth_verifyEmail`
- Auth: Public or guest-accessible

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `VerifyEmailDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| token | string | yes | Email-verification token from the verification channel |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Email verified | VerifyEmailResponseDto | verified: boolean required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Invalid or expired verification token |

### POST /api/v1/auth/verification/request

- Summary: Issue a new email-verification request for the authenticated user
- Operation ID: `Auth_requestEmailVerification`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Email-verification request accepted | VerificationRequestResponseDto | accepted: boolean required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

## Carts

### POST /api/v1/carts

- Summary: Create or retrieve a shopping cart
- Operation ID: `Cart_createOrGetCart`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| x-guest-cart-token | header | string | no | Guest cart bearer token for guest-owned cart access. |
| Authorization | header | string | no | Optional Bearer JWT for authenticated cart access. |

#### Request Body

- Required: yes
- Schema: `CreateCartDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| guestToken | string | no | Anonymous cart token in UUIDv4 format (omit for authenticated users) |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Cart created or retrieved | CartResponseDto | id: string required; guestToken: string; status: string required; couponCode: string; items: array<CartItemResponseDto> required; userId: string; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |

### GET /api/v1/carts/{id}

- Summary: Get cart by ID
- Operation ID: `Cart_getCart`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| id | path | string | yes | Cart ID |
| x-guest-cart-token | header | string | no | Guest cart bearer token for guest-owned cart access. |
| Authorization | header | string | no | Optional Bearer JWT for authenticated cart access. |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Cart details | CartResponseDto | id: string required; guestToken: string; status: string required; couponCode: string; items: array<CartItemResponseDto> required; userId: string; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 404 | Cart not found |

### DELETE /api/v1/carts/{id}/coupon

- Summary: Remove coupon from the cart
- Operation ID: `Cart_removeCoupon`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| id | path | string | yes | Cart ID |
| x-guest-cart-token | header | string | no | Guest cart bearer token for guest-owned cart access. |
| Authorization | header | string | no | Optional Bearer JWT for authenticated cart access. |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Coupon removed | CartResponseDto | id: string required; guestToken: string; status: string required; couponCode: string; items: array<CartItemResponseDto> required; userId: string; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 404 | Cart not found |

### POST /api/v1/carts/{id}/coupon

- Summary: Apply a coupon to the cart
- Operation ID: `Cart_applyCoupon`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| id | path | string | yes | Cart ID |
| x-guest-cart-token | header | string | no | Guest cart bearer token for guest-owned cart access. |
| Authorization | header | string | no | Optional Bearer JWT for authenticated cart access. |

#### Request Body

- Required: yes
- Schema: `ApplyCouponDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| couponCode | string | yes | Coupon code to apply |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Coupon applied | CartResponseDto | id: string required; guestToken: string; status: string required; couponCode: string; items: array<CartItemResponseDto> required; userId: string; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 404 | Cart not found |

### POST /api/v1/carts/{id}/items

- Summary: Add an item to the cart
- Operation ID: `Cart_addItem`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| id | path | string | yes | Cart ID |
| x-guest-cart-token | header | string | no | Guest cart bearer token for guest-owned cart access. |
| Authorization | header | string | no | Optional Bearer JWT for authenticated cart access. |

#### Request Body

- Required: yes
- Schema: `AddCartItemDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| variantId | string | yes | Product variant ID to add |
| quantity | number | yes | Quantity (minimum 1) |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Item added to cart | CartResponseDto | id: string required; guestToken: string; status: string required; couponCode: string; items: array<CartItemResponseDto> required; userId: string; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 404 | Cart not found |

### DELETE /api/v1/carts/{id}/items/{variantId}

- Summary: Remove an item from the cart
- Operation ID: `Cart_removeItem`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| id | path | string | yes | Cart ID |
| variantId | path | string | yes | Product variant ID |
| x-guest-cart-token | header | string | no | Guest cart bearer token for guest-owned cart access. |
| Authorization | header | string | no | Optional Bearer JWT for authenticated cart access. |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Item removed from cart | CartResponseDto | id: string required; guestToken: string; status: string required; couponCode: string; items: array<CartItemResponseDto> required; userId: string; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 404 | Cart or variant not found |

### PATCH /api/v1/carts/{id}/items/{variantId}

- Summary: Update cart item quantity
- Operation ID: `Cart_updateItemQuantity`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| id | path | string | yes | Cart ID |
| variantId | path | string | yes | Product variant ID |
| x-guest-cart-token | header | string | no | Guest cart bearer token for guest-owned cart access. |
| Authorization | header | string | no | Optional Bearer JWT for authenticated cart access. |

#### Request Body

- Required: yes
- Schema: `UpdateCartItemDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| quantity | number | yes | New quantity (minimum 1) |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Item quantity updated | CartResponseDto | id: string required; guestToken: string; status: string required; couponCode: string; items: array<CartItemResponseDto> required; userId: string; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 404 | Cart or variant not found |

### POST /api/v1/carts/merge

- Summary: Merge guest cart into authenticated user cart
- Operation ID: `Cart_mergeGuestCart`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `MergeCartDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| sourceGuestToken | string | yes | Guest token from source (anonymous) cart |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Guest cart merged into user cart | CartResponseDto | id: string required; guestToken: string; status: string required; couponCode: string; items: array<CartItemResponseDto> required; userId: string; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |

## Catalog Admin

### GET /api/v1/catalog/admin/attributes

- Summary: List all attributes
- Operation ID: `CatalogAdmin_listAttributes`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All attributes | array<AdminCatalogAttributeDto> | Array of AdminCatalogAttributeDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/attributes

- Summary: Create a new attribute
- Operation ID: `CatalogAdmin_createAttribute`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `CreateAttributeDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| key | string | yes |  |
| inputType | string: TEXT \| SELECT \| MULTI_SELECT \| COLOR \| SIZE \| BOOLEAN \| NUMBER | yes |  |
| isFilterable | boolean | no |  |
| isVariantDefining | boolean | no |  |
| sortOrder | number | no |  |
| translations | array<AttributeTranslationDto> | yes |  |
| options | array<AttributeOptionDto> | no |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Attribute created | AdminCatalogAttributeDto | id: string required; key: string required; inputType: string required; isFilterable: boolean required; isVariantDefining: boolean required; sortOrder: number required; translations: array<AdminCatalogTranslationDto> required; options: array<AdminCatalogAttributeOptionDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/catalog/admin/brands

- Summary: List all brands
- Operation ID: `CatalogAdmin_listBrands`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All brands | array<AdminCatalogBrandDto> | Array of AdminCatalogBrandDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/brands

- Summary: Create a new brand
- Operation ID: `CatalogAdmin_createBrand`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `CreateBrandDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| key | string | yes |  |
| translations | array<TranslationDto> | yes |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Brand created | AdminCatalogBrandDto | id: string required; key: string required; status: string required; translations: array<AdminCatalogTranslationDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/brands/{brandId}/archive

- Summary: Archive a brand
- Operation ID: `CatalogAdmin_archiveBrand`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| brandId | path | string | yes | Brand ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Brand archived | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Brand not found |

### POST /api/v1/catalog/admin/brands/{brandId}/publish

- Summary: Publish a brand
- Operation ID: `CatalogAdmin_publishBrand`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| brandId | path | string | yes | Brand ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Brand published | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Brand not found |

### GET /api/v1/catalog/admin/categories

- Summary: List all categories
- Operation ID: `CatalogAdmin_listCategories`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All categories | array<AdminCatalogCategoryDto> | Array of AdminCatalogCategoryDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/categories

- Summary: Create a new category
- Operation ID: `CatalogAdmin_createCategory`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `CreateCategoryDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| key | string | yes |  |
| parentId | string | no |  |
| sortOrder | number | no |  |
| translations | array<TranslationDto> | yes |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Category created | AdminCatalogCategoryDto | id: string required; key: string required; parentId: string; status: string required; sortOrder: number required; translations: array<AdminCatalogTranslationDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/categories/{categoryId}/archive

- Summary: Archive a category
- Operation ID: `CatalogAdmin_archiveCategory`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| categoryId | path | string | yes | Category ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Category archived | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Category not found |

### POST /api/v1/catalog/admin/categories/{categoryId}/publish

- Summary: Publish a category
- Operation ID: `CatalogAdmin_publishCategory`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| categoryId | path | string | yes | Category ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Category published | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Category not found |

### GET /api/v1/catalog/admin/collections

- Summary: List all collections
- Operation ID: `CatalogAdmin_listCollections`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All collections | array<AdminCatalogCollectionDto> | Array of AdminCatalogCollectionDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/collections

- Summary: Create a new collection
- Operation ID: `CatalogAdmin_createCollection`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `CreateCollectionDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| key | string | yes |  |
| sortOrder | number | no |  |
| translations | array<TranslationDto> | yes |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Collection created | AdminCatalogCollectionDto | id: string required; key: string required; status: string required; sortOrder: number required; translations: array<AdminCatalogTranslationDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/collections/{collectionId}/archive

- Summary: Archive a collection
- Operation ID: `CatalogAdmin_archiveCollection`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| collectionId | path | string | yes | Collection ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Collection archived | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Collection not found |

### POST /api/v1/catalog/admin/collections/{collectionId}/publish

- Summary: Publish a collection
- Operation ID: `CatalogAdmin_publishCollection`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| collectionId | path | string | yes | Collection ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Collection published | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Collection not found |

### GET /api/v1/catalog/admin/product-types

- Summary: List all product types
- Operation ID: `CatalogAdmin_listProductTypes`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All product types | array<AdminCatalogProductTypeDto> | Array of AdminCatalogProductTypeDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/product-types

- Summary: Create a new product type
- Operation ID: `CatalogAdmin_createProductType`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `CreateProductTypeDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| key | string | yes |  |
| sortOrder | number | no |  |
| translations | array<TranslationDto> | yes |  |
| attributes | array<ProductTypeAttributeLinkDto> | no |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Product type created | AdminCatalogProductTypeDto | id: string required; key: string required; status: string required; sortOrder: number required; translations: array<AdminCatalogTranslationDto> required; attributes: array<AdminCatalogProductTypeAttributeDto> |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/product-types/{productTypeId}/archive

- Summary: Archive a product type
- Operation ID: `CatalogAdmin_archiveProductType`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| productTypeId | path | string | yes | Product type ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Product type archived | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Product type not found |

### POST /api/v1/catalog/admin/product-types/{productTypeId}/publish

- Summary: Publish a product type
- Operation ID: `CatalogAdmin_publishProductType`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| productTypeId | path | string | yes | Product type ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Product type published | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Product type not found |

### GET /api/v1/catalog/admin/products

- Summary: List all products with pagination and filters
- Operation ID: `CatalogAdmin_listProducts`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| cursor | query | string | no |  |
| limit | query | integer | no |  |
| status | query | string: DRAFT \| PUBLISHED \| ARCHIVED | no |  |
| search | query | string | no |  |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Paginated product list | AdminPaginatedCatalogProductsDto | items: array<AdminCatalogProductDto> required; nextCursor: string |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid query parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/products

- Summary: Create a new product
- Operation ID: `CatalogAdmin_createProduct`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `CreateProductDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| productTypeId | string | yes |  |
| brandId | string | no |  |
| sku | string | yes |  |
| isFeatured | boolean | no |  |
| categoryIds | array<string> | no |  |
| collectionIds | array<string> | no |  |
| tagIds | array<string> | no |  |
| translations | array<ProductTranslationDto> | yes |  |
| variants | array<ProductVariantDto> | yes |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Product created | AdminCatalogProductDto | id: string required; productTypeId: string required; brandId: string; sku: string required; status: string required; isFeatured: boolean required; publishedAt: string; archivedAt: string; createdAt: string required; updatedAt: string required; translations: array<AdminCatalogTranslationDto> required; productType: AdminCatalogProductTypeDto; brand: allOf(AdminCatalogBrandDto); variants: array<AdminCatalogVariantDto>; categoryLinks: array<AdminCatalogRelationLinkDto>; collectionLinks: array<AdminCatalogRelationLinkDto>; tagLinks: array<AdminCatalogRelationLinkDto>; media: array<AdminCatalogMediaDto> |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/catalog/admin/products/{productId}

- Summary: Get a single product by ID
- Operation ID: `CatalogAdmin_getProduct`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| productId | path | string | yes | Product ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Product details | AdminCatalogProductDto | id: string required; productTypeId: string required; brandId: string; sku: string required; status: string required; isFeatured: boolean required; publishedAt: string; archivedAt: string; createdAt: string required; updatedAt: string required; translations: array<AdminCatalogTranslationDto> required; productType: AdminCatalogProductTypeDto; brand: allOf(AdminCatalogBrandDto); variants: array<AdminCatalogVariantDto>; categoryLinks: array<AdminCatalogRelationLinkDto>; collectionLinks: array<AdminCatalogRelationLinkDto>; tagLinks: array<AdminCatalogRelationLinkDto>; media: array<AdminCatalogMediaDto> |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Product not found |

### PATCH /api/v1/catalog/admin/products/{productId}

- Summary: Update a product
- Operation ID: `CatalogAdmin_updateProduct`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| productId | path | string | yes | Product ID |

#### Request Body

- Required: yes
- Schema: `UpdateProductDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| brandId | string | no |  |
| isFeatured | boolean | no |  |
| categoryIds | array<string> | no |  |
| collectionIds | array<string> | no |  |
| tagIds | array<string> | no |  |
| translations | array<ProductTranslationDto> | no |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Product updated | AdminCatalogProductDto | id: string required; productTypeId: string required; brandId: string; sku: string required; status: string required; isFeatured: boolean required; publishedAt: string; archivedAt: string; createdAt: string required; updatedAt: string required; translations: array<AdminCatalogTranslationDto> required; productType: AdminCatalogProductTypeDto; brand: allOf(AdminCatalogBrandDto); variants: array<AdminCatalogVariantDto>; categoryLinks: array<AdminCatalogRelationLinkDto>; collectionLinks: array<AdminCatalogRelationLinkDto>; tagLinks: array<AdminCatalogRelationLinkDto>; media: array<AdminCatalogMediaDto> |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Product not found |

### POST /api/v1/catalog/admin/products/{productId}/archive

- Summary: Archive a product
- Operation ID: `CatalogAdmin_archiveProduct`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| productId | path | string | yes | Product ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Product archived | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Product not found |

### POST /api/v1/catalog/admin/products/{productId}/media/attach

- Summary: Attach uploaded media to a product
- Operation ID: `CatalogAdmin_attachMedia`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| productId | path | string | yes | Product ID |

#### Request Body

- Required: yes
- Schema: `AttachMediaDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| mediaId | string | yes |  |
| uploadToken | string | yes |  |
| checksum | string | no |  |
| translations | array<MediaTranslationDto> | no |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Media attached successfully | AttachedMediaResponseDto | id: string required; productId: string required; variantId: string; status: string required; mediaType: string required; role: string required; mimeType: string required; objectKey: string required; publicUrl: string required; checksum: string; attachedAt: string; translations: array<AttachedMediaTranslationDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Product not found |

### POST /api/v1/catalog/admin/products/{productId}/media/upload-intents

- Summary: Issue a media upload intent for a product
- Operation ID: `CatalogAdmin_issueMediaUploadIntent`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| productId | path | string | yes | Product ID |

#### Request Body

- Required: yes
- Schema: `CreateMediaUploadIntentDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| mediaType | string: IMAGE \| VIDEO \| FILE | yes |  |
| role | string: PRIMARY \| GALLERY \| SWATCH \| DETAIL | yes |  |
| mimeType | string | yes |  |
| sizeBytes | number | yes |  |
| variantId | string | no |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Media upload intent created | MediaUploadIntentResponseDto | mediaId: string required; objectKey: string required; uploadUrl: string required; publicUrl: string required; uploadToken: string required; expiresAt: string required; headers: MediaUploadHeadersDto required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Product not found |

### POST /api/v1/catalog/admin/products/{productId}/publish

- Summary: Publish a product
- Operation ID: `CatalogAdmin_publishProduct`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| productId | path | string | yes | Product ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Product published | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Product not found |

### POST /api/v1/catalog/admin/products/{productId}/variants

- Summary: Create a new product variant
- Operation ID: `CatalogAdmin_createProductVariant`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| productId | path | string | yes | Product ID |

#### Request Body

- Required: yes
- Schema: `CreateProductVariantDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| sku | string | yes |  |
| isDefault | boolean | no |  |
| position | number | no |  |
| translations | array<ProductVariantTranslationDto> | yes |  |
| optionValues | array<VariantOptionValueDto> | yes |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Product variant created | AdminCatalogVariantDto | id: string required; productId: string required; sku: string required; status: string required; isDefault: boolean required; position: number required; translations: array<AdminCatalogTranslationDto> required; optionValues: array<AdminCatalogProductVariantOptionValueDto>; price: allOf(CatalogVariantPriceDto) |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Product not found |

### GET /api/v1/catalog/admin/tags

- Summary: List all tags
- Operation ID: `CatalogAdmin_listTags`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All tags | array<AdminCatalogTagDto> | Array of AdminCatalogTagDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/tags

- Summary: Create a new tag
- Operation ID: `CatalogAdmin_createTag`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `CreateTagDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| key | string | yes |  |
| translations | array<TranslationDto> | yes |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Tag created | AdminCatalogTagDto | id: string required; key: string required; status: string required; translations: array<AdminCatalogTranslationDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/catalog/admin/tags/{tagId}/archive

- Summary: Archive a tag
- Operation ID: `CatalogAdmin_archiveTag`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| tagId | path | string | yes | Tag ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Tag archived | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Tag not found |

### POST /api/v1/catalog/admin/tags/{tagId}/publish

- Summary: Publish a tag
- Operation ID: `CatalogAdmin_publishTag`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| tagId | path | string | yes | Tag ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Tag published | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Tag not found |

### PATCH /api/v1/catalog/admin/variants/{variantId}

- Summary: Update a product variant
- Operation ID: `CatalogAdmin_updateProductVariant`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| variantId | path | string | yes | Variant ID |

#### Request Body

- Required: yes
- Schema: `UpdateProductVariantDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| sku | string | no |  |
| isDefault | boolean | no |  |
| position | number | no |  |
| translations | array<ProductVariantTranslationDto> | no |  |
| optionValues | array<VariantOptionValueDto> | no |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Product variant updated | AdminCatalogVariantDto | id: string required; productId: string required; sku: string required; status: string required; isDefault: boolean required; position: number required; translations: array<AdminCatalogTranslationDto> required; optionValues: array<AdminCatalogProductVariantOptionValueDto>; price: allOf(CatalogVariantPriceDto) |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Variant not found |

### POST /api/v1/catalog/admin/variants/{variantId}/archive

- Summary: Archive a product variant
- Operation ID: `CatalogAdmin_archiveProductVariant`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| variantId | path | string | yes | Variant ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Variant archived | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Variant not found |

### POST /api/v1/catalog/admin/variants/{variantId}/publish

- Summary: Publish a product variant
- Operation ID: `CatalogAdmin_publishProductVariant`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| variantId | path | string | yes | Variant ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Variant published | CatalogStatusResponseDto | id: string required; status: string required; publishedAt: string; archivedAt: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Variant not found |

## Catalog Public

### GET /api/v1/catalog/products

- Summary: Browse published products with optional filters
- Operation ID: `CatalogPublic_browseProducts`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| page | query | integer | no |  |
| pageSize | query | integer | no |  |
| locale | query | string | no |  |
| brandSlug | query | string | no |  |
| categorySlug | query | string | no |  |
| collectionSlug | query | string | no |  |
| tagSlug | query | string | no |  |
| productTypeKey | query | string | no |  |
| optionKeys | query | string | no | Comma-separated attribute option keys |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Product browse results | PaginatedCatalogProductsDto | items: array<CatalogProductSummaryDto> required; total: integer required; page: integer required; pageSize: integer required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid query parameters |

### GET /api/v1/catalog/products/{slug}

- Summary: Get a published product by its translated slug
- Operation ID: `CatalogPublic_getProductBySlug`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| slug | path | string | yes | Translated product slug |
| locale | query | string | no | Locale code for translations (default: en) |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Published product detail | CatalogProductSummaryDto | id: string required; sku: string required; status: string required; name: string; slug: string; shortDescription: string; description: string; brand: allOf(CatalogLocalizedReferenceDto); productType: CatalogLocalizedReferenceDto required; categories: array<CatalogLocalizedReferenceDto> required; collections: array<CatalogLocalizedReferenceDto> required; tags: array<CatalogLocalizedReferenceDto> required; media: array<CatalogMediaSummaryDto> required; variants: array<CatalogVariantSummaryDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid locale parameter |
| 404 | Product not found |

## Checkout

### POST /api/v1/checkout/place

- Summary: Place an order from cart
- Operation ID: `Checkout_placeOrder`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| idempotency-key | header | string | yes | Client-generated idempotency key for duplicate-submit protection (max 128 chars, alphanumeric, dashes, and underscores). |
| x-guest-cart-token | header | string | no | Guest cart bearer token for guest-owned cart access. |
| Authorization | header | string | no | Optional Bearer JWT for authenticated placement or guest checkout attribution. |

#### Request Body

- Required: yes
- Schema: `CheckoutPlaceOrderDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| cartId | string | yes | Cart ID to place the order from |
| currencyCode | string | yes | ISO 4217 currency code |
| countryCode | string | yes | ISO 3166-1 alpha-2 country code |
| customerEmail | string (email) | yes | Customer email address |
| shippingMethodKey | string | yes | Selected shipping-method key |
| paymentMethod | string: cash_on_delivery \| online_card | yes | Payment method |
| customerLocale | string | no | Customer locale |
| reservationKey | string | no | Reservation key from a prior /checkout/reserve call |
| shippingAddress | allOf(CheckoutAddressDto) | yes | Shipping destination address |
| billingAddress | allOf(CheckoutAddressDto) | no | Billing address (if different from shipping) |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Order placed successfully | CheckoutPlaceOrderResponseDto | id: string required; orderNumber: string required; userId: string; cartId: string required; status: string required; paymentMethod: string required; paymentStatus: string required; fulfillmentStatus: string required; customerEmail: string required; customerName: string required; customerPhone: string required; currencyCode: string required; countryCode: string required; shippingMethod: OrderShippingMethodDetailsDto required; couponCode: string; subtotalAmount: number required; subtotalDiscountAmount: number required; discountedSubtotalAmount: number required; shippingAmount: number required; taxAmount: number required; grandTotalAmount: number required; paidAt: string; placedAt: string required; createdAt: string required; updatedAt: string required; addresses: array<OrderAddressDto> required; items: array<OrderLineItemDto> required; appliedPromotions: array<OrderAppliedPromotionDto> required; shipments: array<OrderShipmentDto> required; returnRequests: array<OrderReturnRequestDto> required; refunds: array<OrderRefundDto> required; payment: CheckoutPaymentAttemptDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 404 | Cart not found |

### POST /api/v1/checkout/preview

- Summary: Preview checkout costs before placing an order
- Operation ID: `Checkout_previewCheckout`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| x-guest-cart-token | header | string | no | Guest cart bearer token for guest-owned cart access. |
| Authorization | header | string | no | Optional Bearer JWT for authenticated checkout preview. |

#### Request Body

- Required: yes
- Schema: `CheckoutCartPreviewDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| cartId | string | yes | Cart ID to evaluate for checkout |
| currencyCode | string | yes | ISO 4217 currency code (e.g. SAR, EGP) |
| countryCode | string | yes | ISO 3166-1 alpha-2 country code (e.g. SA, EG) |
| customerLocale | string | no | Customer locale in BCP-47 format (e.g. ar-SA) |
| reserveStockOnPreview | boolean | no | Whether to hold inventory during preview (default false) |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Checkout preview with pricing, tax, and shipping breakdown | CheckoutPreviewResponseDto | cartId: string required; reservationKey: string; reservationExpiresAt: string; paymentReadiness: CheckoutPaymentReadinessDto required; currencyCode: string required; countryCode: string required; subtotalAmount: number required; subtotalDiscountAmount: number required; discountedSubtotalAmount: number required; taxAmount: number required; grandTotalExcludingShippingAmount: number required; appliedPromotions: array<CheckoutPreviewAppliedPromotionDto> required; rejectedPromotions: array<string> required; items: array<CheckoutPreviewItemResponseDto> required; shippingMethods: array<CheckoutPreviewShippingMethodDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 404 | Cart not found |

### POST /api/v1/checkout/reserve

- Summary: Reserve stock and preview checkout (authenticated customer only)
- Operation ID: `Checkout_reserveCheckoutPreview`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `CheckoutCartPreviewDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| cartId | string | yes | Cart ID to evaluate for checkout |
| currencyCode | string | yes | ISO 4217 currency code (e.g. SAR, EGP) |
| countryCode | string | yes | ISO 3166-1 alpha-2 country code (e.g. SA, EG) |
| customerLocale | string | no | Customer locale in BCP-47 format (e.g. ar-SA) |
| reserveStockOnPreview | boolean | no | Whether to hold inventory during preview (default false) |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Checkout preview with stock reservations confirmed | CheckoutPreviewResponseDto | cartId: string required; reservationKey: string; reservationExpiresAt: string; paymentReadiness: CheckoutPaymentReadinessDto required; currencyCode: string required; countryCode: string required; subtotalAmount: number required; subtotalDiscountAmount: number required; discountedSubtotalAmount: number required; taxAmount: number required; grandTotalExcludingShippingAmount: number required; appliedPromotions: array<CheckoutPreviewAppliedPromotionDto> required; rejectedPromotions: array<string> required; items: array<CheckoutPreviewItemResponseDto> required; shippingMethods: array<CheckoutPreviewShippingMethodDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |
| 404 | Cart not found |

## Commerce Support Admin

### GET /api/v1/support/admin/carts

- Summary: List active carts for support review
- Operation ID: `CommerceSupportAdmin_listActiveCarts`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Active carts (support view) | array<CartResponseDto> | Array of CartResponseDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/support/admin/wishlists

- Summary: List active wishlists for support review
- Operation ID: `CommerceSupportAdmin_listWishlists`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Active wishlists (support view) | array<WishlistResponseDto> | Array of WishlistResponseDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

## Content

### GET /api/v1/content/legal-references

- Summary: Get public legal reference page keys
- Operation ID: `PublicContent_getLegalReferences`
- Auth: Public or guest-accessible

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Public legal references | LegalReferencesResponseDto | terms: allOf(PublicLegalReferenceDto) required; privacy: allOf(PublicLegalReferenceDto) required; returns: allOf(PublicLegalReferenceDto) required; shipping: allOf(PublicLegalReferenceDto) required |

#### Error Responses

No explicit non-2xx responses documented beyond framework defaults.

### GET /api/v1/content/pages/{slug}

- Summary: Get a published content page by its slug
- Operation ID: `PublicContent_getPage`
- Auth: Public or guest-accessible

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| slug | path | string | yes | Content page slug |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Published content page | ContentPageResponseDto | key: string required; slug: string required; title: string required; body: string required; status: string required; locale: string required; sortOrder: number required; isLegal: boolean required; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 404 | Content page not found |

## Content Admin

### GET /api/v1/content/admin/legal-references

- Summary: Get legal reference page key mappings
- Operation ID: `AdminContent_getLegalReferences`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Legal references mapping | AdminLegalReferencesResponseDto | termsPageKey: string required; privacyPageKey: string required; returnsPageKey: string required; shippingPageKey: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### PUT /api/v1/content/admin/legal-references

- Summary: Update legal reference page key mappings
- Operation ID: `AdminContent_upsertLegalReferences`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `UpdateLegalReferencesDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| termsPageKey | object | no | Key of the terms-of-service page (null to unset) |
| privacyPageKey | object | no | Key of the privacy-policy page (null to unset) |
| returnsPageKey | object | no | Key of the returns-policy page (null to unset) |
| shippingPageKey | object | no | Key of the shipping-policy page (null to unset) |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Legal references updated | AdminLegalReferencesResponseDto | termsPageKey: string required; privacyPageKey: string required; returnsPageKey: string required; shippingPageKey: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/content/admin/pages

- Summary: List all content pages
- Operation ID: `AdminContent_listPages`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All content pages | array<ContentPageResponseDto> | Array of ContentPageResponseDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### PUT /api/v1/content/admin/pages/{key}

- Summary: Create or update a content page
- Operation ID: `AdminContent_upsertPage`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| key | path | string | yes | Content page key |

#### Request Body

- Required: yes
- Schema: `UpsertContentPageDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| slug | string | yes | URL-friendly page slug |
| title | string | yes | Page title |
| body | string | yes | Page body content |
| status | string: DRAFT \| PUBLISHED \| ARCHIVED | yes | Publishing status |
| sortOrder | number | no | Display order |
| isLegal | boolean | no | Whether this page is a legal reference target |
| locale | string | no | Locale code (e.g. en, ar) |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Page upserted | ContentPageResponseDto | key: string required; slug: string required; title: string required; body: string required; status: string required; locale: string required; sortOrder: number required; isLegal: boolean required; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

## Fulfillment

### GET /api/v1/orders/me/{orderId}/shipments

- Summary: List my order shipments
- Operation ID: `CustomerFulfillment_listMyShipments`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| orderId | path | string | yes | Order identifier |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | List of shipments for the order | array<FulfillmentResponseDto> | Array of FulfillmentResponseDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |
| 404 | Order not found |

## Fulfillment Admin

### GET /api/v1/orders/admin/{orderId}/shipments

- Summary: List shipments for an order
- Operation ID: `AdminFulfillment_listShipments`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| orderId | path | string | yes | Order identifier |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | List of shipments for the order | array<FulfillmentResponseDto> | Array of FulfillmentResponseDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Order not found |

### POST /api/v1/orders/admin/{orderId}/shipments

- Summary: Create a shipment for an order
- Operation ID: `AdminFulfillment_createShipment`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| orderId | path | string | yes | Order identifier |

#### Request Body

- Required: yes
- Schema: `CreateShipmentDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| carrierKey | string | no | Carrier service key (e.g., ups_ground) |
| carrierName | string | no | Human-readable carrier name |
| trackingNumber | string | no | Shipment tracking number |
| trackingUrl | string | no | Tracking URL for the shipment |
| notes | string | no | Internal notes about the shipment |
| items | array<CreateShipmentItemDto> | yes | Shipment line items |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Shipment created | FulfillmentResponseDto | id: string required; orderId: string required; shipmentNumber: string required; status: string required; carrierKey: string; carrierName: string; trackingNumber: string; trackingUrl: string; notes: string; shippedAt: string; deliveredAt: string; cancelledAt: string; createdAt: string required; updatedAt: string required; items: array<FulfillmentItemDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Order not found |

### PATCH /api/v1/orders/admin/{orderId}/shipments/{shipmentId}/status

- Summary: Update shipment status
- Operation ID: `AdminFulfillment_updateShipmentStatus`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| orderId | path | string | yes | Order identifier |
| shipmentId | path | string | yes | Shipment identifier |

#### Request Body

- Required: yes
- Schema: `UpdateShipmentStatusDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| status | string: PENDING \| SHIPPED \| DELIVERED \| CANCELLED | yes |  |
| trackingNumber | string | no |  |
| trackingUrl | string | no |  |
| notes | string | no |  |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Shipment status updated | FulfillmentResponseDto | id: string required; orderId: string required; shipmentNumber: string required; status: string required; carrierKey: string; carrierName: string; trackingNumber: string; trackingUrl: string; notes: string; shippedAt: string; deliveredAt: string; cancelledAt: string; createdAt: string required; updatedAt: string required; items: array<FulfillmentItemDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Order or shipment not found |

## Health

### GET /api/v1/health/liveness

- Summary: Check API process liveness
- Operation ID: `Health_getLiveness`
- Auth: Public or guest-accessible

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | API process is alive | HealthLivenessResponseDto | status: string required |

#### Error Responses

No explicit non-2xx responses documented beyond framework defaults.

### GET /api/v1/health/readiness

- Summary: Check API readiness including downstream dependencies
- Operation ID: `Health_getReadiness`
- Auth: Public or guest-accessible

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | The Health Check is successful | HealthReadinessResponseDto | status: string required; info: object<string, HealthIndicatorDetailDto>; error: object<string, HealthIndicatorDetailDto>; details: object<string, HealthIndicatorDetailDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 503 | The Health Check is not successful |

## Identity

### GET /api/v1/identity/admin/access-check

- Summary: Verify privileged identity access for administrative actors
- Operation ID: `Identity_getAdminAccessCheck`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Administrative identity access is allowed | AdminAccessCheckResponseDto | allowed: boolean required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request parameters |
| 401 | Missing or invalid access token |
| 403 | Missing required role or permission |

### GET /api/v1/identity/users/{userId}/profile

- Summary: Read a user profile when the actor owns it or has identity.read access
- Operation ID: `Identity_getUserProfile`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| userId | path | string | yes | UUID of the user whose profile is requested |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | User profile returned | UserProfileDto | id: string required; email: string required; displayName: string required; userType: string required; status: string required; emailVerifiedAt: string; lastLoginAt: string; createdAt: string required; roles: array<UserRoleDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request parameters |
| 401 | Missing or invalid access token |
| 403 | Object-level access denied |
| 404 | Requested user not found |

## Identity Admin

### GET /api/v1/identity/admin/customers

- Summary: List all customers
- Operation ID: `AdminAccess_listCustomers`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All customers | array<AdminCustomerSummaryDto> | Array of AdminCustomerSummaryDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Missing required role or permission |

### GET /api/v1/identity/admin/permissions

- Summary: List all available admin permissions
- Operation ID: `AdminAccess_listPermissions`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All available permissions | array<AdminPermissionDto> | Array of AdminPermissionDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Missing required role or permission |

### GET /api/v1/identity/admin/roles

- Summary: List all admin roles
- Operation ID: `AdminAccess_listRoles`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All admin roles | array<AdminRoleDto> | Array of AdminRoleDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Missing required role or permission |

### POST /api/v1/identity/admin/roles

- Summary: Create a new admin role
- Operation ID: `AdminAccess_createRole`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `CreateAdminRoleDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| key | string | yes | Unique role key (lowercase, snake_case) |
| name | string | yes | Human-readable role name |
| description | string | no | Optional role description |
| permissionKeys | array<string> | yes | Permission keys assigned to this role |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Role created | AdminRoleDto | id: string required; key: string required; name: string required; description: string; permissions: array<AdminPermissionDto> required; staffCount: number; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Missing required role or permission |

### PATCH /api/v1/identity/admin/roles/{roleId}/permissions

- Summary: Update an admin role's permission set
- Operation ID: `AdminAccess_updateRolePermissions`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| roleId | path | string | yes | UUID of the admin role to update |

#### Request Body

- Required: yes
- Schema: `UpdateAdminRolePermissionsDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| permissionKeys | array<string> | yes | New set of permission keys for the role |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Role permissions updated | AdminRoleDto | id: string required; key: string required; name: string required; description: string; permissions: array<AdminPermissionDto> required; staffCount: number; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Missing required role or permission |
| 404 | Requested role not found |

### GET /api/v1/identity/admin/staff

- Summary: List all staff members
- Operation ID: `AdminAccess_listStaff`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All staff members | array<StaffSummaryDto> | Array of StaffSummaryDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Missing required role or permission |

### POST /api/v1/identity/admin/staff/{staffId}/resend-invitation

- Summary: Resend a staff member invitation
- Operation ID: `AdminAccess_resendStaffInvitation`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| staffId | path | string | yes | UUID of the staff member to resend invitation to |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Invitation resent | InvitationSentResponseDto | invitationSent: boolean required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request parameters |
| 401 | Missing or invalid access token |
| 403 | Missing required role or permission |
| 404 | Requested staff member not found |

### PATCH /api/v1/identity/admin/staff/{staffId}/roles

- Summary: Update a staff member's role assignments
- Operation ID: `AdminAccess_updateStaffRoles`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| staffId | path | string | yes | UUID of the staff member to update |

#### Request Body

- Required: yes
- Schema: `UpdateStaffRolesDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| roleIds | array<string> | yes | New set of role IDs for the staff member |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Staff roles updated | StaffDetailDto | id: string required; email: string required; displayName: string required; status: string required; roles: array<UserRoleDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Missing required role or permission |
| 404 | Requested staff member not found |

### PATCH /api/v1/identity/admin/staff/{staffId}/status

- Summary: Update a staff member's account status
- Operation ID: `AdminAccess_updateStaffStatus`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| staffId | path | string | yes | UUID of the staff member to update |

#### Request Body

- Required: yes
- Schema: `UpdateStaffStatusDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| status | string: ACTIVE \| SUSPENDED \| DISABLED | yes | New staff account status |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Staff status updated | StaffStatusResponseDto | id: string required; email: string required; displayName: string required; status: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Missing required role or permission |
| 404 | Requested staff member not found |

### POST /api/v1/identity/admin/staff/invitations

- Summary: Create a staff member invitation
- Operation ID: `AdminAccess_inviteStaff`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `InviteStaffDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| email | string (email) | yes | Email address of the staff member to invite |
| displayName | string | yes | Display name for the invited staff member |
| roleIds | array<string> | yes | Role IDs to assign upon invitation |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Staff invitation created | StaffSummaryDto | id: string required; email: string required; displayName: string required; status: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Missing required role or permission |

## Inventory Admin

### POST /api/v1/inventory/admin/adjustments

- Summary: Adjust stock quantity for a variant in a warehouse
- Operation ID: `InventoryAdmin_adjustStock`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `AdjustStockDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| warehouseId | string | yes | Warehouse identifier |
| variantId | string | yes | Catalog variant identifier |
| quantityChanged | number | yes | Quantity change (positive or negative, must not be zero) |
| type | string: RECEIPT \| ADJUSTMENT \| SALE \| RETURN_RESTOCK \| WASTE | yes | Movement type |
| referenceType | string | no | Reference type for traceability (e.g. order, return) |
| referenceId | string | no | Reference identifier for traceability |
| reason | string | no | Human-readable reason for the adjustment |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Stock adjustment applied | StockAdjustmentResponseDto | id: string required; warehouseId: string required; variantId: string required; type: string required; quantityChanged: number required; referenceType: string; referenceId: string; actorUserId: string; createdAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/inventory/admin/levels

- Summary: Query current stock levels with optional filters
- Operation ID: `InventoryAdmin_getStockLevels`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| warehouseId | query | string | no | Filter by warehouse identifier |
| variantId | query | string | no | Filter by variant identifier |
| sku | query | string | no | Filter by variant SKU |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Current stock levels | array<StockLevelResponseDto> | Array of StockLevelResponseDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/inventory/admin/movements

- Summary: Query paginated stock movement history
- Operation ID: `InventoryAdmin_getStockMovements`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| warehouseId | query | string | no | Filter by warehouse identifier |
| variantId | query | string | no | Filter by variant identifier |
| type | query | string: RECEIPT \| ADJUSTMENT \| SALE \| RETURN_RESTOCK \| WASTE | no | Filter by movement type |
| page | query | integer | no | Page number (1-based) |
| limit | query | integer | no | Results per page (minimum 1) |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Paginated stock movements | PaginatedStockMovementsDto | items: array<StockMovementItemDto> required; pagination: PaginationDto required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/inventory/admin/reservations

- Summary: Query stock reservations with optional filters and status
- Operation ID: `InventoryAdmin_getReservations`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| warehouseId | query | string | no | Filter by warehouse identifier |
| variantId | query | string | no | Filter by variant identifier |
| status | query | string: RESERVED \| REDEEMED \| RELEASED \| EXPIRED | no | Filter by reservation status |
| limit | query | integer | no | Maximum results to return (1-100) |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Stock reservations | array<StockReservationResponseDto> | Array of StockReservationResponseDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

## Notifications

### GET /api/v1/notifications/me

- Summary: List my notifications
- Operation ID: `CustomerNotifications_listMyNotifications`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| cursor | query | string | no | Cursor for pagination |
| status | query | string: PENDING \| PROCESSING \| SENT \| FAILED | no | Filter by notification status |
| channel | query | string: EMAIL \| PUSH \| IN_APP | no | Filter by notification channel |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Paginated list of notifications | PaginatedNotificationsDto | items: array<NotificationResponseDto> required; nextCursor: string |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |

### GET /api/v1/notifications/me/preferences

- Summary: Get my notification preferences
- Operation ID: `CustomerNotifications_getPreference`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Notification preferences | NotificationPreferenceResponseDto | id: string required; userId: string required; channel: string required; orderConfirmations: boolean required; orderShipments: boolean required; orderDeliveries: boolean required; returnStatusUpdates: boolean required; reviewReplies: boolean required; backInStock: boolean required; lowStockAlerts: boolean required; promotionalMessages: boolean required; createdAt: string (date-time) required; updatedAt: string (date-time) required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |

### PUT /api/v1/notifications/me/preferences

- Summary: Upsert notification preferences
- Operation ID: `CustomerNotifications_upsertPreference`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `UpsertNotificationPreferenceDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| channel | string: EMAIL \| PUSH \| IN_APP | yes | Notification channel to configure |
| orderConfirmations | boolean | no | Enable or disable order confirmation notifications |
| orderShipments | boolean | no | Enable or disable order shipment notifications |
| orderDeliveries | boolean | no | Enable or disable order delivery notifications |
| returnStatusUpdates | boolean | no | Enable or disable return status update notifications |
| reviewReplies | boolean | no | Enable or disable review reply notifications |
| backInStock | boolean | no | Enable or disable back-in-stock notifications |
| lowStockAlerts | boolean | no | Enable or disable low stock alert notifications |
| promotionalMessages | boolean | no | Enable or disable promotional message notifications |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Updated notification preferences | NotificationPreferenceResponseDto | id: string required; userId: string required; channel: string required; orderConfirmations: boolean required; orderShipments: boolean required; orderDeliveries: boolean required; returnStatusUpdates: boolean required; reviewReplies: boolean required; backInStock: boolean required; lowStockAlerts: boolean required; promotionalMessages: boolean required; createdAt: string (date-time) required; updatedAt: string (date-time) required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |

### POST /api/v1/notifications/me/push-devices

- Summary: Register a push device
- Operation ID: `CustomerNotifications_registerPushDevice`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `RegisterPushDeviceDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| token | string | yes | Push notification device token |
| platform | string: android \| ios \| web | yes | Push device platform |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Push device registered | PushDeviceResponseDto | id: string required; userId: string required; token: string required; platform: string required; isActive: boolean required; createdAt: string (date-time) required; updatedAt: string (date-time) required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |

### DELETE /api/v1/notifications/me/push-devices/{deviceId}

- Summary: Unregister a push device
- Operation ID: `CustomerNotifications_unregisterPushDevice`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| deviceId | path | string | yes | Push device identifier |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Push device unregistered | UnregisterPushDeviceResponseDto | removed: boolean required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |
| 404 | Push device not found |

## Notifications Admin

### GET /api/v1/notifications/admin

- Summary: List all notifications
- Operation ID: `AdminNotifications_listNotifications`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| cursor | query | string | no | Cursor for pagination |
| status | query | string: PENDING \| PROCESSING \| SENT \| FAILED | no | Filter by notification status |
| channel | query | string: EMAIL \| PUSH \| IN_APP | no | Filter by notification channel |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Paginated list of notifications | PaginatedNotificationsDto | items: array<NotificationResponseDto> required; nextCursor: string |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/notifications/admin/{notificationId}/retry

- Summary: Retry a failed notification
- Operation ID: `AdminNotifications_retryNotification`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| notificationId | path | string | yes | Notification identifier |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Notification retry initiated | NotificationResponseDto | id: string required; userId: string; recipientEmail: string; channel: string required; eventType: string required; title: string required; body: string; status: string required; relatedEntityType: string; relatedEntityId: string; deduplicationKey: string required; lastError: string; attempts: number required; availableAt: string; processedAt: string; createdAt: string required; updatedAt: string required; user: allOf(NotificationUserBriefDto) |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Notification not found |

## Orders

### GET /api/v1/orders/me

- Summary: List authenticated customer orders
- Operation ID: `CustomerOrders_listMyOrders`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | List of customer orders | array<SerializedOrderDto> | Array of SerializedOrderDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |

### GET /api/v1/orders/me/{orderId}

- Summary: Get a single customer order by ID
- Operation ID: `CustomerOrders_getMyOrder`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| orderId | path | string | yes | Order ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Customer order details | SerializedOrderDto | id: string required; orderNumber: string required; userId: string; cartId: string required; status: string required; paymentMethod: string required; paymentStatus: string required; fulfillmentStatus: string required; customerEmail: string required; customerName: string required; customerPhone: string required; currencyCode: string required; countryCode: string required; shippingMethod: OrderShippingMethodDetailsDto required; couponCode: string; subtotalAmount: number required; subtotalDiscountAmount: number required; discountedSubtotalAmount: number required; shippingAmount: number required; taxAmount: number required; grandTotalAmount: number required; paidAt: string; placedAt: string required; createdAt: string required; updatedAt: string required; addresses: array<OrderAddressDto> required; items: array<OrderLineItemDto> required; appliedPromotions: array<OrderAppliedPromotionDto> required; shipments: array<OrderShipmentDto> required; returnRequests: array<OrderReturnRequestDto> required; refunds: array<OrderRefundDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |
| 404 | Order not found |

### POST /api/v1/orders/me/{orderId}/cancel

- Summary: Cancel an order
- Operation ID: `CustomerOrderCancellation_cancelOrder`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| orderId | path | string | yes | Order identifier |

#### Request Body

- Required: yes
- Schema: `CancelOrderDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| reason | string | no | Reason for order cancellation |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Order cancelled | SerializedOrderDto | id: string required; orderNumber: string required; userId: string; cartId: string required; status: string required; paymentMethod: string required; paymentStatus: string required; fulfillmentStatus: string required; customerEmail: string required; customerName: string required; customerPhone: string required; currencyCode: string required; countryCode: string required; shippingMethod: OrderShippingMethodDetailsDto required; couponCode: string; subtotalAmount: number required; subtotalDiscountAmount: number required; discountedSubtotalAmount: number required; shippingAmount: number required; taxAmount: number required; grandTotalAmount: number required; paidAt: string; placedAt: string required; createdAt: string required; updatedAt: string required; addresses: array<OrderAddressDto> required; items: array<OrderLineItemDto> required; appliedPromotions: array<OrderAppliedPromotionDto> required; shipments: array<OrderShipmentDto> required; returnRequests: array<OrderReturnRequestDto> required; refunds: array<OrderRefundDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Order cannot be cancelled by this authenticated user |
| 404 | Order not found |

## Orders Admin

### GET /api/v1/orders/admin

- Summary: List all orders (admin view)
- Operation ID: `AdminOrders_listOrders`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | List of all orders (admin view) | array<SerializedOrderDto> | Array of SerializedOrderDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/orders/admin/{orderId}

- Summary: Get a single order by ID (admin view)
- Operation ID: `AdminOrders_getOrder`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| orderId | path | string | yes | Order ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Order details (admin view) | SerializedOrderDto | id: string required; orderNumber: string required; userId: string; cartId: string required; status: string required; paymentMethod: string required; paymentStatus: string required; fulfillmentStatus: string required; customerEmail: string required; customerName: string required; customerPhone: string required; currencyCode: string required; countryCode: string required; shippingMethod: OrderShippingMethodDetailsDto required; couponCode: string; subtotalAmount: number required; subtotalDiscountAmount: number required; discountedSubtotalAmount: number required; shippingAmount: number required; taxAmount: number required; grandTotalAmount: number required; paidAt: string; placedAt: string required; createdAt: string required; updatedAt: string required; addresses: array<OrderAddressDto> required; items: array<OrderLineItemDto> required; appliedPromotions: array<OrderAppliedPromotionDto> required; shipments: array<OrderShipmentDto> required; returnRequests: array<OrderReturnRequestDto> required; refunds: array<OrderRefundDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Order not found |

### POST /api/v1/orders/admin/{orderId}/cancel

- Summary: Admin cancel an order
- Operation ID: `AdminOrderCancellation_cancelOrder`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| orderId | path | string | yes | Order identifier |

#### Request Body

- Required: yes
- Schema: `CancelOrderDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| reason | string | no | Reason for order cancellation |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Order cancelled | SerializedOrderDto | id: string required; orderNumber: string required; userId: string; cartId: string required; status: string required; paymentMethod: string required; paymentStatus: string required; fulfillmentStatus: string required; customerEmail: string required; customerName: string required; customerPhone: string required; currencyCode: string required; countryCode: string required; shippingMethod: OrderShippingMethodDetailsDto required; couponCode: string; subtotalAmount: number required; subtotalDiscountAmount: number required; discountedSubtotalAmount: number required; shippingAmount: number required; taxAmount: number required; grandTotalAmount: number required; paidAt: string; placedAt: string required; createdAt: string required; updatedAt: string required; addresses: array<OrderAddressDto> required; items: array<OrderLineItemDto> required; appliedPromotions: array<OrderAppliedPromotionDto> required; shipments: array<OrderShipmentDto> required; returnRequests: array<OrderReturnRequestDto> required; refunds: array<OrderRefundDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Order not found |

## Payments Admin

### GET /api/v1/payments/admin/attempts

- Summary: List all payment attempts
- Operation ID: `AdminPayments_listAttempts`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| cursor | query | string | no | Pagination cursor (opaque token from previous page) |
| limit | query | integer | no | Page size (1-100, default server-defined) |
| orderId | query | string | no | Filter by order ID |
| status | query | string: AWAITING_CUSTOMER_ACTION \| PROCESSING \| SUCCEEDED \| FAILED \| CANCELLED | no | Filter by payment-attempt status |
| provider | query | string: COD \| STRIPE | no | Filter by payment provider |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Paginated list of payment attempts | PaginatedPaymentAttemptsDto | items: array<PaymentAttemptResponseDto> required; nextCursor: string |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/payments/admin/refunds

- Summary: List all refunds
- Operation ID: `AdminPayments_listRefunds`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| cursor | query | string | no | Pagination cursor (opaque token from previous page) |
| limit | query | integer | no | Page size (1-100, default server-defined) |
| orderId | query | string | no | Filter by order ID |
| status | query | string: PENDING \| SUCCEEDED \| FAILED | no | Filter by refund status |
| provider | query | string: COD \| STRIPE | no | Filter by payment provider |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Paginated list of refunds | PaginatedRefundsDto | items: array<RefundResponseDto> required; nextCursor: string |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/payments/admin/webhook-events

- Summary: List all payment webhook events
- Operation ID: `AdminPayments_listWebhookEvents`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| cursor | query | string | no | Pagination cursor (opaque token from previous page) |
| limit | query | integer | no | Page size (1-100, default server-defined) |
| orderId | query | string | no | Filter by order ID |
| status | query | string: RECEIVED \| PROCESSED \| DUPLICATE \| FAILED | no | Filter by webhook-event status |
| provider | query | string: COD \| STRIPE | no | Filter by payment provider |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Paginated list of payment webhook events | PaginatedPaymentWebhookEventsDto | items: array<PaymentWebhookEventResponseDto> required; nextCursor: string |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

## Pricing Admin

### PUT /api/v1/pricing/admin/settings/behavior

- Summary: Update pricing behavior (tax inclusion, defaults)
- Operation ID: `PricingAdmin_updatePricingBehavior`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `UpdatePricingBehaviorDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| pricesIncludeTax | boolean | yes | Whether displayed prices include tax by default |
| defaultTaxCountryCode | string | no | Default ISO 3166-1 alpha-2 country code for tax calculation |
| shippingCurrencyCode | string | no | Default ISO 4217 currency code for shipping charges |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Pricing behavior updated | StoreSettingResponseDto | id: string required; key: string required; value: object required; description: string; isPublic: boolean required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### PUT /api/v1/pricing/admin/settings/currency

- Summary: Update the default store currency
- Operation ID: `PricingAdmin_updateStoreCurrency`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `UpdateStoreCurrencyDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| currencyCode | string | yes | ISO 4217 currency code (e.g. USD) |
| symbol | string | yes | Currency symbol (e.g. $) |
| minorUnit | number | yes | Number of decimal minor units (e.g. 2 for cents) |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Store currency updated | StoreSettingResponseDto | id: string required; key: string required; value: object required; description: string; isPublic: boolean required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### PUT /api/v1/pricing/admin/shipping-zones/{key}

- Summary: Upsert a shipping zone by key
- Operation ID: `PricingAdmin_upsertShippingZone`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| key | path | string | yes | Unique key of the shipping zone |

#### Request Body

- Required: yes
- Schema: `UpsertShippingZoneDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| name | string | yes | Display name of the shipping zone |
| isActive | boolean | no | Whether this zone is active for checkout |
| countryCodes | array<string> | yes | ISO 3166-1 alpha-2 country codes in this zone |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Shipping zone upserted | ShippingZoneResponseDto | id: string required; key: string required; name: string required; isActive: boolean required; countryCodes: array<string> required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### PUT /api/v1/pricing/admin/shipping-zones/{zoneId}/methods/{key}

- Summary: Upsert a shipping method within a shipping zone
- Operation ID: `PricingAdmin_upsertShippingMethod`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| zoneId | path | string | yes | Unique identifier of the shipping zone |
| key | path | string | yes | Unique key of the shipping method |

#### Request Body

- Required: yes
- Schema: `UpsertShippingMethodDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| name | string | yes | Display name of the shipping method |
| isActive | boolean | no | Whether this method is available at checkout |
| rateType | string: FLAT \| PERCENTAGE_OF_SUBTOTAL | yes | Rate calculation type: FLAT or PERCENTAGE_OF_SUBTOTAL |
| currencyCode | string | yes | ISO 4217 currency code for shipping charges |
| flatAmount | number | no | Flat shipping amount in minor currency units |
| percentageBps | number | no | Percentage rate in basis points (e.g. 500 = 5.00%) |
| minSubtotalAmount | number | no | Minimum subtotal required for this method |
| maxSubtotalAmount | number | no | Maximum subtotal allowed for this method |
| minItemQuantity | number | no | Minimum item quantity required |
| maxItemQuantity | number | no | Maximum item quantity allowed |
| estimatedMinDays | number | no | Estimated minimum delivery days |
| estimatedMaxDays | number | no | Estimated maximum delivery days |
| sortOrder | number | no | Sort order for display purposes |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Shipping method upserted | ShippingMethodResponseDto | id: string required; zoneId: string required; key: string required; name: string required; isActive: boolean required; rateType: string required; currencyCode: string required; flatAmount: number; percentageBps: number; estimatedMinDays: number; estimatedMaxDays: number; sortOrder: number required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### PUT /api/v1/pricing/admin/tax-classes/{key}

- Summary: Upsert a tax class by key
- Operation ID: `PricingAdmin_upsertTaxClass`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| key | path | string | yes | Unique key of the tax class |

#### Request Body

- Required: yes
- Schema: `UpsertTaxClassDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| name | string | yes | Display name of the tax class |
| isDefault | boolean | no | Whether this class is the store default |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Tax class upserted | TaxClassResponseDto | id: string required; key: string required; name: string required; isDefault: boolean required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### PUT /api/v1/pricing/admin/tax-classes/{taxClassId}/rates/{countryCode}

- Summary: Upsert a manual tax rate for a tax class and country
- Operation ID: `PricingAdmin_upsertManualTaxRate`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| taxClassId | path | string | yes | Unique identifier of the tax class |
| countryCode | path | string | yes | ISO 3166-1 alpha-2 country code |

#### Request Body

- Required: yes
- Schema: `UpsertManualTaxRateDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| rateBps | number | yes | Tax rate in basis points (e.g. 850 = 8.50%) |
| isIncludedInPrice | boolean | no | Whether this tax rate is included in the displayed price |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Manual tax rate upserted | ManualTaxRateResponseDto | id: string required; taxClassId: string required; countryCode: string required; rateBps: number required; isIncludedInPrice: boolean required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### PUT /api/v1/pricing/admin/variants/{variantId}/price

- Summary: Upsert variant price for a given currency
- Operation ID: `PricingAdmin_upsertVariantPrice`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| variantId | path | string | yes | Unique identifier of the catalog variant |

#### Request Body

- Required: yes
- Schema: `UpsertVariantPriceDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| currencyCode | string | yes | ISO 4217 currency code for this price |
| baseAmount | number | yes | Base price in minor currency units |
| saleAmount | number | no | Optional sale price in minor currency units |
| saleStartsAt | string (date-time) | no | Sale start date-time |
| saleEndsAt | string (date-time) | no | Sale end date-time |
| taxClassId | string | no | Tax class identifier for this price entry |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Variant price upserted | VariantPriceResponseDto | id: string required; variantId: string required; currencyCode: string required; baseAmount: number required; saleAmount: number; saleStartsAt: string; saleEndsAt: string; taxClassId: string; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

## Pricing Public

### POST /api/v1/pricing/checkout/preview

- Summary: Preview checkout pricing, taxes, shipping, and promotions
- Operation ID: `PricingPublic_previewCheckout`
- Auth: Public or guest-accessible

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `CheckoutPreviewDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| currencyCode | string | yes | ISO 4217 currency code (e.g. USD) |
| countryCode | string | yes | ISO 3166-1 alpha-2 country code for tax and shipping |
| customerLocale | string | no | Locale for translated output (e.g. en-US) |
| customerId | string | no | Customer identifier for personalised pricing |
| couponCodes | array<string> | no | Coupon codes to apply during preview |
| items | array<CheckoutPreviewItemDto> | yes | Line items to include in the preview |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Checkout price preview computed | PricingPreviewResponseDto | currencyCode: string required; countryCode: string required; subtotalAmount: number required; subtotalDiscountAmount: number required; discountedSubtotalAmount: number required; taxAmount: number required; grandTotalExcludingShippingAmount: number required; items: array<PricingPreviewLineItemDto> required; appliedPromotions: array<PricingPreviewAppliedPromotionDto> required; rejectedPromotions: array<string> required; shippingMethods: array<PricingPreviewShippingMethodDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |

## Promotions Admin

### GET /api/v1/promotions/admin

- Summary: List all promotions
- Operation ID: `PromotionsAdmin_listPromotions`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | All promotions | array<PromotionResponseDto> | Array of PromotionResponseDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/promotions/admin/{promotionId}

- Summary: Get a single promotion by ID
- Operation ID: `PromotionsAdmin_getPromotion`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| promotionId | path | string | yes | Promotion ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Promotion details | PromotionResponseDto | id: string required; key: string required; name: string required; description: string; status: string required; trigger: string required; rewardType: string required; currencyCode: string; fixedAmount: number; percentageBps: number; maxDiscountAmount: number; minSubtotalAmount: number; isCombinable: boolean required; priority: number required; startsAt: string; endsAt: string; totalUsageLimit: number; perCustomerUsageLimit: number; maxApplicationsPerOrder: number required; reservedCount: number required; redeemedCount: number required; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Promotion not found |

### PUT /api/v1/promotions/admin/{promotionId}/coupons/{code}

- Summary: Create or update a coupon for a promotion
- Operation ID: `PromotionsAdmin_upsertCoupon`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| promotionId | path | string | yes | Promotion ID |
| code | path | string | yes | Coupon code |

#### Request Body

- Required: yes
- Schema: `UpsertCouponDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| code | string | yes | Unique coupon code |
| status | string: ACTIVE \| DISABLED \| ARCHIVED | yes | Coupon status |
| startsAt | string (date-time) | no | Start date (ISO 8601) |
| endsAt | string (date-time) | no | End date (ISO 8601) |
| totalUsageLimit | number | no | Maximum number of total redemptions for this coupon |
| perCustomerUsageLimit | number | no | Maximum redemptions per customer for this coupon |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Coupon created or updated | CouponResponseDto | id: string required; promotionId: string required; code: string required; normalizedCode: string required; status: string required; startsAt: string; endsAt: string; totalUsageLimit: number; perCustomerUsageLimit: number; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Promotion not found |

### PUT /api/v1/promotions/admin/by-key/{promotionKey}

- Summary: Create or update a promotion by key
- Operation ID: `PromotionsAdmin_upsertPromotion`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| promotionKey | path | string | yes | Unique promotion key |

#### Request Body

- Required: yes
- Schema: `UpsertPromotionDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| name | string | yes | Human-readable promotion name |
| description | string | no | Promotion description |
| status | string: DRAFT \| ACTIVE \| ARCHIVED | yes | Promotion status |
| trigger | string: AUTOMATIC \| COUPON | yes | How the promotion is triggered |
| rewardType | string: FIXED_AMOUNT \| PERCENTAGE \| FREE_SHIPPING | yes | Type of discount reward |
| currencyCode | string | no | ISO 4217 currency code |
| fixedAmount | number | no | Fixed discount amount in minor units |
| percentageBps | number | no | Percentage discount in basis points (e.g. 1000 = 10%) |
| maxDiscountAmount | number | no | Maximum discount amount in minor units |
| minSubtotalAmount | number | no | Minimum subtotal required in minor units |
| isCombinable | boolean | no | Whether this promotion can combine with others |
| priority | number | no | Evaluation priority (higher = evaluated first) |
| startsAt | string (date-time) | no | Start date (ISO 8601) |
| endsAt | string (date-time) | no | End date (ISO 8601) |
| totalUsageLimit | number | no | Maximum number of total redemptions |
| perCustomerUsageLimit | number | no | Maximum redemptions per customer |
| maxApplicationsPerOrder | number | no | Maximum applications per order |
| excludedPromotionIds | array<string> | no | Promotion IDs excluded from stacking |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Promotion created or updated | PromotionResponseDto | id: string required; key: string required; name: string required; description: string; status: string required; trigger: string required; rewardType: string required; currencyCode: string; fixedAmount: number; percentageBps: number; maxDiscountAmount: number; minSubtotalAmount: number; isCombinable: boolean required; priority: number required; startsAt: string; endsAt: string; totalUsageLimit: number; perCustomerUsageLimit: number; maxApplicationsPerOrder: number required; reservedCount: number required; redeemedCount: number required; createdAt: string required; updatedAt: string required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

## Reporting Admin

### GET /api/v1/reports/admin/exports

- Summary: List report exports with cursor pagination
- Operation ID: `AdminReporting_listExports`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| cursor | query | string | no | Cursor for the next page of results |
| limit | query | integer | no | Results per page (1-100) |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Cursor-paginated list of report exports | PaginatedReportExportsDto | items: array<ReportExportResponseDto> required; nextCursor: string |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### POST /api/v1/reports/admin/exports

- Summary: Request a new asynchronous report export
- Operation ID: `AdminReporting_createExport`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `CreateReportExportDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| reportType | string: sales_summary \| top_products \| promotion_performance \| inventory_kpis | yes | Report type identifier (sales_summary, top_products, promotion_performance, inventory_kpis) |
| parameters | object | no | Optional parameters to constrain the report scope |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Report export created and enqueued | ReportExportResponseDto | id: string required; reportType: string required; parametersJson: object required; status: string required; resultObjectKey: string; errorMessage: string; requestedByUserId: string required; startedAt: string; completedAt: string; failedAt: string; createdAt: string required; updatedAt: string required; requestedBy: ReportExportUserBriefDto required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/reports/admin/exports/{exportId}/download

- Summary: Generate a short-lived download URL for an export result
- Operation ID: `AdminReporting_createExportDownloadUrl`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| exportId | path | string | yes | Unique identifier of the report export |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Pre-signed download URL for the export | ReportExportDownloadResponseDto | exportId: string required; downloadUrl: string required; expiresInSeconds: number required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Requested export not found |

### GET /api/v1/reports/admin/inventory-kpis

- Summary: Retrieve inventory KPI metrics
- Operation ID: `AdminReporting_getInventoryKpis`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Inventory KPI aggregate data | InventoryKpisResponseDto | stock: InventoryKpisStockMetricDto required; warehouses: number required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/reports/admin/promotion-performance

- Summary: Retrieve promotion usage and performance analytics
- Operation ID: `AdminReporting_getPromotionPerformance`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Promotion performance analytics data | array<PromotionPerformanceDto> | Array of PromotionPerformanceDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/reports/admin/sales-summary

- Summary: Retrieve aggregate sales summary metrics
- Operation ID: `AdminReporting_getSalesSummary`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Sales summary aggregate data | SalesSummaryResponseDto | orders: SalesSummaryMetricDto required; orderLines: SalesSummaryLinesMetricDto required; refunds: SalesSummaryRefundsMetricDto required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/reports/admin/top-products

- Summary: List top-selling products by quantity
- Operation ID: `AdminReporting_getTopProducts`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Top products performance data | array<TopProductDto> | Array of TopProductDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

## Returns

### GET /api/v1/returns/me

- Summary: List my return requests
- Operation ID: `CustomerReturns_listMyReturns`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | List of customer return requests | array<ReturnRequestResponseDto> | Array of ReturnRequestResponseDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |

### GET /api/v1/returns/me/{returnRequestId}

- Summary: Get a return request by ID
- Operation ID: `CustomerReturns_getMyReturn`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| returnRequestId | path | string | yes | Return request identifier |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Return request details | ReturnRequestResponseDto | id: string required; orderId: string required; returnNumber: string required; requestedByUserId: string required; reviewedByUserId: string; receivedByUserId: string; status: string required; reason: string required; notes: string; reviewNotes: string; rejectionReason: string; approvedAt: string; rejectedAt: string; receivedAt: string; closedAt: string; createdAt: string required; updatedAt: string required; items: array<ReturnRequestItemResponseDto> required; refunds: array<OrderRefundDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |
| 404 | Return request not found |

### POST /api/v1/returns/me/orders/{orderId}

- Summary: Create a return request for an order
- Operation ID: `CustomerReturns_createReturn`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| orderId | path | string | yes | Order identifier |

#### Request Body

- Required: yes
- Schema: `CreateReturnRequestDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| reason | string | yes | Overall reason for the return request |
| notes | string | no | Additional notes for the return request |
| items | array<CreateReturnRequestItemDto> | yes | List of order line items to return |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Return request created | ReturnRequestResponseDto | id: string required; orderId: string required; returnNumber: string required; requestedByUserId: string required; reviewedByUserId: string; receivedByUserId: string; status: string required; reason: string required; notes: string; reviewNotes: string; rejectionReason: string; approvedAt: string; rejectedAt: string; receivedAt: string; closedAt: string; createdAt: string required; updatedAt: string required; items: array<ReturnRequestItemResponseDto> required; refunds: array<OrderRefundDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |
| 404 | Order not found |

## Returns Admin

### GET /api/v1/returns/admin

- Summary: List all return requests
- Operation ID: `AdminReturns_listReturns`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | List of all return requests | array<ReturnRequestResponseDto> | Array of ReturnRequestResponseDto |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/returns/admin/{returnRequestId}

- Summary: Get a return request by ID
- Operation ID: `AdminReturns_getReturn`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| returnRequestId | path | string | yes | Return request identifier |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Return request details | ReturnRequestResponseDto | id: string required; orderId: string required; returnNumber: string required; requestedByUserId: string required; reviewedByUserId: string; receivedByUserId: string; status: string required; reason: string required; notes: string; reviewNotes: string; rejectionReason: string; approvedAt: string; rejectedAt: string; receivedAt: string; closedAt: string; createdAt: string required; updatedAt: string required; items: array<ReturnRequestItemResponseDto> required; refunds: array<OrderRefundDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Return request not found |

### POST /api/v1/returns/admin/{returnRequestId}/receive

- Summary: Receive a return request
- Operation ID: `AdminReturns_receiveReturn`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| returnRequestId | path | string | yes | Return request identifier |

#### Request Body

- Required: yes
- Schema: `ReceiveReturnRequestDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| items | array<ReceiveReturnRequestItemDto> | yes | List of received return items |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Return request received | ReturnRequestResponseDto | id: string required; orderId: string required; returnNumber: string required; requestedByUserId: string required; reviewedByUserId: string; receivedByUserId: string; status: string required; reason: string required; notes: string; reviewNotes: string; rejectionReason: string; approvedAt: string; rejectedAt: string; receivedAt: string; closedAt: string; createdAt: string required; updatedAt: string required; items: array<ReturnRequestItemResponseDto> required; refunds: array<OrderRefundDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Return request not found |

### POST /api/v1/returns/admin/{returnRequestId}/refund

- Summary: Execute a refund for a return request
- Operation ID: `AdminReturns_refundReturn`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| returnRequestId | path | string | yes | Return request identifier |

#### Request Body

- Required: yes
- Schema: `ExecuteReturnRefundDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| amount | number | yes | Refund amount in the smallest currency unit (e.g., cents) |
| reason | string | no | Reason for the refund |
| isOverride | boolean | no | Set to true to override the automatic refund cap derived from received return items. Requires refunds.override_cap permission. |
| overrideReason | string | no | Required when isOverride is true. Explains why the refund exceeds the received-items cap. |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Return refund executed | ReturnRequestResponseDto | id: string required; orderId: string required; returnNumber: string required; requestedByUserId: string required; reviewedByUserId: string; receivedByUserId: string; status: string required; reason: string required; notes: string; reviewNotes: string; rejectionReason: string; approvedAt: string; rejectedAt: string; receivedAt: string; closedAt: string; createdAt: string required; updatedAt: string required; items: array<ReturnRequestItemResponseDto> required; refunds: array<OrderRefundDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Return request not found |

### POST /api/v1/returns/admin/{returnRequestId}/review

- Summary: Review a return request
- Operation ID: `AdminReturns_reviewReturn`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| returnRequestId | path | string | yes | Return request identifier |

#### Request Body

- Required: yes
- Schema: `ReviewReturnRequestDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| decision | string: approve \| reject | yes | Review decision for the return request |
| reviewNotes | string | no | Internal review notes |
| rejectionReason | string | no | Reason for rejection (required when decision is reject) |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Return request reviewed | ReturnRequestResponseDto | id: string required; orderId: string required; returnNumber: string required; requestedByUserId: string required; reviewedByUserId: string; receivedByUserId: string; status: string required; reason: string required; notes: string; reviewNotes: string; rejectionReason: string; approvedAt: string; rejectedAt: string; receivedAt: string; closedAt: string; createdAt: string required; updatedAt: string required; items: array<ReturnRequestItemResponseDto> required; refunds: array<OrderRefundDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Return request not found |

## Reviews

### GET /api/v1/reviews/me

- Summary: List reviews written by the authenticated customer
- Operation ID: `CustomerReviews_listMyReviews`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| cursor | query | string | no | Pagination cursor |
| limit | query | integer | no | Page size (max 100) |
| status | query | string: PENDING \| APPROVED \| REJECTED \| FLAGGED \| HIDDEN | no | Filter by review status |
| productId | query | string | no | Filter by product ID |
| userId | query | string | no | Filter by user ID (ignored for /me endpoint) |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Paginated list of my reviews | PaginatedReviewsDto | items: array<ReviewResponseDto> required; nextCursor: string |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid query parameters |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |

### GET /api/v1/reviews/me/{reviewId}

- Summary: Get a single review written by the authenticated customer
- Operation ID: `CustomerReviews_getMyReview`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| reviewId | path | string | yes | Review ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Review details | ReviewResponseDto | id: string required; productId: string required; userId: string required; orderLineId: string required; rating: number required; title: string required; body: string required; isVerifiedPurchase: boolean required; status: string required; rejectionReason: string; createdAt: string required; updatedAt: string required; product: ReviewProductDto required; orderLine: ReviewOrderLineDto required; moderationActions: array<ReviewModerationActionDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |
| 404 | Review not found |

### POST /api/v1/reviews/order-lines/{orderLineId}

- Summary: Create a verified purchase review for an order line
- Operation ID: `CustomerReviews_createReview`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| orderLineId | path | string | yes | Order line ID |

#### Request Body

- Required: yes
- Schema: `CreateReviewDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| rating | number | yes | Rating from 1 to 5 |
| title | string | yes | Review title |
| body | string | yes | Review body text |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Review created successfully | ReviewResponseDto | id: string required; productId: string required; userId: string required; orderLineId: string required; rating: number required; title: string required; body: string required; isVerifiedPurchase: boolean required; status: string required; rejectionReason: string; createdAt: string required; updatedAt: string required; product: ReviewProductDto required; orderLine: ReviewOrderLineDto required; moderationActions: array<ReviewModerationActionDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |
| 404 | Order line not found |

## Reviews Admin

### GET /api/v1/reviews/admin

- Summary: List all reviews with pagination and filters
- Operation ID: `AdminReviews_listReviews`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| cursor | query | string | no | Pagination cursor |
| limit | query | integer | no | Page size (max 100) |
| status | query | string: PENDING \| APPROVED \| REJECTED \| FLAGGED \| HIDDEN | no | Filter by review status |
| productId | query | string | no | Filter by product ID |
| userId | query | string | no | Filter by user ID (ignored for /me endpoint) |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Paginated list of reviews | PaginatedReviewsDto | items: array<ReviewResponseDto> required; nextCursor: string |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid query parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |

### GET /api/v1/reviews/admin/{reviewId}

- Summary: Get a single review by ID
- Operation ID: `AdminReviews_getReview`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| reviewId | path | string | yes | Review ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Review details | ReviewResponseDto | id: string required; productId: string required; userId: string required; orderLineId: string required; rating: number required; title: string required; body: string required; isVerifiedPurchase: boolean required; status: string required; rejectionReason: string; createdAt: string required; updatedAt: string required; product: ReviewProductDto required; orderLine: ReviewOrderLineDto required; moderationActions: array<ReviewModerationActionDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Review not found |

### PATCH /api/v1/reviews/admin/{reviewId}/moderate

- Summary: Moderate a review (approve, reject, flag, or hide)
- Operation ID: `AdminReviews_moderateReview`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| reviewId | path | string | yes | Review ID |

#### Request Body

- Required: yes
- Schema: `ReviewModerationDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| decision | string: APPROVE \| REJECT \| FLAG \| HIDE | yes | Moderation decision |
| reason | string | no | Reason for the moderation decision |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Review moderation result | ReviewResponseDto | id: string required; productId: string required; userId: string required; orderLineId: string required; rating: number required; title: string required; body: string required; isVerifiedPurchase: boolean required; status: string required; rejectionReason: string; createdAt: string required; updatedAt: string required; product: ReviewProductDto required; orderLine: ReviewOrderLineDto required; moderationActions: array<ReviewModerationActionDto> required |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Insufficient permissions |
| 404 | Review not found |

## Wishlist

### GET /api/v1/wishlist

- Summary: Get the authenticated user wishlist
- Operation ID: `Wishlist_getWishlist`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | User wishlist | WishlistResponseDto | id: string required; userId: string required; items: array<WishlistItemResponseDto> required; itemCount: number |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |

### POST /api/v1/wishlist/items

- Summary: Add an item to the wishlist
- Operation ID: `Wishlist_addItem`
- Auth: Bearer token required

#### Parameters

None.

#### Request Body

- Required: yes
- Schema: `AddWishlistItemDto`

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| variantId | string | yes | Product variant ID to add to wishlist |

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 201 | Item added to wishlist | WishlistResponseDto | id: string required; userId: string required; items: array<WishlistItemResponseDto> required; itemCount: number |

#### Error Responses

| Status | Description |
| --- | --- |
| 400 | Invalid request body or parameters |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |

### DELETE /api/v1/wishlist/items/{variantId}

- Summary: Remove an item from the wishlist
- Operation ID: `Wishlist_removeItem`
- Auth: Bearer token required

#### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| variantId | path | string | yes | Product variant ID |

#### Request Body

None.

#### Success Responses

| Status | Description | Schema | Top-level output |
| --- | --- | --- | --- |
| 200 | Item removed from wishlist | WishlistResponseDto | id: string required; userId: string required; items: array<WishlistItemResponseDto> required; itemCount: number |

#### Error Responses

| Status | Description |
| --- | --- |
| 401 | Missing or invalid access token |
| 403 | Customer-only resource; admin/staff tokens are rejected |
| 404 | Wishlist item not found |

## Related Repo Docs

- `docs/api/authentication.md` - auth/session behavior and security rules
- `docs/api/error-codes.md` - common error codes and error-envelope shape
- `docs/api/idempotency.md` - checkout placement idempotency contract
- `docs/operations/integrated-dashboard.md` - embedded admin dashboard operational notes
- `plans/phase-13-dashboard-ui/api-permission-map.md` - dashboard-oriented API grouping and permission map

## Maintenance Notes

- When endpoints or DTOs change, regenerate `packages/contracts/openapi/openapi.json` first, then update this handbook from the regenerated contract.
- Treat the OpenAPI JSON as canonical if this handbook and the generated contract ever diverge.
