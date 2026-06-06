import { ExternalLink, Wrench } from 'lucide-react';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { StatCard } from '@/components/ui/StatCard';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { useActionForm } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import type { DataRecord } from '@/lib/format';

export function SystemPage() {
  const { request } = useAuth();
  const { t } = useT();
  const queryClient = useQueryClient();
  const health = useQuery({
    queryKey: ['system-health'],
    queryFn: () => request<DataRecord>('/health/readiness', { anonymous: true }),
  });
  const action = useActionForm([['system-health']]);

  const openMaintenanceDialog = () => {
    action.open({
      title: t('system.runMaintenance'),
      description: t('system.runMaintenanceDesc'),
      path: '/system/maintenance/run',
      method: 'POST',
      submitLabel: t('system.runMaintenance'),
      values: {
        maintenanceSecret: '',
      },
      fields: [
        {
          name: 'maintenanceSecret',
          label: t('system.maintenanceSecret'),
          type: 'password',
          required: true,
          description: t('system.maintenanceSecretDesc'),
        },
      ],
      prepare: (values) => ({
        headers: {
          Authorization: `Bearer ${String(values.maintenanceSecret ?? '')}`,
        },
        body: {},
      }),
    });
  };

  if (health.isPending) {
    return (
      <PageShell title={t('system.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (health.isError) {
    return (
      <PageShell title={t('system.title')}>
        <LoadError error={health.error} />
      </PageShell>
    );
  }

  const value = health.data;
  const mode = value.taskExecution?.mode ?? 'unknown';

  return (
    <PageShell
      title={t('system.title')}
      subtitle={t('system.subtitle')}
      actions={
        <button
          className="inline-flex items-center gap-2 border border-neutral-700 bg-white text-black px-4 py-2 font-bold text-xs uppercase tracking-widest hover:bg-neutral-200 transition-colors"
          onClick={openMaintenanceDialog}
        >
          <Wrench size={16} /> {t('system.runMaintenance')}
        </button>
      }
    >
      <div className="space-y-6 p-6">
        <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
          <StatCard label={t('system.apiHealth')} value={String(value.status ?? 'unknown')} accent={value.status === 'up' ? 'success' : 'danger'} />
          <StatCard label={t('system.taskExecution')} value={String(mode)} />
          <StatCard label={t('system.redisRequired')} value={value.taskExecution?.redisRequired ? t('system.required') : t('system.notRequired')} />
          <StatCard label={t('system.documentation')} value={t('system.openapiDocs')} />
        </div>

        <div className="border border-neutral-800 bg-[#0f0f0f] p-6">
          <h2 className="mb-4 font-mono text-[10px] uppercase tracking-[0.15em] text-neutral-400">{t('system.deploymentGuidance')}</h2>
          <div className="divide-y divide-neutral-800 border border-neutral-800">
            {[
              { label: t('system.runtimeStatus'), value: String(value.status ?? 'unknown') },
              { label: t('system.directMode'), value: t('system.directModeValue') },
              { label: t('system.queueMode'), value: t('system.queueModeValue') },
              {
                label: t('system.apiDocumentation'),
                value: (
                  <a
                    href="/api/v1/docs"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-flex items-center gap-1 text-amber-400 hover:underline"
                  >
                    Open Swagger docs <ExternalLink size={13} />
                  </a>
                ),
              },
            ].map((row) => (
              <div key={row.label} className="flex items-center justify-between gap-4 px-5 py-3.5">
                <span className="text-sm text-neutral-400">{row.label}</span>
                <span className="text-sm font-semibold text-[#e5e2e1]">{row.value}</span>
              </div>
            ))}
          </div>
        </div>
      </div>

      <ConfirmModal
        action={action.action}
        busy={action.busy}
        error={action.error}
        fieldErrors={action.fieldErrors}
        onClose={action.close}
        onSubmit={async (values) => {
          await action.execute(values);
          await queryClient.invalidateQueries({ queryKey: ['system-health'] });
        }}
      />
    </PageShell>
  );
}
