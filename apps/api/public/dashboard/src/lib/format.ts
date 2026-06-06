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

export function chipColor(status: unknown): 'success' | 'warning' | 'danger' | 'default' {
  const tone = statusTone(status);
  if (tone === 'info') return 'default';
  return tone;
}

export function chipClass(status: unknown): string {
  const base = 'inline-flex px-2 py-0.5 font-mono text-[10px] uppercase tracking-widest';
  const color = chipColor(status);
  const map: Record<string, string> = {
    success: `${base} bg-green-400/10 text-green-400 border border-green-400/20`,
    warning: `${base} bg-amber-500/10 text-amber-400 border border-amber-500/20`,
    danger: `${base} bg-red-400/10 text-red-400 border border-red-400/20`,
    default: `${base} bg-neutral-700 text-neutral-300 border border-neutral-600`,
  };
  return map[color] ?? map.default;
}
