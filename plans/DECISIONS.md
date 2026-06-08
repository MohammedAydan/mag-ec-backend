# Architecture Decisions

## ADR-001: Modular Monolith Architecture

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** The product requires strong transactional integrity across catalog, pricing, inventory, carts, checkout, orders, and payments while the repository is expected to be built incrementally by an AI agent.
- **Decision:** Build the system as a modular monolith with explicit domain/application/infrastructure/presentation boundaries and a separately bootstrapped worker process.
- **Alternatives considered:** Microservices, event-driven distributed services, and GraphQL-first API design.
- **Consequences:** Delivery and testing stay tractable, deployment is simpler, and consistency remains straightforward. Module boundaries must still be maintained to avoid monolith erosion.

---

## ADR-002: MySQL First with PostgreSQL-Portability Rules

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** The initial release must use MySQL 8.4 LTS, but the product brief explicitly requires a future PostgreSQL migration path.
- **Decision:** Use Prisma with a MySQL provider for v1 and enforce application-level portability rules such as minor-unit money values, application-generated IDs, minimized provider-specific SQL, and normalized searchable fields.
- **Alternatives considered:** PostgreSQL from day one, dual-database support in v1, or a MySQL-specific domain model.
- **Consequences:** The project meets the current deployment requirement while reducing future migration risk. Some optimizations must be deferred or abstracted to stay portable.

---

## ADR-003: Versioned REST with OpenAPI-Generated Flutter Client

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** The API must support Flutter storefront and admin clients without hand-maintained duplicate request/response models.
- **Decision:** Expose the backend as versioned REST under `/api/v1`, generate OpenAPI artifacts in-repo, and use OpenAPI Generator `dart-dio` for client generation.
- **Alternatives considered:** GraphQL, ad hoc REST without formal contract generation, or manually maintained client SDKs.
- **Consequences:** Contract discipline becomes mandatory, endpoint DTOs must be documented precisely, and contract drift can be caught in CI.

---

## ADR-004: Security-First Authentication and Authorization

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** The system includes both customer and administrative surfaces with sensitive PII, order, and financial operations.
- **Decision:** Use JWT access tokens with rotating hashed refresh-token families, Argon2id password hashing, deny-by-default RBAC, object-level policy checks, rate limiting, and centralized log redaction.
- **Alternatives considered:** Long-lived JWT-only auth, sessionless refresh reuse, or permissive role checks without object-level controls.
- **Consequences:** Authentication implementation is more involved early, but it materially reduces account/session abuse risk and aligns with OWASP-style API controls.

---

## ADR-005: Business Rules Stay in Application and Domain Services

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** Commerce invariants such as totals, stock, coupon usage, and refunds are easy to fragment if logic leaks into controllers or persistence queries.
- **Decision:** Keep core business policies inside application and domain services, with controllers limited to validation/mapping and infrastructure limited to repository/provider concerns.
- **Alternatives considered:** Fat controllers, query-driven rule evaluation, or vendor-centric domain logic.
- **Consequences:** Code organization is stricter, but rules remain testable, reusable, and auditable as the project grows.

---

## ADR-006: pnpm Workspace with Separate API and Worker Packages

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** The foundation phase needed a repo structure that supports an API process, a worker process, shared packages, Prisma, and generated contracts without prematurely splitting the deployment model.
- **Decision:** Use a pnpm workspace with separate `apps/api`, `apps/worker`, and `packages/*` entries from phase 00 onward.
- **Alternatives considered:** Single-package monorepo root, separate repositories, or delayed workspace adoption.
- **Consequences:** Build and dependency boundaries are clearer early, and later worker/contract growth is easier to manage. Tooling scripts need to be workspace-aware from the start.

---

## ADR-007: Prisma 7 Configuration via `prisma.config.ts`

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** Prisma 7 no longer supports datasource URLs in `schema.prisma`, and phase 00 must match the current CLI contract rather than older examples.
- **Decision:** Keep the datasource provider in `prisma/schema.prisma` and move datasource URL configuration to a root `prisma.config.ts`.
- **Alternatives considered:** Retaining the older schema-based URL configuration or delaying Prisma setup until phase 01.
- **Consequences:** The repo matches current Prisma 7 behavior and avoids phase-01 rework. Future Prisma CLI usage must continue to treat `prisma.config.ts` as authoritative.

---

## ADR-008: Variant-Level Pricing with Strategy-Based Tax and Rule-Based Shipping

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** Phase 04 needs authoritative pricing for sellable catalog units plus checkout-preview-ready tax and shipping calculations, while later phases still need room for provider-backed tax or carrier adapters.
- **Decision:** Store prices on `CatalogProductVariant`, keep store-wide currency and pricing defaults in `StoreSetting`, model manual tax and shipping configuration relationally, and hide tax computation behind a strategy contract.
- **Alternatives considered:** Product-level pricing only, storing all pricing/tax/shipping policy in JSON settings, or coupling checkout preview directly to a future external tax/carrier provider.
- **Consequences:** Checkout preview can price real variants now, later adapters can replace the manual tax strategy cleanly, and shipping/tax admin data stays queryable and testable. Multi-currency and price-list support remain future work.

---

## ADR-009: Promotions as Relational Rules with Explicit Usage Ledgers

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** Phase 05 needs deterministic promotion and coupon evaluation now, while later checkout and order phases still need concurrency-safe reservation and redemption accounting without adopting a generic rule engine too early.
- **Decision:** Model promotions, coupons, exclusions, and usage ledgers relationally; evaluate eligibility in an application service; and centralize coupon normalization in a dedicated service shared by admin and pricing-preview flows.
- **Alternatives considered:** A generic JSON rule engine, storing coupon usage only on orders later, or embedding discount logic directly in pricing controllers.
- **Consequences:** Promotions stay queryable, testable, and auditable, and later order-placement flows can claim or consume usage via the existing ledgers. More exotic rule types remain future work and should extend the evaluator intentionally rather than bypass it.

---

## ADR-010: Server-Persisted Guest Carts with Opaque Tokens

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** Phase 07 needs resumable guest carts, deterministic merge behavior, and server-side re-evaluation of pricing, promotions, and stock without trusting client-maintained cart state.
- **Decision:** Persist guest carts server-side in the same relational model as authenticated carts and address them through opaque `guestToken` values supplied by the client.
- **Alternatives considered:** Signed client-side cart payloads, local-only guest carts, or separate guest-cart storage outside Prisma.
- **Consequences:** Cart ownership and merge behavior stay auditable and simple to test, but guest tokens must be treated as bearer secrets and cart-expiry cleanup remains a later responsibility.

---

## ADR-011: Authoritative Order Placement with Scoped Idempotency

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** Phase 08 introduces the first irreversible checkout operation, so duplicate submits, stale client totals, and partially applied stock or promotion side effects must be prevented.
- **Decision:** Recalculate checkout placement server-side inside one transaction, bind idempotency keys to the checkout-placement route plus actor scope, and persist replay payloads on the `IdempotencyKey` record for safe retries.
- **Alternatives considered:** Trusting preview snapshots from the client, using a global unspecialized idempotency namespace, or making order placement eventually consistent across separate writes.
- **Consequences:** Order placement becomes more explicit and testable, retries are safe for both users and guests, and future payment/fulfillment phases can build on authoritative order snapshots. The current idempotency abstraction remains checkout-specific until additional write paths justify generalization.

---

## ADR-012: Verified Provider Webhooks Are The Only Online Payment Authority

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** Phase 09 introduces provider-backed online payments, but the system cannot trust client callbacks or duplicate webhook deliveries to mutate order and stock state safely.
- **Decision:** Use a `PaymentGateway` abstraction with Stripe PaymentIntents as the first adapter, persist payment attempts and webhook events locally, and treat verified webhook processing as the only authoritative source for online payment success or failure transitions.
- **Alternatives considered:** Trusting client-side payment confirmation, updating order state directly from provider SDK callbacks without event persistence, or keeping provider logic inside checkout services.
- **Consequences:** Payment state changes become auditable and replay-safe, stock redemption can remain tied to verified success, and future providers can slot in behind the same gateway boundary. The current implementation is still limited to one provider and a simple capture-style flow.

---

## ADR-013: Derive Post-Purchase Order State From Operational Artifacts

- **Date:** 2026-05-25
- **Status:** Accepted
- **Context:** Phase 10 introduces shipments, returns, restock decisions, and refunds. Directly mutating order fulfillment state from every controller action would make partial fulfillment and partial return behavior inconsistent and hard to audit.
- **Decision:** Persist shipment and return records as first-class operational artifacts, then centralize fulfillment-state recalculation in a dedicated post-purchase order service. Use explicit return dispositions and warehouse targeting so stock changes only happen during controlled receiving flows, not during request or review steps.
- **Alternatives considered:** Mutating `Order.fulfillmentStatus` ad hoc inside every shipment and return handler, implicit restock on every approved return, or collapsing returns into refund-only records without physical disposition tracking.
- **Consequences:** The order aggregate stays consistent across partial shipment and return scenarios, inventory only changes at explicit operational boundaries, and later carrier or warehouse integrations can reuse the same derived-state contract.

---

## ADR-014: Dashboard UI Is Planned Separately From Backend Implementation

- **Date:** 2026-05-27
- **Status:** Accepted for planning
- **Context:** The project brain currently defines this repository as backend-only, but the product now needs a complete modern admin dashboard plan that can drive future UI implementation.
- **Decision:** Keep dashboard UI work as a planning package under `plans/phase-13-dashboard-ui/` until the implementation boundary is explicitly chosen. The recommended implementation direction is a separate frontend application or an approved `apps/dashboard` workspace expansion that consumes the REST/OpenAPI backend.
- **Alternatives considered:** Implementing dashboard screens directly in the backend repo immediately, delaying all UI planning, or coupling dashboard code to backend modules without a clear client boundary.
- **Consequences:** Dashboard planning can proceed now without violating the backend-only constraint. Before UI code starts, the team must approve implementation location, frontend stack, product design context, auth/session strategy, and any required backend contract gaps.

---

## ADR-015: Keep API Prefix in OpenAPI Paths, Not Server URLs

- **Date:** 2026-05-31
- **Status:** Accepted
- **Context:** NestJS keeps the global `/api/v1` prefix in generated operation paths by default. Adding the same prefix to `servers[].url` causes generated clients to compose duplicated URLs such as `/api/v1/api/v1/...`.
- **Decision:** Centralize OpenAPI setup in `apps/api/src/openapi/openapi.config.ts`, keep `/api/v1` in operation paths, leave generated contract `servers` empty, and use the same config for runtime Swagger docs and generated contract output.
- **Alternatives considered:** Keeping `/api/v1` as a server URL, ignoring the global prefix during document generation, or maintaining separate runtime and generation Swagger configs.
- **Consequences:** Generated clients use host-only runtime base URLs while operation paths remain fully versioned. Runtime docs and checked-in contracts now stay aligned, but future OpenAPI config changes must go through the shared config helper.

---

## ADR-016: Treat OpenAPI Response DTOs as Runtime Serialization Boundaries

- **Date:** 2026-05-31
- **Status:** Accepted
- **Context:** The generated Flutter/Dio client uses strict `built_value` models, so endpoints that advertise DTOs but return raw Prisma records or partial projections fail at runtime when required fields are null, renamed, or nested differently.
- **Decision:** Services/controllers that expose documented response DTOs must serialize ORM records into DTO-shaped plain objects before returning them. Generated Dart runtime model tests are part of the contract verification path.
- **Alternatives considered:** Relaxing generated Flutter model nullability, returning raw ORM records and changing DTOs to match them, or manually patching Flutter models after generation.
- **Consequences:** Backend handlers carry a small explicit mapping cost, but OpenAPI, runtime JSON, and generated Flutter models stay aligned. Raw database relation names should not leak into public SDK models.

---

## ADR-017: Embedded Admin Dashboard Uses HeroUI v3 with Centralized Same-Origin API Access

- **Date:** 2026-06-05
- **Status:** Accepted
- **Context:** The repository already approved an embedded administrator SPA at `/admin`, but the initial dashboard implementation was a custom React/CSS shell with direct fetch wrappers and inconsistent frontend system choices. The rebuild needed a professional component foundation without changing backend auth semantics or the embedded deployment boundary.
- **Decision:** Rebuild the embedded dashboard on HeroUI v3 plus Tailwind CSS v4, keep the SPA inside `apps/api/public/dashboard`, preserve Vite output to `apps/api/public/admin`, and centralize API access through a shared request/auth layer with env-configurable same-origin `/api/v1` integration and refresh-token retry handling.
- **Alternatives considered:** Keeping the custom CSS shell, moving the dashboard into a separate repository, or adopting a different component library while the embedded SPA decision is already in place.
- **Consequences:** The admin UI now has a maintainable design system and a cleaner API integration boundary while staying deployable with the NestJS app. Bundle size and route chunking remain follow-up optimization work because the current SPA still builds as one large frontend bundle.

---

## ADR-018: Dashboard Actions Use Schema-Driven Drawers and HeroUI Theme Intents

- **Date:** 2026-06-05
- **Status:** Accepted
- **Context:** The embedded dashboard still exposed placeholder JSON payloads, prompt-based maintenance input, and inconsistent form/dialog behavior even after the initial HeroUI rebuild. The user explicitly requested official HeroUI-guided light/dark support plus specific inputs instead of raw JSON editors.
- **Decision:** Use HeroUI's plain React `useTheme` hook for persistent light, dark, and system theme selection, and standardize create or mutate flows on a shared schema-driven `Drawer` form system that renders explicit field controls rather than raw JSON text areas or prompts.
- **Alternatives considered:** Keeping page-specific ad hoc dialogs, leaving generic JSON payload submission in place, or introducing a separate theming library despite HeroUI already providing a supported plain React solution.
- **Consequences:** Dashboard actions now share accessible validation, server-field error wiring, and consistent UX across pages, and theme state stays aligned with HeroUI's documented DOM class plus `data-theme` behavior. The shared renderer adds some abstraction cost, so unusually bespoke future flows may still need page-specific editors.

---

## ADR-019: Vercel Deploys the API as One Direct-Mode Nest Function

- **Date:** 2026-06-07
- **Status:** Accepted
- **Context:** Vercel's NestJS framework support packages a detected Nest entrypoint as a single Vercel Function. This repository embeds a dashboard source package under `apps/api/public/dashboard`, which must build before deployment but must not be typechecked or bundled as API source.
- **Decision:** Keep `apps/api` as the Vercel project root, deploy `src/main.ts` as the single direct-mode NestJS function, build dashboard assets into `public/admin`, and prune `public/dashboard` only at the end of Vercel's ephemeral build.
- **Alternatives considered:** Pointing Vercel at the dashboard package, moving the dashboard source outside `apps/api`, relying only on TypeScript `exclude` settings, or using `vercel.json.functions` for `src/main.ts`.
- **Consequences:** The deployment remains a single same-origin API plus `/admin` app, while Vercel's postbuild scan avoids the nested dashboard TypeScript source. `vercel.json.functions` must not be used for `src/main.ts` because Vercel only accepts those patterns for Serverless Functions inside an `api` directory.

---

## ADR-020: Normalize Vercel Production Env and Derive Missing JWT Secrets

- **Date:** 2026-06-09
- **Status:** Accepted
- **Context:** Vercel MCP diagnostics showed production deployments exposing `VERCEL_ENV=production` while the API saw `NODE_ENV` as unset/development. The same deployment had quoted-empty JWT env values, a valid maintenance secret, and runtime logs containing `redis://localhost`, causing NestJS bootstrap to crash under serverless production.
- **Decision:** Treat `VERCEL_ENV=production` as production for API config, normalize quoted-empty env values before validation/building config, keep direct mode Redis empty unless explicitly configured, and derive stable JWT access/refresh secrets from a strong maintenance secret when explicit JWT secrets are absent or empty.
- **Alternatives considered:** Requiring manual Vercel env edits only, keeping `NODE_ENV` as the only production signal, allowing weak JWT values through, or defaulting to hardcoded production secrets.
- **Consequences:** Vercel direct-mode deployments boot with production-safe defaults even when `NODE_ENV` is missing, and quoted-empty JWT settings no longer crash the app if a strong maintenance secret exists. Explicit separate JWT secrets remain recommended, and weak non-empty JWT secrets still fail validation.

---
