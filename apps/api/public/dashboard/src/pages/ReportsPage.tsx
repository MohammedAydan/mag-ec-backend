import { Download, Plus } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { StatCard } from '@/components/ui/StatCard';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, layout } from '@/components/ui/AdminUi';
import { useJsonAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, dateOf, money, numberOf, type DataRecord } from '@/lib/format';

export function ReportsPage() {
  const { request } = useAuth();
  const reports = useQuery({
    queryKey: ['reports'],
    queryFn: async () => {
      const [sales, top, inventory, exports] = await Promise.all([
        request<DataRecord>('/reports/admin/sales-summary').catch(() => ({} as DataRecord)),
        request('/reports/admin/top-products').catch(() => []),
        request<DataRecord>('/reports/admin/inventory-kpis').catch(() => ({} as DataRecord)),
        request('/reports/admin/exports?limit=20').catch(() => []),
      ]);
      return { sales, top: asArray(top), inventory, exports: asArray(exports) };
    },
  });
  const action = useJsonAction([['reports']]);

  if (reports.isPending) return <PageShell title="Analytics & exports"><PageLoading /></PageShell>;
  if (reports.isError) return <PageShell title="Analytics & exports"><LoadError error={reports.error} /></PageShell>;

  const data = reports.data;

  const download = async (exportId: string) => {
    const response = await request<{ url?: string; downloadUrl?: string }>(`/reports/admin/exports/${exportId}/download`);
    const destination = response.url ?? response.downloadUrl;
    if (destination) window.open(destination, '_blank', 'noopener');
  };

  return (
    <PageShell
      title="Analytics & exports"
      subtitle="Business reporting and downloadable operational extracts."
      actions={<ActionButton tone="primary" onClick={() => action.open({
        title: 'Create report export',
        description: 'Queue a report export in the requested machine-readable format.',
        path: '/reports/admin/exports',
        method: 'POST',
        payload: { reportType: 'sales_summary', format: 'csv' },
      })}><Plus size={16} /> Create export</ActionButton>}
    >
      <Feedback message={action.feedback} />
      <section className={layout.grid4}>
        <StatCard label="Revenue" value={money(data.sales.orders?._sum?.grandTotalAmount ?? data.sales.grossRevenue ?? data.sales.revenue, data.sales.currencyCode || 'EGP')} />
        <StatCard label="Orders" value={numberOf(data.sales.orders?._count?._all ?? data.sales.totalOrders ?? data.sales.ordersCount)} />
        <StatCard label="Reserved units" value={numberOf(data.inventory.stock?._sum?.quantityReserved ?? data.inventory.quantityReserved)} />
        <StatCard label="Exports" value={numberOf(data.exports.length)} />
      </section>
      <section className={layout.grid2}>
        <Panel title="Top products" subtitle="Units sold performance">
          <DataTable headers={['Product', 'Units / revenue']} empty={!data.top.length}>
            {data.top.slice(0, 8).map((product) => (
              <tr key={product.id ?? product.productId}>
                <td><strong>{product.name ?? product.product?.name ?? product.productId ?? 'Product'}</strong></td>
                <td>{numberOf(product._sum?.quantity ?? product.quantity ?? product.unitsSold ?? product.revenue ?? 0)}</td>
              </tr>
            ))}
          </DataTable>
        </Panel>
        <Panel title="Report exports" subtitle="Stored securely for download">
          <DataTable headers={['Report', 'Status', '']} empty={!data.exports.length}>
            {data.exports.map((item) => (
              <tr key={item.id}>
                <td><strong>{item.reportType ?? item.type}</strong><small>{dateOf(item.createdAt)}</small></td>
                <td><Badge value={item.status} /></td>
                <td>{item.status === 'COMPLETED' && <ActionButton tone="primary" onClick={() => void download(item.id)}><Download size={15} /> Download</ActionButton>}</td>
              </tr>
            ))}
          </DataTable>
        </Panel>
      </section>
      <JsonActionDialog {...action} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
