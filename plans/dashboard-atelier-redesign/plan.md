# Dashboard Atelier Redesign

## Goal
Redesign the entire admin dashboard SPA using the new "Atelier" dark editorial design language from `new-design-only/`, replacing HeroUI with pure Tailwind CSS v4 while preserving all 16 existing pages and their backend API integrations.

## Acceptance Criteria
- [ ] All HeroUI dependencies removed; replaced with pure Tailwind CSS + motion/react
- [ ] New design language applied exactly: `#050505` background, `#0f0f0f` surfaces, `amber-500` accent, Playfair Display serif headings, JetBrains Mono code, Inter body
- [ ] Sidebar reorganized into cleaner sections with brand header matching the new design
- [ ] TopBar redesigned to match the new design header style
- [ ] All 16 existing pages redesigned with the new aesthetic
- [ ] Missing elements from new design added: toast notifications, maintenance mode banner, SVG charts, drawer-based forms
- [ ] Overlapping concerns split: Payments/Refunds separated, Orders/Fulfillment cleanly divided
- [ ] Build succeeds (`pnpm build` in dashboard package)
- [ ] Typecheck passes (`tsc --noEmit`)
- [ ] Existing auth, http, and routing infrastructure preserved

## Approach
1. Replace `index.css` with new design's CSS + design tokens
2. Rebuild `ShellLayout.tsx`, `Sidebar.tsx`, `TopBar.tsx` following new design patterns
3. Rebuild all shared UI components (`PageShell`, `DataTable`, `StatCard`, `Feedback`, etc.) without HeroUI
4. Redesign all 16 page components with the new design language
5. Add `motion/react` for animations, add toast system, maintenance banner
6. Reorganize sidebar sections: split "Engage & finance" into "Payments" and "Engagement", split "Govern" into "Staff" and "System"
7. Remove HeroUI from `package.json`, add `motion` dependency

## Scope
**IN:**
- Full CSS replacement with design tokens
- Shell layout rebuild (Sidebar, TopBar, Layout)
- All 16 page components redesigned
- All shared UI components rebuilt
- Toast notification system
- Maintenance mode banner
- Drawer-based forms for quick actions
- Sidebar reorganization
- motion/react animations

**OUT:**
- Changes to backend API endpoints
- Changes to auth/http infrastructure
- New backend features
- Flutter client changes

## Dependencies
- None (standalone frontend redesign)

## Estimated Complexity: XL
