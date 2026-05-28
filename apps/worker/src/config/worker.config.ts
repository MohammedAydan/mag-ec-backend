export interface WorkerConfig {
  nodeEnv: 'development' | 'test' | 'staging' | 'production';
  databaseUrl: string;
  redisUrl: string;
  queuePrefix: string;
  logLevel: string;
  s3Endpoint: string;
  s3Region: string;
  s3BucketPublic: string;
  s3BucketPrivate: string;
  s3AccessKeyId: string;
  s3SecretAccessKey: string;
  s3PublicBaseUrl: string;
  reportStorageMode: 'local' | 's3';
  paymentProvider: 'cod' | 'stripe';
  stripeSecretKey: string;
  emailProvider: 'disabled' | 'resend';
  emailFrom: string;
  emailApiKey: string;
  fcmProjectId: string;
  fcmClientEmail: string;
  fcmPrivateKey: string;
}

function requiredInProduction(name: string, value: string, isProduction: boolean): string {
  if (isProduction && value.trim().length === 0) {
    throw new Error(`${name} is required in production`);
  }
  return value;
}

export function buildWorkerConfig(): { worker: WorkerConfig } {
  const nodeEnv = (process.env.NODE_ENV ?? 'development') as WorkerConfig['nodeEnv'];
  const isProduction = nodeEnv === 'production';
  const reportStorageMode = (process.env.REPORT_STORAGE_MODE ??
    'local') as WorkerConfig['reportStorageMode'];
  const paymentProvider = (process.env.PAYMENT_PROVIDER ?? 'cod')
    .trim()
    .toLowerCase() as WorkerConfig['paymentProvider'];
  const emailProvider = (process.env.EMAIL_PROVIDER ?? 'disabled') as WorkerConfig['emailProvider'];

  if (isProduction && reportStorageMode !== 's3') {
    throw new Error('REPORT_STORAGE_MODE must be s3 in production');
  }
  if (
    isProduction &&
    paymentProvider === 'stripe' &&
    !(process.env.STRIPE_SECRET_KEY ?? '').trim()
  ) {
    throw new Error('STRIPE_SECRET_KEY is required when Stripe is enabled in production');
  }
  if (isProduction && emailProvider !== 'resend') {
    throw new Error('EMAIL_PROVIDER must be resend in production');
  }

  return {
    worker: {
      nodeEnv,
      databaseUrl: requiredInProduction(
        'DATABASE_URL',
        process.env.DATABASE_URL ?? 'mysql://root:root@localhost:3306/ecommerce',
        isProduction,
      ),
      redisUrl: requiredInProduction(
        'REDIS_URL',
        process.env.REDIS_URL ?? 'redis://localhost:6379',
        isProduction,
      ),
      queuePrefix: process.env.QUEUE_PREFIX ?? 'ecommerce',
      logLevel: process.env.LOG_LEVEL ?? 'info',
      s3Endpoint: requiredInProduction('S3_ENDPOINT', process.env.S3_ENDPOINT ?? '', isProduction),
      s3Region: requiredInProduction('S3_REGION', process.env.S3_REGION ?? '', isProduction),
      s3BucketPublic: requiredInProduction(
        'S3_BUCKET_PUBLIC',
        process.env.S3_BUCKET_PUBLIC ?? '',
        isProduction,
      ),
      s3BucketPrivate: requiredInProduction(
        'S3_BUCKET_PRIVATE',
        process.env.S3_BUCKET_PRIVATE ?? '',
        isProduction,
      ),
      s3AccessKeyId: requiredInProduction(
        'S3_ACCESS_KEY_ID',
        process.env.S3_ACCESS_KEY_ID ?? '',
        isProduction,
      ),
      s3SecretAccessKey: requiredInProduction(
        'S3_SECRET_ACCESS_KEY',
        process.env.S3_SECRET_ACCESS_KEY ?? '',
        isProduction,
      ),
      s3PublicBaseUrl: process.env.S3_PUBLIC_BASE_URL ?? '',
      reportStorageMode,
      paymentProvider,
      stripeSecretKey: process.env.STRIPE_SECRET_KEY ?? '',
      emailProvider,
      emailFrom: requiredInProduction('EMAIL_FROM', process.env.EMAIL_FROM ?? '', isProduction),
      emailApiKey: requiredInProduction(
        'EMAIL_API_KEY',
        process.env.EMAIL_API_KEY ?? '',
        isProduction,
      ),
      fcmProjectId: requiredInProduction(
        'FCM_PROJECT_ID',
        process.env.FCM_PROJECT_ID ?? '',
        isProduction,
      ),
      fcmClientEmail: requiredInProduction(
        'FCM_CLIENT_EMAIL',
        process.env.FCM_CLIENT_EMAIL ?? '',
        isProduction,
      ),
      fcmPrivateKey: requiredInProduction(
        'FCM_PRIVATE_KEY',
        process.env.FCM_PRIVATE_KEY ?? '',
        isProduction,
      ),
    },
  };
}
