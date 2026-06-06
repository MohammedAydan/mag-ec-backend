import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { DataTable } from '@/components/ui/DataTable';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, dateOf, money } from '@/lib/format';

export function PaymentsPage() {
  const { request } = useAuth();
  const { t } = useT();
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

  if (result.isPending) {
    return (
      <PageShell title={t('payments.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (result.isError) {
    return (
      <PageShell title={t('payments.title')}>
        <LoadError error={result.error} />
      </PageShell>
    );
  }

  return (
    <PageShell title={t('payments.title')} subtitle={t('payments.subtitle')}>
      <div className="space-y-6 p-6">
        <div className="space-y-2">
          <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('payments.paymentAttempts')}</h2>
          <DataTable headers={[t('payments.order'), t('payments.provider'), t('payments.amount'), t('common.status'), t('payments.created')]} empty={!result.data.attempts.length}>
            {result.data.attempts.map((payment) => (
              <tr key={payment.id}>
                <td>
                  <strong className="block text-sm">{payment.order?.orderNumber ?? payment.orderId ?? t('common.unknown')}</strong>
                </td>
                <td>{payment.provider ?? t('common.unknown')}</td>
                <td>{money(payment.amount, payment.currencyCode || 'EGP')}</td>
                <td>
                  <span className={chipClass(payment.status)}>
                    {String(payment.status ?? t('common.unknown'))}
                  </span>
                </td>
                <td>{dateOf(payment.createdAt)}</td>
              </tr>
            ))}
          </DataTable>
        </div>

        <div className="grid gap-6 lg:grid-cols-2">
          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('payments.webhookEvents')}</h2>
            <DataTable headers={[t('payments.event'), t('common.status'), t('payments.received')]} empty={!result.data.events.length}>
              {result.data.events.slice(0, 10).map((event) => (
                <tr key={event.id ?? event.providerEventId}>
                  <td>{event.eventType ?? event.providerEventId ?? t('payments.event')}</td>
                  <td>
                    <span className={chipClass(event.status)}>
                      {String(event.status ?? t('common.unknown'))}
                    </span>
                  </td>
                  <td>{dateOf(event.createdAt)}</td>
                </tr>
              ))}
            </DataTable>
          </div>

          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('payments.refundsHeader')}</h2>
            <DataTable headers={[t('payments.order'), t('payments.amount'), t('common.status')]} empty={!result.data.refunds.length}>
              {result.data.refunds.slice(0, 10).map((refund) => (
                <tr key={refund.id}>
                  <td>{refund.orderId ?? refund.id}</td>
                  <td>{money(refund.amount, refund.currencyCode || 'EGP')}</td>
                  <td>
                    <span className={chipClass(refund.status)}>
                      {String(refund.status ?? t('common.unknown'))}
                    </span>
                  </td>
                </tr>
              ))}
            </DataTable>
          </div>
        </div>
      </div>
    </PageShell>
  );
}
