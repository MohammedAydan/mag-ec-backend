# Implemented API Mapping

| Dashboard area | API paths preserved from the original admin |
| --- | --- |
| Authentication | `/auth/login`, `/auth/me`, `/auth/refresh`, `/auth/logout` |
| Overview / Reports | `/reports/admin/sales-summary`, `/reports/admin/inventory-kpis`, `/reports/admin/top-products`, `/reports/admin/exports` |
| Catalog | `/catalog/admin/products`, `/catalog/admin/products/:id`, variant lifecycle and pricing routes |
| Taxonomy | `/catalog/admin/brands`, `/categories`, `/collections`, `/tags`, `/attributes`, `/product-types` |
| Pricing / Promotions | `/pricing/admin/settings/*`, `/pricing/admin/shipping-zones/*`, `/promotions/admin/*` |
| Inventory | `/inventory/admin/levels`, `/movements`, `/reservations`, `/adjustments` |
| Orders / Shipping | `/orders/admin`, `/orders/admin/:id`, `/orders/admin/:id/shipments`, cancellation and shipment status |
| Payments | `/payments/admin/attempts`, `/webhook-events`, `/refunds` |
| Returns | `/returns/admin`, review, receive, and refund actions |
| Reviews | `/reviews/admin`, moderation route |
| Notifications | `/notifications/admin`, retry route |
| Access | `/identity/admin/staff`, `/roles`, `/permissions`, `/customers` |
| Support visibility | `/support/admin/carts`, `/support/admin/wishlists` |
| Content / Audit | `/content/admin/pages`, `/audit/admin` |
| System | `/health/readiness`, `/system/maintenance/run`, `/docs` |
