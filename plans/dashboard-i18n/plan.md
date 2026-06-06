# Plan: Dashboard Internationalization (i18n)

## Goal
Full bilingual support (Arabic + English) across the entire admin dashboard with extensible architecture for adding more languages.

## Acceptance Criteria
- [ ] Every visible string in the dashboard (labels, buttons, headers, placeholders, descriptions, errors) is translatable
- [ ] Arabic RTL layout renders correctly (dir="rtl", logical CSS properties)
- [ ] Language switcher in sidebar/footer persists preference to localStorage
- [ ] Default language follows browser preference with fallback to English
- [ ] Adding a new language requires ONLY: creating a new JSON file + adding one entry to a config array
- [ ] Build passes with zero TS errors
- [ ] No English strings remain hardcoded in JSX

## Approach
1. **Lightweight custom i18n** via React Context + JSON translation files (no external deps)
   - `src/lib/i18n.tsx` — `TranslationProvider`, `useT()` hook, `Locale` type
   - `src/locales/en.json` — English strings
   - `src/locales/ar.json` — Arabic strings
2. **Key naming**: flat keys grouped by page/component prefix, e.g. `catalog.title`, `catalog.createProduct`, `common.save`, `common.cancel`
3. **RTL**: `dir` attribute on `<html>` toggled by locale, Tailwind logical properties handle the rest
4. **Language switcher**: dropdown in Sidebar footer

## Scope: IN
- All dashboard pages (14+), shared components (ConfirmModal, DataTable, Feedback, PageShell, Sidebar, ErrorBoundary)
- Form labels, placeholders, descriptions, validation errors
- Table headers, empty states, loading states
- Navigation, breadcrumbs, action buttons
- RTL layout

## Scope: OUT
- Backend API i18n (error messages from NestJS — separate concern)
- Flutter client i18n
- Date/time locale formatting (could be follow-up)
- Number formatting (could be follow-up)

## Architecture
```
src/
├── lib/i18n.tsx          ← TranslationProvider + useT hook + types
├── locales/
│   ├── en.json           ← English translations
│   └── ar.json           ← Arabic translations
└── locales/types.ts      ← Type-safe key union (generated from en.json)
```

## Estimated Complexity: L (touches every file)
