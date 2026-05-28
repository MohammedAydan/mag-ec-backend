# Dashboard API and Permission Map

## Mapping Rules

- Every screen must map to explicit backend endpoints before implementation.
- Every action must map to an RBAC permission.
- Missing endpoints must be logged as backend follow-up tasks instead of worked around with unsafe client behavior.
- The dashboard must consume API responses through typed DTOs and normalized error handling.

## Auth and Session

Likely API areas:

- `POST /api/v1/auth/login`
- `POST /api/v1/auth/refresh`
- `POST /api/v1/auth/logout`
- `GET /api/v1/auth/me`
- Password reset and verification endpoints where admin self-service uses them.

UI requirements:

- Login screen.
- Session refresh handling.
- Expired-session recovery.
- Permission-denied screen.
- Account menu and logout.

## Identity and Access

Likely API areas:

- `GET /api/v1/identity/users/:userId/profile`
- `GET /api/v1/identity/admin/access-check`

Potential gaps:

- Admin user list.
- Role/permission management.
- Invite user.
- Suspend/deactivate user.

## Catalog

Likely API areas:

- Admin catalog create/update/publish/archive endpoints.
- Public catalog endpoints for preview/reference.
- Media upload-intent and attach endpoints.

Permissions:

- Catalog read.
- Catalog write.
- Product publish/archive.
- Media attach.

Potential gaps:

- Product search facets optimized for admin.
- Bulk publish/archive.
- Bulk price/inventory edit support.

## Pricing, Tax, Shipping

Likely API areas:

- Pricing admin settings.
- Variant price update.
- Tax class/rate upsert.
- Shipping zone/method upsert.
- Checkout preview.

Permissions:

- Pricing read/write.
- Tax write.
- Shipping write.

Potential gaps:

- Read endpoints for full settings if not already present.
- Change history for pricing settings.

## Inventory

Likely API areas:

- Stock adjustment.
- Stock levels.
- Stock movements.

Permissions:

- Inventory read.
- Inventory adjust.

Potential gaps:

- Reservation list.
- Warehouse management CRUD.
- Low-stock threshold configuration.

## Orders, Fulfillment, Returns, Refunds

Likely API areas:

- Admin order list/detail.
- Shipment list/create/status update.
- Admin return list/detail/review/receive/refund.

Permissions:

- Order read.
- Fulfillment write.
- Return review.
- Refund execute.
- Restock decision.

Potential gaps:

- Admin order notes.
- Order cancellation.
- Refund diagnostics.

## Payments

Likely API areas:

- Payment attempt models and webhook ingestion exist in backend.

Potential gaps:

- Admin payment attempt list/detail.
- Webhook event list/detail.
- Provider health/config endpoint.

## Reviews

Likely API areas:

- Customer review endpoints.
- Admin review list/detail/moderate endpoints.

Permissions:

- Review read.
- Review moderate.

## Notifications

Likely API areas:

- Customer notification/preference endpoints.
- Admin notification list.

Permissions:

- Notification read.
- Notification administration if retry/config is added.

Potential gaps:

- Retry failed notification.
- Provider health.

## Reporting

Likely API areas:

- Sales summary.
- Top products.
- Promotion performance.
- Inventory KPIs.
- Export list/create.

Permissions:

- Report read.
- Report export.

Potential gaps:

- Date filters for all report endpoints.
- Download URL/auth strategy for export artifacts.
- Export cancellation/retry.

## Content and Legal

Likely API areas:

- Admin content page list/upsert.
- Legal reference list/upsert.
- Public content/legal reference endpoints for preview.

Permissions:

- Content read/write.
- Legal content manage.

## Audit

Likely API areas:

- Admin audit list.

Permissions:

- Audit read.

Potential gaps:

- Export audit events.
- High-risk action categories.

## Cross-Cutting API Needs

- Consistent error envelope mapping to UI messages.
- Cursor pagination conventions.
- Date and currency formatting metadata.
- Feature flag or capability endpoint.
- Current user permissions endpoint.
- Dashboard overview aggregate endpoint.
- User preferences/saved views endpoint if preferences are server-backed.
