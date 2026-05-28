# Phase 03: Catalog, Media, and Localization

## Goal

Build a flexible bilingual product catalog that supports configurable attributes, variants, media, and publishable public/admin APIs for retail domains such as fashion and perfumes.

## Acceptance Criteria

- Catalog models support products, categories, brands, collections, tags, product types, attributes, options, variants, and media relations.
- Admin APIs can create, update, publish, archive, and manage catalog entities and media attachments.
- Public APIs support browse, detail, pagination, filtering, and language-aware content fallback.
- Signed media upload/attachment flow enforces ownership, content-type, and size rules.
- Seed examples prove that fashion and perfume products can be modeled without schema changes.

## Approach

Separate canonical catalog structure from presentation details, and use translation and attribute models rather than hard-coded product types. Keep media upload infrastructure secure and storage-agnostic.

## Scope

### In Scope

- Catalog relational model
- Admin CRUD and public read APIs
- Localization model for Arabic and English content
- Media upload and attachment workflow
- Example seed content

### Out of Scope

- External search engine integration
- Reviews and recommendations
- Rich CMS beyond minimal catalog-adjacent content

## Dependencies

- `phase-01-database-core`
- `phase-02-identity-authz` for admin protection

## Estimated Complexity

XL
