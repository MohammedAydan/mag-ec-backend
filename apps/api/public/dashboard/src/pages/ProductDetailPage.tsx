import { ArrowLeft, Plus } from 'lucide-react';
import { useNavigate, useParams } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useActionForm, useDirectAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, money, nameOf, numberOf, type DataRecord } from '@/lib/format';

export function ProductDetailPage() {
  const navigate = useNavigate();
  const { productId = '' } = useParams();
  const { request } = useAuth();
  const { t } = useT();
  const product = useQuery({
    queryKey: ['catalog', 'product', productId],
    queryFn: () => request<DataRecord>(`/catalog/admin/products/${productId}`),
    enabled: Boolean(productId),
  });
  const action = useActionForm([['catalog', 'product', productId], ['catalog', 'products']]);
  const lifecycle = useDirectAction([['catalog', 'product', productId], ['catalog', 'products']]);

  if (product.isPending) {
    return (
      <PageShell title={t('productDetail.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (product.isError) {
    return (
      <PageShell title={t('productDetail.title')}>
        <LoadError error={product.error} />
      </PageShell>
    );
  }

  const item = product.data;
  const variants = asArray(item.variants);

  return (
    <PageShell
      title={nameOf(item)}
      subtitle={`${t('productDetail.productId')}: ${item.id}`}
      actions={
        <>
          <button className="btn-ghost" onClick={() => navigate('/catalog')}>
            <ArrowLeft size={16} /> {t('common.back')}
          </button>
          <button
            className="btn-primary"
            onClick={() =>
              action.open({
                title: t('productDetail.addVariant'),
                description: t('productDetail.addVariantDesc'),
                path: `/catalog/admin/products/${productId}/variants`,
                method: 'POST',
                submitLabel: t('catalog.addVariant'),
                values: {
                  sku: 'SKU-001',
                  translations: [{ locale: 'en', name: 'Standard' }],
                  optionValues: [],
                },
                fields: [
                  { name: 'sku', label: t('catalog.variantSku'), type: 'text', required: true, width: 'half' },
                  {
                    name: 'translations',
                    label: t('catalog.variantTranslations'),
                    type: 'group-list',
                    required: true,
                    addLabel: t('catalog.addTranslation'),
                    itemLabel: t('catalog.translation'),
                    defaultItem: { locale: 'en', name: '' },
                    fields: [
                      {
                        name: 'locale',
                        label: t('catalog.locale'),
                        type: 'radio',
                        width: 'half',
                        options: [
                          { value: 'en', label: t('catalog.english') },
                          { value: 'ar', label: t('catalog.arabic') },
                        ],
                      },
                      { name: 'name', label: t('catalog.displayName'), type: 'text', required: true, width: 'half' },
                    ],
                  },
                  {
                    name: 'optionValues',
                    label: t('catalog.optionValues'),
                    type: 'string-list',
                    addLabel: t('catalog.addOptionValue'),
                    itemLabel: t('catalog.optionValue'),
                    placeholder: t('catalog.optionValuePlaceholder'),
                  },
                ],
              })
            }
          >
            <Plus size={16} /> {t('productDetail.addVariant')}
          </button>
        </>
      }
    >
      <div className="space-y-6 p-6">
        <Feedback message={action.feedback ?? lifecycle.feedback} />
        <Feedback message={lifecycle.failure} tone="danger" />

        <div className="grid gap-6 lg:grid-cols-2">
          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">
              {t('productDetail.summary')}
            </h2>
            <div className="divide-y divide-neutral-800 rounded-sm border border-neutral-800">
              {[
                {
                  label: t('common.status'),
                  value: (
                    <span className={chipClass(item.status)}>
                      {String(item.status ?? '-')}
                    </span>
                  ),
                },
                { label: t('catalog.brand'), value: <strong className="text-sm">{nameOf(item.brand)}</strong> },
                { label: t('catalog.variants'), value: <strong className="text-sm">{numberOf(variants.length)}</strong> },
              ].map((row) => (
                <div key={row.label} className="flex items-center justify-between gap-4 px-5 py-3.5">
                  <span className="text-sm text-neutral-400">{row.label}</span>
                  <span>{row.value}</span>
                </div>
              ))}
            </div>
          </div>

          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">
              {t('catalog.variants')}
            </h2>
            <DataTable headers={['SKU', t('productDetail.price'), t('common.status'), '']} empty={!variants.length}>
              {variants.map((variant) => (
                <tr key={variant.id}>
                  <td>
                    <strong className="block text-sm">{variant.sku ?? nameOf(variant)}</strong>
                    <small className="block text-xs text-neutral-400">{nameOf(variant)}</small>
                  </td>
                  <td>
                    {money(
                      variant.prices?.[0]?.baseAmount ?? variant.price?.baseAmount,
                      variant.prices?.[0]?.currencyCode || 'EGP'
                    )}
                  </td>
                  <td>
                    <span className={chipClass(variant.status)}>
                      {String(variant.status ?? '-')}
                    </span>
                  </td>
                  <td>
                    <div className="flex justify-end gap-2">
                      <button
                        className="btn-table-default"
                        onClick={() =>
                          action.open({
                            title: t('productDetail.setPrice'),
                            description: t('productDetail.setPriceDesc'),
                            path: `/pricing/admin/variants/${variant.id}/price`,
                            method: 'PUT',
                            submitLabel: t('common.save'),
                            values: { currencyCode: 'EGP', baseAmount: 10000 },
                            fields: [
                              { name: 'currencyCode', label: t('productDetail.currencyCode'), type: 'text', required: true, width: 'half' },
                              { name: 'baseAmount', label: t('productDetail.baseAmount'), type: 'number', required: true, width: 'half', min: 1, step: 1 },
                            ],
                          })
                        }
                      >
                        {t('productDetail.price')}
                      </button>
                      <button
                        disabled={lifecycle.pending === variant.id}
                        onClick={() =>
                          void lifecycle.run(
                            variant.id,
                            `/catalog/admin/variants/${variant.id}/${variant.status === 'PUBLISHED' ? 'archive' : 'publish'}`
                          )
                        }
                        className={variant.status === 'PUBLISHED' ? 'btn-table-danger' : 'btn-table-success'}
                      >
                        {variant.status === 'PUBLISHED' ? t('catalog.archive') : t('catalog.publish')}
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </DataTable>
          </div>
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
