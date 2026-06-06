import { Plus, Settings2 } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useActionForm } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, nameOf, numberOf } from '@/lib/format';

export function PricingPage() {
  const { request } = useAuth();
  const { t } = useT();
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
  const action = useActionForm([['pricing']]);

  if (data.isPending) {
    return (
      <PageShell title={t('pricing.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (data.isError) {
    return (
      <PageShell title={t('pricing.title')}>
        <LoadError error={data.error} />
      </PageShell>
    );
  }

  return (
    <PageShell
      title={t('pricing.title')}
      subtitle={t('pricing.subtitle')}
      actions={
        <>
          <button
            className="btn-primary"
            onClick={() =>
              action.open({
                title: t('pricing.updateCurrency'),
                description: t('pricing.updateCurrencyDesc'),
                path: '/pricing/admin/settings/currency',
                method: 'PUT',
                submitLabel: t('pricing.saveCurrency'),
                values: { currencyCode: 'EGP', symbol: 'E£', minorUnit: 2 },
                fields: [
                  { name: 'currencyCode', label: t('pricing.currencyCode'), type: 'text', required: true, width: 'half' },
                  { name: 'symbol', label: t('pricing.displaySymbol'), type: 'text', required: true, width: 'half' },
                  { name: 'minorUnit', label: t('pricing.minorUnit'), type: 'number', required: true, width: 'half', min: 0, max: 4, step: 1 },
                ],
              })
            }
          >
            <Settings2 size={16} /> {t('pricing.currencySettings')}
          </button>
          <button
            className="btn-primary"
            onClick={() =>
              action.open({
                title: t('pricing.createPromotion'),
                description: t('pricing.createPromotionDesc'),
                path: '/promotions/admin/by-key/spring-offer',
                method: 'PUT',
                submitLabel: t('pricing.createPromotion'),
                values: {
                  name: 'Spring offer',
                  status: 'ACTIVE',
                  trigger: 'COUPON',
                  rewardType: 'PERCENTAGE',
                  percentageBps: 1000,
                  currencyCode: 'EGP',
                  isCombinable: false,
                },
                fields: [
                  { name: 'name', label: t('pricing.promotionName'), type: 'text', required: true },
                  { name: 'currencyCode', label: t('pricing.currencyCode'), type: 'text', required: true, width: 'half' },
                  { name: 'percentageBps', label: t('pricing.discountBasisPoints'), type: 'number', required: true, width: 'half', min: 1, step: 100 },
                  {
                    name: 'status',
                    label: t('pricing.promotionStatus'),
                    type: 'radio',
                    width: 'half',
                    options: [
                      { value: 'ACTIVE', label: t('common.active') },
                      { value: 'DRAFT', label: t('common.draft') },
                      { value: 'ARCHIVED', label: t('common.archived') },
                    ],
                  },
                  {
                    name: 'trigger',
                    label: t('pricing.trigger'),
                    type: 'radio',
                    width: 'half',
                    options: [
                      { value: 'COUPON', label: t('pricing.couponTrigger') },
                      { value: 'AUTOMATIC', label: t('pricing.automatic') },
                    ],
                  },
                  {
                    name: 'rewardType',
                    label: t('pricing.rewardType'),
                    type: 'radio',
                    options: [
                      { value: 'PERCENTAGE', label: t('pricing.percentage') },
                      { value: 'FIXED_AMOUNT', label: t('pricing.fixedAmount') },
                    ],
                  },
                  {
                    name: 'isCombinable',
                    label: t('pricing.allowCombination'),
                    type: 'switch',
                    onLabel: t('pricing.canCombine'),
                    offLabel: t('pricing.exclusivePromotion'),
                  },
                ],
              })
            }
          >
            <Plus size={16} /> {t('pricing.newPromotion')}
          </button>
        </>
      }
    >
      <div className="space-y-6 p-6">
        <Feedback message={action.feedback} />

        <div className="grid gap-6 lg:grid-cols-2">
          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">
              {t('pricing.commercialConfig')}
            </h2>
            <div className="divide-y divide-neutral-800 rounded-sm border border-neutral-800">
              {[
                {
                  label: t('pricing.currencyAndRounding'),
                  action: () =>
                    action.open({
                      title: t('pricing.updateCurrency'),
                      description: t('pricing.updateCurrencyDesc'),
                      path: '/pricing/admin/settings/currency',
                      method: 'PUT',
                      submitLabel: t('pricing.saveCurrency'),
                      values: { currencyCode: 'EGP', symbol: 'E£', minorUnit: 2 },
                      fields: [
                        { name: 'currencyCode', label: t('pricing.currencyCode'), type: 'text', required: true, width: 'half' },
                        { name: 'symbol', label: t('pricing.displaySymbol'), type: 'text', required: true, width: 'half' },
                        { name: 'minorUnit', label: t('pricing.minorUnit'), type: 'number', required: true, width: 'half', min: 0, max: 4, step: 1 },
                      ],
                    }),
                },
                {
                  label: t('pricing.taxBehavior'),
                  action: () =>
                    action.open({
                      title: t('pricing.updateTaxBehavior'),
                      description: t('pricing.updateTaxBehaviorDesc'),
                      path: '/pricing/admin/settings/behavior',
                      method: 'PUT',
                      submitLabel: t('pricing.saveTaxBehavior'),
                      values: {
                        pricesIncludeTax: false,
                        defaultTaxCountryCode: 'EG',
                        shippingCurrencyCode: 'EGP',
                      },
                      fields: [
                        {
                          name: 'pricesIncludeTax',
                          label: t('pricing.pricesIncludeTax'),
                          type: 'switch',
                          onLabel: t('pricing.taxInclusive'),
                          offLabel: t('pricing.taxAddedAtCheckout'),
                        },
                        { name: 'defaultTaxCountryCode', label: t('pricing.defaultTaxCountry'), type: 'text', required: true, width: 'half' },
                        { name: 'shippingCurrencyCode', label: t('pricing.shippingCurrency'), type: 'text', required: true, width: 'half' },
                      ],
                    }),
                },
                {
                  label: t('pricing.shippingZoneSection'),
                  action: () =>
                    action.open({
                      title: t('pricing.createShippingZone'),
                      description: t('pricing.addShippingZoneDesc'),
                      path: '/pricing/admin/shipping-zones/egypt',
                      method: 'PUT',
                      submitLabel: t('pricing.saveShippingZone'),
                      values: { name: 'Egypt', isActive: true, countryCodes: ['EG'] },
                      fields: [
                        { name: 'name', label: t('pricing.zoneName'), type: 'text', required: true, width: 'half' },
                        {
                          name: 'isActive',
                          label: t('pricing.zoneIsActive'),
                          type: 'switch',
                          width: 'half',
                          onLabel: t('common.active'),
                          offLabel: t('common.inactive'),
                        },
                        {
                          name: 'countryCodes',
                          label: t('pricing.countryCodes'),
                          type: 'string-list',
                          required: true,
                          addLabel: t('pricing.addCountry'),
                          itemLabel: t('pricing.countryCode'),
                          placeholder: 'EG',
                        },
                      ],
                    }),
                },
              ].map((row) => (
                <div key={row.label} className="flex items-center justify-between gap-4 px-5 py-3.5">
                  <span className="text-sm text-neutral-400">{row.label}</span>
                  <button className="btn-table-default" onClick={row.action}>
                    {t('pricing.configure')}
                  </button>
                </div>
              ))}
            </div>
          </div>

          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">
              {t('pricing.pricingReadiness')}
            </h2>
            <div className="divide-y divide-neutral-800 rounded-sm border border-neutral-800">
              {[
                { label: t('pricing.productsLoaded'), value: numberOf(data.data.products.length) },
                { label: t('pricing.activeCampaigns'), value: numberOf(data.data.promotions.length) },
                { label: t('pricing.priceEditing'), value: t('pricing.priceEditingDesc') },
              ].map((row) => (
                <div key={row.label} className="flex items-center justify-between gap-4 px-5 py-3.5">
                  <span className="text-sm text-neutral-400">{row.label}</span>
                  <span className="text-sm font-semibold text-[#e5e2e1]">{String(row.value)}</span>
                </div>
              ))}
            </div>
          </div>
        </div>

        <div className="space-y-2">
          <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">
              {t('pricing.promotionsAndCoupons')}
          </h2>
          <DataTable headers={[t('pricing.campaign'), t('pricing.reward'), t('common.status'), t('pricing.coupons'), '']} empty={!data.data.promotions.length}>
            {data.data.promotions.map((promotion) => (
              <tr key={promotion.id ?? promotion.key}>
                <td>
                  <strong className="block text-sm">{nameOf(promotion)}</strong>
                  <small className="block text-xs text-neutral-400">{promotion.key ?? promotion.id}</small>
                </td>
                <td>{promotion.rewardType ?? '-'}</td>
                <td>
                  <span
                    className={chipClass(promotion.status)}
                  >
                    {String(promotion.status ?? '-')}
                  </span>
                </td>
                <td>
                  {asArray(promotion.coupons)
                    .map((coupon) => String(coupon.code ?? ''))
                    .filter(Boolean)
                    .join(', ') || '-'}
                </td>
                <td>
                  <div className="flex justify-end">
                    <button
                      className="btn-table-default"
                      onClick={() =>
                        action.open({
                        title: t('pricing.createCoupon'),
                        description: t('pricing.createCouponDesc'),
                          path: `/promotions/admin/${promotion.id}/coupons/SAVE10`,
                          method: 'PUT',
                          submitLabel: t('pricing.createCoupon'),
                          values: {
                            code: 'SAVE10',
                            status: 'ACTIVE',
                            totalUsageLimit: 500,
                            perCustomerUsageLimit: 1,
                          },
                          fields: [
                            { name: 'code', label: t('pricing.couponCode'), type: 'text', required: true, width: 'half' },
                            {
                              name: 'status',
                              label: t('pricing.couponStatus'),
                              type: 'radio',
                              width: 'half',
                              options: [
                                { value: 'ACTIVE', label: t('common.active') },
                                { value: 'DISABLED', label: t('common.disabled') },
                              ],
                            },
                            { name: 'totalUsageLimit', label: t('pricing.totalUsageLimit'), type: 'number', width: 'half', min: 1, step: 1 },
                            { name: 'perCustomerUsageLimit', label: t('pricing.perCustomerLimit'), type: 'number', width: 'half', min: 1, step: 1 },
                          ],
                        })
                      }
                    >
                      {t('pricing.couponButton')}
                    </button>
                  </div>
                </td>
              </tr>
            ))}
          </DataTable>
        </div>
      </div>
      <ConfirmModal
        action={action.action}
        busy={action.busy}
        error={action.error}
        fieldErrors={action.fieldErrors}
        onClose={action.close}
        onSubmit={action.execute}
      />
    </PageShell>
  );
}
