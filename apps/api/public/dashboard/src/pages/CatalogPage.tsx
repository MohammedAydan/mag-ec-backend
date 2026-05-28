import { Plus } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, RowActions } from '@/components/ui/AdminUi';
import { useJsonAction, useDirectAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, nameOf, numberOf } from '@/lib/format';

export function CatalogPage() {
  const navigate = useNavigate();
  const { request } = useAuth();
  const products = useQuery({
    queryKey: ['catalog', 'products'],
    queryFn: async () => asArray(await request('/catalog/admin/products?limit=50')),
  });
  const create = useJsonAction([['catalog', 'products']]);
  const publish = useDirectAction([['catalog', 'products']]);

  if (products.isPending) return <PageShell title="Product catalog"><PageLoading /></PageShell>;
  if (products.isError) return <PageShell title="Product catalog"><LoadError error={products.error} /></PageShell>;

  return (
    <PageShell
      title="Product catalog"
      subtitle="Products, variants, availability, and publication lifecycle."
      actions={
        <ActionButton tone="primary" onClick={() => create.open({
          title: 'Create product',
          description: 'Create a validated product record with its initial sellable variant.',
          path: '/catalog/admin/products',
          method: 'POST',
          payload: {
            productTypeId: 'replace-with-product-type-id',
            brandId: 'replace-with-brand-id',
            sku: 'PRODUCT-001',
            translations: [{ locale: 'en', name: 'New Product', slug: 'new-product', description: 'Product description' }],
            variants: [{ sku: 'PRODUCT-001-STD', isDefault: true, translations: [{ locale: 'en', name: 'Standard' }], optionValues: [] }],
          },
        })}><Plus size={16} /> New product</ActionButton>
      }
    >
      <Feedback message={create.feedback ?? publish.feedback} />
      <Feedback message={publish.failure} tone="danger" />
      <Panel title="Products" subtitle={`${products.data.length} products available`}>
        <DataTable headers={['Product', 'Type', 'Variants', 'Status', '']} empty={!products.data.length}>
          {products.data.map((product) => (
            <tr key={product.id}>
              <td><strong>{nameOf(product)}</strong><small>{product.translations?.[0]?.slug ?? product.slug ?? product.id}</small></td>
              <td>{product.productType?.name ?? product.productTypeKey ?? '—'}</td>
              <td>{numberOf(product.variants?.length ?? product._count?.variants ?? 0)}</td>
              <td><Badge value={product.status} /></td>
              <td>
                <RowActions>
                  <ActionButton onClick={() => navigate(`/catalog/${product.id}`)}>Inspect</ActionButton>
                  <ActionButton
                    tone={product.status === 'PUBLISHED' ? 'danger' : 'primary'}
                    disabled={publish.pending === product.id}
                    onClick={() => void publish.run(
                      product.id,
                      `/catalog/admin/products/${product.id}/${product.status === 'PUBLISHED' ? 'archive' : 'publish'}`,
                    )}
                  >
                    {product.status === 'PUBLISHED' ? 'Archive' : 'Publish'}
                  </ActionButton>
                </RowActions>
              </td>
            </tr>
          ))}
        </DataTable>
      </Panel>
      <JsonActionDialog {...create} onClose={create.close} onSubmit={create.execute} />
    </PageShell>
  );
}
