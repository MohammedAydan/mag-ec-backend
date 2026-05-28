/* eslint-disable react-refresh/only-export-components */
import { useState, type FormEvent, type ReactNode } from 'react';
import { AlertCircle, CheckCircle2, LoaderCircle, X } from 'lucide-react';
import { statusTone } from '@/lib/format';
import styles from './AdminUi.module.css';

export interface JsonAction {
  title: string;
  description: string;
  path: string;
  method: string;
  payload: unknown;
}

interface PanelProps {
  title: string;
  subtitle?: string;
  actions?: ReactNode;
  children: ReactNode;
  className?: string;
}

export function Panel({ title, subtitle, actions, children, className = '' }: PanelProps) {
  return (
    <section className={`${styles.panel} ${className}`}>
      <header className={styles.panelHead}>
        <div>
          <h2>{title}</h2>
          {subtitle && <p>{subtitle}</p>}
        </div>
        {actions && <div className={styles.panelActions}>{actions}</div>}
      </header>
      {children}
    </section>
  );
}

export function Badge({ value }: { value: unknown }) {
  const text = String(value ?? 'Unknown');
  return (
    <span className={`${styles.badge} ${styles[statusTone(value)]}`}>
      {text}
    </span>
  );
}

interface TableProps {
  headers: string[];
  children: ReactNode;
  empty?: boolean;
  emptyText?: string;
}

export function DataTable({ headers, children, empty = false, emptyText = 'No records available.' }: TableProps) {
  if (empty) return <EmptyState title={emptyText} />;
  return (
    <div className={styles.tableWrap}>
      <table className={styles.table}>
        <thead>
          <tr>{headers.map((header) => <th key={header}>{header}</th>)}</tr>
        </thead>
        <tbody>{children}</tbody>
      </table>
    </div>
  );
}

export function EmptyState({ title, description }: { title: string; description?: string }) {
  return (
    <div className={styles.empty}>
      <strong>{title}</strong>
      {description && <span>{description}</span>}
    </div>
  );
}

export function PageLoading() {
  return (
    <div className={styles.loading} aria-label="Loading dashboard data">
      <LoaderCircle className={styles.spin} size={22} />
      <span>Loading operational data…</span>
    </div>
  );
}

export function LoadError({ error }: { error: unknown }) {
  return (
    <div className={styles.error} role="alert">
      <AlertCircle size={18} />
      <span>{error instanceof Error ? error.message : 'Unable to load this view.'}</span>
    </div>
  );
}

export function Feedback({ message, tone = 'success' }: { message?: string | null; tone?: 'success' | 'danger' }) {
  if (!message) return null;
  return (
    <div className={`${styles.feedback} ${styles[tone]}`} role="status">
      {tone === 'success' ? <CheckCircle2 size={17} /> : <AlertCircle size={17} />}
      <span>{message}</span>
    </div>
  );
}

export function RowActions({ children }: { children: ReactNode }) {
  return <div className={styles.rowActions}>{children}</div>;
}

export function ActionButton({
  children,
  onClick,
  tone = 'secondary',
  disabled,
}: {
  children: ReactNode;
  onClick: () => void;
  tone?: 'primary' | 'secondary' | 'danger';
  disabled?: boolean;
}) {
  return (
    <button className={styles[tone]} type="button" onClick={onClick} disabled={disabled}>
      {children}
    </button>
  );
}

export function StatList({ children }: { children: ReactNode }) {
  return <dl className={styles.statList}>{children}</dl>;
}

export function StatRow({ label, children }: { label: string; children: ReactNode }) {
  return (
    <div className={styles.statRow}>
      <dt>{label}</dt>
      <dd>{children}</dd>
    </div>
  );
}

export function Tabs({
  items,
  value,
  onChange,
}: {
  items: Array<{ key: string; label: string }>;
  value: string;
  onChange: (key: string) => void;
}) {
  return (
    <div className={styles.tabs} role="tablist">
      {items.map((item) => (
        <button
          key={item.key}
          className={item.key === value ? styles.activeTab : styles.tab}
          type="button"
          role="tab"
          aria-selected={item.key === value}
          onClick={() => onChange(item.key)}
        >
          {item.label}
        </button>
      ))}
    </div>
  );
}

interface DialogProps {
  action: JsonAction | null;
  busy: boolean;
  error?: string | null;
  onClose: () => void;
  onSubmit: (payload: unknown) => Promise<void>;
}

export function JsonActionDialog({ action, busy, error, onClose, onSubmit }: DialogProps) {
  const [draft, setDraft] = useState('');
  const [validation, setValidation] = useState<string | null>(null);

  if (!action) return null;

  const initialValue = JSON.stringify(action.payload, null, 2);
  const content = draft || initialValue;

  const submit = async (event: FormEvent) => {
    event.preventDefault();
    setValidation(null);
    try {
      await onSubmit(JSON.parse(content));
    } catch (parseError) {
      if (parseError instanceof SyntaxError) setValidation('Payload must be valid JSON.');
    }
  };

  return (
    <div className={styles.modalBackdrop} role="presentation" onMouseDown={(event) => {
      if (event.target === event.currentTarget && !busy) onClose();
    }}>
      <section className={styles.dialog} role="dialog" aria-modal="true" aria-labelledby="dialog-title">
        <header>
          <div>
            <span className={styles.eyebrow}>Validated API action</span>
            <h2 id="dialog-title">{action.title}</h2>
            <p>{action.description}</p>
          </div>
          <button className={styles.close} type="button" aria-label="Close dialog" onClick={onClose} disabled={busy}>
            <X size={18} />
          </button>
        </header>
        <form onSubmit={(event) => void submit(event)}>
          <label className={styles.payload}>
            <span>Request payload (JSON)</span>
            <textarea
              value={content}
              onChange={(event) => setDraft(event.target.value)}
              rows={13}
              spellCheck={false}
            />
          </label>
          {(validation || error) && <div className={styles.error}>{validation || error}</div>}
          <footer>
            <button className={styles.secondary} type="button" onClick={onClose} disabled={busy}>Cancel</button>
            <button className={styles.primary} type="submit" disabled={busy}>
              {busy ? 'Executing…' : 'Execute action'}
            </button>
          </footer>
        </form>
      </section>
    </div>
  );
}

export const layout = styles;
