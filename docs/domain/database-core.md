# Database Core

## Initial Shared Tables

- `User`
- `Role`
- `Permission`
- `UserRole`
- `RolePermission`
- `RefreshSession`
- `AuditLog`
- `IdempotencyKey`
- `OutboxEvent`
- `StoreSetting`

## Conventions

- IDs use application-generated `cuid()` values.
- Timestamps use `createdAt` and `updatedAt`, with optional `deletedAt` or `archivedAt` only where lifecycle needs it.
- Access-control joins use composite primary keys.
- Mutable operational records use explicit status enums and indexed expiry or availability timestamps.

## Seed Baseline

- Seed command provisions system permissions, a `super_admin` role, a development admin user, and initial store settings.
- Development admin credentials come from `DEV_SEED_ADMIN_EMAIL` and `DEV_SEED_ADMIN_PASSWORD`.
