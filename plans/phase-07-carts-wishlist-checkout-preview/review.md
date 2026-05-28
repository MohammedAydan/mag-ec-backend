# Phase 07 Review: Carts, Wishlist, and Checkout Preview

## What Was Built

- Server-side guest and authenticated cart persistence with `Cart`, `CartItem`, `Wishlist`, and `WishlistItem` Prisma models plus migration SQL.
- `CartsModule` with guest-token cart access, authenticated cart ownership checks, cart item mutation, coupon application or removal, and guest-to-user merge behavior.
- `WishlistModule` with one-wishlist-per-user semantics and published-variant validation.
- `CheckoutModule` that composes cart state with pricing preview, promotion evaluation, default-warehouse stock visibility, and optional reservation creation through `InventoryCoreService`.
- Unit tests for cart, wishlist, and checkout-preview services plus focused E2E coverage for the new HTTP endpoints.

## Edge Cases Handled

- Authenticated carts reject anonymous access and guest carts reject mismatched guest tokens.
- Cart and wishlist mutations require published variants from published products.
- Guest merge sums line quantities and preserves a user-cart coupon when already present.
- Checkout preview rejects empty carts and fails loudly if the default warehouse is missing.
- Reservation preview returns stock availability alongside the reservation key and expiry timestamp.

## Known Limitations

- Guest-token rotation, cart-expiry jobs, and abandoned-cart campaigns are not implemented in phase 07.
- Payment readiness is currently a static capability summary, because online-payment provider selection is deferred to later phases.
- Reservation preview uses the seeded default warehouse only; multi-warehouse routing remains future work.
- Local MySQL-backed migration apply and DB integration remain environment-dependent because Docker/MySQL is still unavailable on this machine.

## Follow-Up Tasks

- Phase 08 should turn reservation previews into real order placement orchestration with idempotency and reservation redemption or release.
- Phase 09 should replace the placeholder online-payment readiness signal with provider-backed capability evaluation.
- Future work can add guest-cart expiry cleanup and abandoned-cart notification hooks once the core order flow exists.
