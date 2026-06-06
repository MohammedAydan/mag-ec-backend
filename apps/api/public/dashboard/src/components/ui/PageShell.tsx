import type { ReactNode } from 'react';
import { useT } from '@/lib/i18n';

interface PageShellProps {
  title: string;
  subtitle?: string;
  actions?: ReactNode;
  children: ReactNode;
}

export function PageShell({ title, subtitle, actions, children }: PageShellProps) {
  const { t } = useT();
  return (
    <div className="space-y-8">
      <div className="flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
        <div>
          <p className="font-mono text-[10px] uppercase tracking-[0.24em] text-neutral-500">
            {t('common.operationalWorkspace')}
          </p>
          <h1 className="mt-2 font-serif text-3xl italic tracking-tight text-white">
            {title}
          </h1>
          {subtitle && (
            <p className="mt-2 font-mono text-xs uppercase tracking-widest text-neutral-500">
              {subtitle}
            </p>
          )}
        </div>
        {actions && <div className="flex flex-wrap items-center gap-2">{actions}</div>}
      </div>

      <div className="rounded-sm border border-neutral-800 bg-[#0f0f0f]">
        <div className="p-0">{children}</div>
      </div>
    </div>
  );
}
