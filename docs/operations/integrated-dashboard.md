# Integrated Administration Dashboard

The administration dashboard is bundled inside `apps/api/public/admin` and served by the NestJS/Fastify application at:

```
/admin
```

This keeps deployment as one application: starting the API starts both the backend and its administrator interface. The dashboard does not create a separate frontend service and does not alter the storefront API contract.

## Covered operational areas

- Executive overview and runtime mode/health state.
- Catalog products, variants and publication lifecycle.
- Brands, categories, collections, tags, product types and attributes.
- Price setup, currency/tax/shipping configuration, promotions and coupons.
- Inventory levels, active reservations, stock movement journal and adjustments.
- Orders, shipment management and order cancellation.
- Payment attempt, webhook and refund visibility.
- Return review, receiving and refund actions.
- Review moderation and notification retry operations.
- Staff invitations, roles and permission administration, plus customer/cart/wishlist support visibility.
- Content page management and audit activity.
- Reports, exports and protected direct-mode maintenance execution.

## Security behavior

- Dashboard sessions use the existing access/refresh token endpoints and are kept in browser session storage, not local storage.
- Every protected action is still authorized by server-side RBAC permissions; hiding a button is never considered authorization.
- The maintenance secret is prompted only for a manual run and is not persisted by the dashboard.
- Sensitive provider payloads and secrets are not rendered in dashboard views.

## Asset build

`apps/api` copies `public/admin` assets into the API output after TypeScript compilation:

```bash
pnpm --filter @ecommerce/api build
```

Set `DASHBOARD_ENABLED=false` to serve API-only deployments without the dashboard route.
