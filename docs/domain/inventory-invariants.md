# Inventory Domain — Invariants & Rules

## Overview

The inventory system is the **single source of truth** for all stock quantities. Every change
to stock — whether a physical receipt, manual write-off, or a reservation against a checkout —
flows through this domain and is permanently recorded in the append-only `StockMovement` log.

---

## Core Entities

| Entity             | Purpose                                                          |
| ------------------ | ---------------------------------------------------------------- |
| `Warehouse`        | A named physical or logical location holding stock               |
| `StockLevel`       | Current on-hand and reserved quantities per (warehouse, variant) |
| `StockMovement`    | Append-only audit log of every quantity change with typed reason |
| `StockReservation` | Time-bound lock on available stock for a checkout or order       |

---

## Fundamental Invariants

### I-1: Non-negative available stock

```
quantityOnHand - quantityReserved >= 0   -- at all times
```

This is enforced at the database layer via a conditional `UPDATE` that only matches when
sufficient available stock exists. Any operation that would violate this invariant fails
atomically without dirtying the row.

### I-2: Non-negative physical stock

```
quantityOnHand >= 0   -- at all times
```

Enforced in the application layer prior to any decrement that would push `quantityOnHand` below
zero. Any such request throws `BadRequestException`.

### I-3: Reservations can never exceed physical stock

```
quantityReserved <= quantityOnHand   -- at all times
```

Guaranteed by I-1 + the conditional UPDATE pattern. A reservation only increases
`quantityReserved` if the remaining available units satisfy the request.

### I-4: StockMovement is immutable

`StockMovement` rows are **never updated or deleted**. They are the permanent audit trail and
must not be modified by application code. The database `ON UPDATE` trigger should be considered
for defence-in-depth on production systems.

### I-5: Reservation states are terminal once reached

A `StockReservation` transitions through these states only in the permitted directions:

```
RESERVED → RELEASED
RESERVED → REDEEMED
RESERVED → EXPIRED

(No reverse transitions are allowed)
```

A reservation in `RELEASED`, `REDEEMED`, or `EXPIRED` state must never be acted on again by
the system (no re-reservation under the same key; re-reservations create new records).

---

## Concurrency Model

Stock is managed using **conditional SQL updates** — not application-level optimistic locking
with version counters. This provides sub-millisecond atomic check-and-set semantics at the
database level:

```sql
-- Reservation creation (will not match if available stock is insufficient)
UPDATE StockLevel
SET    quantityReserved = quantityReserved + :qty
WHERE  warehouseId = :wh
  AND  variantId   = :var
  AND  (quantityOnHand - quantityReserved) >= :qty
```

If the affected row count is `0`, the reservation request is rejected with HTTP 400.

This pattern is safe under MySQL/MariaDB's `READ COMMITTED` isolation level (the default for
this project) because `UPDATE` statements always read the latest committed state of rows they
lock.

---

## Reservation Lifecycle

```
                     ┌──────────────────┐
                     │  Cart / Checkout  │
                     └────────┬─────────┘
                              │ reserveStock()
                              ▼
                         ┌─────────┐
                         │RESERVED │◄─────── BullMQ delayed job scheduled at creation
                         └────┬────┘
              ┌───────────────┼─────────────┐
              │               │             │
              ▼               ▼             ▼
         ┌─────────┐   ┌──────────┐  ┌─────────┐
         │RELEASED │   │REDEEMED  │  │EXPIRED  │
         └─────────┘   └──────────┘  └─────────┘
    (cart abandoned) (order placed) (timer fired)
```

### Reserve

- Validates variant exists
- Validates quantity > 0
- Conditional UPDATE ensures atomicity (oversell prevention)
- Schedules a BullMQ delayed expiry job on the `inventory-expiry` queue

### Release

- Called when a cart is cleared or checkout is abandoned
- Atomically decrements `quantityReserved` (does NOT change `quantityOnHand`)
- Marks reservation `RELEASED`
- No `StockMovement` is recorded (no physical change)

### Redeem

- Called after a payment confirmation
- Atomically decrements both `quantityOnHand` and `quantityReserved`
- Marks reservation `REDEEMED`
- Creates a `StockMovement` of type `SALE` referencing the order ID

### Expire

- Triggered by BullMQ worker when reservation `expiresAt` passes
- Only acts if reservation is still in `RESERVED` status
- Atomically decrements `quantityReserved` (does NOT change `quantityOnHand`)
- Marks reservation `EXPIRED`

---

## Stock Movement Types

| Type           | Quantity Signed | Physical Change | Reservation Change      |
| -------------- | --------------- | --------------- | ----------------------- |
| `RECEIPT`      | Positive        | ↑ onHand        | None                    |
| `ADJUSTMENT`   | ±               | ↑/↓ onHand      | None                    |
| `WASTE`        | Negative        | ↓ onHand        | None                    |
| `RETURN`       | Positive        | ↑ onHand        | None                    |
| `SALE`         | Negative        | ↓ onHand        | ↓ reserved (via redeem) |
| `TRANSFER_IN`  | Positive        | ↑ onHand        | None                    |
| `TRANSFER_OUT` | Negative        | ↓ onHand        | None                    |

---

## Low-Stock Warning

The service logs a **structured warning** (Pino `warn` level) when the available stock drops
below `10` units after any operation. This is a passive alert — downstream systems (alerts,
notifications) should consume structured logs and act on the `{ event: 'low_stock_warning' }` field.

Default threshold: `10` units (constant in `InventoryCoreService`).

---

## API Contract Summary

| Endpoint                       | Method | Permission        | Description                             |
| ------------------------------ | ------ | ----------------- | --------------------------------------- |
| `/inventory/admin/adjustments` | `POST` | `inventory.write` | Manual stock adjustment                 |
| `/inventory/admin/levels`      | `GET`  | `inventory.read`  | List stock levels per warehouse/variant |
| `/inventory/admin/movements`   | `GET`  | `inventory.read`  | Paginated movement audit log            |

---

## Known Limitations & Follow-ups

- **No event publishing**: Stock events (depleted, reserved, redeemed) are logged but not published to an event bus. A future phase should add `OutboxEvent` publishing.
- **Single default warehouse assumption**: The initial implementation seeds a single default warehouse. Multi-warehouse routing logic is deferred to a future phase.
- **Expiry clock precision**: BullMQ delayed jobs are approximate. Clock skew of a few seconds is acceptable; do not use inventory reservations as a strict time-bounded access token.
