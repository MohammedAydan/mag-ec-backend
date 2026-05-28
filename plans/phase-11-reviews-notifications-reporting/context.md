# Phase 11 Context

## Files to Create / Modify

- `prisma/schema.prisma` — Add Review, ReviewModerationAction, Notification, NotificationPreference, ContentPage models
- `prisma/migrations/20260525_11_reviews_notifications_reporting/migration.sql` — Incremental migration artifact
- `prisma/seed.ts` — Add review and notification preference seed data
- `apps/api/src/modules/reviews/**` — Reviews module (controllers, services, DTOs)
- `apps/api/src/modules/notifications/**` — Notifications module (ports, adapters, preferences, jobs)
- `apps/api/src/modules/reporting/**` — Reporting module (controllers, services, DTOs)
- `apps/api/src/modules/audit/**` — Audit admin views module (controller, service, DTOs)
- `apps/api/src/modules/content/**` — Content/legal settings module (controller, service, DTOs)
- `apps/api/src/app.module.ts` — Wire new modules
- `apps/worker/src/processors/**` — Notification dispatch processor, report export processor
- `docs/domain/reviews-moderation.md` — Reviews domain documentation
- `docs/domain/notifications.md` — Notifications domain documentation
- `docs/domain/reporting.md` — Reporting domain documentation
- `docs/implementation-status.md` — Update status
- `docs/security/control-matrix.md` — Update with new endpoints

## New Dependencies to Add

- No new external SDK dependencies for v1 — email/push adapters will be console/log-based stubs until provider credentials are finalized

## Env Vars Needed

- `EMAIL_PROVIDER` — already in .env.example, stub adapter used when empty
- `EMAIL_FROM` — already in .env.example
- `EMAIL_API_KEY` — already in .env.example
- `FCM_PROJECT_ID`, `FCM_CLIENT_EMAIL`, `FCM_PRIVATE_KEY` — already in .env.example, stub adapter used when empty

## Open Questions (Resolved)

- Email provider for v1: Use a ConsoleEmailSender stub adapter that logs notifications. Real provider (Resend/SES) can be swapped in later via the EmailSender port.
- Report exports: Start with CSV-only exports through async BullMQ jobs. XLSX/PDF can be added later without changing the job structure.

## Status Update (2026-05-26)

- Prisma schema for phase-11 models is present and validated, with a scaffolded incremental migration under `prisma/migrations/20260526_11_reviews_notifications_reporting/`.
- `apps/api` modules for Reviews, Notifications, Reporting, Audit, and Content are implemented and wired into `AppModule`.
- Reporting exports now run through the `report-export` worker processor, generate concrete CSV payloads for the supported report types, and persist `resultObjectKey`, `completedAt`, and failure state.
- Audit browsing now redacts sensitive JSON keys case-insensitively before serializing admin responses.
- Content/legal settings now expose admin and public legal-reference APIs backed by `StoreSetting`, and public content page reads only resolve published pages.
- `prisma/seed.ts` now includes the phase-11 permissions needed by seeded `super_admin` users.
- Verification completed locally with `pnpm.cmd lint`, `pnpm.cmd typecheck`, `pnpm.cmd test`, `pnpm.cmd build`, and `pnpm.cmd openapi:generate`.

## Remaining Environment-Dependent Work

- Regenerate or validate the phase-11 migration SQL with a real MySQL-backed `prisma migrate dev --create-only` run if an exact runtime-produced artifact is required.
- Run `pnpm.cmd prisma:seed`, MySQL-backed integration suites, and any Redis-backed worker smoke checks on a machine with local Docker/MySQL/Redis available.
