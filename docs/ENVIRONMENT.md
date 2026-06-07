# Environment Configuration

## Required Environment Variables

Copy `.env.example` to `.env` and configure:

### Core
| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `NODE_ENV` | Yes | `development` | `development`, `test`, `staging`, or `production` |
| `PORT` | Yes | `3000` | API server port |
| `API_PREFIX` | Yes | `api/v1` | URL prefix for all API routes |
| `APP_PUBLIC_URL` | Yes | — | Public-facing URL of the API |

### Database
| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `DATABASE_URL` | Yes | — | MySQL connection string (`mysql://user:pass@host:3306/db`) |
| `EXECUTION_MODE` | Yes | `direct` | `direct` (no Redis) or `queue` (Redis + worker) |
| `REDIS_URL` | Queue only | — | Redis connection string |
| `QUEUE_ENABLED` | No | `false` | Deprecated; use `EXECUTION_MODE=queue` instead |
| `QUEUE_PREFIX` | No | `ecommerce` | Prefix for BullMQ queue keys |

### Authentication
| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `JWT_ACCESS_SECRET` | **Production: Yes** | — | HMAC secret for access tokens |
| `JWT_ACCESS_EXPIRES_IN` | No | `15m` | Access token TTL |
| `JWT_REFRESH_SECRET` | **Production: Yes** | — | HMAC secret for refresh tokens |
| `JWT_REFRESH_EXPIRES_IN` | No | `30d` | Refresh token TTL |

### Security
| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `MAINTENANCE_SECRET` | **Production: Yes** | — | Auth token for system maintenance |
| `CRON_SECRET` | **Production: Yes** | — | Auth token for Vercel Cron jobs |
| `THROTTLE_TTL_MS` | No | `60000` | Rate limit window in ms |
| `THROTTLE_LIMIT` | No | `120` | Max requests per window per IP |

### CORS
| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `ADMIN_ALLOWED_ORIGINS` | **Production: Yes** | — | Comma-separated admin dashboard origins |
| `STORE_ALLOWED_ORIGINS` | **Production: Yes** | — | Comma-separated storefront origins |

### Dashboard
| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `DASHBOARD_ENABLED` | No | `true` | Serve admin dashboard SPA at `/admin` |

### Email (Resend)
| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `EMAIL_PROVIDER` | No | `disabled` | `disabled` or `resend` |
| `EMAIL_FROM` | Resend only | — | Sender address |
| `EMAIL_API_KEY` | Resend only | — | Resend API key |

### Payments (Stripe)
| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `PAYMENT_PROVIDER` | No | `cod` | `cod` or `stripe` |
| `STRIPE_SECRET_KEY` | Stripe only | — | Stripe secret key |
| `PAYMENT_WEBHOOK_SECRET` | Stripe only | — | Stripe webhook signing secret |

### Storage (S3-compatible)
| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `S3_ENDPOINT` | Media uploads | — | S3-compatible endpoint |
| `S3_REGION` | Media uploads | `us-east-1` | Region |
| `S3_BUCKET_PUBLIC` | Media uploads | — | Public bucket name |
| `S3_BUCKET_PRIVATE` | Media uploads | — | Private bucket name |
| `S3_ACCESS_KEY_ID` | Media uploads | — | Access key |
| `S3_SECRET_ACCESS_KEY` | Media uploads | — | Secret key |
| `S3_PUBLIC_BASE_URL` | Media uploads | — | Public base URL |
| `REPORT_STORAGE_MODE` | No | `local` | `local` or `s3` |

### Seed
| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `DEV_SEED_ADMIN_EMAIL` | Dev only | `admin@example.com` | Admin email for seed |
| `DEV_SEED_ADMIN_PASSWORD` | Dev only | `ChangeMe123!` | Admin password for seed |
| `SEED_ALLOW_PRODUCTION` | No | `false` | Allow seed in production (break-glass) |

---

## Startup Validation

The application uses Joi validation through `@nestjs/config`. On startup:
- All required variables are validated
- Invalid values cause immediate startup failure
- A safe config summary is logged (no secrets)

---

## Running the Application

```bash
# Development
pnpm dev

# Production build
pnpm build

# Production start
NODE_ENV=production node dist/apps/api/src/main.js

# Worker (if EXECUTION_MODE=queue)
NODE_ENV=production node dist/apps/worker/src/main.js
```
