# Dashboard Design System Plan

## Design Intent

Create a customizable dashboard system that feels premium, calm, and operationally powerful. The design should avoid generic SaaS patterns and instead feel like a carefully designed commerce studio.

## Proposed Aesthetic Direction

Name: **Commerce Command Studio**

Characteristics:

- Warm editorial surfaces instead of sterile gray dashboards.
- Dense, readable operational layouts with disciplined spacing.
- Strong typography and clear hierarchy instead of oversized icon cards.
- Muted material-inspired accents: clay, moss, brass, deep blue, ink.
- Subtle structured backgrounds, such as paper grain, ruled sections, or soft panels.
- Motion used for state change and flow, not decoration.

## Customization Model

- Theme presets: default studio, luxury dark, bright retail, high-contrast operations.
- Brand tokens: logo, primary accent, secondary accent, success/warning/danger/info, surface tint, radius scale.
- Density modes: comfortable, compact, command.
- Navigation preferences: pinned modules, collapsed groups, saved views.
- Locale preferences: language, date/time format, currency display, RTL readiness.
- Data preferences: saved filters, table columns, sort order, export defaults.

## Token Categories

- Color: background, surface, elevated, border, text, muted text, accent, success, warning, danger, info.
- Typography: display, heading, body, tabular numeric, label, caption.
- Spacing: page gutters, section rhythm, table density, form rhythm, drawer spacing.
- Radius: none/small/medium/large based on brand personality.
- Shadow/elevation: minimal and functional, not decorative.
- Motion: duration, easing, stagger, reduced-motion fallback.
- Data visualization: categorical palette, sequential palette, negative/positive deltas.

## Typography Direction

Avoid default stacks such as Inter, Roboto, Arial, and generic system UI as the primary visual identity.

Planning candidates:

- Editorial/refined: Fraunces or Newsreader for display, Source Sans 3 or IBM Plex Sans for body.
- Modern retail: Sora or Space Grotesk for headings, Noto Sans for body.
- Arabic/RTL-ready: Noto Kufi Arabic or IBM Plex Sans Arabic paired with a Latin family that has similar rhythm.

Final font selection must wait for brand context and licensing constraints.

## Layout System

- Desktop shell: left navigation rail, top command/search bar, persistent context area, main content canvas.
- Tablet shell: collapsible rail with action bar and condensed filters.
- Mobile triage shell: bottom navigation for urgent modules, simplified queues, no critical action hidden.
- Content rhythm: use asymmetric sections, grouped controls, and large table canvases rather than uniform cards.
- Data-heavy screens: table first, filters and actions close to the data, detail drawer for fast inspection.

## Component Inventory

- App shell and navigation rail.
- Command palette/search.
- RBAC-aware nav item and action button.
- Data table with columns, filters, sorting, pagination/cursors, bulk actions, saved views.
- Detail drawer and split-pane editor.
- Timeline/activity feed.
- Status badge system.
- Metric strip and KPI cards.
- Chart primitives.
- Form field system.
- Media upload/attachment panel.
- Confirmation and reason-capture dialog.
- Toast/notification center.
- Empty/loading/error/forbidden states.
- Audit event viewer.
- Export job tracker.

## Accessibility Rules

- WCAG 2.2 AA minimum.
- All actions keyboard reachable.
- Visible focus rings that match the brand but remain high contrast.
- Data tables must expose semantic headers and row context.
- Drawer/dialog focus management must be tested.
- Motion must respect reduced-motion preferences.
- Color cannot be the only indicator of state.
- Touch targets should be at least 44px where touch is expected.

## Design QA Checklist

- No generic purple/blue gradient SaaS default.
- No repeated icon-card grids where tables or queues are more useful.
- Every page has a clear primary job.
- Every form has success, validation, server-error, and dirty-state behavior.
- Every destructive action explains impact.
- Empty states teach useful next steps.
- Permission-denied states explain what access is needed.
