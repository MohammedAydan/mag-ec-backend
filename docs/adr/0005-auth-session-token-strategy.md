# ADR-0005: Access and Refresh Token Strategy

- Date: 2026-05-25
- Status: Accepted

## Context

The platform needs secure customer and admin authentication with revocation and session-rotation support.

## Decision

Use short-lived JWT access tokens with rotating refresh-token families stored hashed server-side, backed by deny-by-default authorization controls.

## Consequences

- Authentication implementation is more involved than long-lived JWT-only approaches
- Session theft and replay protection improve materially
- Phase 02 must implement secure token storage, rotation, revocation, and audit coverage
