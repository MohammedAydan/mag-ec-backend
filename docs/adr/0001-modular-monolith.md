# ADR-0001: Modular Monolith Architecture

- Date: 2026-05-25
- Status: Accepted

## Context

The backend needs strong transactional consistency across commerce domains while remaining feasible to implement, test, and evolve inside a single repository.

## Decision

Use a modular monolith built on NestJS, with clear domain/application/infrastructure/presentation boundaries and a separate worker bootstrap in the same workspace.

## Consequences

- Stronger consistency and lower operational overhead during the initial release
- Easier phased delivery and testing
- Requires discipline to keep module boundaries explicit as the codebase grows
