# ADR-0003: Money Stored in Minor Units

- Date: 2026-05-25
- Status: Accepted

## Context

Commerce totals, discounts, refunds, and snapshots cannot rely on floating-point arithmetic safely.

## Decision

Represent money as integer minor units plus ISO currency code throughout the backend.

## Consequences

- Arithmetic stays deterministic and portable
- Currency-aware formatting remains a client or presentation concern
- Pricing services must centralize rounding and conversion rules
