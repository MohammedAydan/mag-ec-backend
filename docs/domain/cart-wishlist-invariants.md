# Cart and Wishlist Invariants

## Cart Ownership

- Guest carts are persisted server-side and addressed by an opaque `guestToken` supplied by the client.
- Authenticated carts are owned by exactly one `User` through `Cart.userId`.
- A cart is never shared across users; authenticated cart access requires a matching access token subject.
- Guest cart access requires an exact `x-guest-cart-token` match when the cart has no `userId`.

## Cart Lifecycle

- `Cart.status` is `ACTIVE` while the cart is mutable and usable for preview.
- A guest cart transitions to `MERGED` after its items are merged into the authenticated user's active cart.
- Abandoned carts can transition to `ABANDONED` without being deleted, preserving an auditable intent record.
- Cart lines are unique per `(cartId, variantId)` and quantities are merged rather than duplicated.

## Merge Rules

- Guest-to-user merge sums quantities when the same variant exists in both carts.
- The authenticated cart keeps its existing coupon if one is already applied; otherwise it inherits the guest cart coupon.
- Guest cart items are removed after merge and the source cart is marked `MERGED`.

## Wishlist Rules

- Each user owns at most one wishlist through the unique `Wishlist.userId` constraint.
- Wishlist lines are unique per `(wishlistId, variantId)`.
- Wishlist entries only accept published variants belonging to published products.

## Checkout Preview and Reservation

- Checkout preview is derived from current cart state, current pricing, current promotion eligibility, and current stock levels.
- Preview does not guarantee stock unless `reserveStockOnPreview` is enabled through the authenticated reservation path.
- Stock reservation uses the default warehouse only in phase 07 and returns a reservation key plus expiry timestamp.
- Preview totals are always recomputed server-side; clients do not send authoritative prices, discounts, or totals.

## Security Assumptions

- `guestToken` is treated as a bearer-style secret scoped only to guest-cart access; it must be stored client-side and not logged.
- Pricing, promotion, and stock availability are re-evaluated on every preview request to prevent stale cart assumptions.
- Cart and wishlist mutation flows reject unpublished variants so archived or draft catalog data does not leak into pre-purchase state.
