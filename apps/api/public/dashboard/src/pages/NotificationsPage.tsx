import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useDirectAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, dateOf } from '@/lib/format';

export function NotificationsPage() {
  const { request } = useAuth();
  const { t } = useT();
  const notifications = useQuery({
    queryKey: ['notifications'],
    queryFn: async () => asArray(await request('/notifications/admin').catch(() => [])),
  });
  const retry = useDirectAction([['notifications']]);

  if (notifications.isPending) {
    return (
      <PageShell title={t('notifications.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (notifications.isError) {
    return (
      <PageShell title={t('notifications.title')}>
        <LoadError error={notifications.error} />
      </PageShell>
    );
  }

  return (
    <PageShell title={t('notifications.title')} subtitle={t('notifications.subtitle')}>
      <div className="space-y-4 p-6">
        <Feedback message={retry.feedback} />
        <Feedback message={retry.failure} tone="danger" />
        <div className="flex items-center justify-between">
          <p className="text-sm text-neutral-400">{notifications.data.length} {t('notifications.messages')}</p>
        </div>
        <DataTable headers={[t('notifications.message'), t('notifications.channel'), t('common.status'), t('notifications.created'), '']} empty={!notifications.data.length}>
          {notifications.data.map((notification) => (
            <tr key={notification.id}>
              <td>
                <strong className="block text-sm">{notification.title}</strong>
                <small className="block text-xs text-neutral-400">{notification.recipientEmail ?? notification.user?.email ?? notification.userId ?? t('notifications.recipient')}</small>
              </td>
              <td>{notification.channel}</td>
              <td>
                <span className={chipClass(notification.status)}>
                  {String(notification.status ?? t('common.unknown'))}
                </span>
              </td>
              <td>{dateOf(notification.createdAt)}</td>
              <td>
                {notification.status === 'FAILED' && (
                  <div className="flex justify-end">
                    <button
                      className="btn-table-default"
                      disabled={retry.pending === notification.id}
                      onClick={() => void retry.run(notification.id, `/notifications/admin/${notification.id}/retry`)}
                    >
                      {t('notifications.retry')}
                    </button>
                  </div>
                )}
              </td>
            </tr>
          ))}
        </DataTable>
      </div>
    </PageShell>
  );
}
