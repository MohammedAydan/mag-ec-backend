import type { ReactNode } from 'react';

interface StatCardProps {
  label: string;
  value: string | number;
  delta?: string;
  deltaPositive?: boolean;
  icon?: ReactNode;
  accent?: 'success' | 'warning' | 'danger' | 'primary';
  badge?: string;
}

const accentBorder: Record<string, string> = {
  success: 'hover:border-green-400',
  warning: 'hover:border-amber-500',
  danger: 'hover:border-red-400',
  primary: 'hover:border-amber-500',
};

const accentIconBg: Record<string, string> = {
  success: 'bg-green-400/10 text-green-400 border-green-400/20',
  warning: 'bg-amber-500/10 text-amber-500 border-amber-500/20',
  danger: 'bg-red-400/10 text-red-400 border-red-400/20',
  primary: 'bg-amber-500/10 text-amber-500 border-amber-500/20',
};

export function StatCard({ label, value, delta, deltaPositive, icon, accent = 'primary', badge }: StatCardProps) {
  return (
    <div
      className={`group relative overflow-hidden border border-neutral-800 bg-[#0f0f0f] p-6 transition-all duration-300 ${accentBorder[accent]}`}
    >
      <div className="mb-4 flex items-start justify-between">
        <span className="font-mono text-[10px] uppercase tracking-widest text-neutral-400">{label}</span>
        {badge && (
          <span className="bg-neutral-900 px-2 py-0.5 font-mono text-[10px] uppercase tracking-widest text-neutral-400">
            {badge}
          </span>
        )}
      </div>
      <div className="mb-2 text-4xl font-light text-white">{value}</div>
      {delta && (
        <div
          className={`flex items-center gap-1 font-mono text-[10px] ${
            deltaPositive ? 'text-green-400' : 'text-red-400'
          }`}
        >
          <span>{deltaPositive ? '↑' : '↓'}</span>
          <span>{delta}</span>
        </div>
      )}
      {icon && (
        <div
          className={`mt-3 flex h-10 w-10 items-center justify-center border ${accentIconBg[accent]}`}
        >
          {icon}
        </div>
      )}
    </div>
  );
}
