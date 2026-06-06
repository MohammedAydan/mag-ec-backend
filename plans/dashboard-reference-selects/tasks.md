# Tasks: Dashboard Reference Select Fields

## Phase 1 — Form System Extension
- [ ] 1.1 Add `SelectActionField` type to `admin-actions.tsx`
- [ ] 1.2 Add `select` field validator in ConfirmModal (required check)
- [ ] 1.3 Add `<select>` dropdown renderer in ConfirmModal with Atelier styling
- [ ] 1.4 Update `emptyValueForField` to return `''` for select type

## Phase 2 — Data Fetching Helpers
- [ ] 2.1 Create `lib/reference-data.ts` with fetch helpers for each entity type
- [ ] 2.2 Add warehouse list endpoint check (or inline fallback)

## Phase 3 — Page Conversions (Single-value ID → select)
- [ ] 3.1 CatalogPage: productTypeId → select (from /catalog/admin/product-types)
- [ ] 3.2 CatalogPage: brandId → select (from /catalog/admin/brands)
- [ ] 3.3 InventoryPage: warehouseId → select (from stock levels or warehouse endpoint)
- [ ] 3.4 InventoryPage: variantId → select (from stock levels or variants endpoint)
- [ ] 3.5 TaxonomyPage: parentId → select (from /catalog/admin/categories)
- [ ] 3.6 TaxonomyPage: attributeId → select (from /catalog/admin/attributes)

## Phase 4 — Page Conversions (Multi-value ID → checkbox-list)
- [ ] 4.1 CatalogPage: categoryIds → checkbox-list (from /catalog/admin/categories)
- [ ] 4.2 CatalogPage: collectionIds → checkbox-list (from /catalog/admin/collections)
- [ ] 4.3 CatalogPage: tagIds → checkbox-list (from /catalog/admin/tags)

## Phase 5 — Group-List Internal Fields
- [ ] 5.1 FulfillmentPage: warehouseId inside group-list → select
- [ ] 5.2 FulfillmentPage: returnRequestItemId inside group-list → select
- [ ] 5.3 OrderDetailPage: orderLineId inside group-list → select

## Phase 6 — Verify
- [ ] 6.1 Run `pnpm build` — all 4 packages pass
- [ ] 6.2 Visually verify dropdown rendering in browser
