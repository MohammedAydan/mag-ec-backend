# Staging and Release Runbook

## Staging Validation Sequence

1. Provision staging environment variables from `docs/operations/environment-variables.md`.
2. **Verify DATABASE_URL and REDIS_URL are set explicitly** — the app fail-closed behavior requires these in staging; localhost defaults are only available in dev/test.
3. Deploy the API and worker from the candidate commit.
4. Run `pnpm prisma:migrate:deploy`.
5. **Seed only if staging fixtures are needed** (e.g., for integration or partner testing). Set `SEED_ALLOW_PRODUCTION=true` to bypass the seed environment guard, and provide explicit `DEV_SEED_ADMIN_EMAIL` / `DEV_SEED_ADMIN_PASSWORD`. The seed will NOT overwrite an existing admin password.
6. Verify `/api/v1/health/liveness` and `/api/v1/health/readiness`.
7. Run `pnpm openapi:verify`.
8. Run `pnpm flutter:client:verify`.
9. Execute the production smoke-test plan before approving release.

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
