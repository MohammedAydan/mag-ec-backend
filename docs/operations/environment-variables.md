# Environment Variables

## Core Runtime

- `NODE_ENV`
- `PORT`
- `API_PREFIX`
- `APP_PUBLIC_URL`
- `ADMIN_ALLOWED_ORIGINS`
- `STORE_ALLOWED_ORIGINS`
- `LOG_LEVEL`
- `OPENAPI_ENABLED`

## Infrastructure

- `DATABASE_URL`
- `REDIS_URL`
- `THROTTLE_TTL_MS`
- `THROTTLE_LIMIT`
- `S3_ENDPOINT`
- `S3_REGION`
- `S3_BUCKET_PUBLIC`
- `S3_BUCKET_PRIVATE`
- `S3_ACCESS_KEY_ID`
- `S3_SECRET_ACCESS_KEY`
- `S3_PUBLIC_BASE_URL`

## Authentication Placeholders

- `JWT_ACCESS_SECRET`
- `JWT_ACCESS_EXPIRES_IN`
- `JWT_REFRESH_SECRET`
- `JWT_REFRESH_EXPIRES_IN`

## Integration Placeholders

- `PAYMENT_PROVIDER`
- `PAYMENT_WEBHOOK_SECRET`
- `STRIPE_SECRET_KEY`
- `EMAIL_PROVIDER`
- `EMAIL_FROM`
- `EMAIL_API_KEY`
- `FCM_PROJECT_ID`
- `FCM_CLIENT_EMAIL`
- `FCM_PRIVATE_KEY`
- `SENTRY_DSN`

## Notes

- `.env.example` contains the current local-development defaults and placeholders.
- `DATABASE_URL` and `REDIS_URL` default to local development values in phase 00 to keep local bootstrap and contract generation self-contained.
- `THROTTLE_TTL_MS` and `THROTTLE_LIMIT` tune the global abuse-protection baseline without code changes.
- `PAYMENT_PROVIDER=stripe` requires both `STRIPE_SECRET_KEY` and `PAYMENT_WEBHOOK_SECRET`.
- Production deployments should override every secret-bearing value explicitly.

## Execution and integrated dashboard

| Variable                 | Required               | Description                                                                    |
| ------------------------ | ---------------------- | ------------------------------------------------------------------------------ |
| `EXECUTION_MODE`         | Yes                    | `direct` (default; no worker/Redis) or `queue` (Redis + worker).               |
| `MAINTENANCE_SECRET`     | Production direct mode | Private bearer secret for manual maintenance; use 32+ random characters.       |
| `CRON_SECRET`            | Vercel direct mode     | Bearer secret Vercel sends automatically to the protected cron route.          |
| `MAINTENANCE_BATCH_SIZE` | No                     | Maximum expired reservations/outbox items claimed per direct maintenance pass. |
| `DASHBOARD_ENABLED`      | No                     | Serves the embedded administrator SPA at `/admin` when `true`.                 |
