import { Plus } from 'lucide-react';
import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, RowActions, Tabs } from '@/components/ui/AdminUi';
import { useDirectAction, useJsonAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, nameOf } from '@/lib/format';

const taxonomy = [
  { key: 'brands', label: 'Brands' },
  { key: 'categories', label: 'Categories' },
  { key: 'collections', label: 'Collections' },
  { key: 'tags', label: 'Tags' },
  { key: 'attributes', label: 'Attributes' },
  { key: 'product-types', label: 'Product types' },
];

export function TaxonomyPage() {
  const [active, setActive] = useState('brands');
  const { request } = useAuth();
  const listing = useQuery({
    queryKey: ['taxonomy', active],
    queryFn: async () => asArray(await request(`/catalog/admin/${active}`)),
  });
  const create = useJsonAction([['taxonomy', active]]);
  const lifecycle = useDirectAction([['taxonomy', active]]);
  const canLifecycle = active !== 'attributes';

  return (
    <PageShell
      title="Taxonomy & attributes"
      subtitle="Reusable structures that organize every catalog experience."
      actions={<ActionButton tone="primary" onClick={() => create.open({
        title: `Create ${active.replace('-', ' ')}`,
        description: 'Create a reusable catalog classification.',
        path: `/catalog/admin/${active}`,
        method: 'POST',
        payload: { key: 'new-item', translations: [{ locale: 'en', name: 'New item', slug: 'new-item' }] },
      })}><Plus size={16} /> New {active.replace('-', ' ')}</ActionButton>}
    >
      <Feedback message={create.feedback ?? lifecycle.feedback} />
      <Feedback message={lifecycle.failure} tone="danger" />
      <Panel title="Catalog structure" subtitle="Publish or archive reusable storefront classification data.">
        <Tabs items={taxonomy} value={active} onChange={setActive} />
        {listing.isPending && <PageLoading />}
        {listing.isError && <LoadError error={listing.error} />}
        {listing.data && (
          <DataTable headers={['Name', 'Status', '']} empty={!listing.data.length}>
            {listing.data.map((item) => (
              <tr key={item.id}>
                <td><strong>{nameOf(item)}</strong><small>{item.key ?? item.slug ?? item.id}</small></td>
                <td><Badge value={item.status ?? (item.isActive ? 'ACTIVE' : 'DRAFT')} /></td>
                <td>{canLifecycle && (
                  <RowActions>
                    <ActionButton
                      tone={item.status === 'PUBLISHED' ? 'danger' : 'primary'}
                      disabled={lifecycle.pending === item.id}
                      onClick={() => void lifecycle.run(
                        item.id,
                        `/catalog/admin/${active}/${item.id}/${item.status === 'PUBLISHED' ? 'archive' : 'publish'}`,
                      )}
                    >{item.status === 'PUBLISHED' ? 'Archive' : 'Publish'}</ActionButton>
                  </RowActions>
                )}</td>
              </tr>
            ))}
          </DataTable>
        )}
      </Panel>
      <JsonActionDialog {...create} onClose={create.close} onSubmit={create.execute} />
    </PageShell>
  );
}
