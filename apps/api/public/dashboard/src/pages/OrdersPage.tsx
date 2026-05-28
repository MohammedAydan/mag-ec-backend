import { useNavigate } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, RowActions } from '@/components/ui/AdminUi';
import { useJsonAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, dateOf, money } from '@/lib/format';

export function OrdersPage() {
  const navigate = useNavigate();
  const { request } = useAuth();
  const orders = useQuery({
    queryKey: ['orders'],
    queryFn: async () => asArray(await request('/orders/admin')),
  });
  const action = useJsonAction([['orders']]);

  if (orders.isPending) return <PageShell title="Orders"><PageLoading /></PageShell>;
  if (orders.isError) return <PageShell title="Orders"><LoadError error={orders.error} /></PageShell>;

  return (
    <PageShell title="Orders" subtitle="Customer purchases, payment standing, and service lifecycle.">
      <Feedback message={action.feedback} />
      <Panel title="Order register" subtitle={`${orders.data.length} orders returned`}>
        <DataTable headers={['Order', 'Customer', 'Total', 'Payment', 'Status', '']} empty={!orders.data.length}>
          {orders.data.map((order) => (
            <tr key={order.id}>
              <td><strong>{order.orderNumber ?? order.id}</strong><small>{dateOf(order.createdAt)}</small></td>
              <td>{order.customerEmail ?? order.user?.email ?? 'Guest'}</td>
              <td>{money(order.grandTotal ?? order.totalAmount ?? order.total, order.currencyCode || 'EGP')}</td>
              <td><Badge value={order.paymentStatus} /></td>
              <td><Badge value={order.status} /></td>
              <td>
                <RowActions>
                  <ActionButton onClick={() => navigate(`/orders/${order.id}`)}>View</ActionButton>
                  {!/CANCELLED|DELIVERED|COMPLETED/.test(String(order.status ?? '')) && (
                    <ActionButton tone="danger" onClick={() => action.open({
                      title: 'Cancel order',
                      description: 'Provide an auditable cancellation reason.',
                      path: `/orders/admin/${order.id}/cancel`,
                      method: 'POST',
                      payload: { reason: 'Cancelled by administrator request' },
                    })}>Cancel</ActionButton>
                  )}
                </RowActions>
              </td>
            </tr>
          ))}
        </DataTable>
      </Panel>
      <JsonActionDialog {...action} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
