# ADR-0002: MySQL Now, PostgreSQL Later

- Date: 2026-05-25
- Status: Accepted

## Context

The initial production requirement is MySQL 8.4 LTS, but the product brief requires a viable future PostgreSQL migration path.

## Decision

Use MySQL with Prisma for the initial release and enforce portability-oriented domain and schema rules, including application-generated identifiers and minor-unit money storage.

## Consequences

- Meets the immediate production database requirement
- Preserves a cleaner future migration path
- Constrains database-specific shortcuts in the early phases
