# Monitoring and Incident Response

## Minimum Release Signals

- API process boot failures
- Readiness probe failures
- Database connectivity failures
- Redis connectivity failures
- Payment webhook verification failures
- Queue job failure spikes for notification dispatch and report export
- Unexpected growth in 5xx responses

## Logging Baseline

- Structured request logging is enabled through `nestjs-pino`.
- Sensitive headers and credential-bearing request fields are redacted before logging.
- `x-request-id` is propagated so production incidents can be correlated across API logs and user reports.

## Alerting Guidance

- Page on sustained readiness failures or complete API unavailability.
- Page on repeated payment-webhook verification failures in production.
- Ticket on elevated report-export failures or notification-dispatch failures unless they affect transactional customer messaging.
- Ticket on throttle saturation if legitimate traffic is being rejected.

## Triage Flow

1. Confirm whether liveness is healthy and readiness is failing, or both are failing.
2. Check the most recent deploy, migration, and environment-variable changes.
3. Review structured logs by `x-request-id`, route, and status code.
4. If payment flows are involved, verify provider webhook delivery status before trusting any client-reported success.
5. If queue-backed work is involved, inspect Redis availability and the corresponding BullMQ worker logs.

## Post-Incident Minimums

- Capture incident start and end times in UTC.
- Record affected endpoints or jobs, customer impact, root cause, mitigation, and rollback state.
- Add a follow-up hardening item if the issue exposed a missing monitor, alert, or runbook step.
