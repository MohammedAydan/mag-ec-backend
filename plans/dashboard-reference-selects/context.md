# Context: Dashboard Reference Select Fields

## Files to modify
- `apps/api/public/dashboard/src/lib/admin-actions.tsx` — Add SelectActionField type
- `apps/api/public/dashboard/src/components/ui/ConfirmModal.tsx` — Add select renderer + validator
- `apps/api/public/dashboard/src/pages/CatalogPage.tsx` — Convert ID fields
- `apps/api/public/dashboard/src/pages/InventoryPage.tsx` — Convert ID fields
- `apps/api/public/dashboard/src/pages/TaxonomyPage.tsx` — Convert ID fields
- `apps/api/public/dashboard/src/pages/FulfillmentPage.tsx` — Convert group-list fields
- `apps/api/public/dashboard/src/pages/OrderDetailPage.tsx` — Convert group-list fields
- `apps/api/public/dashboard/src/pages/PricingPage.tsx` — May need variant selects

## API endpoints available
- GET `/catalog/admin/product-types` → [{id, name, key}]
- GET `/catalog/admin/brands` → [{id, name}]
- GET `/catalog/admin/categories` → [{id, name, key}]
- GET `/catalog/admin/collections` → [{id, name, key}]
- GET `/catalog/admin/tags` → [{id, name}]
- GET `/catalog/admin/attributes` → [{id, name, key}]
- GET `/catalog/admin/products` → [{id, translations}] (for variant listing)
- GET `/inventory/admin/levels` → includes warehouse + variant data

## API endpoints needed (inline fallback)
- Warehouses: extract from `/inventory/admin/levels` response (warehouse: {id, name, key})
- Variants: extract from `/inventory/admin/levels` response or `/catalog/admin/products`

## Open questions
- Can group-list child fields use 'select' type? (Yes — the renderer already supports recursive rendering)
- Should we cache fetched options? (Yes — use TanStack Query with staleTime: Infinity)
