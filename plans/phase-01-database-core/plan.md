# Phase 01: Database Core

## Goal

Establish the authoritative persistence and infrastructure baseline with Prisma/MySQL, core platform tables, migrations, seeds, Redis/BullMQ bootstrap, and transaction-safe repository conventions.

## Acceptance Criteria

- Prisma is configured for MySQL with validated schema, generated client, and initial migrations.
- Base models exist for users, refresh sessions, roles, permissions, audit logs, idempotency keys, outbox events, and store settings.
- Seed flow creates initial security primitives and a development admin safely.
- Redis/BullMQ connectivity and worker health scaffolding are operational.
- Repository and transaction helper patterns are documented and covered by integration tests against real MySQL.

## Approach

Build shared persistence concerns before feature modules so later phases can reuse tested transaction and queue primitives. Favor portability rules in schema design from the beginning.

## Scope

### In Scope

- Prisma schema and migrations
- Core shared database models
- Seed architecture
- Redis/BullMQ bootstrap
- Transaction helpers and repository conventions
- Persistence integration tests

### Out of Scope

- Customer-facing business flows
- Advanced search infrastructure
- Payment providers

## Dependencies

- `phase-00-foundation`
- Confirmed decisions on ID strategy, money representation, and migration rules

## Estimated Complexity

L
