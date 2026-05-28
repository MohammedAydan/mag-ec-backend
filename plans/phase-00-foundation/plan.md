# Phase 00: Foundation

## Goal

Bootstrap the repository into a production-grade NestJS/Fastify backend foundation with strict tooling, validated configuration, health checks, structured logging, a stable error contract, OpenAPI generation, and CI scaffolding.

## Acceptance Criteria

- A NestJS API application exists with Fastify bootstrap and versioned `/api/v1` routing.
- TypeScript strictness, linting, formatting, test scaffolding, and build scripts are configured and runnable.
- `.env.example` and startup configuration validation cover all required core variables.
- Health endpoints, request correlation, structured logging, and global error handling are wired in.
- OpenAPI generation is implemented and produces a committed contract artifact or reproducible output target.
- Docker local infrastructure for MySQL, Redis, and optional storage is defined.
- CI baseline covers install, lint, typecheck, tests, Prisma validation/generation, OpenAPI generation, and build.
- Initial ADR and implementation-status documentation are created and aligned with the repo state.

## Approach

Establish the workspace and runtime skeleton first, then add cross-cutting operational concerns before documenting the baseline. Keep the app thin in business scope: only infrastructure and platform primitives needed for later phases should be introduced now.

## Scope

### In Scope

- Workspace/package bootstrap
- API application scaffold
- Fastify adapter integration
- Shared config, validation, logging, request IDs, health, error contract
- Docker compose and environment examples
- OpenAPI generation path
- CI baseline
- Foundation documentation and ADR materialization

### Out of Scope

- Business modules beyond minimal placeholders required for bootstrap
- Authentication flows
- Prisma business models beyond what is necessary to validate the base setup
- Catalog, cart, order, or payment endpoints

## Dependencies

- Root `plan.md` implementation contract
- User approval later if package installation or other external-side-effect commands require it

## Estimated Complexity

L
