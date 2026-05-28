import { ArrowLeft, Plus } from 'lucide-react';
import { useNavigate, useParams } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, RowActions, StatList, StatRow, layout } from '@/components/ui/AdminUi';
import { useDirectAction, useJsonAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, money, nameOf, numberOf, type DataRecord } from '@/lib/format';

export function ProductDetailPage() {
  const navigate = useNavigate();
  const { productId = '' } = useParams();
  const { request } = useAuth();
  const product = useQuery({
    queryKey: ['catalog', 'product', productId],
    queryFn: () => request<DataRecord>(`/catalog/admin/products/${productId}`),
    enabled: Boolean(productId),
  });
  const action = useJsonAction([['catalog', 'product', productId], ['catalog', 'products']]);
  const lifecycle = useDirectAction([['catalog', 'product', productId], ['catalog', 'products']]);

  if (product.isPending) return <PageShell title="Product"><PageLoading /></PageShell>;
  if (product.isError) return <PageShell title="Product"><LoadError error={product.error} /></PageShell>;

  const item = product.data;
  const variants = asArray(item.variants);

  return (
    <PageShell
      title={nameOf(item)}
      subtitle={`Product ID: ${item.id}`}
      actions={<>
        <ActionButton onClick={() => navigate('/catalog')}><ArrowLeft size={16} /> Back</ActionButton>
        <ActionButton tone="primary" onClick={() => action.open({
          title: 'Add product variant',
          description: 'Attach a new sellable variant to this catalog product.',
          path: `/catalog/admin/products/${productId}/variants`,
          method: 'POST',
          payload: { sku: 'SKU-001', translations: [{ locale: 'en', name: 'Standard' }], optionValues: [] },
        })}><Plus size={16} /> Add variant</ActionButton>
      </>}
    >
      <Feedback message={action.feedback ?? lifecycle.feedback} />
      <Feedback message={lifecycle.failure} tone="danger" />
      <section className={layout.grid2}>
        <Panel title="Product summary" subtitle="Configured catalog record">
          <StatList>
            <StatRow label="Status"><Badge value={item.status} /></StatRow>
            <StatRow label="Brand"><strong>{nameOf(item.brand)}</strong></StatRow>
            <StatRow label="Variants"><strong>{numberOf(variants.length)}</strong></StatRow>
          </StatList>
        </Panel>
        <Panel title="Variants" subtitle="Published variants are available for sale">
          <DataTable headers={['SKU', 'Price', 'Status', '']} empty={!variants.length}>
            {variants.map((variant) => (
              <tr key={variant.id}>
                <td><strong>{variant.sku ?? nameOf(variant)}</strong><small>{nameOf(variant)}</small></td>
                <td>{money(variant.prices?.[0]?.baseAmount ?? variant.price?.baseAmount, variant.prices?.[0]?.currencyCode || 'EGP')}</td>
                <td><Badge value={variant.status} /></td>
                <td>
                  <RowActions>
                    <ActionButton onClick={() => action.open({
                      title: 'Set variant price',
                      description: 'Update the base selling price for this product variant.',
                      path: `/pricing/admin/variants/${variant.id}/price`,
                      method: 'PUT',
                      payload: { currencyCode: 'EGP', baseAmount: 10000 },
                    })}>Price</ActionButton>
                    <ActionButton
                      tone={variant.status === 'PUBLISHED' ? 'danger' : 'primary'}
                      disabled={lifecycle.pending === variant.id}
                      onClick={() => void lifecycle.run(
                        variant.id,
                        `/catalog/admin/variants/${variant.id}/${variant.status === 'PUBLISHED' ? 'archive' : 'publish'}`,
                      )}
                    >{variant.status === 'PUBLISHED' ? 'Archive' : 'Publish'}</ActionButton>
                  </RowActions>
                </td>
              </tr>
            ))}
          </DataTable>
        </Panel>
      </section>
      <JsonActionDialog {...action} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
