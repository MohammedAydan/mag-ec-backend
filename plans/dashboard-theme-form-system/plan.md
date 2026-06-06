# Goal
Refine the embedded admin dashboard into a HeroUI-first light/dark aware application with structured action forms, accessible dialogs, and cleaner operational page design.

## Acceptance Criteria

- The dashboard follows HeroUI v3 quick-start expectations for CSS import order, theming, and React-side theme switching.
- The app supports light, dark, and system themes with persistent selection and no broken contrast on core shell/page surfaces.
- Generic JSON action submission is replaced by structured form-driven overlays across the dashboard pages that currently use `useJsonAction`.
- Dialog and form flows use HeroUI primitives with accessible focus, validation feedback, and disabled/loading behavior.
- Mojibake and obvious UI copy corruption are removed from the dashboard.
- `pnpm.cmd --filter @atelier/admin-dashboard typecheck` passes.
- `pnpm.cmd --filter @atelier/admin-dashboard build` passes.

## Approach

1. Align the dashboard bootstrap and global CSS with HeroUI guidance for Tailwind import order, theme variables, and plain React `useTheme`.
2. Refresh the shell and core UI surfaces to support a dual-theme Commerce Command Studio aesthetic.
3. Replace `ConfirmModal` plus static payload submission with a schema-driven action form overlay that renders specific field types instead of hidden JSON payloads.
4. Migrate each `useJsonAction` page to structured field definitions, including nested/repeatable inputs where payloads currently contain arrays or object lists.
5. Sweep hidden UI bugs during migration: mojibake, validation gaps, malformed placeholders, and inconsistent feedback states.

## Scope: IN

- `apps/api/public/dashboard/**`
- Dashboard planning documents updated for the new UI system

## Scope: OUT

- Backend API contract changes
- New dashboard routes or backend features
- Bundle-splitting/performance work beyond opportunistic cleanup

## Dependencies

- HeroUI v3 official guidance for quick start, theming, dark mode, forms, and overlays
- Existing dashboard API/auth layer in `src/lib`

## Estimated Complexity

XL
