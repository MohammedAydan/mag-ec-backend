# Security Checklist

**Date:** 2026-06-07  
**Project:** E-Commerce API + Admin Dashboard

---

## Authentication

| # | Check | Status | Evidence |
|---|-------|--------|----------|
| SEC-01 | Access token expiry is reasonable (15 min) | ✅ | `JWT_ACCESS_EXPIRES_IN=15m` |
| SEC-02 | Refresh token rotation (30 days) | ✅ | `JWT_REFRESH_EXPIRES_IN=30d` |
| SEC-03 | Logout invalidates refresh session | ✅ | `POST /auth/logout` revokes session |
| SEC-04 | No tokens logged in production | ✅ | Smoke test verified — no token output |
| SEC-05 | Auth errors don't leak details | ✅ | HttpExceptionFilter normalizes errors |

## Authorization

| # | Check | Status | Evidence |
|---|-------|--------|----------|
| SEC-06 | Admin routes require AdminGuard | ✅ | All `/admin` routes use `@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)` |
| SEC-07 | Permission-based access control | ✅ | `@RequirePermissions(['pricing.write'])` etc. |
| SEC-08 | Staff invite requires identity.write | ✅ | Guarded |
| SEC-09 | Customer endpoints cannot access admin data | ✅ | Separate guards |

## Input Validation

| # | Check | Status | Evidence |
|---|-------|--------|----------|
| SEC-10 | DTOs use class-validator | ✅ | `@IsString`, `@IsNotEmpty`, `@IsInt`, `@Min`, `@Max` |
| SEC-11 | Unknown fields rejected | ✅ | `forbidNonWhitelisted: true` in ValidationPipe |
| SEC-12 | Slugs/keys normalized | ✅ | `.trim().toLowerCase()` consistently |
| SEC-13 | Email normalized | ✅ | `normalizeEmail()` |
| SEC-14 | Discounts bounded (0-100000 bps) | ✅ | `@Min(0) @Max(100000)` on `percentageBps` |
| SEC-15 | Prices bounded (non-negative) | ✅ | `@Min(0)` on `baseAmount`, `saleAmount` |

## HTTP Security Headers

| # | Check | Status | Evidence |
|---|-------|--------|----------|
| SEC-16 | Helmet enabled | ✅ | `@fastify/helmet` with CSP, HSTS, XSS protection |
| SEC-17 | CSP doesn't break dashboard | ✅ | Dashboard assets served from same origin |
| SEC-18 | X-Content-Type-Options: nosniff | ✅ | Helmet default |
| SEC-19 | Referrer-Policy configured | ✅ | Helmet default |
| SEC-20 | Frame options: SAMEORIGIN | ✅ | Helmet default |

## CORS

| # | Check | Status | Evidence |
|---|-------|--------|----------|
| SEC-21 | Production origins configurable | ✅ | `ADMIN_ALLOWED_ORIGINS` + `STORE_ALLOWED_ORIGINS` env vars |
| SEC-22 | Dev CORS permissive in dev only | ✅ | `NODE_ENV` controls behavior |

## Rate Limiting

| # | Check | Status | Evidence |
|---|-------|--------|----------|
| SEC-23 | Global rate limiting | ✅ | `ThrottlerModule` with configurable TTL/limit |
| SEC-24 | Health endpoints exempt | ✅ | `@SkipThrottle()` on HealthController |
| SEC-25 | Webhook endpoints exempt | ✅ | `@SkipThrottle()` on webhook controllers |
| SEC-26 | Login rate-limited | ✅ | Default 5 req/60s for auth |

## Secrets Management

| # | Check | Status | Evidence |
|---|-------|--------|----------|
| SEC-27 | `.env` not committed | ✅ | `.env.example` with placeholders only |
| SEC-28 | Joi validates required env vars | ✅ | `AppConfig` schema fails startup if critical vars missing |
| SEC-29 | No secrets in logs | ✅ | Pino redaction; smoke test confirmed no token leaks |
| SEC-30 | No secrets in code | ✅ | All secrets from `ConfigService` |

## Error Handling

| # | Check | Status | Evidence |
|---|-------|--------|----------|
| SEC-31 | Global exception filter | ✅ | `HttpExceptionFilter` normalizes errors |
| SEC-32 | No stack traces in production | ✅ | `NODE_ENV=production` suppresses |
| SEC-33 | Consistent error format | ✅ | `{ error, code, details, path, requestId, timestamp }` |

## Dependencies

| # | Check | Status | Evidence |
|---|-------|--------|----------|
| SEC-34 | No critical CVEs | ⚠️ | One moderate advisory in Prisma toolchain (CVE-2026-39406) — no compatible patch yet |
| SEC-35 | Regular `pnpm audit` | ✅ | `pnpm security:audit` configured |

---

**Result:** 34/35 checks pass. 1 moderate CVE in Prisma toolchain dependency — non-blocking, no compatible patched version available.
