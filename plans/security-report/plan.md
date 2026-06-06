# Security Report Plan

## Goal

Produce a source-grounded security report for the backend project with prioritized findings, evidence, and practical remediation guidance.

## Acceptance Criteria

- Report covers authentication/session security, authorization/RBAC, input validation, API exposure, webhook/payment security, persistence/Prisma usage, secrets/configuration, dependency/tooling risk, operational hardening, logging/audit/privacy, and generated contract exposure.
- Each finding includes severity, affected files or surfaces, evidence, impact, and recommended fix.
- Report separates confirmed findings from residual risks and environment-blocked checks.
- The audit uses parallel subagents for independent review tracks and consolidates their outputs into one authoritative report.
- The report is saved as a repo artifact under `docs/security/`.

## Approach

1. Inventory the application modules, security docs, runtime configuration, package scripts, and existing tests.
2. Launch parallel subagents against disjoint review tracks.
3. Locally inspect high-risk cross-cutting surfaces and collect verification evidence.
4. Consolidate subagent results, de-duplicate issues, assign severity, and write the final report.
5. Run lightweight validation for the report and append session closeout artifacts.

## Scope

In scope:

- `apps/api/src/**`
- `apps/worker/src/**`
- `prisma/**`
- `scripts/**`
- `.github/workflows/**`
- `docs/security/**`
- `packages/contracts/openapi/openapi.json`
- Root package/tooling configuration.

Out of scope:

- Live external penetration testing.
- Destructive security tests, fuzzing against production, or real provider webhook/payment calls.
- Broad code fixes unless a trivial documentation/report issue blocks completion.
- Frontend/dashboard UI security review beyond static serving/API exposure notes.

## Dependencies

- Local source tree and generated OpenAPI contract.
- Existing test and script inventory.
- Subagent analysis outputs.

## Estimated Complexity

L
