/* Dynamic admin API payloads vary by module and are narrowed at render boundaries. */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export type DataRecord = Record<string, any>;

export function asArray(value: unknown): DataRecord[] {
  if (Array.isArray(value)) return value as DataRecord[];
  const record = value as DataRecord | null;
  if (Array.isArray(record?.items)) return record.items as DataRecord[];
  if (Array.isArray(record?.data)) return record.data as DataRecord[];
  return [];
}

export function nameOf(item: DataRecord | null | undefined): string {
  if (!item) return '—';
  return (
    item.name ??
    item.title ??
    item.displayName ??
    item.translations?.[0]?.name ??
    item.email ??
    item.key ??
    item.sku ??
    item.id ??
    '—'
  );
}

export function money(value: unknown, currency = 'EGP'): string {
  if (value === undefined || value === null) return '—';
  return new Intl.NumberFormat('en-EG', {
    style: 'currency',
    currency,
    maximumFractionDigits: 2,
  }).format(Number(value) / 100);
}

export function numberOf(value: unknown): string {
  return new Intl.NumberFormat('en-EG').format(Number(value ?? 0));
}

export function dateOf(value: unknown): string {
  if (!value) return '—';
  const date = new Date(String(value));
  return Number.isNaN(date.valueOf())
    ? String(value)
    : date.toLocaleString('en-EG', { dateStyle: 'medium', timeStyle: 'short' });
}

export function statusTone(value: unknown): 'success' | 'warning' | 'danger' | 'info' {
  const status = String(value ?? '').toUpperCase();
  if (/ACTIVE|PAID|SUCCEEDED|COMPLETED|PUBLISHED|DELIVERED|SENT|APPROVED|DISPATCHED|UP/.test(status)) {
    return 'success';
  }
  if (/FAILED|CANCELLED|REJECTED|ARCHIVED|REFUNDED|SUSPENDED|DOWN/.test(status)) return 'danger';
  if (/PENDING|PROCESSING|DRAFT|RESERVED|AWAITING|REQUESTED|LOW/.test(status)) return 'warning';
  return 'info';
}
