import { buildAppConfig, envValidationSchema } from '../../src/config/app.config';

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
});
