Continue `D:\Projects\NodeJS-Projects\e-commerce-api` from the saved phase-06 state.

Before doing anything, follow `AGENTS.md` exactly:

1. Read `plans/context.md`
2. Read `plans/SESSION_LOG.md`
3. Read `plans/chat-context-20260525-173406.md`
4. Read `plans/phase-06-inventory-reservations/`
5. Report a short session-resume summary

Scope:

- Stay strictly inside `phase-06-inventory-reservations`
- Do not start phase 07
- Do not touch the unrelated untracked `.antigravitycli/` directory or `GEMINI.md`

Primary goal:

- Implement the inventory and reservations slice only

Required next actions:

- Review the phase-06 plan, tasks, and context files
- Design the inventory, stock movement, and reservation data model before coding
- Keep promotion-usage and pricing integration assumptions aligned with phases 04 and 05
- Close phase 06 with verification and plan updates before moving the active feature

Known current state:

- Latest commits:
  - `8e1dc4f` `feat(api): add identity and catalog foundations`
  - `<new commit created in this handoff>`
  - `3803e23` `docs(handoff): save next-session resume context`
- Verified commands already passing for the current uncommitted work before handoff:
  - `pnpm.cmd prisma:generate`
  - `pnpm.cmd prisma:validate`
  - `pnpm.cmd lint`
  - `pnpm.cmd typecheck`
  - `pnpm.cmd test`
  - `pnpm.cmd test:e2e`
  - `pnpm.cmd test:integration`
  - `pnpm.cmd build`
  - `pnpm.cmd openapi:generate`

Known caveats:

- `pnpm.cmd openapi:check` intentionally fails until the generated OpenAPI diff for the uncommitted phase-04 and phase-05 endpoints is committed
- MySQL-gated integration still skips locally unless `RUN_MYSQL_INTEGRATION=true` and a reachable MySQL runtime is available
