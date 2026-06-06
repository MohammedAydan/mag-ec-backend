import { useT } from '@/lib/i18n';

interface PageLoadingProps {
  label?: string;
}

export function PageLoading({ label }: PageLoadingProps) {
  const { t } = useT();
  const loadingLabel = label ?? t('common.syncingWorkspace');
  return (
    <div className="flex min-h-52 flex-col items-center justify-center gap-4 px-6 py-16">
      <div className="h-7 w-7 animate-spin rounded-full border-2 border-neutral-700 border-t-amber-500" />
      <div className="text-center">
        <p className="font-mono text-[10px] uppercase tracking-[0.18em] text-neutral-500">{loadingLabel}</p>
        <p className="mt-2 font-mono text-[11px] leading-relaxed text-neutral-600">
          {t('common.loadingOperational')}
        </p>
      </div>
    </div>
  );
}

export function LoadError({ error }: { error: unknown }) {
  const { t } = useT();
  const message = error instanceof Error ? error.message : t('error.loadError');
  return (
    <div
      role="alert"
      className="flex items-start gap-3 border border-red-400/30 bg-red-400/5 px-4 py-4 font-mono text-xs text-red-400"
    >
      <span className="flex-shrink-0 text-lg leading-none" aria-hidden="true">
        !
      </span>
      <span>{message}</span>
    </div>
  );
}
