import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useActionForm } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass } from '@/lib/format';

export function ReviewsPage() {
  const { request } = useAuth();
  const { t } = useT();
  const reviews = useQuery({
    queryKey: ['reviews'],
    queryFn: async () => asArray(await request('/reviews/admin?limit=50').catch(() => [])),
  });
  const action = useActionForm([['reviews']]);

  if (reviews.isPending) {
    return (
      <PageShell title={t('reviews.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (reviews.isError) {
    return (
      <PageShell title={t('reviews.title')}>
        <LoadError error={reviews.error} />
      </PageShell>
    );
  }

  return (
    <PageShell title={t('reviews.title')} subtitle={t('reviews.subtitle')}>
      <div className="space-y-4 p-6">
        <Feedback message={action.feedback} />
        <div className="flex items-center justify-between">
          <p className="text-sm text-neutral-400">{reviews.data.length} {t('reviews.submissions')}</p>
        </div>
        <DataTable headers={[t('reviews.productOrCustomer'), t('reviews.rating'), t('reviews.comment'), t('common.status'), '']} empty={!reviews.data.length}>
          {reviews.data.map((review) => (
            <tr key={review.id}>
              <td>
                <strong className="block text-sm">{review.product?.name ?? review.productId ?? t('reviews.product')}</strong>
                <small className="block text-xs text-neutral-400">{review.customer?.email ?? review.user?.email ?? t('reviews.customer')}</small>
              </td>
              <td>
                <span className="text-yellow-500">
                  {'★'.repeat(Math.min(5, Number(review.rating ?? 0)))}
                </span>
                <span className="text-default-300">
                  {'☆'.repeat(Math.max(0, 5 - Number(review.rating ?? 0)))}
                </span>
              </td>
              <td className="max-w-48 truncate">{String(review.comment ?? review.body ?? '').slice(0, 64)}</td>
              <td>
                <span className={chipClass(review.status)}>
                  {String(review.status ?? t('common.unknown'))}
                </span>
              </td>
              <td>
                <div className="flex justify-end gap-2">
                  <button className="btn-table-success" onClick={() => action.open({
                    title: t('reviews.approveReview'),
                    description: t('reviews.approveReviewDesc'),
                    path: `/reviews/admin/${review.id}/moderate`,
                    method: 'PATCH',
                    submitLabel: t('reviews.approveReview'),
                    values: { decision: 'APPROVE' },
                    fields: [
                      {
                        name: 'decision',
                        label: t('reviews.moderationDecision'),
                        type: 'radio',
                        options: [
                          { value: 'APPROVE', label: t('reviews.approve') },
                          { value: 'REJECT', label: t('reviews.reject') },
                        ],
                      },
                    ],
                  })}>{t('reviews.approve')}</button>
                  <button className="btn-table-danger" onClick={() => action.open({
                    title: t('reviews.rejectReview'),
                    description: t('reviews.rejectReviewDesc'),
                    path: `/reviews/admin/${review.id}/moderate`,
                    method: 'PATCH',
                    tone: 'danger',
                    submitLabel: t('reviews.rejectReview'),
                    values: {
                      decision: 'REJECT',
                      reason: 'Does not meet review guidelines.',
                    },
                    fields: [
                      {
                        name: 'decision',
                        label: t('reviews.moderationDecision'),
                        type: 'radio',
                        options: [
                          { value: 'REJECT', label: t('reviews.reject') },
                          { value: 'APPROVE', label: t('reviews.approveInstead') },
                        ],
                      },
                      {
                        name: 'reason',
                        label: t('reviews.rejectionReason'),
                        type: 'textarea',
                        required: true,
                        rows: 4,
                        description: t('reviews.rejectionReasonDesc'),
                      },
                    ],
                  })}>{t('reviews.reject')}</button>
                </div>
              </td>
            </tr>
          ))}
        </DataTable>
      </div>
      <ConfirmModal action={action.action} busy={action.busy} error={action.error} fieldErrors={action.fieldErrors} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
