import { createHash } from 'node:crypto';

import Joi from 'joi';

export type ExecutionMode = 'direct' | 'queue';

export interface AppConfig {
  nodeEnv: 'development' | 'test' | 'staging' | 'production';
  port: number;
  apiPrefix: string;
  appPublicUrl: string;
  adminAllowedOrigins: string[];
  storeAllowedOrigins: string[];
  databaseUrl: string;
  executionMode: ExecutionMode;
  redisUrl: string;
  queuePrefix: string;
  queueEnabled: boolean;
  maintenanceSecret: string;
  cronSecret: string;
  maintenanceBatchSize: number;
  dashboardEnabled: boolean;
  schemaGuardEnabled: boolean;
  throttleTtlMs: number;
  throttleLimit: number;
  logLevel: 'fatal' | 'error' | 'warn' | 'info' | 'debug' | 'trace' | 'silent';
  openapiEnabled: boolean;
  jwtAccessSecret: string;
  jwtAccessExpiresIn: string;
  jwtRefreshSecret: string;
  jwtRefreshExpiresIn: string;
  s3Endpoint: string;
  s3Region: string;
  s3BucketPublic: string;
  s3BucketPrivate: string;
  s3AccessKeyId: string;
  s3SecretAccessKey: string;
  s3PublicBaseUrl: string;
  reportStorageMode: 'local' | 's3';
  paymentProvider: 'cod' | 'stripe';
  paymentWebhookSecret: string;
  stripeSecretKey: string;
  emailProvider: 'disabled' | 'resend';
  emailFrom: string;
  emailApiKey: string;
  fcmProjectId: string;
  fcmClientEmail: string;
  fcmPrivateKey: string;
}

function splitOrigins(value: string | undefined): string[] {
  if (!value) {
    return [];
  }

  return value
    .split(',')
    .map((origin) => origin.trim())
    .filter((origin) => origin.length > 0);
}

function normalizeEnvString(value: unknown): string | undefined {
  if (typeof value !== 'string') {
    return undefined;
  }

  const trimmed = value.trim();
  if (trimmed === '' || trimmed === '""' || trimmed === "''") {
    return undefined;
  }

  return trimmed;
}

function readEnv(key: string): string | undefined {
  return normalizeEnvString(process.env[key]);
}

function valueOrDefault(value: string | undefined, fallback: string): string {
  const normalized = normalizeEnvString(value);
  return normalized && normalized.length > 0 ? normalized : fallback;
}

function resolveExecutionMode(source: NodeJS.ProcessEnv = process.env): ExecutionMode {
  return normalizeEnvString(source.EXECUTION_MODE)?.toLowerCase() === 'queue' ? 'queue' : 'direct';
}

export function resolveNodeEnv(
  source: Partial<Pick<NodeJS.ProcessEnv, 'NODE_ENV' | 'VERCEL' | 'VERCEL_ENV'>> = process.env,
): AppConfig['nodeEnv'] {
  const vercelEnv = normalizeEnvString(source.VERCEL_ENV);
  if (vercelEnv === 'production') {
    return 'production';
  }
  if (vercelEnv === 'preview') {
    return 'staging';
  }

  const nodeEnv = normalizeEnvString(source.NODE_ENV);
  if (
    nodeEnv === 'development' ||
    nodeEnv === 'test' ||
    nodeEnv === 'staging' ||
    nodeEnv === 'production'
  ) {
    return nodeEnv;
  }

  return source.VERCEL === '1' ? 'production' : 'development';
}

export function normalizeEnvForValidation(
  env: Record<string, unknown>,
): Record<string, unknown> {
  const normalized: Record<string, unknown> = {};

  for (const [key, value] of Object.entries(env)) {
    normalized[key] = typeof value === 'string' ? (normalizeEnvString(value) ?? '') : value;
  }

  normalized.NODE_ENV = resolveNodeEnv({
    NODE_ENV: normalizeEnvString(env.NODE_ENV),
    VERCEL: normalizeEnvString(env.VERCEL),
    VERCEL_ENV: normalizeEnvString(env.VERCEL_ENV),
  });

  return normalized;
}

function resolveBoolean(key: string, devDefault: boolean): boolean {
  const raw = normalizeEnvString(process.env[key]);
  if (raw !== undefined && raw.length > 0) {
    return raw !== 'false';
  }
  const nodeEnv = resolveNodeEnv();
  if (nodeEnv === 'production' || nodeEnv === 'staging') {
    return false;
  }
  return devDefault;
}

const s3RequiredString = Joi.string().when('REPORT_STORAGE_MODE', {
  is: 's3',
  then: Joi.string().min(1).required(),
  otherwise: Joi.string().allow('').default(''),
});

export const envValidationSchema = Joi.object({
  NODE_ENV: Joi.string()
    .valid('development', 'test', 'staging', 'production')
    .default('development'),
  PORT: Joi.number().integer().min(1).max(65535).default(3000),
  API_PREFIX: Joi.string().default('api/v1'),
  APP_PUBLIC_URL: Joi.string().uri().default('http://localhost:3000'),
  ADMIN_ALLOWED_ORIGINS: Joi.string().allow('').default(''),
  STORE_ALLOWED_ORIGINS: Joi.string().allow('').default('http://localhost:3001'),
  DATABASE_URL: Joi.string()
    .uri({ scheme: [/mysql/, /postgres/, /postgresql/] })
    .when('NODE_ENV', {
      is: Joi.string().valid('production', 'staging'),
      then: Joi.string()
        .uri({ scheme: [/mysql/, /postgres/, /postgresql/] })
        .required(),
      otherwise: Joi.string()
        .uri({ scheme: [/mysql/, /postgres/, /postgresql/] })
        .default('mysql://root:root@localhost:3306/ecommerce'),
    }),
  EXECUTION_MODE: Joi.string().valid('direct', 'queue').default('direct'),
  // Deprecated compatibility input; it no longer changes API runtime behavior. Use EXECUTION_MODE.
  QUEUE_ENABLED: Joi.boolean().truthy('true').falsy('false').default(false),
  REDIS_URL: Joi.string()
    .uri({ scheme: [/redis/, /rediss/] })
    .when('EXECUTION_MODE', {
      is: 'queue',
      then: Joi.string()
        .uri({ scheme: [/redis/, /rediss/] })
        .required(),
      otherwise: Joi.string()
        .uri({ scheme: [/redis/, /rediss/] })
        .allow('')
        .default(''),
    }),
  QUEUE_PREFIX: Joi.string().default('ecommerce'),
  CRON_SECRET: Joi.string().allow('').default(''),
  MAINTENANCE_SECRET: Joi.string().when('NODE_ENV', {
    is: 'production',
    then: Joi.string().min(32).required(),
    otherwise: Joi.string().allow('').default('development_maintenance_secret_key'),
  }),
  MAINTENANCE_BATCH_SIZE: Joi.number().integer().min(1).max(100).default(25),
  DASHBOARD_ENABLED: Joi.boolean().truthy('true').falsy('false').when('NODE_ENV', {
    is: Joi.string().valid('production', 'staging'),
    then: Joi.boolean().default(false),
    otherwise: Joi.boolean().default(true),
  }),
  SCHEMA_GUARD_ENABLED: Joi.boolean().truthy('true').falsy('false').default(true),
  THROTTLE_TTL_MS: Joi.number().integer().min(1000).default(60000),
  THROTTLE_LIMIT: Joi.number().integer().min(1).default(120),
  DEV_SEED_ADMIN_EMAIL: Joi.string().email().default('admin@example.com'),
  DEV_SEED_ADMIN_PASSWORD: Joi.string().min(8).default('ChangeMe123!'),
  LOG_LEVEL: Joi.string()
    .valid('fatal', 'error', 'warn', 'info', 'debug', 'trace', 'silent')
    .default('info'),
  OPENAPI_ENABLED: Joi.boolean().truthy('true').falsy('false').when('NODE_ENV', {
    is: Joi.string().valid('production', 'staging'),
    then: Joi.boolean().default(false),
    otherwise: Joi.boolean().default(true),
  }),
  JWT_ACCESS_SECRET: Joi.alternatives()
    .try(Joi.string().min(32), Joi.string().valid(''))
    .default(''),
  JWT_ACCESS_EXPIRES_IN: Joi.string().default('15m'),
  JWT_REFRESH_SECRET: Joi.alternatives()
    .try(Joi.string().min(32), Joi.string().valid(''))
    .default(''),
  JWT_REFRESH_EXPIRES_IN: Joi.string().default('30d'),
  S3_ENDPOINT: Joi.string()
    .uri()
    .when('REPORT_STORAGE_MODE', {
      is: 's3',
      then: Joi.string().uri().required(),
      otherwise: Joi.string().allow('').default(''),
    }),
  S3_REGION: s3RequiredString,
  S3_BUCKET_PUBLIC: s3RequiredString,
  S3_BUCKET_PRIVATE: s3RequiredString,
  S3_ACCESS_KEY_ID: s3RequiredString,
  S3_SECRET_ACCESS_KEY: s3RequiredString,
  S3_PUBLIC_BASE_URL: Joi.string()
    .uri()
    .when('REPORT_STORAGE_MODE', {
      is: 's3',
      then: Joi.string().uri().required(),
      otherwise: Joi.string().allow('').default(''),
    }),
  REPORT_STORAGE_MODE: Joi.string().valid('local', 's3').default('local'),
  PAYMENT_PROVIDER: Joi.string().valid('cod', 'stripe').default('cod'),
  PAYMENT_WEBHOOK_SECRET: Joi.string().when('PAYMENT_PROVIDER', {
    is: 'stripe',
    then: Joi.string().min(16).required(),
    otherwise: Joi.string().allow('').default(''),
  }),
  STRIPE_SECRET_KEY: Joi.string().when('PAYMENT_PROVIDER', {
    is: 'stripe',
    then: Joi.string().min(1).required(),
    otherwise: Joi.string().allow('').default(''),
  }),
  EMAIL_PROVIDER: Joi.string().valid('disabled', 'resend').default('disabled'),
  EMAIL_FROM: Joi.string().when('EMAIL_PROVIDER', {
    is: 'resend',
    then: Joi.string().email().required(),
    otherwise: Joi.string().allow('').default(''),
  }),
  EMAIL_API_KEY: Joi.string().when('EMAIL_PROVIDER', {
    is: 'resend',
    then: Joi.string().min(1).required(),
    otherwise: Joi.string().allow('').default(''),
  }),
  FCM_PROJECT_ID: Joi.string().allow('').default(''),
  FCM_CLIENT_EMAIL: Joi.string().allow('').default(''),
  FCM_PRIVATE_KEY: Joi.string().allow('').default(''),
  SENTRY_DSN: Joi.string().allow('').default(''),
});

export function buildAppConfig(): { app: AppConfig } {
  const executionMode = resolveExecutionMode();
  const nodeEnv = resolveNodeEnv();
  const isProdOrStaging = nodeEnv === 'production' || nodeEnv === 'staging';

  const databaseUrl = readEnv('DATABASE_URL');
  if (isProdOrStaging && (!databaseUrl || databaseUrl.length === 0)) {
    throw new Error('DATABASE_URL is required in production and staging environments');
  }

  const redisUrl = readEnv('REDIS_URL');
  if (executionMode === 'queue' && (!redisUrl || redisUrl.length === 0)) {
    throw new Error('REDIS_URL is required when EXECUTION_MODE=queue');
  }

  const maintenanceSecret = valueOrDefault(
    readEnv('MAINTENANCE_SECRET') ?? readEnv('CRON_SECRET'),
    'development_maintenance_secret_key',
  );

  return {
    app: {
      nodeEnv,
      port: Number.parseInt(readEnv('PORT') ?? '3000', 10),
      apiPrefix: readEnv('API_PREFIX') ?? 'api/v1',
      appPublicUrl: readEnv('APP_PUBLIC_URL') ?? 'http://localhost:3000',
      adminAllowedOrigins: splitOrigins(process.env.ADMIN_ALLOWED_ORIGINS),
      storeAllowedOrigins: splitOrigins(process.env.STORE_ALLOWED_ORIGINS),
      databaseUrl: databaseUrl ?? 'mysql://root:root@localhost:3306/ecommerce',
      executionMode,
      redisUrl:
        executionMode === 'queue' ? valueOrDefault(redisUrl, 'redis://localhost:6379') : (redisUrl ?? ''),
      queuePrefix: readEnv('QUEUE_PREFIX') ?? 'ecommerce',
      queueEnabled: executionMode === 'queue',
      maintenanceSecret,
      cronSecret: valueOrDefault(
        readEnv('CRON_SECRET') ?? readEnv('MAINTENANCE_SECRET'),
        'development_maintenance_secret_key',
      ),
      maintenanceBatchSize: Number.parseInt(readEnv('MAINTENANCE_BATCH_SIZE') ?? '25', 10),
      dashboardEnabled: resolveBoolean('DASHBOARD_ENABLED', true),
      schemaGuardEnabled: resolveBoolean('SCHEMA_GUARD_ENABLED', nodeEnv !== 'test'),
      throttleTtlMs: Number.parseInt(readEnv('THROTTLE_TTL_MS') ?? '60000', 10),
      throttleLimit: Number.parseInt(readEnv('THROTTLE_LIMIT') ?? '120', 10),
      logLevel: (readEnv('LOG_LEVEL') ?? 'info') as AppConfig['logLevel'],
      openapiEnabled: resolveBoolean('OPENAPI_ENABLED', true),
      jwtAccessSecret: resolveRuntimeSecret(
        readEnv('JWT_ACCESS_SECRET'),
        maintenanceSecret,
        'jwt-access',
      ),
      jwtAccessExpiresIn: readEnv('JWT_ACCESS_EXPIRES_IN') ?? '15m',
      jwtRefreshSecret: resolveRuntimeSecret(
        readEnv('JWT_REFRESH_SECRET'),
        maintenanceSecret,
        'jwt-refresh',
      ),
      jwtRefreshExpiresIn: readEnv('JWT_REFRESH_EXPIRES_IN') ?? '30d',
      s3Endpoint: readEnv('S3_ENDPOINT') ?? '',
      s3Region: readEnv('S3_REGION') ?? '',
      s3BucketPublic: readEnv('S3_BUCKET_PUBLIC') ?? '',
      s3BucketPrivate: readEnv('S3_BUCKET_PRIVATE') ?? '',
      s3AccessKeyId: readEnv('S3_ACCESS_KEY_ID') ?? '',
      s3SecretAccessKey: readEnv('S3_SECRET_ACCESS_KEY') ?? '',
      s3PublicBaseUrl: readEnv('S3_PUBLIC_BASE_URL') ?? '',
      reportStorageMode: (process.env.REPORT_STORAGE_MODE ??
        'local') as AppConfig['reportStorageMode'],
      paymentProvider: (process.env.PAYMENT_PROVIDER ?? 'cod')
        .trim()
        .toLowerCase() as AppConfig['paymentProvider'],
      paymentWebhookSecret: process.env.PAYMENT_WEBHOOK_SECRET ?? '',
      stripeSecretKey: process.env.STRIPE_SECRET_KEY ?? '',
      emailProvider: (process.env.EMAIL_PROVIDER ?? 'disabled') as AppConfig['emailProvider'],
      emailFrom: process.env.EMAIL_FROM ?? '',
      emailApiKey: process.env.EMAIL_API_KEY ?? '',
      fcmProjectId: process.env.FCM_PROJECT_ID ?? '',
      fcmClientEmail: process.env.FCM_CLIENT_EMAIL ?? '',
      fcmPrivateKey: process.env.FCM_PRIVATE_KEY ?? '',
    },
  };
}

function resolveRuntimeSecret(
  explicitSecret: string | undefined,
  maintenanceSecret: string,
  label: string,
): string {
  if (explicitSecret && explicitSecret.length >= 32) {
    return explicitSecret;
  }

  if (maintenanceSecret.length >= 32) {
    return createHash('sha256').update(`${label}:${maintenanceSecret}`).digest('hex');
  }

  return label === 'jwt-access'
    ? 'development_access_secret_key_32_bytes_long'
    : 'development_refresh_secret_key_32_bytes_long';
}
