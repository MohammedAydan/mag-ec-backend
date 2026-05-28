import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { ActionButton, Badge, DataTable, Feedback, LoadError, PageLoading, Panel } from '@/components/ui/AdminUi';
import { useDirectAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, dateOf } from '@/lib/format';

export function NotificationsPage() {
  const { request } = useAuth();
  const notifications = useQuery({
    queryKey: ['notifications'],
    queryFn: async () => asArray(await request('/notifications/admin').catch(() => [])),
  });
  const retry = useDirectAction([['notifications']]);

  if (notifications.isPending) return <PageShell title="Notifications"><PageLoading /></PageShell>;
  if (notifications.isError) return <PageShell title="Notifications"><LoadError error={notifications.error} /></PageShell>;

  return (
    <PageShell title="Notifications" subtitle="Email, push, and in-app delivery visibility.">
      <Feedback message={retry.feedback} />
      <Feedback message={retry.failure} tone="danger" />
      <Panel title="Delivery ledger" subtitle={`${notifications.data.length} messages`}>
        <DataTable headers={['Message', 'Channel', 'Status', 'Created', '']} empty={!notifications.data.length}>
          {notifications.data.map((notification) => (
            <tr key={notification.id}>
              <td><strong>{notification.title}</strong><small>{notification.recipientEmail ?? notification.user?.email ?? notification.userId ?? 'Recipient'}</small></td>
              <td>{notification.channel}</td>
              <td><Badge value={notification.status} /></td>
              <td>{dateOf(notification.createdAt)}</td>
              <td>{notification.status === 'FAILED' && (
                <ActionButton
                  tone="primary"
                  disabled={retry.pending === notification.id}
                  onClick={() => void retry.run(notification.id, `/notifications/admin/${notification.id}/retry`)}
                >Retry</ActionButton>
              )}</td>
            </tr>
          ))}
        </DataTable>
      </Panel>
    </PageShell>
  );
}
