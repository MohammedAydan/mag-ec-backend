# Catalog Model

## Scope

Phase 03 adds the bilingual catalog backbone for products, taxonomy, variants, and media without hardcoding a single retail vertical.

## Core Entities

- `CatalogProductType`
  - Defines reusable product families such as `fashion` and `perfume`.
  - Owns localized labels plus the attribute set expected for that family.
- `CatalogAttribute` and `CatalogAttributeOption`
  - Model configurable dimensions like size, color, volume, concentration, or scent family.
  - Attributes can be marked `isFilterable` and `isVariantDefining`.
- `CatalogProduct`
  - Canonical product record with lifecycle state, merchandising flags, localized content, and taxonomy links.
- `CatalogProductVariant`
  - Concrete sellable variant choices linked to attribute options.
- `CatalogCategory`, `CatalogCollection`, and `CatalogTag`
  - Taxonomy layers for storefront browse/navigation and merchandising.
- `CatalogMedia`
  - Upload-intent-backed media record with ownership, expiry, localized alt/title text, and final attachment state.

## Localization Rules

- Localized tables store `locale` alongside the translated fields.
- Public reads first attempt the requested locale, then fall back to English, then Arabic, then the first available translation.
- Product slugs are localized at the translation level, so storefront links can be locale-aware without duplicating the product record.

## Public Safety Rules

- Public browse/detail APIs query only `CatalogProduct.status = PUBLISHED`.
- Public media responses include only `CatalogMedia.status = ATTACHED`.
- Draft/admin-only rows are never returned by the public service path.

## Media Flow

1. An authenticated admin requests a media upload intent for a specific product or variant.
2. The API creates a `CatalogMedia` row in `PENDING_UPLOAD` with a hashed one-time upload token and expiry.
3. The client uploads the file to the issued object key / URL.
4. The client calls the attach endpoint with the raw upload token.
5. The API validates actor ownership, token hash, expiry, and product binding, then marks the media as `ATTACHED`.

## Seed Coverage

- A fashion example demonstrates size/color variant modeling.
- A perfume example demonstrates volume/concentration/scent-family modeling.
