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
  details?: unknown;
  fieldErrors?: Record<string, string[]>;

  constructor(error: ApiError) {
    super(error.message);
    this.name = 'ApiRequestError';
    this.statusCode = error.statusCode;
    this.code = error.code;
    this.details = error.details;
    this.fieldErrors = error.fieldErrors;
  }
}

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL?.replace(/\/+$/, '') ?? '/api/v1';
const csrfCookieName = import.meta.env.VITE_CSRF_COOKIE_NAME ?? 'XSRF-TOKEN';
const requestTimeoutMs = Number(import.meta.env.VITE_REQUEST_TIMEOUT_MS) || 30_000;

type JsonLikeRecord = Record<string, unknown>;

function buildUrl(path: string): string {
  return path.startsWith('http://') || path.startsWith('https://')
    ? path
    : `${apiBaseUrl}${path}`;
}

function getCsrfToken(): string | null {
  const match = document.cookie.match(
    new RegExp(`(?:^|;\\s*)${encodeURIComponent(csrfCookieName)}=([^;]*)`)
  );
  return match ? decodeURIComponent(match[1]) : null;
}

function shouldSetJsonContentType(body: RequestInit['body']): boolean {
  return Boolean(body) && !(body instanceof FormData) && !(body instanceof URLSearchParams);
}

function sanitizeErrorMessage(message: string): string {
  if (message.length > 500) return message.slice(0, 500) + '…';
  return message;
}

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
    const value = (body ?? null) as JsonLikeRecord | null;
    const nested = value?.error as JsonLikeRecord | undefined;

    const message =
      (typeof value?.message === 'string' && value.message) ||
      (typeof nested?.message === 'string' && nested.message) ||
      (response.status === 429 ? 'Too many requests. Please wait and try again.' : '') ||
      (response.status === 503 ? 'Service temporarily unavailable. Please try again later.' : '') ||
      `Request failed (${response.status})`;

    throw new ApiRequestError({
      message: sanitizeErrorMessage(message),
      code:
        (typeof value?.code === 'string' && value.code) ||
        (typeof nested?.code === 'string' && nested.code) ||
        'REQUEST_FAILED',
      statusCode: response.status,
      details: value?.details ?? nested?.details,
      fieldErrors:
        (value?.errors as Record<string, string[]> | undefined) ??
        (nested?.errors as Record<string, string[]> | undefined),
    });
  }

  return body as T;
}

function buildHeaders(init: RequestInit, accessToken?: string, anonymous = false): HeadersInit {
  const headers: Record<string, string> = {
    Accept: 'application/json',
  };

  if (shouldSetJsonContentType(init.body)) {
    headers['Content-Type'] = 'application/json';
  }

  if (accessToken) {
    headers['Authorization'] = `Bearer ${accessToken}`;
  }

  if (!anonymous) {
    const csrf = getCsrfToken();
    if (csrf) {
      headers['X-XSRF-TOKEN'] = csrf;
    }
  }

  return { ...headers, ...((init.headers as Record<string, string>) ?? {}) };
}

async function fetchWithTimeout(url: string, init: RequestInit, timeoutMs: number): Promise<Response> {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), timeoutMs);

  try {
    const response = await fetch(url, { ...init, signal: controller.signal });
    return response;
  } catch (error) {
    if (error instanceof DOMException && error.name === 'AbortError') {
      throw new ApiRequestError({
        message: 'Request timed out. Please check your connection and try again.',
        code: 'REQUEST_TIMEOUT',
        statusCode: 408,
      });
    }
    throw error;
  } finally {
    clearTimeout(timer);
  }
}

export async function publicRequest<T>(path: string, init: RequestInit = {}): Promise<T> {
  const response = await fetchWithTimeout(buildUrl(path), {
    ...init,
    headers: buildHeaders(init, undefined, true),
  }, requestTimeoutMs);

  return parseResponse<T>(response);
}

export async function tokenRequest<T>(
  path: string,
  accessToken: string,
  init: RequestInit = {},
): Promise<T> {
  const response = await fetchWithTimeout(buildUrl(path), {
    ...init,
    headers: buildHeaders(init, accessToken),
  }, requestTimeoutMs);

  return parseResponse<T>(response);
}
