import { Plus, Settings2 } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, StatList, StatRow, layout } from '@/components/ui/AdminUi';
import { useJsonAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, nameOf, numberOf } from '@/lib/format';

export function PricingPage() {
  const { request } = useAuth();
  const data = useQuery({
    queryKey: ['pricing'],
    queryFn: async () => {
      const [products, promotions] = await Promise.all([
        request('/catalog/admin/products?limit=10').catch(() => []),
        request('/promotions/admin').catch(() => []),
      ]);
      return { products: asArray(products), promotions: asArray(promotions) };
    },
  });
  const action = useJsonAction([['pricing']]);

  if (data.isPending) return <PageShell title="Pricing & promotions"><PageLoading /></PageShell>;
  if (data.isError) return <PageShell title="Pricing & promotions"><LoadError error={data.error} /></PageShell>;

  return (
    <PageShell
      title="Pricing & promotions"
      subtitle="Control currency, tax, shipping methods, and coupon campaigns."
      actions={<>
        <ActionButton tone="primary" onClick={() => action.open({
          title: 'Update store currency',
          description: 'Set currency display and minor-unit behavior.',
          path: '/pricing/admin/settings/currency',
          method: 'PUT',
          payload: { currencyCode: 'EGP', symbol: 'E£', minorUnit: 2 },
        })}><Settings2 size={16} /> Currency settings</ActionButton>
        <ActionButton onClick={() => action.open({
          title: 'Create promotion',
          description: 'Add a promotional rule to be used at checkout.',
          path: '/promotions/admin/spring-offer',
          method: 'PUT',
          payload: {
            name: 'Spring offer',
            status: 'ACTIVE',
            trigger: 'COUPON',
            rewardType: 'PERCENTAGE',
            percentageBps: 1000,
            currencyCode: 'EGP',
            isCombinable: false,
          },
        })}><Plus size={16} /> New promotion</ActionButton>
      </>}
    >
      <Feedback message={action.feedback} />
      <section className={layout.grid2}>
        <Panel title="Commercial configuration" subtitle="Store-wide controls">
          <StatList>
            <StatRow label="Currency and rounding">
              <ActionButton onClick={() => action.open({
                title: 'Update store currency',
                description: 'Define the currency configuration.',
                path: '/pricing/admin/settings/currency',
                method: 'PUT',
                payload: { currencyCode: 'EGP', symbol: 'E£', minorUnit: 2 },
              })}>Configure</ActionButton>
            </StatRow>
            <StatRow label="Tax behavior">
              <ActionButton onClick={() => action.open({
                title: 'Update tax behavior',
                description: 'Update tax inclusion and default destination.',
                path: '/pricing/admin/settings/behavior',
                method: 'PUT',
                payload: { pricesIncludeTax: false, defaultTaxCountryCode: 'EG', shippingCurrencyCode: 'EGP' },
              })}>Configure</ActionButton>
            </StatRow>
            <StatRow label="Shipping zone">
              <ActionButton onClick={() => action.open({
                title: 'Create shipping zone',
                description: 'Add an active delivery zone.',
                path: '/pricing/admin/shipping-zones/egypt',
                method: 'PUT',
                payload: { name: 'Egypt', isActive: true, countryCodes: ['EG'] },
              })}>Add zone</ActionButton>
            </StatRow>
          </StatList>
        </Panel>
        <Panel title="Pricing readiness" subtitle="Catalog products requiring prices">
          <StatList>
            <StatRow label="Products loaded"><strong>{numberOf(data.data.products.length)}</strong></StatRow>
            <StatRow label="Active campaigns"><strong>{numberOf(data.data.promotions.length)}</strong></StatRow>
            <StatRow label="Price editing"><span>Use variant actions in Catalog</span></StatRow>
          </StatList>
        </Panel>
      </section>
      <Panel title="Promotions & coupons" subtitle="Campaign status, rules, and issued coupon codes">
        <DataTable headers={['Campaign', 'Reward', 'Status', 'Coupons', '']} empty={!data.data.promotions.length}>
          {data.data.promotions.map((promotion) => (
            <tr key={promotion.id ?? promotion.key}>
              <td><strong>{nameOf(promotion)}</strong><small>{promotion.key ?? promotion.id}</small></td>
              <td>{promotion.rewardType ?? '—'}</td>
              <td><Badge value={promotion.status} /></td>
              <td>{asArray(promotion.coupons).map((coupon) => coupon.code).join(', ') || '—'}</td>
              <td>
                <ActionButton onClick={() => action.open({
                  title: 'Create coupon',
                  description: 'Issue a discount code for this campaign.',
                  path: `/promotions/admin/${promotion.id}/coupons/SAVE10`,
                  method: 'PUT',
                  payload: { code: 'SAVE10', status: 'ACTIVE', totalUsageLimit: 500, perCustomerUsageLimit: 1 },
                })}>Coupon</ActionButton>
              </td>
            </tr>
          ))}
        </DataTable>
      </Panel>
      <JsonActionDialog {...action} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
