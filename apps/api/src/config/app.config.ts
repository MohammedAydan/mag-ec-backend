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

function valueOrDefault(value: string | undefined, fallback: string): string {
  const normalized = value?.trim();
  return normalized && normalized.length > 0 ? normalized : fallback;
}

function resolveExecutionMode(): ExecutionMode {
  return process.env.EXECUTION_MODE?.trim().toLowerCase() === 'queue' ? 'queue' : 'direct';
}

function resolveBoolean(key: string, devDefault: boolean): boolean {
  const raw = process.env[key]?.trim();
  if (raw !== undefined && raw.length > 0) {
    return raw !== 'false';
  }
  const nodeEnv = process.env.NODE_ENV ?? 'development';
  if (nodeEnv === 'production' || nodeEnv === 'staging') {
    return false;
  }
  return devDefault;
}

const productionRequiredString = Joi.string().when('NODE_ENV', {
  is: 'production',
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
    .uri({ scheme: [/mysql/] })
    .when('NODE_ENV', {
      is: Joi.string().valid('production', 'staging'),
      then: Joi.string()
        .uri({ scheme: [/mysql/] })
        .required(),
      otherwise: Joi.string()
        .uri({ scheme: [/mysql/] })
        .default('mysql://root:root@localhost:3306/ecommerce'),
    }),
  EXECUTION_MODE: Joi.string().valid('direct', 'queue').default('direct'),
  // Deprecated compatibility input; it no longer changes API runtime behavior. Use EXECUTION_MODE.
  QUEUE_ENABLED: Joi.boolean().truthy('true').falsy('false').default(false),
  REDIS_URL: Joi.string()
    .uri({ scheme: [/redis/, /rediss/] })
    .when('NODE_ENV', {
      is: Joi.string().valid('production', 'staging'),
      then: Joi.string()
        .uri({ scheme: [/redis/, /rediss/] })
        .required(),
      otherwise: Joi.string()
        .uri({ scheme: [/redis/, /rediss/] })
        .when('EXECUTION_MODE', {
          is: 'queue',
          then: Joi.string()
            .uri({ scheme: [/redis/, /rediss/] })
            .required(),
          otherwise: Joi.string().allow('').default(''),
        }),
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
  JWT_ACCESS_SECRET: Joi.string().when('NODE_ENV', {
    is: Joi.string().valid('production', 'staging'),
    then: Joi.string().min(32).required(),
    otherwise: Joi.string().empty('').default('development_access_secret_key_32_bytes_long'),
  }),
  JWT_ACCESS_EXPIRES_IN: Joi.string().default('15m'),
  JWT_REFRESH_SECRET: Joi.string().when('NODE_ENV', {
    is: Joi.string().valid('production', 'staging'),
    then: Joi.string().min(32).required(),
    otherwise: Joi.string().empty('').default('development_refresh_secret_key_32_bytes_long'),
  }),
  JWT_REFRESH_EXPIRES_IN: Joi.string().default('30d'),
  S3_ENDPOINT: Joi.string()
    .uri()
    .when('NODE_ENV', {
      is: 'production',
      then: Joi.string().uri().required(),
      otherwise: Joi.string().allow('').default(''),
    }),
  S3_REGION: productionRequiredString,
  S3_BUCKET_PUBLIC: productionRequiredString,
  S3_BUCKET_PRIVATE: productionRequiredString,
  S3_ACCESS_KEY_ID: productionRequiredString,
  S3_SECRET_ACCESS_KEY: productionRequiredString,
  S3_PUBLIC_BASE_URL: Joi.string()
    .uri()
    .when('NODE_ENV', {
      is: 'production',
      then: Joi.string().uri().required(),
      otherwise: Joi.string().allow('').default(''),
    }),
  REPORT_STORAGE_MODE: Joi.string()
    .valid('local', 's3')
    .when('NODE_ENV', {
      is: 'production',
      then: Joi.string().valid('s3').required(),
      otherwise: Joi.string().default('local'),
    }),
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
  EMAIL_PROVIDER: Joi.string()
    .valid('disabled', 'resend')
    .when('NODE_ENV', {
      is: 'production',
      then: Joi.string().valid('resend').required(),
      otherwise: Joi.string().default('disabled'),
    }),
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
  const nodeEnv = (process.env.NODE_ENV ?? 'development') as AppConfig['nodeEnv'];
  const isProdOrStaging = nodeEnv === 'production' || nodeEnv === 'staging';

  const databaseUrl = process.env.DATABASE_URL?.trim();
  if (isProdOrStaging && (!databaseUrl || databaseUrl.length === 0)) {
    throw new Error('DATABASE_URL is required in production and staging environments');
  }

  const redisUrl = process.env.REDIS_URL?.trim();
  if (isProdOrStaging && (!redisUrl || redisUrl.length === 0)) {
    throw new Error('REDIS_URL is required in production and staging environments');
  }

  return {
    app: {
      nodeEnv,
      port: Number.parseInt(process.env.PORT ?? '3000', 10),
      apiPrefix: process.env.API_PREFIX ?? 'api/v1',
      appPublicUrl: process.env.APP_PUBLIC_URL ?? 'http://localhost:3000',
      adminAllowedOrigins: splitOrigins(process.env.ADMIN_ALLOWED_ORIGINS),
      storeAllowedOrigins: splitOrigins(process.env.STORE_ALLOWED_ORIGINS),
      databaseUrl: databaseUrl ?? 'mysql://root:root@localhost:3306/ecommerce',
      executionMode,
      redisUrl: valueOrDefault(redisUrl, 'redis://localhost:6379'),
      queuePrefix: process.env.QUEUE_PREFIX ?? 'ecommerce',
      queueEnabled: executionMode === 'queue',
      maintenanceSecret: valueOrDefault(
        process.env.MAINTENANCE_SECRET ?? process.env.CRON_SECRET,
        'development_maintenance_secret_key',
      ),
      cronSecret: valueOrDefault(
        process.env.CRON_SECRET ?? process.env.MAINTENANCE_SECRET,
        'development_maintenance_secret_key',
      ),
      maintenanceBatchSize: Number.parseInt(process.env.MAINTENANCE_BATCH_SIZE ?? '25', 10),
      dashboardEnabled: resolveBoolean('DASHBOARD_ENABLED', true),
      schemaGuardEnabled: resolveBoolean('SCHEMA_GUARD_ENABLED', nodeEnv !== 'test'),
      throttleTtlMs: Number.parseInt(process.env.THROTTLE_TTL_MS ?? '60000', 10),
      throttleLimit: Number.parseInt(process.env.THROTTLE_LIMIT ?? '120', 10),
      logLevel: (process.env.LOG_LEVEL ?? 'info') as AppConfig['logLevel'],
      openapiEnabled: resolveBoolean('OPENAPI_ENABLED', true),
      jwtAccessSecret: valueOrDefault(
        process.env.JWT_ACCESS_SECRET,
        'development_access_secret_key_32_bytes_long',
      ),
      jwtAccessExpiresIn: process.env.JWT_ACCESS_EXPIRES_IN ?? '15m',
      jwtRefreshSecret: valueOrDefault(
        process.env.JWT_REFRESH_SECRET,
        'development_refresh_secret_key_32_bytes_long',
      ),
      jwtRefreshExpiresIn: process.env.JWT_REFRESH_EXPIRES_IN ?? '30d',
      s3Endpoint: process.env.S3_ENDPOINT ?? '',
      s3Region: process.env.S3_REGION ?? '',
      s3BucketPublic: process.env.S3_BUCKET_PUBLIC ?? '',
      s3BucketPrivate: process.env.S3_BUCKET_PRIVATE ?? '',
      s3AccessKeyId: process.env.S3_ACCESS_KEY_ID ?? '',
      s3SecretAccessKey: process.env.S3_SECRET_ACCESS_KEY ?? '',
      s3PublicBaseUrl: process.env.S3_PUBLIC_BASE_URL ?? '',
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
