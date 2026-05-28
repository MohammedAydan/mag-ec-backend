# Universal E-Commerce REST API — Production Build Plan

> **File purpose:** This document is the implementation contract for an AI coding agent building a secure, production-grade, headless e-commerce backend API. It is designed to support stores selling fashion, perfumes, cosmetics, electronics, home products, groceries that do not require specialized compliance, digital-compatible future extensions, and most ordinary retail catalog types.
>
> **Frontend target:** Flutter mobile and web application with a separate admin/dashboard client.
>
> **Primary database now:** MySQL 8.4 LTS with InnoDB.
>
> **Future database option:** PostgreSQL, through an explicit migration project and database-portable domain design.
>
> **Architecture decision:** Modular monolith first. Do **not** introduce microservices, GraphQL, marketplace/multi-vendor logic, or provider-specific coupling unless a later approved phase requires it.

---

## 0. Mandatory Agent Instructions

The coding agent must follow these instructions before modifying or generating application code:

1. Read this entire file and create a tracked execution checklist in `docs/implementation-status.md`.
2. Implement one phase only at a time. Do not create unfinished stubs for later phases unless required to compile an earlier phase.
3. Prefer official NestJS, Prisma, Fastify, MySQL, OWASP, payment-provider, AWS SDK, Redis/BullMQ, and OpenAPI Generator documentation over tutorials or outdated snippets.
4. Use the latest **stable** compatible package releases at project bootstrap time, then commit and respect the lockfile. Do not silently upgrade dependencies in feature phases.
5. Use strict TypeScript and production-grade validation, authentication, authorization, testing, migrations, observability, and error handling from the beginning.
6. Keep all business rules in application/domain services, not controllers and not ORM queries scattered across the codebase.
7. Expose APIs only through an explicit versioned REST contract documented as OpenAPI.
8. Build the API so that the Flutter app consumes a generated Dart/Dio client from the OpenAPI document rather than manually duplicating every endpoint/model.
9. MySQL is the production database for version 1. PostgreSQL is a future migration target, not a parallel database during normal operation.
10. Never store payment card data, CVV, raw secrets, password plaintext, refresh tokens in plaintext, or unrestricted uploaded executable files.
11. No phase is complete until its required tests, linting, type checking, migration verification, OpenAPI generation, and security checks pass.
12. When a requirement is ambiguous, choose the most secure and database-portable implementation and document the decision in `docs/adr/`.

---

# 1. Product Vision and Scope

## 1.1 Goal

Build a reusable **headless e-commerce backend API** for a single retail brand/store. The API must work for product domains such as:

- Clothes: size, color, material, fit, gender, season, variant stock and images.
- Perfumes: size/volume, concentration, scent family, top/middle/base notes, gender/audience, brand.
- Cosmetics, accessories, electronics and general merchandise through customizable attributes and variants.
- Physical products at launch, with clean extension points for digital products or subscriptions later.

The backend must support:

- Customer storefront APIs consumed by Flutter mobile/web.
- Secure administrator/dashboard APIs.
- Guest and authenticated shopping experiences.
- Products, flexible variants and attribute-driven catalog.
- Inventory, carts, checkout, orders, payments, shipping, promotions, coupons, returns and refunds.
- Auditing, background jobs, analytics-ready event records, notifications and reliable integrations.
- Arabic and English content support.
- MySQL initially without blocking a future PostgreSQL migration.

## 1.2 Success Criteria

The system is successful when:

- A fashion or perfume store can be configured without schema changes for normal category/attribute differences.
- A user can discover products, add variants to a cart, apply a promotion, select delivery and payment, place an order safely, and track/return it according to policy.
- Administrators can manage catalog, pricing, stock, coupons, orders, refunds, customers and reports with strict permissions and audit logs.
- The API prevents overselling, duplicate orders, duplicate payment capture, unauthorized object access and common API abuse.
- Flutter clients can be regenerated from OpenAPI safely when the backend evolves.
- The project is deployable, observable, backed up and testable in CI.

## 1.3 Explicit Non-Goals for Initial Release

Do not mix these into the core launch unless separately approved:

- Multi-vendor marketplace and vendor payouts.
- POS/offline-first synchronization.
- Full ERP/accounting system.
- Subscriptions, recurring billing or digital licensing.
- International tax compliance engines.
- Recommendation ML or AI shopping assistant.
- Microservices/event streaming infrastructure.
- Crypto payments.

They can be added later behind module boundaries.

---

# 2. Confirmed Technology Decisions

## 2.1 Core Stack

| Concern                                | Decision                                              | Why                                                                                                                 |
| -------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| Runtime                                | Node.js **24 LTS**                                    | Modern supported LTS runtime for current NestJS/Fastify; do not target EOL Node releases.                           |
| Language                               | TypeScript, strict mode                               | Predictable AI-generated code, safer refactors and generated types.                                                 |
| Backend framework                      | **NestJS 11**                                         | Strong modular architecture, DI, official security/OpenAPI/queue patterns, excellent for AI-guided phased building. |
| HTTP adapter                           | **Fastify 5** through `@nestjs/platform-fastify`      | Fast HTTP layer while retaining Nest architecture.                                                                  |
| API style                              | Versioned REST `/api/v1` with OpenAPI                 | Straightforward Flutter integration, contract generation and testing.                                               |
| ORM/migrations                         | **Prisma ORM 7**                                      | Type-safe client and schema-driven migrations supporting MySQL and PostgreSQL.                                      |
| Primary database                       | **MySQL 8.4 LTS**, InnoDB only                        | Required primary database; transactional consistency and locking suitable for commerce.                             |
| Cache / distributed rate limits / jobs | Redis + BullMQ                                        | Fast cache and reliable asynchronous work/retries.                                                                  |
| File/media storage                     | S3-compatible object storage using AWS SDK v3         | Avoid binary files in DB and allow cloud/provider portability.                                                      |
| API client generation                  | OpenAPI Generator `dart-dio`                          | Generated typed Flutter client reduces duplicated API code.                                                         |
| Deployment                             | Docker containers, managed MySQL/Redis/object storage | Reproducible build and safer operations.                                                                            |

## 2.2 Version Snapshot and Upgrade Policy

**Verified reference date:** 2026-05-25.

At document creation time, official/project package sources indicate:

| Component              | Verified stable baseline / line                                                                                                         |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| Node.js                | v24.16.0 is Latest LTS on the official Node.js release page.                                                                            |
| NestJS core            | `@nestjs/core` latest indexed npm version: 11.1.23.                                                                                     |
| NestJS Fastify adapter | `@nestjs/platform-fastify` latest indexed npm version: 11.1.21. Resolve compatible Nest package versions together at installation time. |
| NestJS Swagger         | `@nestjs/swagger` latest indexed npm version: 11.4.3.                                                                                   |
| Fastify                | Current official documentation line: v5.8.x; indexed latest version is 5.8.5.                                                           |
| Prisma CLI and Client  | `prisma` and `@prisma/client` latest indexed npm version: 7.8.0. Use Prisma v7 documentation, not v6 snippets.                          |
| MySQL                  | MySQL 8.4 LTS official manual currently documents releases through 8.4.9.                                                               |

### Dependency policy

- Bootstrap commands must resolve the latest stable versions **compatible with each other** and commit `pnpm-lock.yaml`.
- Keep all `@nestjs/*` packages on compatible major/minor ranges; do not manually combine incompatible peer dependency lines.
- Run dependency vulnerability and license audits in CI.
- Do not use alpha, beta, release candidate or unmaintained packages in production.
- Review dependency upgrades in a dedicated maintenance PR with migrations/tests, never incidentally during a feature implementation.

### Official reference URLs

- Node releases: https://nodejs.org/en/about/previous-releases
- NestJS docs: https://docs.nestjs.com/
- NestJS Fastify performance: https://docs.nestjs.com/techniques/performance
- NestJS OpenAPI: https://docs.nestjs.com/openapi/introduction
- NestJS security: https://docs.nestjs.com/security/authentication
- NestJS queues: https://docs.nestjs.com/techniques/queues
- Prisma docs v7: https://www.prisma.io/docs
- Prisma MySQL connector: https://www.prisma.io/docs/orm/core-concepts/supported-databases/mysql
- Prisma schema providers: https://www.prisma.io/docs/orm/reference/prisma-schema-reference
- Prisma v7 upgrade notes: https://www.prisma.io/docs/guides/upgrade-prisma-orm/v7
- MySQL 8.4 manual: https://dev.mysql.com/doc/refman/8.4/en/
- MySQL InnoDB transactions/locking: https://dev.mysql.com/doc/refman/8.4/en/innodb-locking-transaction-model.html
- OWASP ASVS: https://owasp.org/www-project-application-security-verification-standard/
- OWASP API Security: https://owasp.org/www-project-api-security/
- OpenAPI Generator Dart/Dio: https://openapi-generator.tech/docs/generators/dart-dio/
- AWS SDK v3 S3 examples: https://docs.aws.amazon.com/sdk-for-javascript/v3/developer-guide/javascript_s3_code_examples.html
- BullMQ: https://docs.bullmq.io/
- Stripe idempotency/webhooks, when Stripe is selected: https://docs.stripe.com/api/idempotent_requests and https://docs.stripe.com/webhooks

---

# 3. Trusted Library Selection

Use maintained libraries to reduce boilerplate, but do not let third-party packages replace essential business/security review.

## 3.1 Required Foundation Libraries

| Purpose                              | Packages / tool                                                                          | Rule                                                                                                             |
| ------------------------------------ | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Nest application                     | `@nestjs/common`, `@nestjs/core`, `@nestjs/platform-fastify`, `reflect-metadata`, `rxjs` | Use Nest modules and DI consistently.                                                                            |
| Configuration                        | `@nestjs/config`, `joi`                                                                  | Validate every required environment variable at startup; fail closed.                                            |
| Validation and transformation        | `class-validator`, `class-transformer`                                                   | Global `ValidationPipe` with whitelist, transform and forbidden unknown properties.                              |
| Database                             | `prisma`, `@prisma/client`                                                               | Prisma v7 style setup; all schema changes through migrations.                                                    |
| API documentation                    | `@nestjs/swagger`                                                                        | Generate OpenAPI JSON on CI and expose authenticated/staging docs only as configured.                            |
| Authentication                       | `@nestjs/jwt`, `@nestjs/passport`, `passport`, `passport-jwt`, `argon2`                  | Short-lived access token, rotating refresh token family; Argon2id password hashing.                              |
| Web security                         | `@fastify/helmet`, `@fastify/cors`, `@nestjs/throttler`                                  | Security headers, allowlisted origins, per-route rate limits.                                                    |
| Cookies when used for admin web auth | `@fastify/cookie`, CSRF protection compatible with Fastify/session strategy              | Only needed if tokens are stored in browser cookies. Flutter bearer access is not CSRF-prone in the same manner. |
| Jobs                                 | `@nestjs/bullmq`, `bullmq`, `ioredis`                                                    | Jobs must be retry-safe and idempotent.                                                                          |
| Storage                              | `@aws-sdk/client-s3`, `@aws-sdk/s3-request-presigner`                                    | Signed upload/download URLs; validate content type, ownership and limits.                                        |
| Logging                              | `pino`, `nestjs-pino`                                                                    | Structured JSON logging with request correlation IDs and sensitive-field redaction.                              |
| Health checks                        | `@nestjs/terminus`                                                                       | Liveness/readiness checks for DB/Redis/storage dependencies.                                                     |
| Testing                              | `jest`, `@nestjs/testing`, `supertest`, `testcontainers` or isolated Docker test DB      | Unit, integration and end-to-end coverage.                                                                       |
| Lint/format                          | ESLint, TypeScript ESLint, Prettier                                                      | Enforced in CI.                                                                                                  |
| Commit/build hygiene                 | `pnpm`, `husky`/`lint-staged` optional                                                   | Commit lockfile; do not depend on global tooling for CI.                                                         |

## 3.2 Integration Libraries Behind Adapters

The domain cannot import vendor SDKs directly outside integration modules.

| Integration        | Recommended approach                                                                                                                                                                                                                       |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Payment            | Define `PaymentGateway` port. Implement `CashOnDeliveryGateway` first; add `StripeGateway` or Egyptian provider adapter such as Paymob after credentials/business decision. Each provider must verify signed webhooks and use idempotency. |
| Email              | Define `EmailSender` port. Implement provider adapter such as Resend, SES or SMTP/Nodemailer only in infrastructure.                                                                                                                       |
| Push notification  | Define `PushNotifier` port. Implement Firebase Cloud Messaging adapter when mobile notification work starts.                                                                                                                               |
| Shipping           | Define `ShippingProvider` port. Start with configurable manual zones/rates; later add carrier adapter.                                                                                                                                     |
| Search             | Start with indexed MySQL filtering/search suitable for MVP; define `ProductSearch` port so Meilisearch/Typesense/Elasticsearch can be added without changing catalog services.                                                             |
| Image optimization | Use object storage plus image processing/job adapter; do not block product create/update on heavy processing.                                                                                                                              |
| Observability      | Use structured logs first; add OpenTelemetry/Sentry adapter as deployment matures.                                                                                                                                                         |

## 3.3 Libraries and Designs to Avoid

- Do not use TypeORM and Prisma together.
- Do not depend on a low-maintenance coupon, cart or order library: core commerce rules must be owned by this backend.
- Do not use Firebase/Firestore as the system of record for commerce data.
- Do not upload files directly through a large in-memory API request if presigned object-storage upload is possible.
- Do not directly call payment/shipping/email vendors in controllers.
- Do not use raw SQL for ordinary data operations; raw SQL is permitted only for reviewed performance-critical operations and must have MySQL/PostgreSQL portability notes.

---

# 4. Architecture

## 4.1 Architecture Style: Modular Monolith

Use a single deployable NestJS API plus a separately scalable worker process built from the same codebase.

```text
Flutter Storefront + Flutter/Web Admin
                 |
        Generated REST Client
          (OpenAPI / dart-dio)
                 |
          /api/v1 REST API
        NestJS + Fastify API App
                 |
    Application services / use cases
                 |
 Domain policies, ports and invariants
                 |
 Prisma repositories + provider adapters
        |        |        |        |
      MySQL    Redis    S3      Payments/Email/FCM
                 |
             BullMQ Worker
```

### Why modular monolith

- Commerce operations require strongly consistent transactions across cart, inventory and order data.
- It is far easier for an AI agent to maintain one explicit architecture and test suite.
- It minimizes deployment/observability complexity.
- Modules can later be split if real scale data warrants it.

## 4.2 Repository Structure

```text
ecommerce-api/
  .github/
    workflows/
      ci.yml
      security.yml
  apps/
    api/
      src/
        main.ts
        app.module.ts
        bootstrap/
        config/
        common/
          auth/
          decorators/
          errors/
          filters/
          guards/
          interceptors/
          pagination/
          pipes/
          primitives/
        modules/
          identity/
          customers/
          catalog/
          pricing/
          promotions/
          inventory/
          carts/
          checkout/
          orders/
          payments/
          fulfillment/
          returns/
          reviews/
          content/
          notifications/
          reporting/
          administration/
          audit/
          integrations/
        health/
      test/
    worker/
      src/
        main.ts
        processors/
  packages/
    contracts/
      openapi/
      generated/
    domain-shared/
      src/
  prisma/
    schema.prisma
    migrations/
    seed/
  docs/
    adr/
    api/
    domain/
    operations/
    security/
    implementation-status.md
  docker/
  docker-compose.yml
  .env.example
  package.json
  pnpm-workspace.yaml
  plan.md
```

A simpler single `src/` repository is acceptable if there is only one deployed process initially, but the module boundaries and separate worker bootstrap must remain clear.

## 4.3 Module Internal Pattern

Every business module uses the following division where relevant:

```text
modules/catalog/
  catalog.module.ts
  domain/
    entities/
    value-objects/
    policies/
    events/
    repositories/          # interfaces/ports only
  application/
    commands/
    queries/
    dto/
    services/
  infrastructure/
    prisma/
    mappers/
    search/
  presentation/
    public/
      catalog-public.controller.ts
    admin/
      catalog-admin.controller.ts
```

Rules:

- Controllers validate transport input, call use cases and map output. No business logic.
- Application services coordinate transactions and authorization.
- Domain logic contains rules such as valid price, sellable product, coupon eligibility, order transitions and reservation policy.
- Infrastructure implements persistence and third-party ports.
- DTOs exposed in OpenAPI are not Prisma model objects.
- No customer response ever serializes internal cost, secrets, supplier data, audit fields or password/token values.

---

# 5. MySQL Now, PostgreSQL Later: Portability Strategy

## 5.1 MySQL Production Rules

- Use **MySQL 8.4 LTS** and the **InnoDB** storage engine for every transactional table.
- Use real foreign keys through Prisma default `relationMode = "foreignKeys"` for self-hosted MySQL.
- Set charset/collation to full Unicode (`utf8mb4`) suitable for Arabic and English.
- Store timestamps in UTC and localize only in clients/admin reports.
- Use transactions for stock reservation, order placement, payment state change and refund accounting.
- Implement deadlock-safe retry only around known transactional use cases with bounded retry and logging.
- Create indexes explicitly from query plans and real endpoints.

## 5.2 Portable Data Modeling Rules

To make a future PostgreSQL migration achievable:

1. Use Prisma query APIs instead of MySQL-specific SQL wherever possible.
2. Use application-generated UUIDs/CUIDs consistently rather than database-specific IDs or functions.
3. Store money as integer minor units (`amountMinor BIGINT` plus `currency CHAR(3)`) rather than floating point.
4. Do not rely on MySQL-only enums for core evolving statuses; use stable string enums controlled by Prisma/application validation.
5. JSON columns may be used for noncritical metadata/snapshots, but critical searchable commerce data must be normalized and indexed in relational columns.
6. Avoid DB triggers and stored procedures for business logic. Keep rules in tested application services.
7. Encapsulate full-text/search implementation behind a `ProductSearch` interface.
8. Avoid DB-specific case-insensitive assumptions; normalize searchable slugs/SKU/email fields explicitly.
9. Never edit previously applied migrations. Migrations are append-only.

## 5.3 PostgreSQL Migration Later

Changing `provider = "mysql"` to `provider = "postgresql"` is **not** a safe production migration on its own. A future migration phase must:

1. Freeze schema changes temporarily and export a canonical schema/data mapping document.
2. Create a new PostgreSQL Prisma migration baseline in a dedicated migration branch/directory.
3. Provision PostgreSQL and execute repeatable ETL scripts for relational data and data snapshots.
4. Validate row counts, amounts, order totals, coupon usage counts, inventory balances, unique keys and foreign-key integrity.
5. Run the same repository contract tests against MySQL and PostgreSQL.
6. Perform staged cutover/read-only period or approved downtime plan.
7. Keep encrypted backups and rollback procedure.
8. Update deployment secrets, connection pooling and database-specific performance indexes after acceptance.

---

# 6. API Contract Standards

## 6.1 General REST Rules

- Base path: `/api/v1`.
- Use URI versioning from the first endpoint.
- JSON only for standard APIs; media is uploaded through signed object-storage flow.
- Dates/times: ISO-8601 UTC strings.
- Money: `{ "amountMinor": 129900, "currency": "EGP" }`.
- IDs: non-sequential public IDs such as UUID/CUID to reduce enumeration risk; authorization remains mandatory.
- Pagination:
  - Prefer cursor pagination for storefront product feeds, orders and audit logs.
  - Offset pagination may be used for small bounded admin lists only.
- Filtering and sorting use allowlists; never pass arbitrary user fields to ORM order/filter expressions.
- Localization:
  - Accept `Accept-Language: ar` or `en`.
  - Product localized fields are returned according to requested locale with documented fallback.
- Idempotent write requests:
  - Require `Idempotency-Key` for checkout/order creation, payment intent/create/capture and refund actions.
  - Persist request hash, actor, operation, response/result and expiry.
  - Same key with different body returns conflict.

## 6.2 Standard Successful Response

```json
{
  "data": {},
  "meta": {
    "requestId": "req_...",
    "timestamp": "2026-05-25T12:00:00.000Z"
  }
}
```

Paginated response:

```json
{
  "data": [],
  "meta": {
    "requestId": "req_...",
    "pagination": {
      "nextCursor": "opaque-or-null",
      "hasNextPage": true
    }
  }
}
```

## 6.3 Standard Error Contract

```json
{
  "error": {
    "code": "CART_ITEM_OUT_OF_STOCK",
    "message": "The requested quantity is unavailable.",
    "details": [],
    "requestId": "req_..."
  }
}
```

Rules:

- Do not leak stack traces, SQL error text, tokens, secrets or internal provider payloads.
- Error codes are stable contract identifiers.
- Translate user-safe messages at the client or via API locale support.
- Record detailed internal exceptions in structured logs with sensitive data redacted.

## 6.4 API Documentation and Flutter SDK

- Every controller DTO must be reflected in OpenAPI through Nest Swagger.
- Generate `openapi.json` in CI.
- Validate breaking changes using an OpenAPI diff step before merging.
- Generate Flutter client using the official OpenAPI Generator `dart-dio` generator.
- The Flutter code must depend on repository abstractions wrapping the generated client, not hardcoded raw endpoints.
- Do not hand-write duplicate Dart API models unless a UI/domain mapping requires it.

---

# 7. Roles, Identities and Access Control

## 7.1 Actor Types

| Actor             | Capabilities                                                                                                                      |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Guest             | Browse catalog; manage a guest cart; checkout if enabled; track order using protected token/verification.                         |
| Customer          | Own profile, addresses, cart, wishlist, orders, returns, reviews and notification settings.                                       |
| Support Agent     | Read customer/order data required for support; add internal notes under audit; cannot alter financial records without permission. |
| Catalog Manager   | Manage products, categories, media, attributes and publishing.                                                                    |
| Inventory Manager | Manage warehouses, receipts, adjustments and transfers.                                                                           |
| Order Manager     | Manage fulfillment/status under approved transitions.                                                                             |
| Marketing Manager | Manage coupons, promotions and content banners.                                                                                   |
| Finance Manager   | View/payment capture/refund actions with MFA/step-up later and audit.                                                             |
| Admin             | Manage operational modules according to assigned permissions.                                                                     |
| Super Admin       | Manage administrator roles/settings; tightly restricted and fully audited.                                                        |
| System/Worker     | Execute approved asynchronous operations using service credentials, not human JWTs.                                               |

## 7.2 Authorization Model

Implement both:

- **RBAC:** roles aggregate permissions such as `catalog.product.write`, `orders.refund.execute`.
- **Ownership/object checks:** customers can only view and mutate their own objects; administrators still need permissions.
- Support fine-grained policy guards at application-use-case level, not merely route guards.

Examples:

```text
customer.orders.read.own
customer.addresses.write.own
admin.catalog.write
admin.inventory.adjust
admin.orders.fulfill
admin.payments.refund
admin.promotions.write
admin.users.roles.manage
admin.audit.read
```

The system must prevent BOLA/IDOR: knowing a cart/order/address ID does not authorize access.

---

# 8. Domain Modules and Capabilities

## 8.1 Identity and Authentication

### Required capabilities

- Customer registration, login, email/phone verification configuration.
- Administrator login isolated from customer privileges.
- Password reset flow with one-time, hashed, expiring token.
- Access JWT plus rotating refresh tokens.
- Device/session listing and remote revoke.
- Login throttling and suspicious attempt audit.
- Guest session/cart token.
- Optional social sign-in adapter later.
- Optional admin MFA/step-up authentication before production finance actions.

### Security rules

- Hash passwords using Argon2id.
- Store only hashed refresh tokens and hashed one-time tokens.
- Rotate refresh tokens; detect reused revoked token family and revoke the session family.
- Do not expose account-existence differences unnecessarily in reset/login errors.
- Secure email verification/reset URLs with expiry and one-use semantics.
- Separate customer/admin scopes in token claims and permissions.

## 8.2 Customers and Addresses

Features:

- Profile with safe editable fields.
- Localized preference, marketing consent audit and notification preferences.
- Multiple shipping/billing addresses.
- Default address handling.
- Address snapshots copied into orders; later customer edits never rewrite historical orders.
- Customer soft deactivation/anonymization workflow where legally required.
- Admin notes kept separate and inaccessible to customers.

## 8.3 Catalog

### Flexible product model

Use a flexible structure that represents clothes, perfumes and general goods without schema changes:

- `Product`: title, localized descriptions, slug, status, productType, brand, category relations, SEO, publish window.
- `ProductVariant`: sellable unit with unique SKU, optional barcode, prices, dimensions/weight, inventory item and media.
- `ProductOption` and `ProductOptionValue`: variation dimensions, e.g. Color/Size or Volume/Concentration.
- `AttributeDefinition` and `AttributeValue`: descriptive/filterable traits not always variant-defining, e.g. scent family/material/notes.
- `Category`: nested hierarchy.
- `Brand`.
- `MediaAsset`: product/variant images with order, alt text, locale and ownership.
- `Collection`: curated groups such as New Arrivals or Summer Offers.
- `Tag`.
- `ProductPublication`/status.

### Examples

Clothing:

```text
Product: Classic Linen Shirt
Options: Color, Size
Variants: Black/M, Black/L, White/M
Attributes: material=linen, fit=regular, gender=men
```

Perfume:

```text
Product: Signature Eau de Parfum
Options: Volume
Variants: 50ml, 100ml
Attributes: concentration=EDP, family=woody, topNotes=bergamot, baseNotes=amber
```

### Required behavior

- Draft, active, archived status.
- Product and variant media.
- SEO-friendly unique slugs.
- Attribute-driven filtering.
- Related products/collections.
- Publish/unpublish scheduling through jobs.
- Bulk import/export later with validation and dry run.

## 8.4 Pricing

Features:

- Variant prices in one or more currencies.
- Base price, optional compare-at/original price.
- Price lists for sales, customer groups or date windows.
- Tax-inclusive/tax-exclusive configuration.
- Money arithmetic in integer minor units only.
- Product list and checkout must use the same pricing calculation service.
- Checkout stores a price snapshot; future product price edits cannot alter placed orders.

Minimum data:

```text
Price:
  variantId
  currency
  amountMinor
  compareAtAmountMinor?
  priceListId?
  startsAt?
  endsAt?
  status
```

## 8.5 Promotions, Discounts and Coupons

This is a first-class module, not a simple `coupon.discount` column.

### Promotion types

- Percentage off.
- Fixed amount off.
- Free shipping.
- Buy X get Y / quantity discount.
- Product/category/collection-specific sale.
- Automatic promotion without code.
- Coupon-code promotion.
- First-order promotion.
- Minimum cart subtotal threshold.
- Future customer-segment/personalized rule.

### Rules and constraints

- Start/end dates and timezone handling.
- Active/inactive/draft status.
- Per-customer usage limit.
- Total usage limit.
- Minimum subtotal and optionally quantity.
- Applicable/excluded products, categories, brands or collections.
- Applicable shipping methods.
- Stacking/exclusivity policy.
- Maximum discount cap for percentages when needed.
- Coupon normalization (case-insensitive input) and secure lookup.
- Reservation/consumption semantics:
  - Validation at cart is indicative.
  - Recalculate and atomically consume at checkout/order placement.
  - Release usage on failed order only according to explicit business policy.
- Immutable discount snapshot in order totals for audit/refund correctness.

## 8.6 Inventory and Warehouses

### Required capabilities

- One default warehouse at launch; schema supports multiple warehouses.
- Stock item per sellable variant.
- Stock movements: receipt, sale, return, adjustment, transfer, reservation, release.
- Inventory reservation during checkout with expiration.
- Available quantity = on hand - active reserved quantity.
- Backorder/preorder settings optional by product/variant.
- Low stock threshold and alert jobs.
- Atomic overselling prevention.

### Required transaction invariant

When an order is created from a cart:

1. Re-read current variant status, current pricing and inventory availability.
2. Validate/recalculate promotions.
3. Create or confirm reservations under transaction/appropriate locking strategy.
4. Store immutable order line snapshots/totals.
5. Create payment session or mark COD flow as pending/confirmed according to policy.
6. Commit only once all required local database state is consistent.
7. Handle external payment asynchronously with verified webhook and idempotency.

Inventory cannot be reduced purely from client-side cart state.

## 8.7 Carts and Wishlists

### Cart capabilities

- Guest cart and authenticated cart.
- Merge guest cart into user cart after login with deterministic conflict policy.
- Multiple variants and quantity changes.
- Coupon apply/remove.
- Delivery estimation and cart totals.
- Expiry and abandoned-cart event support.
- Cart status: active, converted, abandoned, expired.
- No stock guarantee merely from adding to cart unless explicit reservation is enabled.

### Wishlist

- Authenticated customers can store variants/products.
- Wishlist must not reserve stock.
- Optional back-in-stock notification subscription.

## 8.8 Checkout

Checkout is an orchestration use case, not merely CRUD.

Required steps:

- Resolve customer/guest identity.
- Validate contact details and address.
- Reprice cart using server-side authoritative pricing.
- Validate promotion eligibility and usage.
- Resolve available shipping methods/rates.
- Calculate tax based on configured tax strategy.
- Validate availability and reserve stock.
- Create order draft/pending order safely.
- Initiate selected payment method.
- Use idempotency key to avoid duplicate orders/payment attempts.
- Convert order after payment confirmation or COD confirmation policy.
- Empty/convert cart only through committed workflow.

Support:

- Cash on delivery if enabled.
- Online payment adapter.
- Guest checkout policy.
- Shipping/billing address snapshots.
- Terms acceptance snapshot if needed.

## 8.9 Orders

### Order lifecycle

Use explicit transition rules, never arbitrary status updates.

```text
Order:
  draft -> pending_payment -> confirmed -> processing -> shipped -> delivered
                         \-> payment_failed / cancelled
  delivered -> return_requested -> return_approved -> returned -> refunded/partially_refunded
```

Separate statuses are preferable:

- `orderStatus`: workflow status.
- `paymentStatus`: unpaid, pending, authorized, paid, partially_refunded, refunded, failed.
- `fulfillmentStatus`: unfulfilled, preparing, shipped, delivered, returned, cancelled.

### Features

- Human-friendly order number plus opaque public ID.
- Order items containing snapshots of title, SKU, selected options, unit price, discounts, taxes and media reference.
- Status history and internal/admin notes.
- Customer order history and detail.
- Admin search/filter/export with permission gating.
- Cancellation policy and inventory release.
- Invoice/receipt generation later through job.

## 8.10 Payments

### Architecture

```text
PaymentGateway interface
  createPaymentSession(...)
  capture(...)
  cancel(...)
  refund(...)
  verifyWebhook(...)
  mapWebhookEvent(...)
```

Implement:

- `CashOnDeliveryGateway` for initial/manual payment.
- One online provider adapter when selected; do not design controllers around a provider SDK.

### Mandatory payment security/reliability

- Never store card number or CVV.
- Store only provider IDs, safe status, amount, currency, timestamps and safe metadata.
- Require idempotency for payment initiation and refunds.
- Verify webhook signature from raw request body as required by provider.
- Persist incoming webhook event ID uniquely; duplicate events are no-ops.
- Webhook updates payment/order through controlled transitions and transaction-safe handlers.
- Do not trust Flutter success screens as payment proof.
- Maintain payment attempt and refund records.
- Audit every admin/manual payment/refund action.

## 8.11 Fulfillment and Shipping

Features:

- Configurable shipping zones: country/governorate/city as needed.
- Shipping methods: standard, express, pickup, custom.
- Rate conditions: fixed rate, free over threshold, weight/order amount rules.
- COD availability per zone/method.
- Shipment record with tracking number/provider and status.
- Provider integration port for future courier API.
- Customer tracking timeline.
- Shipping cost snapshot stored on order.

## 8.12 Returns, Exchanges and Refunds

Features:

- Return policy settings and return windows.
- Customer return request with lines/quantity/reason/photos optional.
- Admin approval/rejection.
- Receiving inspection and restock decision.
- Refund initiation after policy-approved transitions.
- Partial refunds.
- Exchange can initially be modeled as return plus replacement order to simplify financial integrity.
- Refund and returned-stock movements must be auditable and transactional.

## 8.13 Reviews and Ratings

Features:

- Product reviews by authenticated customer.
- Verified-purchase mark using delivered order item.
- Moderation workflow.
- Rating summary cached/derived safely.
- Abuse/report feature.
- Customer cannot review prohibited/unpurchased items if policy requires purchase.

## 8.14 Content, Store Settings and Localization

Features:

- Store identity and contact settings.
- Currencies and default locale.
- Arabic/English localized catalog fields.
- Homepage banners/collections optional.
- Legal pages/references: privacy, returns, terms.
- Tax/shipping/payment feature toggles.
- All sensitive settings permission-protected and audited.

## 8.15 Notifications

Events:

- Registration verification.
- Password reset.
- Order confirmation.
- Payment success/failure.
- Shipment/tracking.
- Delivery.
- Return/refund status.
- Low stock/admin alert.
- Back in stock/customer opt-in.

Delivery channels behind adapters:

- Email.
- Push via FCM.
- Optional SMS/WhatsApp later.

All notification jobs must be retry-safe; avoid duplicate user messages through deduplication/event IDs.

## 8.16 Administration, Audit and Reporting

### Admin dashboard API needs

- Catalog CRUD and publication.
- Variant/pricing/stock operations.
- Promotion/coupon management.
- Order fulfillment/refunds/notes.
- Customer lookup with privacy-limited views.
- Staff/role/permission management.
- Store settings.
- Audit/event views.
- Basic KPIs: revenue/order count/top products/low stock/promotion usage.

### Audit log

Audit at minimum:

- Admin authentication and permission changes.
- Product publish/delete/archive.
- Price changes.
- Inventory adjustments/transfers.
- Coupon/promotion changes.
- Order status overrides.
- Payment capture/refund/manual changes.
- Customer PII access/export/delete actions.
- Store/integration settings changes.

Record:

```text
actorId, actorType, permission/context, action, entityType, entityId,
previousSafeSnapshot?, newSafeSnapshot?, requestId, ip/userAgent summary,
createdAt
```

Never put passwords, tokens, full provider secrets or sensitive raw payment details into audits.

---

# 9. Database Model Blueprint

The agent must translate this blueprint into reviewed Prisma models and migrations. Use explicit join entities when they carry metadata, ordering, limits or snapshots.

## 9.1 Identity and Customer Tables

```text
User
CustomerProfile
AdminProfile
Role
Permission
RolePermission
UserRole
RefreshSession
VerificationToken
PasswordResetToken
Address
CustomerConsent
```

Constraints:

- Unique normalized email where email login is supported.
- Refresh session tokens stored hashed, with token-family/revocation tracking.
- Roles/permissions separated from customer object ownership.

## 9.2 Catalog Tables

```text
ProductType
Brand
Category
ProductCategory
Product
ProductTranslation
ProductOption
ProductOptionValue
ProductVariant
VariantOptionSelection
AttributeDefinition
AttributeValue
ProductAttributeValue
VariantAttributeValue            # only when attribute varies per SKU
Collection
CollectionProduct
Tag
ProductTag
MediaAsset
ProductMedia
VariantMedia
```

Constraints/indexes:

- Unique product slug per locale/store scope.
- Unique SKU; unique barcode when present.
- Indexed active/published/date/category/brand relations.
- Explicit ordering for category products and media.
- Attribute values validated according to definition type and filterability.

## 9.3 Pricing and Promotions Tables

```text
PriceList
Price
Promotion
PromotionRule
PromotionTarget
CouponCode
PromotionUsage
CartDiscount
OrderDiscountSnapshot
```

Constraints:

- Unique active coupon normalized code.
- Unique usage record as appropriate to prevent double consumption.
- Currency consistently ISO-style uppercase code.
- Date-range and active-status indexes.

## 9.4 Inventory Tables

```text
Warehouse
InventoryItem
StockLevel
InventoryMovement
InventoryReservation
LowStockSubscription/AdminAlert
```

Constraints:

- One stock level per inventory item/warehouse.
- Unique active reservation relations/idempotency rules.
- Movement append-only: never silently edit stock history.
- Available stock validated atomically in checkout.

## 9.5 Cart, Checkout and Orders Tables

```text
Cart
CartItem
CartAddress
CartShippingMethod
CheckoutAttempt
IdempotencyRecord
Order
OrderItem
OrderAddressSnapshot
OrderTotalsSnapshot
OrderStatusHistory
OrderNote
```

Constraints:

- Cart item uniqueness for identical variant and compatible customization.
- Order number unique; external/public ID opaque.
- Order line data snapshots remain immutable after order placement except approved return/refund relations.

## 9.6 Payment and Fulfillment Tables

```text
PaymentMethodConfig
Payment
PaymentAttempt
PaymentWebhookEvent
Refund
ShippingZone
ShippingMethod
ShippingRateRule
Fulfillment
Shipment
TrackingEvent
```

Constraints:

- Payment provider event ID unique.
- Provider payment reference unique when guaranteed by provider.
- Refund totals cannot exceed captured/paid amount.
- Payment state transitions centrally enforced.

## 9.7 Engagement, Content and Operation Tables

```text
Wishlist
WishlistItem
Review
ReviewModerationAction
Notification
NotificationPreference
ContentPage
StoreSetting
AuditLog
OutboxEvent
JobDeduplication
```

### Outbox pattern requirement

When a database mutation must cause an asynchronous side effect (send order email, update search, publish analytic event), write an `OutboxEvent` in the same database transaction. A worker publishes/processes the event with idempotency and retry. This prevents a successful order from losing required follow-up work if the process crashes.

---

# 10. REST Endpoint Inventory

Use nouns and controlled action endpoints only where an operation has business meaning. Every endpoint must define authentication, permission, DTO validation, throttling needs, OpenAPI response/error contract and tests.

## 10.1 Public Storefront

```http
GET    /api/v1/store/config
GET    /api/v1/catalog/categories
GET    /api/v1/catalog/categories/:slug
GET    /api/v1/catalog/brands
GET    /api/v1/catalog/collections
GET    /api/v1/catalog/collections/:slug/products
GET    /api/v1/catalog/products
GET    /api/v1/catalog/products/:slug
GET    /api/v1/catalog/products/:productId/reviews
GET    /api/v1/search/products
GET    /api/v1/shipping/countries-or-regions
```

Product list filters should include only documented allowlisted values such as category, brand, price range, options/attributes, collection, search query, sort and availability.

## 10.2 Authentication and Customer Account

```http
POST   /api/v1/auth/register
POST   /api/v1/auth/login
POST   /api/v1/auth/refresh
POST   /api/v1/auth/logout
POST   /api/v1/auth/logout-all
POST   /api/v1/auth/verify
POST   /api/v1/auth/resend-verification
POST   /api/v1/auth/forgot-password
POST   /api/v1/auth/reset-password

GET    /api/v1/me
PATCH  /api/v1/me
GET    /api/v1/me/sessions
DELETE /api/v1/me/sessions/:sessionId
GET    /api/v1/me/addresses
POST   /api/v1/me/addresses
PATCH  /api/v1/me/addresses/:addressId
DELETE /api/v1/me/addresses/:addressId
GET    /api/v1/me/notification-preferences
PATCH  /api/v1/me/notification-preferences
```

## 10.3 Cart, Wishlist and Checkout

```http
POST   /api/v1/carts
GET    /api/v1/carts/:cartId
POST   /api/v1/carts/:cartId/items
PATCH  /api/v1/carts/:cartId/items/:itemId
DELETE /api/v1/carts/:cartId/items/:itemId
POST   /api/v1/carts/:cartId/coupons
DELETE /api/v1/carts/:cartId/coupons/:code
PUT    /api/v1/carts/:cartId/addresses
GET    /api/v1/carts/:cartId/shipping-methods
PUT    /api/v1/carts/:cartId/shipping-method
POST   /api/v1/carts/:cartId/merge

GET    /api/v1/me/wishlist
POST   /api/v1/me/wishlist/items
DELETE /api/v1/me/wishlist/items/:productOrVariantId

POST   /api/v1/checkout/preview
POST   /api/v1/checkout/place-order           # Idempotency-Key required
POST   /api/v1/checkout/payment-session       # Idempotency-Key required
```

Rules:

- Customer/guest cart tokens must not allow reading another actor's cart.
- Preview result is not authoritative after time/stock/price changes; placement always recalculates server-side.

## 10.4 Customer Orders, Returns and Reviews

```http
GET    /api/v1/me/orders
GET    /api/v1/me/orders/:orderId
POST   /api/v1/me/orders/:orderId/cancel
GET    /api/v1/me/orders/:orderId/tracking
POST   /api/v1/me/orders/:orderId/returns
GET    /api/v1/me/returns
GET    /api/v1/me/returns/:returnId

POST   /api/v1/me/reviews
PATCH  /api/v1/me/reviews/:reviewId
DELETE /api/v1/me/reviews/:reviewId
```

## 10.5 Payment and External Webhooks

```http
POST   /api/v1/webhooks/payments/:provider
POST   /api/v1/webhooks/shipping/:provider
```

Rules:

- No customer/admin JWT required for external webhooks; authentication is provider signature verification plus allowlisted handling.
- Use raw body where signature verification requires exact payload.
- Persist provider event IDs and safely ignore verified duplicates.
- Return quickly and enqueue processing when appropriate.

## 10.6 Admin: Catalog and Pricing

```http
GET    /api/v1/admin/products
POST   /api/v1/admin/products
GET    /api/v1/admin/products/:productId
PATCH  /api/v1/admin/products/:productId
POST   /api/v1/admin/products/:productId/publish
POST   /api/v1/admin/products/:productId/archive
POST   /api/v1/admin/products/:productId/media
POST   /api/v1/admin/products/:productId/variants
PATCH  /api/v1/admin/variants/:variantId

CRUD   /api/v1/admin/categories
CRUD   /api/v1/admin/brands
CRUD   /api/v1/admin/collections
CRUD   /api/v1/admin/attributes
CRUD   /api/v1/admin/price-lists
CRUD   /api/v1/admin/promotions
CRUD   /api/v1/admin/coupons
```

`CRUD` means implement explicit REST endpoints and document each in OpenAPI; do not create an uncontrolled generic CRUD API.

## 10.7 Admin: Inventory, Orders and Finance

```http
GET    /api/v1/admin/inventory/stock
POST   /api/v1/admin/inventory/receipts
POST   /api/v1/admin/inventory/adjustments
POST   /api/v1/admin/inventory/transfers
GET    /api/v1/admin/inventory/movements
GET    /api/v1/admin/inventory/low-stock

GET    /api/v1/admin/orders
GET    /api/v1/admin/orders/:orderId
POST   /api/v1/admin/orders/:orderId/confirm
POST   /api/v1/admin/orders/:orderId/cancel
POST   /api/v1/admin/orders/:orderId/fulfillments
POST   /api/v1/admin/orders/:orderId/shipments
POST   /api/v1/admin/orders/:orderId/mark-delivered

GET    /api/v1/admin/payments
POST   /api/v1/admin/payments/:paymentId/capture       # Idempotency-Key
POST   /api/v1/admin/payments/:paymentId/refunds       # Idempotency-Key
GET    /api/v1/admin/refunds
POST   /api/v1/admin/returns/:returnId/approve
POST   /api/v1/admin/returns/:returnId/receive
POST   /api/v1/admin/returns/:returnId/reject
```

## 10.8 Admin: Users, Settings, Audit and Reports

```http
GET    /api/v1/admin/customers
GET    /api/v1/admin/customers/:customerId
GET    /api/v1/admin/staff
POST   /api/v1/admin/staff
PATCH  /api/v1/admin/staff/:staffId/roles
CRUD   /api/v1/admin/roles
GET    /api/v1/admin/permissions
GET    /api/v1/admin/audit-logs
GET    /api/v1/admin/reports/sales-summary
GET    /api/v1/admin/reports/products
GET    /api/v1/admin/reports/promotions
GET    /api/v1/admin/reports/inventory
GET    /api/v1/admin/settings
PATCH  /api/v1/admin/settings
```

Reports must use bounded date ranges, authorized fields, indexes/read model strategy and safe export jobs for large exports.

---

# 11. Security Requirements

## 11.1 Security Baseline

Target **OWASP ASVS 5.0 Level 2** controls relevant to this API, and explicitly test risks from the OWASP API Security project. Maintain `docs/security/control-matrix.md` mapping controls to code/tests/evidence.

## 11.2 Authentication and Session Security

- Argon2id password hashing with calibrated parameters documented in security ADR.
- Short-lived access tokens; rotating refresh tokens stored hashed.
- Session revocation and reuse detection.
- Separate admin/customer permissions and audiences/scopes.
- Login/reset/verification rate limits.
- Optional admin MFA/step-up before finance/settings/role-management production actions.
- Do not put PII or permissions that can become stale beyond safe identifiers/claims in long-lived tokens.

## 11.3 Authorization and Object-Level Protection

Every endpoint must enforce:

- Route capability/permission.
- Entity ownership or role access.
- Field-level data minimization.
- Server-side tenant/store scope if multi-store is added later.

Test negative cases such as:

- Customer A requesting Customer B's order/cart/address/review.
- Catalog manager attempting refunds.
- Support agent attempting price update.
- Revoked refresh session reuse.
- Guessing opaque IDs still does not bypass access checks.

## 11.4 Input Validation and Output Safety

- Global validation pipe:
  - whitelist accepted DTO fields;
  - reject unknown properties;
  - transform known scalar types safely;
  - enforce length/range/format limits.
- Limit filter/sort fields to allowlists.
- Sanitize rich content or limit product content to safe markdown/plain text as selected.
- Serialize outbound responses through DTOs; never return raw Prisma entities containing sensitive fields.
- Prevent mass assignment by explicit application commands.

## 11.5 HTTP, Browser and API Perimeter

- Apply Helmet security headers.
- Configure strict CORS allowlists by environment.
- Disable or restrict admin Swagger documentation in production.
- Apply global and route-specific throttling; stricter for auth, checkout, coupon probing, reviews and webhooks.
- Enforce request body limits and upload policies.
- TLS only in production.
- Configure trusted proxy behavior correctly behind load balancer.
- CSRF protection is mandatory for state-changing browser requests using cookie-authenticated admin sessions; native Flutter bearer-token calls require secure token handling instead.
- Do not expose verbose server technology/error details.

## 11.6 Payment Security

- The API must never store/process raw card data.
- Payment provider hosted/tokenized flow only.
- Verify webhook signatures.
- Use idempotency records for order/payment/refund actions.
- Require controlled state transitions and audit logs.
- Treat redirect/client-reported success as untrusted until provider-confirmed.

## 11.7 Media Upload Security

- Upload through short-lived presigned URLs or controlled upload service.
- Allow only approved MIME types and sizes for catalog/review images.
- Generate server-controlled object keys; clients cannot overwrite arbitrary files.
- Associate uploaded assets only after validation/authorization.
- Apply malware/image processing scanning approach before public serving where required.
- Public media CDN must not expose private exports or admin-only attachments.

## 11.8 Secrets and Privacy

- `.env` never committed; commit `.env.example` only.
- Store production secrets in deployment secret manager.
- Redact passwords, tokens, authorization headers, webhook signatures, address details where unnecessary and provider payload secrets in logs.
- Restrict PII admin viewing/export.
- Encrypt backups and follow retention policy.
- Support customer data export/anonymization/deletion workflow as business/legal policy requires.

## 11.9 Supply Chain and CI Security

- Dependabot/Renovate optional but recommended.
- `pnpm audit`/advisory review, secret scanning and SAST in CI.
- Pin Docker base images sensibly and scan production images.
- Use production-only dependency install in runtime image.
- Enforce migration review and protected deployment secrets.

---

# 12. Correctness and Reliability Requirements

## 12.1 Commerce Invariants

Must always hold:

- Stock cannot become negative unless explicit backorder policy is enabled.
- Order total equals authoritative item, promotion, shipping and tax snapshots at placement time.
- Paid/refunded totals are consistent; total refunded cannot exceed paid/captured amount.
- A coupon usage limit cannot be exceeded through concurrent checkout.
- A webhook duplicate cannot apply an event twice.
- A repeated idempotent checkout/payment/refund request cannot create duplicate effects.
- Historical order lines and financial snapshots remain immutable.
- Every manual inventory or financial change creates an audit trail.

## 12.2 Transactions

Use Prisma transactions for multi-table local state changes, particularly:

- Checkout order creation, promotion consumption and stock reservation.
- Payment/refund state records resulting from a verified provider event.
- Inventory receipts, adjustments, releases and return restocking.
- Role/permission administration changes plus audit log/outbox event.

External calls must not be held inside long database transactions. Instead:

- Store intended local operation and idempotency.
- Call provider safely.
- Reconcile asynchronously through webhooks/status jobs.
- Use outbox events for internal asynchronous actions.

## 12.3 Idempotency

Define reusable `IdempotencyService` for sensitive mutation endpoints:

```text
key + authenticated actor/guest scope + operation
requestHash
status: processing | completed | failed
responseStatus/responseBodyReference
expiresAt
```

Behavior:

- First valid request executes.
- Same operation/key/body returns saved outcome.
- Same key with a different body returns `409 IDEMPOTENCY_KEY_REUSED`.
- Concurrent same-key attempts do not double execute.
- Configure expiry and cleanup job.

## 12.4 Background Jobs

BullMQ/Redis jobs:

```text
notifications.email.send
notifications.push.send
inventory.reservation.expire
inventory.low-stock.evaluate
catalog.publish.schedule
catalog.media.process
orders.abandoned-cart.evaluate
orders.invoice.generate
integrations.search.sync
reports.export.generate
outbox.dispatch
maintenance.idempotency.cleanup
```

Rules:

- All processors are idempotent.
- Apply bounded retries and exponential backoff.
- Store failed-job visibility/alerting policy.
- Use unique deduplication/event keys where repeating action is harmful.

---

# 13. Performance, Caching and Search

## 13.1 Performance Targets for Initial Production

Define real targets after expected load is known; initial engineering goals:

- Health endpoints remain lightweight.
- Catalog read endpoints use pagination and indexed filtering.
- Checkout paths prioritize correctness before micro-optimization.
- No N+1 queries for product listing/order details.
- No unbounded admin exports in HTTP responses.
- Background processing for emails, exports, image processing and search indexing.

## 13.2 Cache Strategy

Use Redis only for data safe to invalidate/recompute:

- Store config, category tree and selected product catalog read views.
- Rate-limiter/distributed controls.
- Guest/session assistance only with authoritative DB persistence when required.
- Do **not** treat cache as authoritative for stock, payment, orders or coupon usage.

Cache invalidation events originate from application services/outbox events.

## 13.3 Search

Initial searchable capabilities:

- Search text in product name/description/SKU where appropriate.
- Filter by category, brand, options/attributes, price and availability.
- Sort by newest, price, popularity/manual order.

Architecture:

- Implement `ProductSearch` interface.
- MySQL implementation may serve MVP with appropriate indexes and evaluated query behavior.
- Add external search adapter when faceting/search quality/volume demands it.
- Search index is eventually consistent; checkout always queries authoritative DB.

---

# 14. DevOps, Environments and Operations

## 14.1 Environments

Use at least:

- Local development.
- CI/test.
- Staging.
- Production.

Each has separate database, Redis, object storage buckets, payment credentials/webhook destinations and secrets.

## 14.2 Required Environment Variables

Produce validated `.env.example`; actual names may evolve but must cover:

```dotenv
NODE_ENV=development
PORT=3000
API_PREFIX=api/v1
APP_PUBLIC_URL=
ADMIN_ALLOWED_ORIGINS=
STORE_ALLOWED_ORIGINS=

DATABASE_URL=mysql://user:password@localhost:3306/ecommerce
REDIS_URL=redis://localhost:6379

JWT_ACCESS_SECRET=
JWT_ACCESS_EXPIRES_IN=15m
JWT_REFRESH_SECRET=
JWT_REFRESH_EXPIRES_IN=30d

S3_ENDPOINT=
S3_REGION=
S3_BUCKET_PUBLIC=
S3_BUCKET_PRIVATE=
S3_ACCESS_KEY_ID=
S3_SECRET_ACCESS_KEY=
S3_PUBLIC_BASE_URL=

PAYMENT_PROVIDER=cod
PAYMENT_WEBHOOK_SECRET=

EMAIL_PROVIDER=
EMAIL_FROM=
EMAIL_API_KEY=

FCM_PROJECT_ID=
FCM_CLIENT_EMAIL=
FCM_PRIVATE_KEY=

LOG_LEVEL=info
SENTRY_DSN=
```

Rules:

- Startup must fail with useful safe message if required environment values are invalid.
- Separate optional provider config from core boot if a disabled adapter is not required.
- Never load secret provider modules on client/frontend.

## 14.3 Docker Local Development

`docker-compose.yml` should provide:

- MySQL 8.4 LTS.
- Redis.
- Optional S3-compatible local object storage (e.g. MinIO) for development only.
- API and worker may run from local pnpm during early development, then containerize.

Provide commands:

```bash
pnpm install
docker compose up -d mysql redis storage
pnpm prisma migrate dev
pnpm prisma db seed
pnpm dev
pnpm worker:dev
```

## 14.4 CI Pipeline

Every pull request must run:

```bash
pnpm install --frozen-lockfile
pnpm lint
pnpm typecheck
pnpm test
pnpm test:integration
pnpm test:e2e
pnpm prisma validate
pnpm prisma generate
pnpm openapi:generate
pnpm openapi:check
pnpm build
pnpm audit --prod
```

Additionally:

- Start isolated MySQL/Redis services for integration/e2e tests.
- Run migrations from zero on a fresh database.
- Run migration upgrade test from latest known released schema when production starts.
- Check generated OpenAPI artifact changes are intentional.
- Run security/SCA/secret scanning.
- Build Docker image and run health smoke test before release.

## 14.5 Deployment and Backups

- Deploy migrations in a controlled release step before or together with compatible application changes.
- Favor backward-compatible expand/migrate/contract schema changes for zero/minimal downtime.
- Use managed backups plus tested restore drill.
- Maintain rollback/runbook for application and data migration issues.
- Monitor:
  - API 5xx/latency.
  - checkout/payment/webhook failures.
  - failed jobs and queue delay.
  - DB connection/slow query/lock/deadlock indicators.
  - inventory negative/consistency alerts.
  - unusual auth/rate limit events.

---

# 15. Testing Strategy

## 15.1 Required Test Layers

| Layer                   | Focus                                                                                                             |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------- |
| Unit                    | Value objects, totals, discount rules, transitions, permissions, validation utilities.                            |
| Integration             | Prisma repositories against MySQL, transactions, unique constraints, reservation/concurrency, outbox/idempotency. |
| E2E/API                 | Authentication, storefront flow, admin permissions, error contract and OpenAPI-exposed endpoints.                 |
| Contract                | OpenAPI schema and generated Flutter client compatibility.                                                        |
| Security negative tests | BOLA, privilege escalation, invalid DTOs, token/session reuse, rate limit, webhook spoofing, unsafe uploads.      |
| Provider sandbox tests  | Payment webhook/idempotency flows, storage signed URL flow, email/push adapter safe behavior.                     |
| Load/concurrency tests  | Product listing and checkout stock/coupon contention before production.                                           |

## 15.2 Critical E2E Scenarios

Before a production release, tests must cover:

1. Customer register/login/refresh/logout and revoked refresh rejection.
2. Admin permission denial and allowed action.
3. Create fashion product with size/color variants; publish; browse/filter; add chosen SKU to cart.
4. Create perfume product with volume variants/attributes; browse/filter.
5. Create promotion/coupon and apply eligible/ineligible carts.
6. Concurrent checkouts for limited stock cannot oversell.
7. Concurrent coupon limit consumption cannot exceed limit.
8. Idempotency: repeated place-order does not create duplicate order.
9. COD checkout order state and inventory behavior.
10. Online payment sandbox: pending → verified webhook → paid/confirmed, with duplicate webhook no-op.
11. Cancel/payment failure releases reservation according to policy.
12. Shipment/delivery flow and customer tracking.
13. Return approval, stock decision and partial/full refund invariants.
14. Audit log generated for sensitive admin modifications.
15. Unauthorized access to another customer's objects returns safe denial.
16. OpenAPI generation succeeds and Flutter client generation succeeds.

---

# 16. Implementation Phases

The AI agent must execute phases in order unless a written ADR changes sequencing.

## Phase 00 — Foundation, Decisions and Tooling

### Deliverables

- Initialize repository, pnpm workspace if selected and NestJS API using Fastify.
- Strict TypeScript, linting, formatting, test configuration.
- Docker Compose for MySQL 8.4/Redis/local storage.
- Validated configuration and `.env.example`.
- Health endpoint, structured logging, request IDs, global error contract.
- Swagger/OpenAPI document generation.
- CI skeleton.
- ADRs:
  - modular monolith;
  - MySQL now/PostgreSQL later;
  - money representation;
  - REST/OpenAPI/client generation;
  - authentication/token strategy.

### Acceptance

```bash
pnpm lint
pnpm typecheck
pnpm test
pnpm build
docker compose up -d
pnpm prisma validate
pnpm openapi:generate
```

## Phase 01 — Database Core, Prisma and Shared Infrastructure

### Deliverables

- Prisma v7 setup with MySQL provider and InnoDB/utf8mb4 guidance.
- Initial base models: user/session/roles/permissions, store settings, audit logs, outbox, idempotency.
- Migration and seed architecture.
- Database transaction helper/application boundary.
- Redis/BullMQ bootstrap and worker health.
- Serialization/redaction patterns.

### Acceptance

- Fresh migration succeeds on clean MySQL.
- Seed creates initial roles/permissions and development admin securely.
- Repository integration tests run against actual MySQL container.

## Phase 02 — Identity, Authentication and Authorization

### Deliverables

- Customer/admin authentication flows.
- Argon2id password hashing.
- JWT access and rotating hashed refresh session tokens.
- Verification/password reset structure.
- RBAC permissions and object policy guards.
- Auth throttling/security tests.
- Audit events.

### Acceptance

- Positive and negative auth/session/permission E2E tests.
- No token/password in logs or responses.
- BOLA/privilege test suite begins.

## Phase 03 — Catalog, Media and Localization

### Deliverables

- Product/category/brand/product type/attribute/option/variant/collection/tag/media models.
- Admin CRUD and publish/archive APIs.
- Public browse/detail/filter APIs.
- Arabic/English translation model and fallback.
- Signed catalog media upload and attachment workflow.
- Fashion and perfume seed examples.

### Acceptance

- Fashion and perfume products are representable through configuration only.
- Public APIs never expose draft/internal fields.
- Media authorization and limits tested.

## Phase 04 — Pricing, Store Settings, Taxes and Shipping Rates

### Deliverables

- Money primitive and pricing engine.
- Price lists/base and sale pricing.
- Store currency/settings.
- Shipping zones/methods/rates.
- Tax strategy interface/configuration.
- Public pricing and shipping estimation responses.

### Acceptance

- Price/totals unit tests with currencies/rounding boundaries.
- Historical snapshot design ready for checkout.

## Phase 05 — Promotions and Coupons

### Deliverables

- Rule-based promotions and coupon APIs.
- Eligibility calculation service.
- Usage constraints and stacking policy.
- Admin management plus public/cart evaluation.
- Audit logs.

### Acceptance

- Unit/integration tests for percentage/fixed/free-shipping/minimum/order-limit/customer-limit/exclusion/stacking cases.
- Concurrency strategy for checkout usage documented and tested.

## Phase 06 — Inventory and Reservations

### Deliverables

- Warehouse, stock level, movements, reservations.
- Admin inventory operations.
- Reservation expiry worker.
- Low stock notifications/events.
- Oversell-prevention transaction strategy.

### Acceptance

- Concurrent reservation tests prove unavailable stock cannot be sold twice.
- Movements and adjustment audit history are append-only and consistent.

## Phase 07 — Carts, Wishlist and Checkout Preview

### Deliverables

- Guest/authenticated carts and secure guest token handling.
- Cart items, merge rules, coupon handling and totals.
- Wishlist.
- Checkout preview with addresses/shipping/payment methods.
- Abandoned cart job/event optional after core behavior.

### Acceptance

- Ownership tests.
- Cart never claims guaranteed stock without reservation.
- Pricing/promotion changes correctly re-evaluate.

## Phase 08 — Orders, Idempotency and Cash on Delivery

### Deliverables

- Order/order-line/address/totals snapshots.
- Idempotency service.
- Checkout placement orchestration.
- COD payment adapter.
- Status transitions and customer/admin order APIs.
- Outbox events for notifications.

### Acceptance

- Repeated checkout idempotency test.
- Stock/coupon/order totals transaction tests.
- COD full storefront happy path.

## Phase 09 — Online Payments and Webhooks

### Deliverables

- `PaymentGateway` port and selected provider adapter.
- Payment attempts, webhooks, signature verification, duplicate-event handling.
- Refund foundation.
- Payment notification jobs/audit.

### Acceptance

- Provider sandbox end-to-end test.
- Duplicate webhook is harmless.
- Flutter success response alone never marks payment paid.
- No card data stored.

## Phase 10 — Fulfillment, Returns and Refunds

### Deliverables

- Shipment/tracking fulfillment.
- Returns request/moderation/receiving.
- Refund execution and partial refund calculations.
- Stock-restock policy.
- Customer/admin APIs and notifications.

### Acceptance

- Transition and finance invariant tests.
- Refund cannot exceed paid amount.
- Every action audited.

## Phase 11 — Reviews, Notifications, Content and Admin Reports

### Deliverables

- Verified purchase reviews/moderation.
- Email/push adapters and preferences.
- Store content settings/legal references.
- Reports/read views/exports via job.
- Audit log admin views.

### Acceptance

- Permissions and PII protection.
- Job retries/deduplication tested.
- Reports match seeded transaction totals.

## Phase 12 — Hardening, Flutter Contract and Production Release

### Deliverables

- OpenAPI stability review and generated Dart/Dio Flutter API package.
- Security control matrix and negative tests.
- Rate limit/cache/performance tuning.
- Staging deployment, backup/restore and migration runbooks.
- Observability/alerts.
- Release checklist and production smoke tests.

### Acceptance

- All CI gates pass.
- Critical E2E paths pass on staging.
- Security review has no unresolved high/critical issues.
- Restore drill and rollback runbook documented.
- Flutter integration uses generated contract and repository layer.

---

# 17. Recommended Initial Commands

The agent must verify the latest official Nest/Prisma instructions before running commands, particularly Prisma v7 setup and ESM/config requirements. A starting outline:

```bash
mkdir ecommerce-api
cd ecommerce-api
pnpm init

# Scaffold Nest application according to current NestJS CLI guidance,
# select pnpm, then configure the Fastify adapter.

# Runtime foundation packages: resolve compatible latest stable versions.
pnpm add @nestjs/common @nestjs/core @nestjs/platform-fastify @nestjs/config \
  @nestjs/swagger @nestjs/jwt @nestjs/passport passport passport-jwt \
  class-transformer class-validator joi reflect-metadata rxjs argon2

pnpm add @fastify/helmet @fastify/cors @fastify/cookie @nestjs/throttler
pnpm add prisma @prisma/client
pnpm add @nestjs/bullmq bullmq ioredis
pnpm add @aws-sdk/client-s3 @aws-sdk/s3-request-presigner
pnpm add pino nestjs-pino @nestjs/terminus

pnpm add -D typescript eslint prettier jest @nestjs/testing supertest \
  @types/passport-jwt @types/supertest
```

After bootstrap, replace this illustrative list with the exact locked dependencies confirmed compatible by install/build/tests.

Prisma outline:

```bash
pnpm prisma init --datasource-provider mysql --output ../generated/prisma
pnpm prisma validate
pnpm prisma migrate dev --name init
pnpm prisma generate
```

Do not paste a Prisma v6 configuration blindly into a Prisma v7 project.

---

# 18. Coding Rules for the AI Agent

## 18.1 TypeScript and Nest Rules

- Enable `strict`, `noUncheckedIndexedAccess`, safe linting and no implicit `any`.
- Never use `any` to bypass design/type errors; use safe types and mapping.
- Use dependency injection and module exports intentionally.
- Use DTOs and application result models; do not expose ORM objects.
- Each endpoint has validation, authorization, errors, OpenAPI annotations and tests.
- Prefer composable services/policies to enormous service/controller files.

## 18.2 Prisma and Database Rules

- Schema change requires migration, seed impact review and tests.
- Never use `db push` for production deployment.
- Never delete or edit historical production migrations.
- Select only necessary fields, especially for users/admin/customer PII.
- Require pagination for collection endpoints.
- Add indexes for query patterns and document them.
- Use `Decimal` only where specifically required; monetary totals remain minor integer units.
- Explicitly review cascade deletes; prefer archival/soft deletion where historical commerce records must remain.

## 18.3 Business Logic Rules

- Controllers never calculate prices, discounts, stock or order transitions.
- Client payload is never accepted as authoritative price/discount/total/payment/permission state.
- Recalculate order placement server-side.
- Provider events are untrusted until signature verified.
- Time-dependent promotions are evaluated using server UTC.
- All external side effects are idempotent/retriable.

## 18.4 Security Rules

- Implement deny-by-default permission checks.
- Add negative tests before marking sensitive modules complete.
- Redact logs centrally.
- Never weaken CORS, validation, authentication or upload checks just to make a UI request work.
- Never commit `.env`, credentials, payment secrets or service account keys.

---

# 19. Documentation Deliverables

Maintain these alongside code:

```text
docs/
  implementation-status.md
  adr/
    0001-modular-monolith.md
    0002-mysql-now-postgresql-migration-later.md
    0003-money-minor-units.md
    0004-rest-openapi-flutter-client-generation.md
    0005-auth-session-token-strategy.md
    0006-inventory-reservation-checkout-transaction.md
    0007-payment-webhook-idempotency.md
  api/
    openapi.json
    error-codes.md
    authentication.md
    idempotency.md
  domain/
    catalog-model.md
    promotions-rules.md
    order-lifecycle.md
    inventory-invariants.md
    payment-and-refund-invariants.md
  security/
    threat-model.md
    control-matrix.md
    data-classification.md
  operations/
    local-development.md
    environment-variables.md
    deployment.md
    backup-restore.md
    incident-response.md
    mysql-to-postgresql-migration-plan.md
```

---

# 20. Completion Definition

The backend is not “complete” because endpoints exist. It is release-ready only when:

- It supports flexible products/variants for both clothes and perfumes without schema rewrites.
- Catalog, pricing, promotion, inventory, cart, checkout, order, payment, shipping, return/refund, notification, reporting and admin/audit functionality are implemented to the approved launch scope.
- Server-side transactions and idempotency enforce money/stock/coupon/payment invariants.
- Authentication, authorization, rate limits, secure uploads, safe serialization and webhook verification are complete.
- OpenAPI is generated and Flutter client generation works.
- MySQL migration/backup/restore/deployment workflows are documented and tested.
- Portability rules are followed so a future PostgreSQL migration remains viable.
- Automated tests and security verification gates pass.
- Staging smoke tests and operational monitoring/runbooks are approved.

---

# 21. First Instruction to the Coding Agent

Begin with **Phase 00 only**.

Before coding:

1. Inspect any existing repository files if this plan is being applied to an existing project.
2. Confirm the current stable compatible Node/NestJS/Fastify/Prisma/MySQL package/tool versions using official sources and record locked versions in `docs/implementation-status.md`.
3. Create the architecture skeleton, Docker development infrastructure, configuration validation, API bootstrap with Fastify, error contract, logging/request ID, health endpoint, OpenAPI generation, lint/typecheck/test/build scripts and CI baseline.
4. Do not start Catalog, Auth or product business endpoints until Phase 00 acceptance checks pass.
5. Produce `docs/implementation-status.md` with: changed files, commands run, results, unresolved decisions and recommended next phase.
