import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, layout } from '@/components/ui/AdminUi';
import { useJsonAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, dateOf } from '@/lib/format';

export function ContentPage() {
  const { request } = useAuth();
  const result = useQuery({
    queryKey: ['content-audit'],
    queryFn: async () => {
      const [pages, audits] = await Promise.all([
        request('/content/admin/pages').catch(() => []),
        request('/audit/admin?limit=25').catch(() => []),
      ]);
      return { pages: asArray(pages), audits: asArray(audits) };
    },
  });
  const action = useJsonAction([['content-audit']]);

  if (result.isPending) return <PageShell title="Content & audit"><PageLoading /></PageShell>;
  if (result.isError) return <PageShell title="Content & audit"><LoadError error={result.error} /></PageShell>;

  return (
    <PageShell title="Content & audit" subtitle="Legal pages and immutable operational traceability.">
      <Feedback message={action.feedback} />
      <section className={layout.grid2}>
        <Panel title="Content pages" subtitle="Editable storefront information">
          <DataTable headers={['Page', 'Status', '']} empty={!result.data.pages.length}>
            {result.data.pages.map((page) => (
              <tr key={page.id ?? page.key}>
                <td><strong>{page.title ?? page.key}</strong><small>{page.key}</small></td>
                <td><Badge value={page.status ?? 'ACTIVE'} /></td>
                <td>
                  <ActionButton onClick={() => action.open({
                    title: 'Update content page',
                    description: 'Publish new legal or informational storefront content.',
                    path: `/content/admin/pages/${page.key}`,
                    method: 'PUT',
                    payload: { slug: 'page-slug', title: 'Page title', body: 'Updated public page content.', status: 'PUBLISHED', locale: 'en' },
                  })}>Edit</ActionButton>
                </td>
              </tr>
            ))}
          </DataTable>
        </Panel>
        <Panel title="Recent audit activity" subtitle="Sensitive actions redacted server-side">
          <DataTable headers={['Time', 'Action', 'Entity']} empty={!result.data.audits.length}>
            {result.data.audits.slice(0, 12).map((audit) => (
              <tr key={audit.id ?? audit.createdAt}>
                <td>{dateOf(audit.createdAt)}</td>
                <td><strong>{audit.action}</strong><small>{audit.actorEmail ?? audit.userId ?? 'System'}</small></td>
                <td>{audit.entityType ?? '—'}</td>
              </tr>
            ))}
          </DataTable>
        </Panel>
      </section>
      <JsonActionDialog {...action} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
