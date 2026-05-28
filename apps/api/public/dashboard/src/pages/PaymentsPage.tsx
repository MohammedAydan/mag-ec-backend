import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { Badge, DataTable, LoadError, PageLoading, Panel, layout } from '@/components/ui/AdminUi';
import { useAuth } from '@/lib/auth';
import { asArray, dateOf, money } from '@/lib/format';

export function PaymentsPage() {
  const { request } = useAuth();
  const result = useQuery({
    queryKey: ['payments'],
    queryFn: async () => {
      const [attempts, events, refunds] = await Promise.all([
        request('/payments/admin/attempts?limit=30').catch(() => []),
        request('/payments/admin/webhook-events?limit=30').catch(() => []),
        request('/payments/admin/refunds?limit=30').catch(() => []),
      ]);
      return { attempts: asArray(attempts), events: asArray(events), refunds: asArray(refunds) };
    },
  });

  if (result.isPending) return <PageShell title="Payments"><PageLoading /></PageShell>;
  if (result.isError) return <PageShell title="Payments"><LoadError error={result.error} /></PageShell>;

  return (
    <PageShell title="Payments" subtitle="Financial attempts, provider events, and refund reconciliation.">
      <Panel title="Payment attempts" subtitle="Payment visibility without exposing provider secrets.">
        <DataTable headers={['Order', 'Provider', 'Amount', 'Status', 'Created']} empty={!result.data.attempts.length}>
          {result.data.attempts.map((payment) => (
            <tr key={payment.id}>
              <td><strong>{payment.order?.orderNumber ?? payment.orderId ?? '—'}</strong></td>
              <td>{payment.provider ?? '—'}</td>
              <td>{money(payment.amount, payment.currencyCode || 'EGP')}</td>
              <td><Badge value={payment.status} /></td>
              <td>{dateOf(payment.createdAt)}</td>
            </tr>
          ))}
        </DataTable>
      </Panel>
      <section className={layout.grid2}>
        <Panel title="Webhook events" subtitle="Signed events and processing status">
          <DataTable headers={['Event', 'Status', 'Received']} empty={!result.data.events.length}>
            {result.data.events.slice(0, 10).map((event) => (
              <tr key={event.id ?? event.providerEventId}>
                <td>{event.eventType ?? event.providerEventId ?? 'Event'}</td>
                <td><Badge value={event.status} /></td>
                <td>{dateOf(event.createdAt)}</td>
              </tr>
            ))}
          </DataTable>
        </Panel>
        <Panel title="Refunds" subtitle="Refund allocations and results">
          <DataTable headers={['Order', 'Amount', 'Status']} empty={!result.data.refunds.length}>
            {result.data.refunds.slice(0, 10).map((refund) => (
              <tr key={refund.id}>
                <td>{refund.orderId ?? refund.id}</td>
                <td>{money(refund.amount, refund.currencyCode || 'EGP')}</td>
                <td><Badge value={refund.status} /></td>
              </tr>
            ))}
          </DataTable>
        </Panel>
      </section>
    </PageShell>
  );
}
