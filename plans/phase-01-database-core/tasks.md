# Phase 01 Tasks

- [x] Finalize Prisma schema conventions for IDs, timestamps, soft-delete/archive patterns, and relational integrity.
- [x] Create base shared models for identity, authorization, audit, idempotency, outbox, and store settings.
- [!] Generate and apply the initial MySQL migration on a clean database - blocked: Docker/MySQL is unavailable in the local environment; SQL migration artifact was generated at `prisma/migrations/20260525_01_core_init/migration.sql` but not applied locally.
- [x] Implement seed scripts for roles, permissions, and development bootstrap users.
- [x] Bootstrap Redis and BullMQ modules plus a basic worker process.
- [x] Add repository and transaction helper abstractions for later modules.
- [x] Automate CI-backed MySQL/Redis integration verification so phase-01 closeout is environment-repeatable.
- [!] Write integration tests covering migration, seeds, unique constraints, and transaction behavior - blocked: real MySQL execution is still unavailable locally without Docker/MySQL, but CI automation and the seeded-state spec are now in place.
- [x] Update docs and ADRs if persistence design changes during implementation.
