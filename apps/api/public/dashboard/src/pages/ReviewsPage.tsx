import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, RowActions } from '@/components/ui/AdminUi';
import { useJsonAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray } from '@/lib/format';

export function ReviewsPage() {
  const { request } = useAuth();
  const reviews = useQuery({
    queryKey: ['reviews'],
    queryFn: async () => asArray(await request('/reviews/admin?limit=50').catch(() => [])),
  });
  const action = useJsonAction([['reviews']]);

  if (reviews.isPending) return <PageShell title="Review moderation"><PageLoading /></PageShell>;
  if (reviews.isError) return <PageShell title="Review moderation"><LoadError error={reviews.error} /></PageShell>;

  return (
    <PageShell title="Review moderation" subtitle="Protect quality while publishing trusted customer feedback.">
      <Feedback message={action.feedback} />
      <Panel title="Reviews" subtitle={`${reviews.data.length} submissions`}>
        <DataTable headers={['Product / customer', 'Rating', 'Comment', 'Status', '']} empty={!reviews.data.length}>
          {reviews.data.map((review) => (
            <tr key={review.id}>
              <td><strong>{review.product?.name ?? review.productId ?? 'Product'}</strong><small>{review.customer?.email ?? review.user?.email ?? 'Customer'}</small></td>
              <td>{'★'.repeat(Math.min(5, Number(review.rating ?? 0)))}{'☆'.repeat(Math.max(0, 5 - Number(review.rating ?? 0)))}</td>
              <td>{String(review.comment ?? review.body ?? '').slice(0, 64)}</td>
              <td><Badge value={review.status} /></td>
              <td>
                <RowActions>
                  <ActionButton tone="primary" onClick={() => action.open({
                    title: 'Approve review',
                    description: 'Make this moderated review visible on the storefront.',
                    path: `/reviews/admin/${review.id}/moderate`,
                    method: 'PATCH',
                    payload: { decision: 'APPROVE' },
                  })}>Approve</ActionButton>
                  <ActionButton tone="danger" onClick={() => action.open({
                    title: 'Reject review',
                    description: 'Reject a customer review with an auditable reason.',
                    path: `/reviews/admin/${review.id}/moderate`,
                    method: 'PATCH',
                    payload: { decision: 'REJECT', reason: 'Does not meet review guidelines.' },
                  })}>Reject</ActionButton>
                </RowActions>
              </td>
            </tr>
          ))}
        </DataTable>
      </Panel>
      <JsonActionDialog {...action} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
