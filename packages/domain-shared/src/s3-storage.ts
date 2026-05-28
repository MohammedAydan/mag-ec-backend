import { createHash, createHmac } from 'node:crypto';

export interface S3StorageConfig {
  endpoint: string;
  region: string;
  accessKeyId: string;
  secretAccessKey: string;
  publicBucket: string;
  privateBucket: string;
  publicBaseUrl?: string;
}

export interface StoredObjectMetadata {
  contentLength: number;
  contentType: string | null;
  etag: string | null;
}

interface SignedRequestOptions {
  method: 'HEAD' | 'PUT';
  bucket: string;
  key: string;
  body?: Uint8Array | string;
  contentType?: string;
}

function encodePath(path: string): string {
  return path
    .split('/')
    .map((segment) => encodeURIComponent(segment))
    .join('/');
}

function hash(value: string | Uint8Array): string {
  return createHash('sha256').update(value).digest('hex');
}

function hmac(key: string | Uint8Array, value: string): Buffer {
  return createHmac('sha256', key).update(value).digest();
}

function formatAmzDate(date: Date): { dateStamp: string; amzDate: string } {
  const iso = date.toISOString().replace(/[:-]|\.\d{3}/g, '');
  return { dateStamp: iso.slice(0, 8), amzDate: iso };
}

function encodeQueryComponent(value: string): string {
  return encodeURIComponent(value).replace(
    /[!'()*]/g,
    (character) => `%${character.charCodeAt(0).toString(16).toUpperCase()}`,
  );
}

function canonicalQuery(entries: Array<[string, string]>): string {
  return entries
    .map(([key, value]) => [encodeQueryComponent(key), encodeQueryComponent(value)] as const)
    .sort(([leftKey, leftValue], [rightKey, rightValue]) =>
      leftKey === rightKey ? leftValue.localeCompare(rightValue) : leftKey.localeCompare(rightKey),
    )
    .map(([key, value]) => `${key}=${value}`)
    .join('&');
}

export class S3StorageClient {
  private readonly endpoint: URL;

  constructor(private readonly config: S3StorageConfig) {
    this.endpoint = new URL(config.endpoint);
  }

  createPublicObjectUrl(key: string): string {
    const baseUrl = this.config.publicBaseUrl?.trim();
    if (baseUrl) {
      return `${baseUrl.replace(/\/$/, '')}/${encodePath(key)}`;
    }

    return this.buildObjectUrl(this.config.publicBucket, key).toString();
  }

  createPresignedPutUrl(
    bucket: string,
    key: string,
    contentType: string,
    expiresSeconds = 900,
  ): string {
    return this.createPresignedUrl('PUT', bucket, key, expiresSeconds, contentType);
  }

  createPresignedGetUrl(bucket: string, key: string, expiresSeconds = 300): string {
    return this.createPresignedUrl('GET', bucket, key, expiresSeconds);
  }

  async headObject(bucket: string, key: string): Promise<StoredObjectMetadata | null> {
    const response = await fetch(this.signRequest({ method: 'HEAD', bucket, key }), {
      signal: AbortSignal.timeout(10_000),
    });
    if (response.status === 404) {
      return null;
    }

    if (!response.ok) {
      throw new Error(`Object storage HEAD request failed with status ${response.status}`);
    }

    const lengthHeader = response.headers.get('content-length');
    return {
      contentLength: lengthHeader ? Number.parseInt(lengthHeader, 10) : 0,
      contentType: response.headers.get('content-type'),
      etag: response.headers.get('etag')?.replaceAll('"', '') ?? null,
    };
  }

  async putObject(
    bucket: string,
    key: string,
    body: Uint8Array | string,
    contentType: string,
  ): Promise<void> {
    const response = await fetch(
      this.signRequest({ method: 'PUT', bucket, key, body, contentType }),
      { signal: AbortSignal.timeout(10_000) },
    );

    if (!response.ok) {
      throw new Error(`Object storage PUT request failed with status ${response.status}`);
    }
  }

  private createPresignedUrl(
    method: 'GET' | 'PUT',
    bucket: string,
    key: string,
    expiresSeconds: number,
    contentType?: string,
  ): string {
    if (!Number.isInteger(expiresSeconds) || expiresSeconds < 1 || expiresSeconds > 604800) {
      throw new Error('Presigned URL expiration must be between 1 and 604800 seconds');
    }

    const url = this.buildObjectUrl(bucket, key);
    const now = new Date();
    const { dateStamp, amzDate } = formatAmzDate(now);
    const credentialScope = `${dateStamp}/${this.config.region}/s3/aws4_request`;
    const signedHeaders = contentType ? 'content-type;host' : 'host';
    const queryEntries: Array<[string, string]> = [
      ['X-Amz-Algorithm', 'AWS4-HMAC-SHA256'],
      ['X-Amz-Credential', `${this.config.accessKeyId}/${credentialScope}`],
      ['X-Amz-Date', amzDate],
      ['X-Amz-Expires', String(expiresSeconds)],
      ['X-Amz-SignedHeaders', signedHeaders],
    ];
    const queryString = canonicalQuery(queryEntries);
    const canonicalHeaders = contentType
      ? `content-type:${contentType.trim()}\nhost:${url.host}\n`
      : `host:${url.host}\n`;
    const canonicalRequest = [
      method,
      url.pathname,
      queryString,
      canonicalHeaders,
      signedHeaders,
      'UNSIGNED-PAYLOAD',
    ].join('\n');
    const stringToSign = [
      'AWS4-HMAC-SHA256',
      amzDate,
      credentialScope,
      hash(canonicalRequest),
    ].join('\n');
    const signature = this.sign(dateStamp, stringToSign);

    url.search = `${queryString}&X-Amz-Signature=${signature}`;
    return url.toString();
  }

  private signRequest(options: SignedRequestOptions): Request {
    const url = this.buildObjectUrl(options.bucket, options.key);
    const now = new Date();
    const { dateStamp, amzDate } = formatAmzDate(now);
    const payloadHash = hash(options.body ?? '');
    const headers: Record<string, string> = {
      host: url.host,
      'x-amz-content-sha256': payloadHash,
      'x-amz-date': amzDate,
    };
    if (options.contentType) {
      headers['content-type'] = options.contentType;
    }

    const signedHeaderNames = Object.keys(headers).sort();
    const canonicalHeaders = signedHeaderNames
      .map((headerName) => `${headerName}:${headers[headerName]!.trim()}\n`)
      .join('');
    const signedHeaders = signedHeaderNames.join(';');
    const canonicalRequest = [
      options.method,
      url.pathname,
      '',
      canonicalHeaders,
      signedHeaders,
      payloadHash,
    ].join('\n');
    const credentialScope = `${dateStamp}/${this.config.region}/s3/aws4_request`;
    const stringToSign = [
      'AWS4-HMAC-SHA256',
      amzDate,
      credentialScope,
      hash(canonicalRequest),
    ].join('\n');
    const authorization =
      `AWS4-HMAC-SHA256 Credential=${this.config.accessKeyId}/${credentialScope}, ` +
      `SignedHeaders=${signedHeaders}, Signature=${this.sign(dateStamp, stringToSign)}`;

    return new Request(url, {
      method: options.method,
      headers: {
        ...headers,
        authorization,
      },
      body:
        options.method === 'PUT'
          ? typeof options.body === 'string'
            ? options.body
            : options.body
              ? Buffer.from(options.body)
              : undefined
          : undefined,
    });
  }

  private sign(dateStamp: string, stringToSign: string): string {
    const dateKey = hmac(`AWS4${this.config.secretAccessKey}`, dateStamp);
    const regionKey = hmac(dateKey, this.config.region);
    const serviceKey = hmac(regionKey, 's3');
    const signingKey = hmac(serviceKey, 'aws4_request');
    return createHmac('sha256', signingKey).update(stringToSign).digest('hex');
  }

  private buildObjectUrl(bucket: string, key: string): URL {
    const basePath = this.endpoint.pathname.replace(/\/$/, '');
    const url = new URL(this.endpoint.toString());
    url.pathname = `${basePath}/${encodePath(bucket)}/${encodePath(key)}`;
    url.search = '';
    return url;
  }
}
