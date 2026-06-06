# Goal
Create a concise bilingual project intake form in the portfolio system that captures the essential project brief without overwhelming clients.

## Acceptance Criteria
- The form is usable in both English and Arabic through bilingual labels, placeholders, and success messaging.
- The form captures the minimum fields needed to estimate scope, budget, and timeline.
- The form stays short enough to reduce drop-off while still collecting contact and project details.
- The form is saved in the portfolio system and can be listed afterwards.

## Approach
- Start from an empty draft so the field list stays intentionally small.
- Use paired English/Arabic labels for every field and message instead of separate localized versions to keep the experience simple.
- Favor a small set of high-signal fields: contact identity, project summary, main requirements, budget, timeline, and extra notes.
- Keep helper text brief and specific so clients know what to enter quickly.

## Scope
### In
- Create a new bilingual project intake form.
- Keep the form short and client-friendly.
- Save the form through the portfolio-mcp API.

### Out
- No workflow automation after submission.
- No multi-step wizard.
- No separate English-only or Arabic-only version.

## Decisions
- Use a public form so potential clients can access it easily.
- Use a small field count to avoid fatigue.
- Use bilingual labels in one form rather than language switching logic.

## Complexity
S