import { ArrowLeft, Plus } from 'lucide-react';
import { useNavigate, useParams } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { StatCard } from '@/components/ui/StatCard';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useActionForm } from '@/lib/admin-actions';
import type { ActionOption } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, money, numberOf, type DataRecord } from '@/lib/format';

export function OrderDetailPage() {
  const navigate = useNavigate();
  const { orderId = '' } = useParams();
  const { request } = useAuth();
  const { t } = useT();
  const result = useQuery({
    queryKey: ['order', orderId],
    queryFn: async () => {
      const order = await request<DataRecord>(`/orders/admin/${orderId}`);
      const shipments = asArray(await request(`/orders/admin/${orderId}/shipments`).catch(() => []));
      return { order, shipments };
    },
    enabled: Boolean(orderId),
  });
  const action = useActionForm([['order', orderId], ['orders']]);

  if (result.isPending) {
    return (
      <PageShell title={t('orders.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (result.isError) {
    return (
      <PageShell title={t('orders.title')}>
        <LoadError error={result.error} />
      </PageShell>
    );
  }

  const { order, shipments } = result.data;
  const lines = asArray(order.lines ?? order.items);
  const orderLineOptions: ActionOption[] = lines.map((line: Record<string, unknown>) => ({
    value: String(line.id),
    label: String(line.productName ?? line.sku ?? line.name ?? line.id),
  }));

  return (
    <PageShell
      title={`${t('orders.title')} ${order.orderNumber ?? ''}`}
      subtitle={order.customerEmail ?? t('orders.orderDetail')}
      actions={
        <>
          <button className="btn-ghost" onClick={() => navigate('/orders')}>
            <ArrowLeft size={16} /> {t('common.back')}
          </button>
          <button
            className="btn-primary"
            onClick={() => action.open({
              title: t('orders.createShipment'),
              description: t('orders.createShipmentDesc'),
              path: `/orders/admin/${orderId}/shipments`,
              method: 'POST',
              submitLabel: t('orders.createShipment'),
              values: {
                carrierName: 'Carrier',
                trackingNumber: 'TRACKING-NUMBER',
                items: [{ orderLineId: '', quantity: 1 }],
              },
              fields: [
                { name: 'carrierName', label: t('orders.carrierName'), type: 'text', required: true, width: 'half' },
                { name: 'trackingNumber', label: t('orders.trackingNumber'), type: 'text', required: true, width: 'half' },
                {
                  name: 'items',
                  label: t('orders.shipmentLines'),
                  type: 'group-list',
                  required: true,
                  addLabel: t('orders.addOrderLine'),
                  itemLabel: t('orders.shipmentLine'),
                  defaultItem: { orderLineId: '', quantity: 1 },
                  fields: [
                    { name: 'orderLineId', label: t('orders.orderLine'), type: 'select', required: true, width: 'half', placeholder: t('orders.selectOrderLine'), options: orderLineOptions },
                    { name: 'quantity', label: t('orders.quantity'), type: 'number', required: true, width: 'half', min: 1, step: 1 },
                  ],
                },
              ],
            })}
          >
            <Plus size={16} /> {t('orders.createShipment')}
          </button>
        </>
      }
    >
      <div className="space-y-6 p-6">
        <Feedback message={action.feedback} />
        <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
          <StatCard label={t('orders.orderTotal')} value={money(order.grandTotal ?? order.totalAmount, order.currencyCode || 'EGP')} />
          <StatCard label={t('orders.payment')} value={String(order.paymentStatus ?? '—')} />
          <StatCard label={t('orders.orderStatus')} value={String(order.status ?? '—')} />
          <StatCard label={t('orders.items')} value={numberOf(lines.length)} />
        </div>

        <div className="grid gap-6 lg:grid-cols-2">
          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('orders.items')}</h2>
            <DataTable headers={[t('orders.product'), t('orders.quantity'), t('orders.unitPrice'), t('orders.total')]} empty={!lines.length}>
              {lines.map((line) => (
                <tr key={line.id ?? line.variantId}>
                  <td>
                    <strong className="block text-sm">{line.productName ?? line.title ?? line.variant?.sku ?? line.variantId}</strong>
                  </td>
                  <td>{numberOf(line.quantity)}</td>
                  <td>{money(line.unitPrice ?? line.unitAmount, order.currencyCode || 'EGP')}</td>
                  <td>{money(line.totalAmount ?? Number(line.unitPrice ?? 0) * Number(line.quantity ?? 0), order.currencyCode || 'EGP')}</td>
                </tr>
              ))}
            </DataTable>
          </div>

          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('orders.shipments')}</h2>
            <DataTable headers={[t('orders.carrierName'), t('orders.trackingNumber'), t('common.status'), '']} empty={!shipments.length}>
              {shipments.map((shipment) => (
                <tr key={shipment.id}>
                  <td>{shipment.carrierName ?? shipment.carrier ?? t('orders.carrierName')}</td>
                  <td>{shipment.trackingNumber ?? '—'}</td>
                  <td>
                    <span className={chipClass(shipment.status)}>
                      {String(shipment.status ?? '—')}
                    </span>
                  </td>
                  <td>
                    <div className="flex justify-end">
                      <button
                        className="btn-table-default"
                        onClick={() => action.open({
                          title: t('orders.updateShipmentStatus'),
                          description: t('orders.updateShipmentStatusDesc'),
                          path: `/orders/admin/${orderId}/shipments/${shipment.id}/status`,
                          method: 'PATCH',
                          submitLabel: t('orders.updateStatus'),
                          values: { status: String(shipment.status ?? 'SHIPPED') },
                          fields: [
                            {
                              name: 'status',
                              label: t('orders.shipmentStatus'),
                              type: 'radio',
                              options: [
                                { value: 'PENDING', label: t('common.pending') },
                                { value: 'SHIPPED', label: t('orders.shipped') },
                                { value: 'IN_TRANSIT', label: t('orders.inTransit') },
                                { value: 'DELIVERED', label: t('orders.delivered') },
                                { value: 'CANCELLED', label: t('orders.cancelled') },
                              ],
                            },
                          ],
                        })}
                      >
                        {t('common.update')}
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </DataTable>
          </div>
        </div>
      </div>
      <ConfirmModal action={action.action} busy={action.busy} error={action.error} fieldErrors={action.fieldErrors} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
