# Phase 02: Identity, Authentication, and Authorization

## Goal

Implement secure customer and admin authentication, session rotation, permission enforcement, and audit-aware access control across protected APIs.

## Acceptance Criteria

- Registration, login, token refresh, logout, and session revocation flows are implemented and tested.
- Password hashing uses Argon2id and refresh tokens are stored hashed with rotation and reuse protection.
- Admin and customer route protection is enforced through RBAC and object-level policy checks.
- Verification/password-reset structure is present even if final message providers arrive later.
- Audit events and negative security tests cover token misuse, BOLA, and privilege escalation attempts.

## Approach

Build identity as a cross-cutting module with explicit boundaries between authentication mechanics, authorization policy, and user account management. Keep public contracts stable and security defaults strict.

## Scope

### In Scope

- User auth flows
- Refresh session model usage
- Roles, permissions, guards, decorators, and policy checks
- Auth-focused throttling and audit events
- Password reset and verification flow structure

### Out of Scope

- Social login
- MFA unless explicitly approved later
- Frontend cookie-based flows beyond backend support requirements

## Dependencies

- `phase-01-database-core`

## Estimated Complexity

L
