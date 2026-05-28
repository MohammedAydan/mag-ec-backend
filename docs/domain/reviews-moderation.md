# Reviews and Moderation

## Scope

- Verified-purchase reviews are tied to `OrderLine` ownership and one review per `(productId, userId)`.
- New reviews start in `PENDING` and require moderation decisions for publish-state changes.

## Moderation Model

- Admin moderation decisions map to explicit review statuses: `APPROVED`, `REJECTED`, `FLAGGED`, and `HIDDEN`.
- Rejection and hide actions require a reason, and each moderation action is persisted separately in `ReviewModerationAction`.

## Security and Audit

- Customer review creation validates order-line ownership before allowing a write.
- Admin moderation writes emit `AuditLog` records with the decision and optional reason.
