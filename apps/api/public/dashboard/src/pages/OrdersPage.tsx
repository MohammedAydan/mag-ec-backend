import { useNavigate } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useActionForm } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, dateOf, money } from '@/lib/format';

export function OrdersPage() {
  const navigate = useNavigate();
  const { request } = useAuth();
  const { t } = useT();
  const orders = useQuery({
    queryKey: ['orders'],
    queryFn: async () => asArray(await request('/orders/admin')),
  });
  const action = useActionForm([['orders']]);

  if (orders.isPending) {
    return (
      <PageShell title={t('orders.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (orders.isError) {
    return (
      <PageShell title={t('orders.title')}>
        <LoadError error={orders.error} />
      </PageShell>
    );
  }

  return (
    <PageShell title={t('orders.title')} subtitle={t('orders.subtitle')}>
      <div className="space-y-4 p-6">
        <Feedback message={action.feedback} />
        <div className="flex items-center justify-between">
          <p className="text-sm text-neutral-400">{orders.data.length} {t('orders.ordersReturned')}</p>
        </div>
        <DataTable headers={[t('orders.orderNumber'), t('orders.customer'), t('orders.total'), t('orders.paymentStatus'), t('common.status'), '']} empty={!orders.data.length}>
          {orders.data.map((order) => (
            <tr key={order.id}>
              <td>
                <strong className="block text-sm">{order.orderNumber ?? order.id}</strong>
                <small className="block text-xs text-neutral-400">{dateOf(order.createdAt)}</small>
              </td>
              <td>{order.customerEmail ?? order.user?.email ?? t('common.guest')}</td>
              <td>{money(order.grandTotal ?? order.totalAmount ?? order.total, order.currencyCode || 'EGP')}</td>
              <td>
                <span className={chipClass(order.paymentStatus)}>
                  {String(order.paymentStatus ?? '—')}
                </span>
              </td>
              <td>
                <span className={chipClass(order.status)}>
                  {String(order.status ?? '—')}
                </span>
              </td>
              <td>
                <div className="flex justify-end gap-2">
                  <button className="btn-table-default" onClick={() => navigate(`/orders/${order.id}`)}>{t('common.view')}</button>
                  {!/CANCELLED|DELIVERED|COMPLETED/.test(String(order.status ?? '')) && (
                    <button
                      className="btn-table-danger"
                      onClick={() => action.open({
                        title: t('orders.cancelOrder'),
                        description: t('orders.cancelOrderDesc'),
                        path: `/orders/admin/${order.id}/cancel`,
                        method: 'POST',
                        tone: 'danger',
                        submitLabel: t('orders.cancelOrder'),
                        values: { reason: 'Cancelled by administrator request' },
                        fields: [
                          {
                            name: 'reason',
                            label: t('orders.cancellationReason'),
                            type: 'textarea',
                            required: true,
                            rows: 5,
                            description: t('orders.cancellationReasonDesc'),
                          },
                        ],
                      })}
                    >
                      {t('common.cancel')}
                    </button>
                  )}
                </div>
              </td>
            </tr>
          ))}
        </DataTable>
      </div>
      <ConfirmModal action={action.action} busy={action.busy} error={action.error} fieldErrors={action.fieldErrors} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
