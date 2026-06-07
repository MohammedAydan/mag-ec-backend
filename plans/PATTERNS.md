# Engineering Patterns

## Pattern: Embedded SPA Source vs Built Asset Boundary [feature: vercel-postbuild-type-scan-fix]

- **Problem:** A nested frontend package under a backend app root can be built successfully, then later break serverless packaging when the platform scans frontend `.tsx` source with backend TypeScript settings.
- **Solution:** Keep the frontend build output in a static asset folder, exclude the source package from backend tsconfigs, and prune the frontend source only after the deployment build has emitted the static assets.
- **Example:** `apps/api/scripts/prune-vercel-dashboard-source.mjs` removes `public/dashboard` only when `VERCEL=1`, after `@atelier/admin-dashboard` has built `public/admin`.
- **Gotchas:** Do not use `vercel.json.functions` for `src/main.ts`; Vercel rejects that pattern because it is not under an `api` directory. Build-time pruning must run after the dashboard package has compiled.

---

## Pattern: API Response DTO Serializer [feature: flutter-content-response-nullability-fix]

- **Problem:** Returning ORM records directly can drift from the OpenAPI DTO, especially when generated clients enforce non-null fields.
- **Solution:** Services that expose documented DTOs should serialize ORM records into explicit response objects before returning them.
- **Example:** `apps/api/src/modules/content/services/content.service.ts` serializes `ContentPageRecord` into `ContentPageResponseDto` with non-null fallback fields and ISO timestamps.
- **Gotchas:** Keep admin and public response DTOs separate when the payload shapes differ, even if they share similar domain names.

---

## Pattern: Generated SDK Runtime Contract Samples [feature: flutter-runtime-contract-full-audit]

- **Problem:** A clean OpenAPI schema can still hide runtime response drift until Flutter `built_value` deserialization hits a null, renamed field, or raw ORM relation.
- **Solution:** Keep generated Dart runtime tests with representative payloads for every feature group and make `flutter:client:generate` / `flutter:client:verify` run those tests after OpenAPI generation.
- **Example:** `packages/contracts/openapi/generate-flutter-client.ts` writes `test/model_runtime_test.dart`, which round-trips identity, catalog, carts, wishlist, checkout, pricing, orders, payments, fulfillment, returns, notifications, reporting, audit, content, and health DTOs.
- **Gotchas:** These samples must mirror documented DTOs, not database records. When a backend DTO changes, update the generated runtime sample before trusting the SDK.

---

## Pattern: Phase Folder as Execution Contract [feature: all-phases]

- **Problem:** A long-running backend build can lose continuity across sessions if planning, assumptions, and progress are not stored in a resumable structure.
- **Solution:** Represent each implementation phase as its own folder with `plan.md`, `tasks.md`, and `context.md`, and keep project-wide state in the root `plans/` documents.
- **Example:** `plans/phase-00-foundation/plan.md`
- **Gotchas:** Do not begin implementation without updating the active phase task state and reviewing the corresponding folder first.

---

## Pattern: Layered Business Module Structure [feature: all-phases]

- **Problem:** Commerce backends become brittle when controllers, ORM queries, and vendor SDK calls contain business rules directly.
- **Solution:** Organize each module into domain, application, infrastructure, and presentation layers with explicit ports and DTO boundaries.
- **Example:** `apps/api/src/modules/catalog/{domain,application,infrastructure,presentation}`
- **Gotchas:** Shared utilities must not become a dumping ground for cross-module business logic.

---

## Pattern: Contract-Driven Client Integration [feature: phase-00-foundation]

- **Problem:** Flutter clients drift from backend behavior when endpoint models are copied manually.
- **Solution:** Treat OpenAPI as a first-class artifact, validate it in CI, and generate Dart/Dio clients from it.
- **Example:** `packages/contracts/openapi` and `packages/contracts/generated`
- **Gotchas:** DTO naming and schema changes must remain intentional; breaking changes need explicit versioning and release notes.

---

## Pattern: Centralized API Bootstrap [feature: phase-00-foundation]

- **Problem:** Tests, OpenAPI generation, and runtime startup need to share the same Nest/Fastify configuration without silently diverging.
- **Solution:** Route all API app creation through a single `createApiApplication()` bootstrap function and keep `main.ts`, tests, and contract generation thin.
- **Example:** `apps/api/src/bootstrap/create-api-application.ts`
- **Gotchas:** Environment defaults that make contract generation easy should not silently become production assumptions later.

---

## Pattern: Prisma 7 Adapter-Backed Service [feature: phase-01-database-core]

- **Problem:** Prisma 7 no longer uses datasource URLs inside `schema.prisma`, and the runtime client requires an adapter-backed connection path.
- **Solution:** Centralize Prisma client construction in a Nest service that converts `DATABASE_URL` into a MariaDB adapter and export that service through a global persistence module.
- **Example:** `apps/api/src/modules/persistence/services/prisma.service.ts`
- **Gotchas:** Regenerate Prisma Client whenever schema changes, and avoid eager DB connection during boot paths that should still work offline, such as OpenAPI generation.

---

## Pattern: Cross-Platform MySQL Integration Runner [feature: phase-01-database-core]

- **Problem:** Real MySQL integration tests need migration apply, seed execution, and an explicit `RUN_MYSQL_INTEGRATION=true` flag, but shell syntax differs across Windows and Linux.
- **Solution:** Use a small Node/TS orchestration script at `scripts/run-mysql-integration.ts` to run `prisma migrate deploy`, `prisma db seed`, and the integration Jest suite with inherited stdio and explicit env injection.
- **Example:** `pnpm test:integration:mysql` works locally and in GitHub Actions without shell-specific env syntax.
- **Gotchas:** This assumes the target MySQL database already exists; local runs still need Docker/MySQL provisioned first, and integration specs should fail loudly when `RUN_MYSQL_INTEGRATION=true` but the DB is unreachable.

---

## Pattern: Explicit Nest Injection Tokens Under TS 6 [feature: phase-02-identity-authz]

- **Problem:** OpenAPI generation and other Nest boot paths can fail with undefined runtime dependencies when decorator metadata is not reliable for class-only constructor references under the current TypeScript/Nest setup.
- **Solution:** Use explicit `@Inject(...)` tokens for ConfigService, JwtService, PrismaService, and other class providers in sensitive boot-path services.
- **Example:** `apps/api/src/modules/identity/services/token.service.ts`
- **Gotchas:** Unit tests may still pass without the explicit token if they instantiate services manually, so keep an OpenAPI-generation check in the verification set.

---

## Pattern: Locale Fallback via Translation Selector [feature: phase-03-catalog-media-localization]

- **Problem:** Catalog entities can have partial Arabic or English coverage, but public APIs still need a deterministic localized response shape.
- **Solution:** Centralize locale selection in a small translation service that prefers the requested locale, then English, then Arabic, then the first available translation.
- **Example:** `apps/api/src/modules/catalog/services/catalog-localization.service.ts`
- **Gotchas:** Keep public mappers on the selector path; bypassing it in ad hoc queries will reintroduce inconsistent fallback behavior.

---

## Pattern: Guarded Feature Modules Must Import Their Auth Providers [feature: phase-03-catalog-media-localization]

- **Problem:** A feature module can compile while still failing at app boot if it applies exported guards whose transitive providers are not imported into the module graph.
- **Solution:** Import the owning auth or identity module anywhere route controllers use exported auth guards, even if the guard classes themselves are not listed as local providers.
- **Example:** `apps/api/src/modules/catalog/catalog.module.ts`
- **Gotchas:** This often shows up only in full app boot or e2e tests, not isolated unit tests, so include at least one real Nest boot path in verification.

---

## Pattern: Minor-Unit Money Service [feature: phase-04-pricing-store-settings]

- **Problem:** Pricing, tax, and shipping calculations drift quickly when each service implements its own rounding or currency checks.
- **Solution:** Centralize money creation, basis-point percentage math, integer multiplication, and currency mismatch guards in a dedicated money service.
- **Example:** `apps/api/src/modules/pricing/services/money.service.ts`
- **Gotchas:** Keep all percentage math in basis points and avoid ad hoc `Math.round` usage in feature services, or snapshot totals will diverge.

---

## Pattern: Strategy Tax with Relational Shipping Rules [feature: phase-04-pricing-store-settings]

- **Problem:** Checkout preview needs immediate tax and shipping behavior, but the final provider landscape is still undecided.
- **Solution:** Store tax classes, country rates, shipping zones, and shipping methods relationally, then inject a tax-strategy contract so the manual implementation can be replaced later without rewriting preview flows.
- **Example:** `apps/api/src/modules/pricing/services/manual-tax-strategy.service.ts`
- **Gotchas:** Do not hide provider-independent pricing rules inside JSON settings; relational configuration keeps preview queries, admin APIs, and later audits testable.

---

## Pattern: Deterministic Promotion Evaluation Pipeline [feature: phase-05-promotions-coupons]

- **Problem:** Promotions become inconsistent when automatic discounts, coupon rules, and stacking logic are evaluated ad hoc in multiple transport paths.
- **Solution:** Load candidate promotions by trigger, normalize coupon inputs once, sort by priority, and return both applied and rejected promotions from a single evaluator service consumed by pricing or checkout flows.
- **Example:** `apps/api/src/modules/promotions/services/promotion-evaluator.service.ts`
- **Gotchas:** Keep rejection reasons explicit and do not let preview-specific shortcuts bypass exclusion, combinability, or usage-limit checks.

---

## Pattern: Usage Limits via Reservation-Ready Ledgers [feature: phase-05-promotions-coupons]

- **Problem:** Simple redeemed-count fields alone are not enough once checkout needs to reserve a coupon or promotion before an order is finalized.
- **Solution:** Pair aggregate counters on promotions and coupons with append-only redemption ledgers that can represent reserved, redeemed, and released usage states.
- **Example:** `prisma/schema.prisma` models `PromotionRedemption` and `CouponRedemption`
- **Gotchas:** The counters and ledgers must be updated transactionally in later order flows; preview evaluation should only read them and must not mutate usage state.

---

## Pattern: Guest Cart Merge into Active User Cart [feature: phase-07-carts-wishlist-checkout-preview]

- **Problem:** Guest shoppers need to preserve pre-login intent without creating duplicate user-cart lines or trusting client-calculated totals.
- **Solution:** Persist guest carts server-side, merge them into the authenticated user's active cart by variant, sum quantities on collisions, and mark the source cart `MERGED` after moving or deleting its lines.
- **Example:** `apps/api/src/modules/carts/services/cart.service.ts`
- **Gotchas:** Ownership checks must differentiate between `userId`-owned carts and guest-token carts, and checkout must always re-evaluate pricing/promotions after merge rather than reusing stale client snapshots.

---

## Pattern: Replay-Safe Checkout Placement [feature: phase-08-orders-idempotency-cod]

- **Problem:** Order placement is irreversible and spans pricing, promotions, inventory, cart state, and order snapshots, so duplicate submits or stale previews can create inconsistent commerce state.
- **Solution:** Acquire an actor-scoped idempotency key first, then execute authoritative placement inside one transaction that recalculates pricing, validates payment and shipping, redeems reservations and promotions, writes snapshots, and stores the successful response for replay.
- **Example:** `apps/api/src/modules/checkout/services/checkout-placement.service.ts` and `apps/api/src/modules/checkout/services/checkout-idempotency.service.ts`
- **Gotchas:** The request hash must be stable across equivalent payloads, guest scope must stay bound to the guest token, and idempotency must reject in-flight duplicates instead of silently racing them.

---

## Pattern: Verified Webhook Transition Barrier [feature: phase-09-online-payments-webhooks]

- **Problem:** Online payment flows are unsafe if client callbacks or replayed provider webhooks can directly mark orders as paid.
- **Solution:** Persist every provider payment attempt and webhook event, enforce webhook-event uniqueness at the database layer, and route order-payment transitions only through verified webhook handlers.
- **Example:** `apps/api/src/modules/payments/services/payment-webhook.service.ts`
- **Gotchas:** Raw request body access is mandatory for signature verification, duplicate events must short-circuit before replaying transitions, and online-payment reservations should not be redeemed before verified success.

---

## Pattern: Derived Post-Purchase Order State [feature: phase-10-fulfillment-returns-refunds]

- **Problem:** Shipments, returns, refunds, and restock actions can each change how an order should be presented, but hand-mutating order status in every workflow quickly becomes inconsistent.
- **Solution:** Treat shipments and received returns as first-class artifacts, then recalculate `Order.status` and `Order.fulfillmentStatus` from those records in one dedicated service after each operational change.
- **Example:** `apps/api/src/modules/orders/services/order-post-purchase.service.ts`
- **Gotchas:** Count only shipped or delivered shipments toward fulfillment, count only received or closed returns toward returned quantity, and avoid implicit stock changes outside the return-receiving step.

---

## Pattern: SDK-Safe OpenAPI Action Endpoints [feature: openapi-contract-accuracy-audit]

- **Problem:** Generated TypeScript and Flutter SDKs break or become unstable when OpenAPI paths collide by template shape, integer query params emit `number`, or empty-body command routes omit explicit metadata.
- **Solution:** Normalize route design so semantically different lookups do not share the same templated path, emit integer pagination schemas explicitly, document `401` and `403` on secured operations, and mark intentional empty-body POST or PUT or PATCH endpoints with `x-sdk-allow-empty-request-body: true`.
- **Example:** `apps/api/src/modules/promotions/controllers/promotions-admin.controller.ts`, `packages/contracts/openapi/verify-openapi-contract.ts`, `apps/api/src/openapi/openapi-contract.spec.ts`
- **Gotchas:** Nest validation decorators alone are not enough for integer query schemas, and OpenAPI treats `/foo/{id}` plus `/foo/{key}` as the same path for SDK generation purposes.

---
