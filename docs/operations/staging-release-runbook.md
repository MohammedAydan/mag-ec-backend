# Staging and Release Runbook

## Staging Validation Sequence

1. Provision staging environment variables from `docs/operations/environment-variables.md`.
2. Deploy the API and worker from the candidate commit.
3. Run `pnpm prisma:migrate:deploy`.
4. Run `pnpm prisma:seed` only if the staging environment is meant to contain seed fixtures.
5. Verify `/api/v1/health/liveness` and `/api/v1/health/readiness`.
6. Run `pnpm openapi:verify`.
7. Run `pnpm flutter:client:verify`.
8. Execute the production smoke-test plan before approving release.

## Backup and Restore Expectations

- Take a database backup immediately before production migrations.
- Confirm restore credentials and target environment before starting the release window.
- Do not rely on seed data as a recovery mechanism for production business data.

## Rollback Guidance

- If a deploy fails before migrations run, roll back the application release to the last known-good artifact.
- If a migration is already applied, use a forward-fix strategy unless a tested rollback migration exists.
- If payment-webhook handling is affected, pause release promotion until webhook verification and duplicate protection are revalidated.

## Migration Notes

- Use `pnpm prisma:migrate:deploy` for release environments.
- Run migrations before enabling traffic from new clients that depend on the changed contract.
- Record the applied migration set and deployment timestamp in the release notes.
