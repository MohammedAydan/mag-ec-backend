# Execution Modes and Serverless Deployment

The backend supports two execution modes from the same NestJS application. The REST API contract and the integrated administrator dashboard are identical in both modes.

## Direct mode — default

Use `EXECUTION_MODE=direct` when the deployment should run without Redis, a dedicated worker process, or BullMQ jobs. This is the appropriate mode for compact deployments and serverless platforms such as Vercel.

```env
EXECUTION_MODE=direct
DASHBOARD_ENABLED=true
MAINTENANCE_SECRET=<random-secret-at-least-32-characters>
CRON_SECRET=<same-or-another-random-secret>
```

Build and run only the API plus its embedded dashboard in direct mode:

```bash
pnpm build:direct
# Set EXECUTION_MODE=direct in .env, then:
pnpm --filter @ecommerce/api dev
```

In direct mode:

- Notifications are delivered by the API service after their durable notification record has been created.
- Report exports are generated during the authenticated API request and stored using the configured private object storage in production.
- Pending outbox events and expired inventory reservations are processed opportunistically around mutating API requests.
- The protected maintenance endpoint processes quiet-period expirations when no store traffic is occurring.

### Protected maintenance endpoint

```
GET  /api/v1/system/maintenance/run
POST /api/v1/system/maintenance/run
Authorization: Bearer <CRON_SECRET or MAINTENANCE_SECRET>
```

For Vercel, configure `CRON_SECRET`; Vercel Cron automatically supplies `Authorization: Bearer <CRON_SECRET>` when invoking the cron path. A representative cron configuration is:

```json
{
  "$schema": "https://openapi.vercel.sh/vercel.json",
  "crons": [{ "path": "/api/v1/system/maintenance/run", "schedule": "0 2 * * *" }]
}
```

The daily schedule above is compatible with Vercel Hobby. Direct mode additionally performs bounded maintenance around mutating requests, so incoming store activity can release expired reservations before new checkout reservations are committed. On hosting that permits frequent schedules, choose an interval aligned to reservation TTL. The maintenance route is idempotent: it atomically claims reservations and outbox records before changing them.

## Queue mode — optional scalable execution

Use `EXECUTION_MODE=queue` for deployments with a continuously available Redis instance and an independently deployed worker process.

```env
EXECUTION_MODE=queue
REDIS_URL=redis://user:password@redis-host:6379/0
QUEUE_PREFIX=ecommerce
```

Build the optional worker-capable deployment in queue mode:

```bash
pnpm build:queue
# Set EXECUTION_MODE=queue and REDIS_URL in .env, then run both:
pnpm --filter @ecommerce/api dev
pnpm --filter @ecommerce/worker dev
```

In queue mode:

- The API enqueues reservation expiry, notification delivery and report generation jobs lazily.
- `apps/worker` consumes the queues and performs background work.
- Health readiness verifies Redis connectivity because it becomes a required dependency.

## Production requirements common to both modes

- Use remote MySQL 8.4 with backups and TLS/connection management suitable for the hosting provider.
- Set `REPORT_STORAGE_MODE=s3` and configure S3-compatible object storage; local report files are development-only.
- Configure a real email provider for reset, verification and commerce notification delivery.
- Configure Stripe webhook secrets when online payment is enabled.
- Use strong JWT, maintenance and cron secrets and do not expose them to browser code.
- For serverless/direct deployments configure the platform build command as `pnpm build:direct`, so no standalone worker application is built.
- Run the release gate in `docs/operations/release-checklist.md` before deployment.

## Integrated dashboard

When `DASHBOARD_ENABLED=true`, the same API process serves the administration SPA at `/admin`. API endpoints remain under `/api/v1`, and the dashboard uses admin access tokens and permission checks already enforced by the backend.

## Legacy setting

`QUEUE_ENABLED` is retained only for compatibility with earlier environment files and does not select the API runtime anymore. Set `EXECUTION_MODE=queue` explicitly when starting the worker-based architecture.

## Vercel Hobby scheduling note

Vercel Hobby accepts cron schedules that execute only once per day. Direct mode therefore also runs a bounded maintenance pass around write requests; for higher precision reservation expiry or high-throughput dispatch, use Vercel Pro with a more frequent cron or set `EXECUTION_MODE=queue` on an environment that supports Redis and a continuously running worker.
