import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, RowActions } from '@/components/ui/AdminUi';
import { useJsonAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, dateOf } from '@/lib/format';

export function FulfillmentPage() {
  const { request } = useAuth();
  const returns = useQuery({
    queryKey: ['returns'],
    queryFn: async () => asArray(await request('/returns/admin').catch(() => [])),
  });
  const action = useJsonAction([['returns']]);

  if (returns.isPending) return <PageShell title="Fulfillment & returns"><PageLoading /></PageShell>;
  if (returns.isError) return <PageShell title="Fulfillment & returns"><LoadError error={returns.error} /></PageShell>;

  return (
    <PageShell title="Fulfillment & returns" subtitle="Shipment servicing and controlled return/refund workflows.">
      <Feedback message={action.feedback} />
      <Panel title="Return requests" subtitle={`${returns.data.length} return cases`}>
        <DataTable headers={['Return', 'Reason', 'Status', 'Created', '']} empty={!returns.data.length}>
          {returns.data.map((item) => (
            <tr key={item.id}>
              <td><strong>{item.returnNumber ?? item.id}</strong><small>{item.order?.orderNumber ?? item.orderId ?? ''}</small></td>
              <td>{item.reason ?? '—'}</td>
              <td><Badge value={item.status} /></td>
              <td>{dateOf(item.createdAt)}</td>
              <td>
                <RowActions>
                  <ActionButton onClick={() => action.open({
                    title: 'Review return request',
                    description: 'Approve or reject a return after operational review.',
                    path: `/returns/admin/${item.id}/review`,
                    method: 'POST',
                    payload: { decision: 'approve', reviewNotes: 'Approved after inspection.' },
                  })}>Review</ActionButton>
                  <ActionButton onClick={() => action.open({
                    title: 'Receive returned items',
                    description: 'Register condition and final disposition for returned inventory.',
                    path: `/returns/admin/${item.id}/receive`,
                    method: 'POST',
                    payload: { items: [{ returnRequestItemId: 'replace-with-return-item-id', receivedQuantity: 1, finalDisposition: 'RESTOCK', warehouseId: 'replace-with-warehouse-id' }] },
                  })}>Receive</ActionButton>
                  <ActionButton tone="primary" onClick={() => action.open({
                    title: 'Issue refund',
                    description: 'Create a refund linked to this accepted return request.',
                    path: `/returns/admin/${item.id}/refund`,
                    method: 'POST',
                    payload: { amount: 1000, reason: 'Approved return refund' },
                  })}>Refund</ActionButton>
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
