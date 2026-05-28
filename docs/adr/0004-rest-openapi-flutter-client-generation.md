# ADR-0004: REST and OpenAPI-Generated Flutter Clients

- Date: 2026-05-25
- Status: Accepted

## Context

The backend serves Flutter storefront and admin clients, and manually duplicated contracts are a long-term maintenance risk.

## Decision

Expose a versioned REST API under `/api/v1`, generate OpenAPI artifacts from the backend, and treat those artifacts as the source contract for Flutter client generation.

## Consequences

- Schema and DTO changes must remain intentional
- CI can validate contract generation
- Breaking API changes become easier to detect and communicate
