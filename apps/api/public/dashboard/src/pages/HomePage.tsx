import { Activity, AlertTriangle, CreditCard, ShoppingCart } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { StatCard } from '@/components/ui/StatCard';
import { DataTable } from '@/components/ui/DataTable';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, dateOf, money, numberOf, type DataRecord } from '@/lib/format';

export function HomePage() {
  const { user, request } = useAuth();
  const { t } = useT();
  const dashboard = useQuery({
    queryKey: ['overview'],
    queryFn: async () => {
      const [sales, inventory, orders, attempts, health] = await Promise.all([
        request<DataRecord>('/reports/admin/sales-summary').catch(() => ({} as DataRecord)),
        request<DataRecord>('/reports/admin/inventory-kpis').catch(() => ({} as DataRecord)),
        request<unknown>('/orders/admin').catch(() => []),
        request<unknown>('/payments/admin/attempts?limit=6').catch(() => []),
        request<DataRecord>('/health/readiness', { anonymous: true }).catch(() => ({} as DataRecord)),
      ]);
      return { sales, inventory, orders: asArray(orders), attempts: asArray(attempts), health };
    },
  });

  const name = user?.displayName ?? user?.email ?? 'Administrator';

  if (dashboard.isPending) {
    return (
      <PageShell title={`${t('home.welcome')}, ${name}`}>
        <PageLoading />
      </PageShell>
    );
  }

  if (dashboard.isError) {
    return (
      <PageShell title={t('home.title')}>
        <LoadError error={dashboard.error} />
      </PageShell>
    );
  }

  const { sales, inventory, orders, attempts, health } = dashboard.data;
  const revenue = sales.orders?._sum?.grandTotalAmount ?? sales.grossRevenue ?? sales.revenue ?? sales.totalRevenue ?? 0;
  const orderCount = sales.orders?._count?._all ?? sales.ordersCount ?? sales.totalOrders ?? orders.length;
  const onHand = inventory.stock?._sum?.quantityOnHand ?? inventory.quantityOnHand ?? 0;
  const reserved = inventory.stock?._sum?.quantityReserved ?? inventory.quantityReserved ?? 0;
  const lowStock = Math.max(0, reserved > onHand ? 1 : (inventory.lowStockCount ?? inventory.lowStock ?? 0));
  const pendingPayments = attempts.filter((item) => /PENDING|PROCESSING|AWAITING/.test(String(item.status))).length;

  return (
    <PageShell
      title={`${t('home.welcome')}, ${name}`}
      subtitle={t('home.subtitle')}
    >
      <div className="space-y-8 p-6">
        <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
          <StatCard
            label={t('home.grossRevenue')}
            value={money(revenue, sales.currencyCode || 'EGP')}
            icon={<CreditCard className="h-5 w-5" />}
          />
          <StatCard
            label={t('home.orders')}
            value={numberOf(orderCount)}
            icon={<ShoppingCart className="h-5 w-5" />}
          />
          <StatCard
            label={t('home.lowStock')}
            value={numberOf(lowStock)}
            icon={<AlertTriangle className="h-5 w-5" />}
            accent={lowStock ? 'warning' : 'success'}
          />
          <StatCard
            label={t('home.paymentsPending')}
            value={numberOf(pendingPayments)}
            icon={<Activity className="h-5 w-5" />}
            accent={pendingPayments ? 'warning' : 'success'}
          />
        </div>

        <div className="grid gap-8 lg:grid-cols-2">
          <div className="space-y-3">
            <h2 className="font-mono text-[10px] uppercase tracking-[0.15em] text-neutral-400">{t('home.recentOrders')}</h2>
            <DataTable headers={[t('orders.orderNumber'), t('orders.customer'), t('orders.total'), t('common.status')]} empty={!orders.length}>
              {orders.slice(0, 6).map((order: DataRecord) => (
                <tr key={order.id ?? order.orderNumber}>
                  <td className="px-6 py-3">
                    <strong className="block text-sm text-white">{order.orderNumber ?? order.id}</strong>
                    <small className="block font-mono text-[10px] text-neutral-500">
                      {dateOf(order.createdAt)}
                    </small>
                  </td>
                  <td className="px-6 py-3 text-sm">{order.customerEmail ?? order.user?.email ?? t('common.guest')}</td>
                  <td className="px-6 py-3 text-sm">
                    {money(order.grandTotal ?? order.totalAmount ?? order.total, order.currencyCode || 'EGP')}
                  </td>
                  <td className="px-6 py-3">
                    <span className={chipClass(String(order.status ?? order.paymentStatus ?? ''))}>
                      {String(order.status ?? order.paymentStatus ?? '—')}
                    </span>
                  </td>
                </tr>
              ))}
            </DataTable>
          </div>

          <div className="space-y-3">
            <h2 className="font-mono text-[10px] uppercase tracking-[0.15em] text-neutral-400">{t('home.operationsPulse')}</h2>
            <div className="divide-y divide-neutral-800 border border-neutral-800">
              {[
                { label: t('home.executionMode'), value: health.taskExecution?.mode ?? t('common.unknown') },
                { label: t('home.queueRequired'), value: health.taskExecution?.redisRequired ? t('common.yes') : t('common.no') },
                { label: t('home.paymentEventsVisible'), value: numberOf(attempts.length) },
                { label: t('home.apiStatus'), value: health.status ?? 'up' },
              ].map((row) => (
                <div
                  key={row.label}
                  className="flex items-center justify-between gap-4 px-5 py-3.5"
                >
                  <span className="font-mono text-xs text-neutral-400">{row.label}</span>
                  <span className="font-mono text-xs text-white">{String(row.value)}</span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </PageShell>
  );
}
