# Next Agent Prompt

Use this as the starting prompt for another AI agent:

```text
You are continuing dashboard work in:

D:\Projects\NodeJS-Projects\e-commerce-api-d

Start with these files in order:

1. plans/context.md
2. plans/SESSION_LOG.md
3. plans/dashboard-theme-form-system/review.md
4. redesign-dashboard-summary/README.md
5. redesign-dashboard-summary/03-heroui-research.md
6. redesign-dashboard-summary/04-dashboard-file-map.md
7. redesign-dashboard-summary/06-open-issues-and-next-steps.md

Important context:

- The embedded admin dashboard lives in apps/api/public/dashboard and builds to /admin.
- The dashboard redesign is already implemented and verified by lint, typecheck, dashboard build, and workspace build.
- HeroUI quick-start, theming, components, and dark-mode guidance were already applied.
- The main shared redesign primitive is apps/api/public/dashboard/src/components/ui/ConfirmModal.tsx, which is now a schema-driven Drawer form system.
- The shared action typing/execution layer is apps/api/public/dashboard/src/lib/admin-actions.tsx.
- Light, dark, and system theme switching is already implemented with HeroUI useTheme.
- Remaining non-blocking follow-up is the large Vite chunk warning and browser-backed visual QA.
- The repo worktree is dirty beyond dashboard scope. Do not touch unrelated files unless explicitly required.

When you start:

- summarize the current dashboard redesign state from the files above,
- state exactly what you plan to change,
- keep any further work scoped to the dashboard unless you find a real integration blocker.
```
