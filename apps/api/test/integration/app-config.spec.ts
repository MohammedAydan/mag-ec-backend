import {
  buildAppConfig,
  envValidationSchema,
  normalizeEnvForValidation,
  resolveNodeEnv,
} from '../../src/config/app.config';

describe('buildAppConfig', () => {
  const originalEnv = process.env;

  beforeEach(() => {
    process.env = { ...originalEnv };
  });

  afterAll(() => {
    process.env = originalEnv;
  });

  it('builds the API prefix from environment values', () => {
    process.env.API_PREFIX = 'api/v1';

    expect(buildAppConfig().app.apiPrefix).toBe('api/v1');
  });

  it('accepts a Vercel direct-mode production boot without inactive S3 or Resend settings', () => {
    const result = envValidationSchema.validate(
      {
        NODE_ENV: 'production',
        EXECUTION_MODE: 'direct',
        DATABASE_URL: 'mysql://user:pass@example.com:3306/ecommerce',
        JWT_ACCESS_SECRET: 'production_access_secret_key_32_bytes',
        JWT_REFRESH_SECRET: 'production_refresh_secret_key_32_bytes',
        MAINTENANCE_SECRET: 'production_maintenance_secret_32_bytes',
        REPORT_STORAGE_MODE: 'local',
        EMAIL_PROVIDER: 'disabled',
      },
      { abortEarly: false, allowUnknown: true },
    );

    expect(result.error).toBeUndefined();
    expect(result.value.REPORT_STORAGE_MODE).toBe('local');
    expect(result.value.EMAIL_PROVIDER).toBe('disabled');
  });

  it('requires S3 settings when S3 report storage is enabled', () => {
    const result = envValidationSchema.validate(
      {
        NODE_ENV: 'production',
        EXECUTION_MODE: 'direct',
        DATABASE_URL: 'mysql://user:pass@example.com:3306/ecommerce',
        JWT_ACCESS_SECRET: 'production_access_secret_key_32_bytes',
        JWT_REFRESH_SECRET: 'production_refresh_secret_key_32_bytes',
        MAINTENANCE_SECRET: 'production_maintenance_secret_32_bytes',
        REPORT_STORAGE_MODE: 's3',
        EMAIL_PROVIDER: 'disabled',
      },
      { abortEarly: false, allowUnknown: true },
    );

    expect(result.error?.message).toContain('"S3_ENDPOINT" is required');
    expect(result.error?.message).toContain('"S3_BUCKET_PRIVATE" is required');
  });

  it('requires Resend settings when Resend email is enabled', () => {
    const result = envValidationSchema.validate(
      {
        NODE_ENV: 'production',
        EXECUTION_MODE: 'direct',
        DATABASE_URL: 'mysql://user:pass@example.com:3306/ecommerce',
        JWT_ACCESS_SECRET: 'production_access_secret_key_32_bytes',
        JWT_REFRESH_SECRET: 'production_refresh_secret_key_32_bytes',
        MAINTENANCE_SECRET: 'production_maintenance_secret_32_bytes',
        REPORT_STORAGE_MODE: 'local',
        EMAIL_PROVIDER: 'resend',
      },
      { abortEarly: false, allowUnknown: true },
    );

    expect(result.error?.message).toContain('"EMAIL_FROM" is required');
    expect(result.error?.message).toContain('"EMAIL_API_KEY" is required');
  });

  it('treats Vercel production as production when NODE_ENV is unset', () => {
    expect(resolveNodeEnv({ VERCEL: '1', VERCEL_ENV: 'production' })).toBe('production');
    expect(resolveNodeEnv({ VERCEL: '1', VERCEL_ENV: 'preview' })).toBe('staging');
  });

  it('normalizes Vercel production env before validation', () => {
    const result = envValidationSchema.validate(
      normalizeEnvForValidation({
        VERCEL: '1',
        VERCEL_ENV: 'production',
        EXECUTION_MODE: 'direct',
        DATABASE_URL: 'postgresql://user:pass@example.com:5432/ecommerce',
        JWT_ACCESS_SECRET: '""',
        JWT_REFRESH_SECRET: '""',
        MAINTENANCE_SECRET: 'production_maintenance_secret_32_bytes',
        REPORT_STORAGE_MODE: 'local',
        EMAIL_PROVIDER: 'disabled',
      }),
      { abortEarly: false, allowUnknown: true },
    );

    expect(result.error).toBeUndefined();
    expect(result.value.NODE_ENV).toBe('production');
    expect(result.value.JWT_ACCESS_SECRET).toBe('');
    expect(result.value.JWT_REFRESH_SECRET).toBe('');
  });

  it('derives stable JWT secrets from maintenance secret for Vercel direct mode', () => {
    process.env.VERCEL = '1';
    process.env.VERCEL_ENV = 'production';
    delete process.env.NODE_ENV;
    process.env.EXECUTION_MODE = 'direct';
    process.env.DATABASE_URL = 'postgresql://user:pass@example.com:5432/ecommerce';
    process.env.JWT_ACCESS_SECRET = '""';
    process.env.JWT_REFRESH_SECRET = '""';
    process.env.MAINTENANCE_SECRET = 'production_maintenance_secret_32_bytes';
    process.env.REPORT_STORAGE_MODE = 'local';
    process.env.EMAIL_PROVIDER = 'disabled';
    delete process.env.REDIS_URL;

    const config = buildAppConfig().app;

    expect(config.nodeEnv).toBe('production');
    expect(config.executionMode).toBe('direct');
    expect(config.redisUrl).toBe('');
    expect(config.schemaGuardEnabled).toBe(false);
    expect(config.jwtAccessSecret).toHaveLength(64);
    expect(config.jwtRefreshSecret).toHaveLength(64);
    expect(config.jwtAccessSecret).not.toBe(config.jwtRefreshSecret);
  });

  it('still rejects weak non-empty JWT secrets in production validation', () => {
    const result = envValidationSchema.validate(
      normalizeEnvForValidation({
        VERCEL: '1',
        VERCEL_ENV: 'production',
        EXECUTION_MODE: 'direct',
        DATABASE_URL: 'postgresql://user:pass@example.com:5432/ecommerce',
        JWT_ACCESS_SECRET: 'weak',
        JWT_REFRESH_SECRET: 'production_refresh_secret_key_32_bytes',
        MAINTENANCE_SECRET: 'production_maintenance_secret_32_bytes',
      }),
      { abortEarly: false, allowUnknown: true },
    );

    expect(result.error?.message).toContain('"JWT_ACCESS_SECRET" length must be at least 32');
  });
});
