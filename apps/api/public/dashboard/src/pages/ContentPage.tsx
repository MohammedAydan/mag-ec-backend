import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useActionForm } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, dateOf } from '@/lib/format';

export function ContentPage() {
  const { request } = useAuth();
  const { t } = useT();
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
  const action = useActionForm([['content-audit']]);

  if (result.isPending) {
    return (
      <PageShell title={t('content.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (result.isError) {
    return (
      <PageShell title={t('content.title')}>
        <LoadError error={result.error} />
      </PageShell>
    );
  }

  return (
    <PageShell title={t('content.title')} subtitle={t('content.subtitle')}>
      <div className="space-y-6 p-6">
        <Feedback message={action.feedback} />

        <div className="grid gap-6 lg:grid-cols-2">
          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('content.contentPages')}</h2>
            <DataTable headers={[t('content.pageCol'), t('common.status'), '']} empty={!result.data.pages.length}>
              {result.data.pages.map((page) => (
                <tr key={page.id ?? page.key}>
                  <td>
                    <strong className="block text-sm">{page.title ?? page.key}</strong>
                    <small className="block text-xs text-neutral-400">{page.key}</small>
                  </td>
                  <td>
                    <span className={chipClass(page.status ?? 'ACTIVE')}>
                      {String(page.status ?? 'ACTIVE')}
                    </span>
                  </td>
                  <td>
                    <div className="flex justify-end">
                      <button className="btn-table-default" onClick={() => action.open({
                        title: t('content.updateContentPage'),
                        description: t('content.updateContentPageDesc'),
                        path: `/content/admin/pages/${page.key}`,
                        method: 'PUT',
                        submitLabel: t('content.publishUpdate'),
                        values: {
                          slug: String(page.slug ?? page.key ?? ''),
                          title: String(page.title ?? page.key ?? ''),
                          body: String(page.body ?? ''),
                          status: String(page.status ?? 'PUBLISHED'),
                          locale: String(page.locale ?? page.translations?.[0]?.locale ?? 'en'),
                        },
                        fields: [
                          { name: 'title', label: t('content.pageTitle'), type: 'text', required: true },
                          { name: 'slug', label: t('content.publicSlug'), type: 'text', required: true, width: 'half' },
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
                          {
                            name: 'status',
                            label: t('content.publicationStatus'),
                            type: 'radio',
                            options: [
                              { value: 'DRAFT', label: t('common.draft') },
                              { value: 'PUBLISHED', label: t('common.published') },
                              { value: 'ARCHIVED', label: t('common.archived') },
                            ],
                          },
                          {
                            name: 'body',
                            label: t('content.pageBody'),
                            type: 'textarea',
                            required: true,
                            rows: 8,
                            description: t('content.pageBodyDesc'),
                          },
                        ],
                      })}>{t('content.editButton')}</button>
                    </div>
                  </td>
                </tr>
              ))}
            </DataTable>
          </div>

          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('content.recentAuditActivity')}</h2>
            <DataTable headers={[t('content.timeCol'), t('content.actionCol'), t('content.entityCol')]} empty={!result.data.audits.length}>
              {result.data.audits.slice(0, 12).map((audit) => (
                <tr key={audit.id ?? audit.createdAt}>
                  <td>{dateOf(audit.createdAt)}</td>
                  <td>
                    <strong className="block text-sm">{audit.action}</strong>
                    <small className="block text-xs text-neutral-400">{audit.actorEmail ?? audit.userId ?? t('content.systemActor')}</small>
                  </td>
                  <td>{audit.entityType ?? t('common.unknown')}</td>
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
