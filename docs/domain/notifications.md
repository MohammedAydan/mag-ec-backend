# Notifications

## Scope

- Notifications are persisted first, then dispatched asynchronously through BullMQ workers.
- The initial phase uses console-stub adapters rather than a real email or push provider.

## Delivery Model

- `Notification` records are deduplicated by `deduplicationKey`.
- Queue jobs operate on persisted notification IDs so retries do not require rebuilding the payload from scratch.
- Customer preferences are stored in `NotificationPreference` per user and channel.

## Operational Notes

- Admin users can browse notification records through the API for support or delivery debugging.
- Delivery infrastructure is provider-agnostic and can be replaced behind the existing ports later.
