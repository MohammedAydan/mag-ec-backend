# Feature: OpenAPI Generator Command Hardening

## Goal
Make the OpenAPI TypeScript and Flutter client generation commands run reliably in this workspace without depending on the user-global npm cache.

## Acceptance Criteria
- `pnpm.cmd typescript:client:generate` no longer fails because `npx` tries to use `C:\Users\moham\AppData\Local\npm-cache`.
- The same isolation strategy is applied to the Flutter generator wrapper so both client generators behave consistently.
- The generators still validate the OpenAPI contract and produce the same output paths and manifests as before.
- The changed generator command(s) are rerun successfully after the fix.

## Approach
1. Inspect the generator runner implementation and isolate the `npx` cache/config inside a temp directory under agent control.
2. Apply the same execution hardening to both TypeScript and Flutter generator wrappers.
3. Rerun the failing generation command and, if needed, the parallel Flutter command to verify the fix.

## Scope: IN
- `packages/contracts/openapi/generate-typescript-client.ts`
- `packages/contracts/openapi/generate-flutter-client.ts`
- Minimal planning and session-log updates for this follow-up fix

## Scope: OUT
- Broader OpenAPI schema audits
- Unrelated dashboard or backend endpoint work

## Dependencies
- Existing OpenAPI generator scripts and pinned `@openapitools/openapi-generator-cli` wrapper usage

## Estimated Complexity
S
