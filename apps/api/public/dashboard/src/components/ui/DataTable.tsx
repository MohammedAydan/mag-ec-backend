import type { ReactNode } from 'react';
import { useT } from '@/lib/i18n';

interface DataTableProps {
  headers: string[];
  children: ReactNode;
  empty?: boolean;
  emptyText?: string;
}

export function DataTable({ headers, children, empty = false, emptyText }: DataTableProps) {
  const { t } = useT();
  const emptyLabel = emptyText ?? t('table.noData');
  if (empty) {
    return (
      <div className="flex flex-col items-center justify-center px-6 py-16">
        <div className="rounded-sm border border-dashed border-neutral-700 px-8 py-6 text-center">
          <p className="font-mono text-xs uppercase tracking-[0.15em] text-neutral-500">{emptyLabel}</p>
        </div>
      </div>
    );
  }

  return (
    <div className="w-full overflow-x-auto">
      <table className="w-full border-collapse text-start whitespace-nowrap">
        <thead>
          <tr className="border-b border-neutral-800 bg-[#0a0a0a] font-mono text-[10px] uppercase tracking-widest text-neutral-400">
            {headers.map((header) => (
              <th key={header} className="px-6 py-4 font-normal">
                {header}
              </th>
            ))}
          </tr>
        </thead>
        <tbody className="divide-y divide-neutral-800 text-sm text-[#e5e2e1]">
          {children}
        </tbody>
      </table>
    </div>
  );
}
