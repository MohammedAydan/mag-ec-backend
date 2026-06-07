# Context: Vercel Invalid Functions Config Fix

## Files to Create / Modify
- `apps/api/vercel.json` - remove unsupported `functions` block
- `apps/api/package.json` - run post-build Vercel prune script
- `apps/api/scripts/prune-vercel-dashboard-source.mjs` - Vercel-only cleanup of nested dashboard source
- `docs/operations/execution-modes-and-serverless.md` - correct Vercel packaging guidance
- `plans/DECISIONS.md` - update ADR-019 consequence/decision details
- `plans/PATTERNS.md` - update embedded SPA source/built asset boundary pattern
- `plans/vercel-invalid-functions-config-fix/review.md` - outcome and verification
- `plans/context.md` - active feature/status update
- `plans/SESSION_LOG.md` - append handoff entry

## Source Inputs
- User-provided Vercel log from 2026-06-07 07:57 UTC
- `apps/api/vercel.json`
- `apps/api/package.json`
- Existing dashboard build output path `apps/api/public/admin`

## New Dependencies
- None

## Env Vars Needed
- `VERCEL=1` is provided by Vercel during platform builds and gates the prune script.

## Open Questions
- None. Vercel rejected the `functions` entry before the build began, so that config must be removed.
