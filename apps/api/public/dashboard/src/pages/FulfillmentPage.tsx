import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useActionForm } from '@/lib/admin-actions';
import type { ActionOption } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, dateOf } from '@/lib/format';

export function FulfillmentPage() {
  const { request } = useAuth();
  const { t } = useT();
  const returns = useQuery({
    queryKey: ['returns'],
    queryFn: async () => asArray(await request('/returns/admin').catch(() => [])),
  });
  const warehouseQuery = useQuery({
    queryKey: ['returns', 'warehouses'],
    queryFn: async () => asArray(await request('/inventory/admin/levels').catch(() => [])),
    staleTime: Infinity,
  });
  const action = useActionForm([['returns']]);

  if (returns.isPending) {
    return (
      <PageShell title={t('fulfillment.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (returns.isError) {
    return (
      <PageShell title={t('fulfillment.title')}>
        <LoadError error={returns.error} />
      </PageShell>
    );
  }

  // Extract unique warehouse options from stock levels
  const warehouseMap = new Map<string, string>();
  (warehouseQuery.data ?? []).forEach((s: Record<string, unknown>) => {
    if (s.warehouseId && !warehouseMap.has(String(s.warehouseId))) {
      const wh = s.warehouse as Record<string, unknown> | undefined;
      warehouseMap.set(String(s.warehouseId), String(wh?.name ?? wh?.key ?? s.warehouseId));
    }
  });
  const warehouseOptions: ActionOption[] = Array.from(warehouseMap.entries()).map(([id, name]) => ({
    value: id,
    label: name,
  }));

  return (
    <PageShell title={t('fulfillment.title')} subtitle={t('fulfillment.subtitle')}>
      <div className="space-y-4 p-6">
        <Feedback message={action.feedback} />
        <div className="flex items-center justify-between">
          <p className="text-sm text-neutral-400">{returns.data.length} {t('fulfillment.returnCases')}</p>
        </div>
        <DataTable headers={[t('fulfillment.returnHeader'), t('fulfillment.reasonHeader'), t('common.status'), t('fulfillment.createdHeader'), '']} empty={!returns.data.length}>
          {returns.data.map((item) => (
            <tr key={item.id}>
              <td>
                <strong className="block text-sm">{item.returnNumber ?? item.id}</strong>
                <small className="block text-xs text-neutral-400">{item.order?.orderNumber ?? item.orderId ?? ''}</small>
              </td>
              <td>{item.reason ?? t('common.unknown')}</td>
              <td>
                <span className={chipClass(item.status)}>
                  {String(item.status ?? t('common.unknown'))}
                </span>
              </td>
              <td>{dateOf(item.createdAt)}</td>
              <td>
                <div className="flex justify-end gap-1.5">
                  <button className="btn-table-default" onClick={() => action.open({
                    title: t('fulfillment.reviewReturn'),
                    description: t('fulfillment.reviewReturnDesc'),
                    path: `/returns/admin/${item.id}/review`,
                    method: 'POST',
                    submitLabel: t('fulfillment.saveReview'),
                    values: { decision: 'approve', reviewNotes: 'Approved after inspection.' },
                    fields: [
                      {
                        name: 'decision',
                        label: t('fulfillment.decision'),
                        type: 'radio',
                        options: [
                          { value: 'approve', label: t('fulfillment.approveReturn') },
                          { value: 'reject', label: t('fulfillment.rejectReturn') },
                        ],
                      },
                      {
                        name: 'reviewNotes',
                        label: t('fulfillment.reviewNotes'),
                        type: 'textarea',
                        rows: 4,
                        required: true,
                        description: t('fulfillment.reviewNotesDesc'),
                      },
                    ],
                  })}>{t('fulfillment.reviewButton')}</button>
                  <button className="btn-table-default" onClick={() => action.open({
                    title: t('fulfillment.receiveItems'),
                    description: t('fulfillment.receiveItemsDesc'),
                    path: `/returns/admin/${item.id}/receive`,
                    method: 'POST',
                    submitLabel: t('fulfillment.receiveItems'),
                    values: {
                      items: [
                        {
                          returnRequestItemId: '',
                          receivedQuantity: 1,
                          finalDisposition: 'RESTOCK',
                          warehouseId: '',
                        },
                      ],
                    },
                    fields: [
                      {
                        name: 'items',
                        label: t('fulfillment.returnedItems'),
                        type: 'group-list',
                        required: true,
                        addLabel: t('fulfillment.addReturnedItem'),
                        itemLabel: t('fulfillment.returnLine'),
                        defaultItem: {
                          returnRequestItemId: '',
                          receivedQuantity: 1,
                          finalDisposition: 'RESTOCK',
                          warehouseId: '',
                        },
                        fields: [
                          { name: 'returnRequestItemId', label: t('fulfillment.returnItem'), type: 'text', required: true, width: 'half', placeholder: t('fulfillment.returnItemPlaceholder') },
                          { name: 'warehouseId', label: t('fulfillment.destinationWarehouse'), type: 'select', required: true, width: 'half', placeholder: t('fulfillment.selectDestWarehouse'), options: warehouseOptions },
                          { name: 'receivedQuantity', label: t('fulfillment.receivedQuantity'), type: 'number', required: true, width: 'half', step: 1, min: 1 },
                          {
                            name: 'finalDisposition',
                            label: t('fulfillment.finalDisposition'),
                            type: 'radio',
                            width: 'half',
                            options: [
                              { value: 'RESTOCK', label: t('fulfillment.restock') },
                              { value: 'DISCARD', label: t('fulfillment.discard') },
                              { value: 'QUARANTINE', label: t('fulfillment.quarantine') },
                            ],
                          },
                        ],
                      },
                    ],
                  })}>{t('fulfillment.receiveButton')}</button>
                  <button className="btn-table-danger" onClick={() => action.open({
                    title: t('fulfillment.issueRefund'),
                    description: t('fulfillment.issueRefundDesc'),
                    path: `/returns/admin/${item.id}/refund`,
                    method: 'POST',
                    tone: 'danger',
                    submitLabel: t('fulfillment.issueRefund'),
                    values: { amount: 1000, reason: 'Approved return refund' },
                    fields: [
                      { name: 'amount', label: t('fulfillment.refundAmount'), type: 'number', required: true, width: 'half', min: 1, step: 1 },
                      {
                        name: 'reason',
                        label: t('fulfillment.refundReason'),
                        type: 'textarea',
                        required: true,
                        rows: 4,
                        width: 'full',
                      },
                    ],
                  })}>{t('fulfillment.refundButton')}</button>
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
