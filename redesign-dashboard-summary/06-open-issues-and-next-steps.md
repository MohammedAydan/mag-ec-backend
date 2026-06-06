# Open Issues And Next Steps

## Still open

### 1. Large frontend chunk warning

Status:

- known
- non-blocking
- not solved by the redesign

Likely direction:

- route-level code splitting
- lazy loading heavier pages
- splitting shared dashboard modules if appropriate

### 2. No browser-backed visual QA yet

Status:

- build and lint evidence exists
- no automated or human browser review was recorded in the redesign session

Likely direction:

- open the dashboard in browser
- check light, dark, and system theme switching
- check drawer forms on the converted pages
- verify mobile and narrow-width behavior

### 3. Shared form renderer may not fit every future workflow

Status:

- current renderer covers the existing complexity well
- future deeply bespoke workflows may still need page-specific editors

Likely direction:

- reuse the schema-driven drawer by default
- only break out page-specific UI when the schema model becomes awkward

## Known repo-level caution

The worktree is broadly dirty outside this redesign scope. If another agent creates commits or further changes, they must avoid mixing unrelated repo changes into dashboard follow-up work.

## Recommended next tasks for another agent

1. Run browser QA on the dashboard shell and converted forms.
2. Improve code splitting to reduce the current Vite chunk warning.
3. Check whether any remaining operational pages need deeper UX refinement beyond the shared drawer conversion.
4. If required, add focused tests around shared action-form behaviors.
