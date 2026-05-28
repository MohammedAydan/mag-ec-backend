# System Architecture

## Overview

The system is a headless e-commerce backend that exposes versioned REST APIs for a Flutter storefront client and a separate admin/dashboard client. It is designed as a modular monolith built on NestJS with Fastify, backed by MySQL for transactional data, Redis for cache and jobs, object storage for media, and optional provider adapters for payments, email, push, and shipping.

## Architecture Pattern

Modular monolith with clean domain/application/infrastructure/presentation boundaries and a separately bootstrapped worker process for asynchronous jobs.

## System Diagram

```text
Flutter Storefront + Admin Client
             |
      Generated Dart API Client
         (OpenAPI / dart-dio)
             |
         /api/v1 REST
             |
   NestJS 11 + Fastify 5 API App
             |
   Application services / use cases
             |
Domain policies, ports, invariants, DTO mappers
      |          |          |          |
    Prisma      Redis      S3      External Adapters
    MySQL      BullMQ    Media     Payments/Email/FCM
             |
        Worker Process
```

## Core Components

| Component                 | Responsibility                                                                                                                | Location                                                              |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| API application           | HTTP bootstrap, middleware, module composition, REST exposure                                                                 | `apps/api/src`                                                        |
| Worker application        | Queue processors and deferred tasks                                                                                           | `apps/worker/src`                                                     |
| Shared common layer       | Auth primitives, errors, interceptors, pagination, utilities                                                                  | `apps/api/src/common`                                                 |
| Business modules          | Domain-specific application and presentation logic                                                                            | `apps/api/src/modules/*`                                              |
| Checkout and orders flow  | Authoritative preview, placement, idempotency, payment attempts, webhooks, fulfillment, returns, refunds, and order-read APIs | `apps/api/src/modules/{checkout,orders,payments,fulfillment,returns}` |
| Shared domain package     | Shared primitives and cross-module contracts                                                                                  | `packages/domain-shared/src`                                          |
| OpenAPI contracts package | Stored contract artifacts and generated clients                                                                               | `packages/contracts`                                                  |
| Persistence layer         | Prisma schema, migrations, seed scripts                                                                                       | `prisma/`                                                             |
| Documentation surface     | ADRs, operations, security, domain references, API artifacts                                                                  | `docs/`                                                               |

## Data Flow

Client requests enter the NestJS API through versioned REST routes under `/api/v1`. Controllers validate and authorize the request, then dispatch into application services. Application services enforce business rules using domain policies and repository ports, persist authoritative state through Prisma/MySQL, emit outbox events, and schedule asynchronous work through BullMQ when needed. Checkout placement now re-evaluates pricing server-side, binds an idempotency key to the actor scope, and commits stock, promotion, cart, and order writes atomically before publishing order outbox events. For online-card orders, payment attempts are created through a gateway adapter and stock remains reserved until a verified provider webhook updates the authoritative payment state. Post-purchase flows extend the same order aggregate with shipment records, return requests, explicit restock decisions, and provider-backed refunds while a dedicated post-purchase service derives order fulfillment state from those operational artifacts. Background jobs process deferred tasks such as notifications, search indexing, reservation expiry, and webhook side effects. Media flows through signed object-storage uploads and attachment records rather than direct binary persistence in the database.

## External Integrations

| Service               | Purpose                                | Auth Method                                            |
| --------------------- | -------------------------------------- | ------------------------------------------------------ |
| MySQL 8.4 LTS         | Authoritative transactional store      | Database credentials via validated env vars            |
| Redis                 | Cache, queues, distributed controls    | Redis URL or discrete credentials                      |
| S3-compatible storage | Product and content media              | Access key and secret; signed URLs                     |
| Payment provider      | Online payment processing and webhooks | Provider API credentials plus webhook signature secret |
| Email provider        | Transactional email delivery           | Provider API key or SMTP credentials                   |
| FCM                   | Mobile push notifications              | Service account credentials                            |

## Boundaries & Invariants

- Clients are never authoritative for prices, totals, discounts, payment state, permissions, or stock.
- Controllers may validate and map transport data only; business rules live in application/domain layers.
- Order placement, stock reservation, coupon usage, payment transition, and refund accounting must be transaction-safe and idempotent.
- Fulfillment and return state must be derived from shipment and received-return records rather than manually patched onto orders.
- Product flexibility must support categories such as fashion and perfumes through configuration and attributes, not schema rewrites.
- Public APIs must never expose draft, secret, supplier-only, or internal audit fields.
- Search and cache may be eventually consistent; checkout and payment paths must consult authoritative transactional state.

## Security Model

- Auth: JWT access tokens plus rotating refresh-token sessions, with separate customer/admin flows as needed
- Authorization: deny-by-default RBAC and object-level policy checks
- Secrets: validated environment configuration, no secrets in code or logs, centralized redaction
- Input validation: global validation pipeline with whitelist and forbidden unknown fields, plus provider webhook signature verification at ingress
