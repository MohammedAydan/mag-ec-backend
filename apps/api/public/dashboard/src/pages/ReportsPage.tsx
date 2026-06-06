import { Download, Plus } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { StatCard } from '@/components/ui/StatCard';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useActionForm } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, dateOf, money, numberOf, type DataRecord } from '@/lib/format';

export function ReportsPage() {
  const { request } = useAuth();
  const { t } = useT();
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
  const action = useActionForm([['reports']]);

  if (reports.isPending) {
    return (
      <PageShell title={t('reports.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (reports.isError) {
    return (
      <PageShell title={t('reports.title')}>
        <LoadError error={reports.error} />
      </PageShell>
    );
  }

  const data = reports.data;

  const download = async (exportId: string) => {
    const response = await request<{ url?: string; downloadUrl?: string }>(`/reports/admin/exports/${exportId}/download`);
    const destination = response.url ?? response.downloadUrl;
    if (destination) window.open(destination, '_blank', 'noopener');
  };

  return (
    <PageShell
      title={t('reports.title')}
      subtitle={t('reports.subtitle')}
      actions={
        <button
          className="btn-primary"
          onClick={() => action.open({
            title: t('reports.createExport'),
            description: t('reports.createExportDesc'),
            path: '/reports/admin/exports',
            method: 'POST',
            submitLabel: t('reports.queueExport'),
            values: { reportType: 'sales_summary', format: 'csv' },
            fields: [
              {
                name: 'reportType',
                label: t('reports.reportType'),
                type: 'radio',
                options: [
                  { value: 'sales_summary', label: t('reports.salesSummary') },
                  { value: 'top_products', label: t('reports.topProductsOpt') },
                  { value: 'inventory_kpis', label: t('reports.inventoryKPIs') },
                ],
              },
              {
                name: 'format',
                label: t('reports.exportFormat'),
                type: 'radio',
                options: [
                  { value: 'csv', label: t('reports.csv') },
                  { value: 'json', label: t('reports.json') },
                ],
              },
            ],
          })}
        >
          <Plus size={16} /> {t('reports.createExport')}
        </button>
      }
    >
      <div className="space-y-6 p-6">
        <Feedback message={action.feedback} />

        <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
          <StatCard label={t('reports.revenue')} value={money(data.sales.orders?._sum?.grandTotalAmount ?? data.sales.grossRevenue ?? data.sales.revenue, data.sales.currencyCode || 'EGP')} />
          <StatCard label={t('reports.orders')} value={numberOf(data.sales.orders?._count?._all ?? data.sales.totalOrders ?? data.sales.ordersCount)} />
          <StatCard label={t('reports.reservedUnits')} value={numberOf(data.inventory.stock?._sum?.quantityReserved ?? data.inventory.quantityReserved)} />
          <StatCard label={t('reports.exports')} value={numberOf(data.exports.length)} />
        </div>

        <div className="grid gap-6 lg:grid-cols-2">
          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('reports.topProducts')}</h2>
            <DataTable headers={[t('reports.reportCol'), t('reports.unitsOrRevenue')]} empty={!data.top.length}>
              {data.top.slice(0, 8).map((product) => (
                <tr key={product.id ?? product.productId}>
                  <td>
                    <strong className="block text-sm">{product.name ?? product.product?.name ?? product.productId ?? t('reports.report')}</strong>
                  </td>
                  <td>{numberOf(product._sum?.quantity ?? product.quantity ?? product.unitsSold ?? product.revenue ?? 0)}</td>
                </tr>
              ))}
            </DataTable>
          </div>

          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('reports.reportExports')}</h2>
            <DataTable headers={[t('reports.reportCol'), t('common.status'), '']} empty={!data.exports.length}>
              {data.exports.map((item) => (
                <tr key={item.id}>
                  <td>
                    <strong className="block text-sm">{item.reportType ?? item.type}</strong>
                    <small className="block text-xs text-neutral-400">{dateOf(item.createdAt)}</small>
                  </td>
                  <td>
                    <span className={chipClass(item.status)}>
                      {String(item.status ?? '—')}
                    </span>
                  </td>
                  <td>
                    {item.status === 'COMPLETED' && (
                      <div className="flex justify-end">
                        <button className="btn-table-default" onClick={() => void download(item.id)}>
                          <Download size={15} /> {t('reports.download')}
                        </button>
                      </div>
                    )}
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
