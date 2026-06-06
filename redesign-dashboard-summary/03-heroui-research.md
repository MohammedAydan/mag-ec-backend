# HeroUI Research

This redesign followed HeroUI's official documentation and the installed local package contract.

## Official links used

- Quick Start:
  - https://heroui.com/docs/react/getting-started/quick-start
  - key takeaway: import order matters and must be `@import "tailwindcss";` before `@import "@heroui/styles";`

- Components index:
  - https://heroui.com/en/docs/react/components
  - key takeaway: the installed component set includes `Drawer`, `Form`, `FieldError`, `TextField`, `TextArea`, `RadioGroup`, `Switch`, `Checkbox`, `Tabs`, `Input`, `Card`, `Chip`, and related primitives

- Dark mode:
  - https://heroui.com/en/docs/react/getting-started/dark-mode
  - key takeaway: for plain React apps, HeroUI recommends `useTheme`
  - key takeaway: HeroUI applies theme state through DOM class and `data-theme`
  - key takeaway: `system` is a supported theme intent in plain React

- Theming:
  - https://heroui.com/en/docs/react/getting-started/theming
  - key takeaway: HeroUI theming is CSS-variable driven and works cleanly with light and dark theme selectors

## Local package facts that were checked

Observed in local `@heroui/react`:

- `useTheme` exists and is suitable for plain React theme switching
- `Drawer` compound components are available
- `Form` and field primitives are available
- local component contracts differ from some stale code that previously used unsupported props or variants

## How the research changed implementation

### 1. CSS bootstrap

Changed global CSS to:

- import Tailwind first
- import HeroUI styles second
- keep theme tokens in the dashboard CSS layer

### 2. Theme switching

Used:

- HeroUI `useTheme('system')`
- shell-level light, dark, and system toggle

Reason:

- this matches HeroUI's documented plain React approach
- no extra theme library was needed

### 3. Dialog and form direction

Used:

- `Drawer`
- `Form`
- `FieldError`
- explicit field primitives

Reason:

- user asked for better dialogs and forms
- HeroUI already provides the needed accessible primitives
- drawers work better than generic payload confirmation for complex nested actions

### 4. Avoided unsupported stale patterns

Removed or avoided:

- raw JSON payload editors as the primary mutation UI
- prompt-based maintenance input
- stale prop assumptions from older component code

## Implementation interpretation

The research supported a practical architecture:

- keep one shared schema-driven action renderer,
- let pages describe fields instead of raw JSON payloads,
- use HeroUI theme state as the single theme source,
- keep the dashboard embedded rather than splitting it into a separate app.
