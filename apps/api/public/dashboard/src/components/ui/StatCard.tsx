import type { ReactNode } from 'react';
import styles from './StatCard.module.css';

interface StatCardProps {
  label: string;
  value: string | number;
  delta?: string;
  deltaPositive?: boolean;
  icon?: ReactNode;
  accent?: 'default' | 'success' | 'warning' | 'danger' | 'info';
}

export function StatCard({ label, value, delta, deltaPositive, icon, accent = 'default' }: StatCardProps) {
  return (
    <div className={`${styles.card} ${styles[accent]}`}>
      {icon && <div className={styles.icon} aria-hidden>{icon}</div>}
      <div className={styles.body}>
        <span className={styles.label}>{label}</span>
        <span className={styles.value}>{value}</span>
        {delta && (
          <span className={`${styles.delta} ${deltaPositive ? styles.positive : styles.negative}`}>
            {deltaPositive ? '↑' : '↓'} {delta}
          </span>
        )}
      </div>
    </div>
  );
}
