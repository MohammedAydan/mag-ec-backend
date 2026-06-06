# Plan: Dashboard Reference Select Fields

## Goal
Replace ALL manual ID text inputs across the dashboard with dropdown selects that fetch and display available options from the API. No entity relationship should ever require typing an ID by hand.

## Acceptance Criteria
- [ ] New `SelectActionField` type renders as styled `<select>` dropdown in ConfirmModal
- [ ] All single-value ID fields (productTypeId, brandId, warehouseId, etc.) use `type: 'select'` with pre-fetched options
- [ ] All multi-value ID fields (categoryIds, collectionIds, tagIds) use `type: 'checkbox-list'` with pre-fetched options
- [ ] Options include both `name`/`key` and `id` for identification
- [ ] Build passes with zero TS errors
- [ ] Every form in the dashboard that references another entity uses selects, not text inputs

## Approach
1. Add `SelectActionField` type with `options: ActionOption[]` to the form system
2. Add `<select>` renderer in ConfirmModal with Atelier dark styling
3. Create a lightweight `useReferenceData` hook that fetches lists once and caches them
4. Update every page that has ID fields to pre-fetch options and use `type: 'select'` or `type: 'checkbox-list'`

## Scope: IN
- CatalogPage: productTypeId, brandId (text→select), categoryIds, collectionIds, tagIds (string-list→checkbox-list)
- InventoryPage: warehouseId, variantId (text→select)
- FulfillmentPage: warehouseId, returnRequestItemId (text→select, in group-list)
- OrderDetailPage: orderLineId (text→select, in group-list)
- TaxonomyPage: parentId, attributeId (text→select)

## Scope: OUT
- Text fields that are NOT entity references (SKU, name, key, email, etc.)
- Number fields (quantity, amount, percentage)
- Currency/symbol fields

## Dependencies
- Existing API endpoints for catalog entities (ready)
- Need to verify warehouse list endpoint availability
- Need to verify variant list endpoint availability

## Estimated Complexity: M
