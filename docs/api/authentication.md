# Authentication Contract

## Overview

- API prefix: `/api/v1`
- Access token transport: `Authorization: Bearer <jwt>`
- Access token lifetime: `JWT_ACCESS_EXPIRES_IN` (default local fallback: `15m`)
- Refresh token lifetime: `JWT_REFRESH_EXPIRES_IN` (default local fallback: `30d`)
- Password hashing: Argon2id
- Refresh token storage: SHA-256 hash in `RefreshSession`, with family rotation and reuse detection

## Endpoints

### Public

- `POST /auth/register`
  - Registers a customer account.
  - Returns the created user summary only; token issuance still starts at login.
- `POST /auth/login`
  - Validates credentials, loads roles/permissions, issues an access token plus refresh token, and creates a refresh-session record.
- `POST /auth/refresh`
  - Verifies the refresh token, rotates the session family member, and returns a fresh token pair.
- `POST /auth/logout`
  - Revokes the full refresh-session family for the submitted refresh token.
- `POST /auth/password-reset/request`
  - Always returns `202 Accepted` without revealing whether the account exists.
  - If the account is eligible, a one-time password-reset token record is created in `AccountActionToken`.
- `POST /auth/password-reset/confirm`
  - Consumes the one-time password-reset token, updates the password hash, and revokes all active refresh sessions for that user.
- `POST /auth/verification/confirm`
  - Consumes the one-time email-verification token and sets `emailVerifiedAt`.

### Protected

- `POST /auth/verification/request`
  - Requires a valid access token.
  - Issues a new one-time email-verification token for the authenticated user when the email is still unverified.
- `GET /auth/me`
  - Requires a valid access token.
  - Returns the authenticated user profile plus current roles and permissions.
- `GET /identity/users/:userId/profile`
  - Requires a valid access token.
  - Allows self-access or actors with `identity.read` / `super_admin`.
- `GET /identity/admin/access-check`
  - Requires a valid access token.
  - Requires the `super_admin` role and `identity.read` permission.

## Security Rules

- Raw passwords, bearer access tokens, refresh tokens, and set-cookie values are redacted in structured logs.
- Refresh-token replay detection revokes the entire session family.
- Password-reset completion revokes every non-revoked refresh session for the user.
- Password-reset request responses are enumeration-safe.
- Email-verification and password-reset tokens are stored hashed and marked one-time-use via `consumedAt`.
- Object-level access to user profiles is deny-by-default unless the actor is the owner or holds privileged identity access.

## Current Limitations

- Verification and password-reset delivery adapters are not wired yet; phase 02 stores the token structure and API contracts, while actual email delivery remains for a later integration phase.
- Admin/customer audiences currently share the same JWT issuer/validation path; split audiences can be introduced later if the admin client model requires it.
