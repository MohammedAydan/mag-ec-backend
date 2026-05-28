export interface RequestContextValue {
  requestId: string;
}

export interface ErrorResponseShape {
  error: string;
  code: string;
  details?: unknown;
  requestId?: string;
  path?: string;
  timestamp: string;
}

export * from './s3-storage.js';
