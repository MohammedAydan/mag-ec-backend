import { ArrowLeft, Plus } from 'lucide-react';
import { useNavigate, useParams } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { StatCard } from '@/components/ui/StatCard';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, RowActions, layout } from '@/components/ui/AdminUi';
import { useJsonAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, money, numberOf, type DataRecord } from '@/lib/format';

export function OrderDetailPage() {
  const navigate = useNavigate();
  const { orderId = '' } = useParams();
  const { request } = useAuth();
  const result = useQuery({
    queryKey: ['order', orderId],
    queryFn: async () => {
      const order = await request<DataRecord>(`/orders/admin/${orderId}`);
      const shipments = asArray(await request(`/orders/admin/${orderId}/shipments`).catch(() => []));
      return { order, shipments };
    },
    enabled: Boolean(orderId),
  });
  const action = useJsonAction([['order', orderId], ['orders']]);

  if (result.isPending) return <PageShell title="Order"><PageLoading /></PageShell>;
  if (result.isError) return <PageShell title="Order"><LoadError error={result.error} /></PageShell>;

  const { order, shipments } = result.data;
  const lines = asArray(order.lines ?? order.items);

  return (
    <PageShell
      title={`Order ${order.orderNumber ?? ''}`}
      subtitle={order.customerEmail ?? 'Customer order'}
      actions={<>
        <ActionButton onClick={() => navigate('/orders')}><ArrowLeft size={16} /> Back</ActionButton>
        <ActionButton tone="primary" onClick={() => action.open({
          title: 'Create shipment',
          description: 'Register carrier tracking and the order lines being shipped.',
          path: `/orders/admin/${orderId}/shipments`,
          method: 'POST',
          payload: { carrierName: 'Carrier', trackingNumber: 'TRACKING-NUMBER', items: [{ orderLineId: 'replace-with-order-line-id', quantity: 1 }] },
        })}><Plus size={16} /> Create shipment</ActionButton>
      </>}
    >
      <Feedback message={action.feedback} />
      <section className={layout.grid4}>
        <StatCard label="Order total" value={money(order.grandTotal ?? order.totalAmount, order.currencyCode || 'EGP')} />
        <StatCard label="Payment" value={String(order.paymentStatus ?? '—')} />
        <StatCard label="Order status" value={String(order.status ?? '—')} />
        <StatCard label="Items" value={numberOf(lines.length)} />
      </section>
      <section className={layout.grid2}>
        <Panel title="Items" subtitle="Snapshot recorded at checkout">
          <DataTable headers={['Product', 'Qty', 'Price', 'Total']} empty={!lines.length}>
            {lines.map((line) => (
              <tr key={line.id ?? line.variantId}>
                <td><strong>{line.productName ?? line.title ?? line.variant?.sku ?? line.variantId}</strong></td>
                <td>{numberOf(line.quantity)}</td>
                <td>{money(line.unitPrice ?? line.unitAmount, order.currencyCode || 'EGP')}</td>
                <td>{money(line.totalAmount ?? Number(line.unitPrice ?? 0) * Number(line.quantity ?? 0), order.currencyCode || 'EGP')}</td>
              </tr>
            ))}
          </DataTable>
        </Panel>
        <Panel title="Shipments" subtitle="Tracking and delivery">
          <DataTable headers={['Carrier', 'Tracking', 'Status', '']} empty={!shipments.length}>
            {shipments.map((shipment) => (
              <tr key={shipment.id}>
                <td>{shipment.carrierName ?? shipment.carrier ?? 'Carrier'}</td>
                <td>{shipment.trackingNumber ?? '—'}</td>
                <td><Badge value={shipment.status} /></td>
                <td>
                  <RowActions>
                    <ActionButton onClick={() => action.open({
                      title: 'Update shipment status',
                      description: 'Move a shipment through its delivery lifecycle.',
                      path: `/orders/admin/${orderId}/shipments/${shipment.id}/status`,
                      method: 'PATCH',
                      payload: { status: 'SHIPPED' },
                    })}>Update</ActionButton>
                  </RowActions>
                </td>
              </tr>
            ))}
          </DataTable>
        </Panel>
      </section>
      <JsonActionDialog {...action} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
