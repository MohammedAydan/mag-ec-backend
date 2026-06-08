type EnvCheck = {
  present: boolean;
  length: number;
  valid: boolean;
};

type DiagnosticsResponse = {
  status: 'ok';
  runtime: {
    nodeVersion: string;
    region: string | null;
    vercel: boolean;
    vercelEnv: string;
  };
  deployment: {
    nodeEnvRaw: string;
    nodeEnvEffective: string;
    executionMode: string;
    dashboardEnabled: string;
    schemaGuardEnabled: string;
    reportStorageMode: string;
    emailProvider: string;
    paymentProvider: string;
  };
  required: {
    databaseUrl: EnvCheck;
    jwtAccessSecret: EnvCheck;
    jwtRefreshSecret: EnvCheck;
    jwtAccessSecretEffective: EnvCheck;
    jwtRefreshSecretEffective: EnvCheck;
    maintenanceSecret: EnvCheck;
  };
  optionalProviders: {
    s3Configured: boolean;
    resendConfigured: boolean;
    stripeConfigured: boolean;
    redisConfigured: boolean;
  };
};

const MIN_SECRET_LENGTH = 32;

export function GET(): Response {
  const executionMode = valueOrDefault(process.env.EXECUTION_MODE, 'direct');
  const reportStorageMode = valueOrDefault(process.env.REPORT_STORAGE_MODE, 'local');
  const emailProvider = valueOrDefault(process.env.EMAIL_PROVIDER, 'disabled');
  const paymentProvider = valueOrDefault(process.env.PAYMENT_PROVIDER, 'cod');
  const maintenanceSecret = process.env.MAINTENANCE_SECRET ?? process.env.CRON_SECRET;

  const body: DiagnosticsResponse = {
    status: 'ok',
    runtime: {
      nodeVersion: process.version,
      region: process.env.VERCEL_REGION ?? process.env.AWS_REGION ?? null,
      vercel: process.env.VERCEL === '1',
      vercelEnv: valueOrDefault(process.env.VERCEL_ENV, '<unset>'),
    },
    deployment: {
      nodeEnvRaw: valueOrDefault(process.env.NODE_ENV, '<unset>'),
      nodeEnvEffective: resolveEffectiveNodeEnv(),
      executionMode,
      dashboardEnabled: valueOrDefault(process.env.DASHBOARD_ENABLED, '<unset>'),
      schemaGuardEnabled: valueOrDefault(process.env.SCHEMA_GUARD_ENABLED, '<unset>'),
      reportStorageMode,
      emailProvider,
      paymentProvider,
    },
    required: {
      databaseUrl: checkDatabaseUrl(process.env.DATABASE_URL),
      jwtAccessSecret: checkSecret(process.env.JWT_ACCESS_SECRET),
      jwtRefreshSecret: checkSecret(process.env.JWT_REFRESH_SECRET),
      jwtAccessSecretEffective: checkSecret(
        hasStrongSecret(process.env.JWT_ACCESS_SECRET) ? process.env.JWT_ACCESS_SECRET : maintenanceSecret,
      ),
      jwtRefreshSecretEffective: checkSecret(
        hasStrongSecret(process.env.JWT_REFRESH_SECRET) ? process.env.JWT_REFRESH_SECRET : maintenanceSecret,
      ),
      maintenanceSecret: checkSecret(maintenanceSecret),
    },
    optionalProviders: {
      s3Configured:
        reportStorageMode !== 's3' ||
        allPresent(
          process.env.S3_ENDPOINT,
          process.env.S3_REGION,
          process.env.S3_BUCKET_PUBLIC,
          process.env.S3_BUCKET_PRIVATE,
          process.env.S3_ACCESS_KEY_ID,
          process.env.S3_SECRET_ACCESS_KEY,
          process.env.S3_PUBLIC_BASE_URL,
        ),
      resendConfigured:
        emailProvider !== 'resend' ||
        allPresent(process.env.EMAIL_FROM, process.env.EMAIL_API_KEY),
      stripeConfigured:
        paymentProvider !== 'stripe' ||
        allPresent(process.env.STRIPE_SECRET_KEY, process.env.PAYMENT_WEBHOOK_SECRET),
      redisConfigured: executionMode !== 'queue' || allPresent(process.env.REDIS_URL),
    },
  };

  return Response.json(body, {
    status: 200,
    headers: {
      'Cache-Control': 'no-store',
    },
  });
}

function checkSecret(value: string | undefined): EnvCheck {
  const length = normalizeEnvString(value)?.length ?? 0;

  return {
    present: length > 0,
    length,
    valid: length >= MIN_SECRET_LENGTH,
  };
}

function checkDatabaseUrl(value: string | undefined): EnvCheck {
  const normalized = normalizeEnvString(value);
  const length = normalized?.length ?? 0;
  const valid = typeof normalized === 'string' && /^(mysql|postgres|postgresql):\/\//i.test(normalized);

  return {
    present: length > 0,
    length,
    valid,
  };
}

function allPresent(...values: Array<string | undefined>): boolean {
  return values.every((value) => normalizeEnvString(value) !== undefined);
}

function valueOrDefault(value: string | undefined, fallback: string): string {
  const normalized = normalizeEnvString(value);
  return normalized && normalized.length > 0 ? normalized : fallback;
}

function hasStrongSecret(value: string | undefined): boolean {
  return (normalizeEnvString(value)?.length ?? 0) >= MIN_SECRET_LENGTH;
}

function normalizeEnvString(value: string | undefined): string | undefined {
  const normalized = value?.trim();
  if (!normalized || normalized === '""' || normalized === "''") {
    return undefined;
  }

  return normalized;
}

function resolveEffectiveNodeEnv(): string {
  const vercelEnv = normalizeEnvString(process.env.VERCEL_ENV);
  if (vercelEnv === 'production') {
    return 'production';
  }
  if (vercelEnv === 'preview') {
    return 'staging';
  }

  const nodeEnv = normalizeEnvString(process.env.NODE_ENV);
  if (nodeEnv) {
    return nodeEnv;
  }

  return process.env.VERCEL === '1' ? 'production' : 'development';
}
