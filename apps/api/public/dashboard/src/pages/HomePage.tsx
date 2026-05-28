import { Activity, AlertTriangle, CreditCard, Package, ShoppingCart } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { StatCard } from '@/components/ui/StatCard';
import { Badge, DataTable, LoadError, PageLoading, Panel, StatList, StatRow, layout } from '@/components/ui/AdminUi';
import { useAuth } from '@/lib/auth';
import { asArray, dateOf, money, numberOf, type DataRecord } from '@/lib/format';

export function HomePage() {
  const { user, request } = useAuth();
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
  if (dashboard.isPending) return <PageShell title={`Welcome, ${name}`}><PageLoading /></PageShell>;
  if (dashboard.isError) return <PageShell title="Store performance"><LoadError error={dashboard.error} /></PageShell>;

  const { sales, inventory, orders, attempts, health } = dashboard.data;
  const revenue = sales.orders?._sum?.grandTotalAmount ?? sales.grossRevenue ?? sales.revenue ?? sales.totalRevenue ?? 0;
  const orderCount = sales.orders?._count?._all ?? sales.ordersCount ?? sales.totalOrders ?? orders.length;
  const onHand = inventory.stock?._sum?.quantityOnHand ?? inventory.quantityOnHand ?? 0;
  const reserved = inventory.stock?._sum?.quantityReserved ?? inventory.quantityReserved ?? 0;
  const lowStock = Math.max(0, reserved > onHand ? 1 : (inventory.lowStockCount ?? inventory.lowStock ?? 0));
  const pendingPayments = attempts.filter((item) => /PENDING|PROCESSING|AWAITING/.test(String(item.status))).length;

  return (
    <PageShell
      title={`Welcome, ${name}`}
      subtitle="Operational clarity across commerce, stock, payment activity, and service readiness."
    >
      <section className={layout.grid4}>
        <StatCard label="Gross revenue" value={money(revenue, sales.currencyCode || 'EGP')} icon={<CreditCard size={20} />} />
        <StatCard label="Orders" value={numberOf(orderCount)} icon={<ShoppingCart size={20} />} />
        <StatCard label="Low stock" value={numberOf(lowStock)} icon={<AlertTriangle size={20} />} accent={lowStock ? 'warning' : 'success'} />
        <StatCard label="Payments pending" value={numberOf(pendingPayments)} icon={<Activity size={20} />} accent={pendingPayments ? 'warning' : 'success'} />
      </section>
      <section className={layout.grid2}>
        <Panel title="Recent orders" subtitle="Newest customer purchase activity">
          <DataTable headers={['Order', 'Customer', 'Total', 'Status']} empty={!orders.length}>
            {orders.slice(0, 6).map((order) => (
              <tr key={order.id ?? order.orderNumber}>
                <td><strong>{order.orderNumber ?? order.id}</strong><small>{dateOf(order.createdAt)}</small></td>
                <td>{order.customerEmail ?? order.user?.email ?? 'Guest'}</td>
                <td>{money(order.grandTotal ?? order.totalAmount ?? order.total, order.currencyCode || 'EGP')}</td>
                <td><Badge value={order.status ?? order.paymentStatus} /></td>
              </tr>
            ))}
          </DataTable>
        </Panel>
        <Panel title="Operations pulse" subtitle="Critical runtime and financial signals">
          <StatList>
            <StatRow label="Execution mode"><strong>{health.taskExecution?.mode ?? 'Unknown'}</strong></StatRow>
            <StatRow label="Queue required"><strong>{health.taskExecution?.redisRequired ? 'Yes' : 'No'}</strong></StatRow>
            <StatRow label="API status"><Badge value={health.status ?? 'up'} /></StatRow>
            <StatRow label="Payment events visible"><strong>{numberOf(attempts.length)}</strong></StatRow>
            <StatRow label="Catalog readiness"><Package size={16} /></StatRow>
          </StatList>
        </Panel>
      </section>
    </PageShell>
  );
}
