import { Plus } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, layout } from '@/components/ui/AdminUi';
import { useJsonAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, dateOf, numberOf } from '@/lib/format';

export function InventoryPage() {
  const { request } = useAuth();
  const data = useQuery({
    queryKey: ['inventory'],
    queryFn: async () => {
      const [levels, movements, reservations] = await Promise.all([
        request('/inventory/admin/levels').catch(() => []),
        request('/inventory/admin/movements?limit=20').catch(() => []),
        request('/inventory/admin/reservations?limit=20').catch(() => []),
      ]);
      return { stock: asArray(levels), movements: asArray(movements), reservations: asArray(reservations) };
    },
  });
  const action = useJsonAction([['inventory']]);

  if (data.isPending) return <PageShell title="Inventory control"><PageLoading /></PageShell>;
  if (data.isError) return <PageShell title="Inventory control"><LoadError error={data.error} /></PageShell>;

  return (
    <PageShell
      title="Inventory control"
      subtitle="Warehouse balances, active reservations, and movement accountability."
      actions={<ActionButton tone="primary" onClick={() => action.open({
        title: 'Adjust stock',
        description: 'Record an auditable warehouse stock movement.',
        path: '/inventory/admin/adjustments',
        method: 'POST',
        payload: {
          warehouseId: 'replace-with-warehouse-id',
          variantId: 'replace-with-variant-id',
          quantityChanged: 10,
          type: 'RECEIPT',
          reason: 'Initial receiving',
        },
      })}><Plus size={16} /> Adjust stock</ActionButton>}
    >
      <Feedback message={action.feedback} />
      <section className={layout.grid2}>
        <Panel title="Stock levels" subtitle={`${data.data.stock.length} monitored balances`}>
          <DataTable headers={['Variant', 'On hand', 'Reserved', 'Signal', 'Available']} empty={!data.data.stock.length}>
            {data.data.stock.map((stock) => {
              const available = Number(stock.quantityOnHand ?? 0) - Number(stock.quantityReserved ?? 0);
              return (
                <tr key={`${stock.variantId}-${stock.warehouseId}`}>
                  <td><strong>{stock.variant?.sku ?? stock.sku ?? stock.variantId}</strong><small>{stock.warehouse?.name ?? stock.warehouseId ?? 'Default warehouse'}</small></td>
                  <td>{numberOf(stock.quantityOnHand)}</td>
                  <td>{numberOf(stock.quantityReserved)}</td>
                  <td><Badge value={available <= 5 ? 'Low stock' : 'Available'} /></td>
                  <td>{numberOf(available)}</td>
                </tr>
              );
            })}
          </DataTable>
        </Panel>
        <Panel title="Movement history" subtitle="Latest inventory journal entries">
          <DataTable headers={['Date', 'Type', 'Delta', 'Reference']} empty={!data.data.movements.length}>
            {data.data.movements.slice(0, 8).map((movement) => (
              <tr key={movement.id ?? movement.createdAt}>
                <td>{dateOf(movement.createdAt)}</td>
                <td>{movement.type ?? 'Movement'}</td>
                <td>{numberOf(movement.quantityChanged)}</td>
                <td>{movement.reason ?? movement.referenceId ?? '—'}</td>
              </tr>
            ))}
          </DataTable>
        </Panel>
      </section>
      <Panel title="Reservations" subtitle="Outstanding and recently resolved stock allocations">
        <DataTable headers={['Variant', 'Qty', 'Status', 'Expires', 'Customer']} empty={!data.data.reservations.length}>
          {data.data.reservations.map((reservation) => (
            <tr key={reservation.id}>
              <td><strong>{reservation.variant?.sku ?? reservation.variantId}</strong><small>{reservation.warehouse?.name ?? reservation.warehouseId}</small></td>
              <td>{numberOf(reservation.quantity)}</td>
              <td><Badge value={reservation.status} /></td>
              <td>{dateOf(reservation.expiresAt)}</td>
              <td>{reservation.user?.email ?? 'Guest'}</td>
            </tr>
          ))}
        </DataTable>
      </Panel>
      <JsonActionDialog {...action} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
