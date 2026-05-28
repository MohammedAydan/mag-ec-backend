import { ExternalLink, Wrench } from 'lucide-react';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { StatCard } from '@/components/ui/StatCard';
import { ActionButton, Badge, Feedback, LoadError, PageLoading, Panel, StatList, StatRow, layout } from '@/components/ui/AdminUi';
import { useAuth } from '@/lib/auth';
import type { DataRecord } from '@/lib/format';

export function SystemPage() {
  const { request } = useAuth();
  const queryClient = useQueryClient();
  const health = useQuery({
    queryKey: ['system-health'],
    queryFn: () => request<DataRecord>('/health/readiness', { anonymous: true }),
  });
  const runMaintenance = async () => {
    const secret = window.prompt('Enter the protected maintenance secret. It is not saved in the browser.');
    if (!secret) return;
    await request('/system/maintenance/run', {
      method: 'POST',
      headers: { Authorization: `Bearer ${secret}` },
      body: '{}',
    });
    await queryClient.invalidateQueries({ queryKey: ['system-health'] });
  };

  if (health.isPending) return <PageShell title="System operations"><PageLoading /></PageShell>;
  if (health.isError) return <PageShell title="System operations"><LoadError error={health.error} /></PageShell>;

  const value = health.data;
  const mode = value.taskExecution?.mode ?? 'unknown';

  return (
    <PageShell
      title="System operations"
      subtitle="Runtime health, execution mode, and protected maintenance controls."
      actions={<ActionButton tone="primary" onClick={() => void runMaintenance()}><Wrench size={16} /> Run maintenance</ActionButton>}
    >
      <Feedback message={undefined} />
      <section className={layout.grid4}>
        <StatCard label="API health" value={String(value.status ?? 'unknown')} accent={value.status === 'up' ? 'success' : 'danger'} />
        <StatCard label="Task execution" value={String(mode)} />
        <StatCard label="Redis required" value={value.taskExecution?.redisRequired ? 'Required' : 'Not required'} />
        <StatCard label="Documentation" value="OpenAPI" />
      </section>
      <Panel title="Deployment guidance" subtitle="Choose one operation mode per environment">
        <StatList>
          <StatRow label="Runtime status"><Badge value={value.status ?? 'unknown'} /></StatRow>
          <StatRow label="Direct mode"><strong>Vercel / low-ops hosting</strong></StatRow>
          <StatRow label="Queue mode"><strong>Redis + worker for throughput</strong></StatRow>
          <StatRow label="API documentation">
            <a href="/api/v1/docs" target="_blank" rel="noopener noreferrer">
              Open Swagger docs <ExternalLink size={13} />
            </a>
          </StatRow>
        </StatList>
      </Panel>
    </PageShell>
  );
}
