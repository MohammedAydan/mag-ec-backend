export interface ApiError {
  message: string;
  code: string;
  statusCode: number;
  details?: unknown;
  fieldErrors?: Record<string, string[]>;
}

export class ApiRequestError extends Error {
  statusCode: number;
  code: string;
  fieldErrors?: Record<string, string[]>;

  constructor(err: ApiError) {
    super(err.message);
    this.name = 'ApiRequestError';
    this.statusCode = err.statusCode;
    this.code = err.code;
    this.fieldErrors = err.fieldErrors;
  }
}

export const BASE_URL = '/api/v1';

async function parseResponse<T>(response: Response): Promise<T> {
  if (response.status === 204) return undefined as T;

  const raw = await response.text();
  let body: unknown;
  try {
    body = raw ? JSON.parse(raw) : null;
  } catch {
    body = raw;
  }

  if (!response.ok) {
    const value = body as Record<string, unknown> | null;
    const nested = value?.error as Record<string, unknown> | undefined;
    throw new ApiRequestError({
      message:
        (typeof value?.message === 'string' && value.message) ||
        (typeof nested?.message === 'string' && nested.message) ||
        `${response.status} ${response.statusText}`,
      code: (typeof value?.code === 'string' && value.code) || 'REQUEST_FAILED',
      statusCode: response.status,
      details: value?.details,
      fieldErrors: value?.errors as Record<string, string[]> | undefined,
    });
  }

  return body as T;
}

export async function publicRequest<T>(path: string, init: RequestInit = {}): Promise<T> {
  const response = await fetch(`${BASE_URL}${path}`, {
    ...init,
    headers: {
      Accept: 'application/json',
      ...(init.body ? { 'Content-Type': 'application/json' } : {}),
      ...init.headers,
    },
  });
  return parseResponse<T>(response);
}

export async function tokenRequest<T>(
  path: string,
  accessToken: string,
  init: RequestInit = {},
): Promise<T> {
  const response = await fetch(`${BASE_URL}${path}`, {
    ...init,
    headers: {
      Accept: 'application/json',
      ...(init.body ? { 'Content-Type': 'application/json' } : {}),
      Authorization: `Bearer ${accessToken}`,
      ...init.headers,
    },
  });
  return parseResponse<T>(response);
}
