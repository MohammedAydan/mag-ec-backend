# Goal
Rebuild the admin dashboard from scratch using exclusively HeroUI v3 components (`@heroui/react`), dropping all custom CSS modules and hand-rolled UI wrappers. The result must be a production-grade SPA with proper section organization, form layouts, and hardened security.

# Acceptance Criteria
- Zero custom `.module.css` files (only `index.css` for global resets/HeroUI theme vars)
- Zero hand-rolled UI components in `components/ui/` (sections, forms, tables, dialogs all powered by HeroUI)
- All existing pages/routes preserved with HeroUI-native layouts
- Auth layer (`lib/auth.tsx`, `lib/http.ts`) preserved and hardened
- `pnpm typecheck`, `pnpm lint`, and `pnpm build` pass clean
- Security: CSRF-aware, no token leakage in errors, proper session management, CSP-compatible markup

# Approach
1. Preserve the proven `lib/` layer (auth, http, query-client, format, admin-actions) with targeted security hardening
2. Delete all `components/` (shell + ui) and CSS modules
3. Build a HeroUI-native Shell with a responsive sidebar nav using HeroUI primitives (Button, ListBox, Card, Separator, Avatar, Chip)
4. Migrate every page to HeroUI: Card, Table, Button, Chip, Modal, Form, Input, Select, TextArea, NumberField, Switch, Checkbox, Badge, Spinner, EmptyState, Pagination, Tabs, Accordion, Breadcrumbs, Dropdown
5. Use HeroUI's built-in Table component with proper column configs instead of raw `<table>` elements
6. Use HeroUI Form + Input/Select/Textarea instead of raw form elements
7. Use HeroUI Modal for action dialogs instead of the custom JsonActionDialog
8. Add CSRF protection to the HTTP layer
9. Hardening: remove verbose error detail leakage, add input trimming, enforce strict validation feedback

# Scope: IN
- Full replacement of all components/pages with HeroUI-native implementations
- Security hardening of auth/http layer
- All 17 admin routes: login, home, orders, order-detail, catalog, product-detail, taxonomy, pricing, inventory, payments, fulfillment, reviews, notifications, staff, reports, content, system
- Layout shell with collapsible sidebar, top bar, breadcrumbs
- Responsive behavior (mobile-friendly sidebar overlay)

# Scope: OUT
- Adding new pages or features not already present
- Changing the backend API contracts
- Adding a design system file or token system beyond what HeroUI provides
- Dark mode toggle (for now; can be added later)
- i18n/localization
- E2E testing

# Dependencies
- HeroUI v3 (`@heroui/react`) - already installed
- Tailwind CSS v4 via `@tailwindcss/vite` - already configured
- React Router v7 - already installed
- React Query v5 - already installed
- React Hook Form + Zod - already installed

# Estimated Complexity: L
