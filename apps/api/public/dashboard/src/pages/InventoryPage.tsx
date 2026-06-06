import { Plus } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useActionForm } from '@/lib/admin-actions';
import type { ActionOption } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, dateOf, numberOf } from '@/lib/format';

export function InventoryPage() {
  const { request } = useAuth();
  const { t } = useT();
  const data = useQuery({
    queryKey: ['inventory'],
    queryFn: async () => {
      const [levels, movements, reservations] = await Promise.all([
        request('/inventory/admin/levels').catch(() => []),
        request('/inventory/admin/movements?limit=20').catch(() => []),
        request('/inventory/admin/reservations?limit=20').catch(() => []),
      ]);
      return { stock: asArray(levels), movements: asArray(movements), reservations: asArray(reservations) };
    },
  });
  const action = useActionForm([['inventory']]);

  if (data.isPending) {
    return (
      <PageShell title={t('inventory.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (data.isError) {
    return (
      <PageShell title={t('inventory.title')}>
        <LoadError error={data.error} />
      </PageShell>
    );
  }

  // Extract unique warehouse and variant options from stock levels
  const warehouseMap = new Map<string, string>();
  const variantMap = new Map<string, string>();
  data.data.stock.forEach((s: Record<string, unknown>) => {
    if (s.warehouseId && !warehouseMap.has(String(s.warehouseId))) {
      const wh = s.warehouse as Record<string, unknown> | undefined;
      warehouseMap.set(String(s.warehouseId), String(wh?.name ?? wh?.key ?? s.warehouseId));
    }
    if (s.variantId && !variantMap.has(String(s.variantId))) {
      const v = s.variant as Record<string, unknown> | undefined;
      variantMap.set(String(s.variantId), String(v?.name ?? v?.sku ?? s.variantId));
    }
  });
  const warehouseOptions: ActionOption[] = Array.from(warehouseMap.entries()).map(([id, name]) => ({
    value: id,
    label: name,
  }));
  const variantOptions: ActionOption[] = Array.from(variantMap.entries()).map(([id, name]) => ({
    value: id,
    label: name,
  }));

  return (
    <PageShell
      title={t('inventory.title')}
      subtitle={t('inventory.subtitle')}
      actions={
        <button
          className="btn-primary"
          onClick={() => action.open({
            title: t('inventory.adjustStock'),
            description: t('inventory.adjustStockDesc'),
            path: '/inventory/admin/adjustments',
            method: 'POST',
            submitLabel: t('inventory.recordAdjustment'),
            values: {
              warehouseId: '',
              variantId: '',
              quantityChanged: 10,
              type: 'RECEIPT',
              reason: 'Initial receiving',
            },
            fields: [
              { name: 'warehouseId', label: t('inventory.warehouse'), type: 'select', required: true, width: 'half', placeholder: t('inventory.selectWarehouse'), options: warehouseOptions },
              { name: 'variantId', label: t('inventory.variant'), type: 'select', required: true, width: 'half', placeholder: t('inventory.selectVariant'), options: variantOptions },
              { name: 'quantityChanged', label: t('inventory.quantityDelta'), type: 'number', required: true, width: 'half', step: 1 },
              {
                name: 'type',
                label: t('inventory.movementType'),
                type: 'radio',
                width: 'half',
                options: [
                  { value: 'RECEIPT', label: t('inventory.receipt') },
                  { value: 'ADJUSTMENT', label: t('inventory.adjustment') },
                  { value: 'RETURN', label: t('inventory.return') },
                  { value: 'RELEASE', label: t('inventory.release') },
                ],
              },
              {
                name: 'reason',
                label: t('inventory.auditReason'),
                type: 'textarea',
                required: true,
                rows: 4,
                description: t('inventory.auditReasonDesc'),
              },
            ],
          })}
        >
          <Plus size={16} /> {t('inventory.adjustStock')}
        </button>
      }
    >
      <div className="space-y-6 p-6">
        <Feedback message={action.feedback} />

        <div className="grid gap-6 lg:grid-cols-2">
          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">
              {t('inventory.stockLevelsMonitored', { count: data.data.stock.length })}
            </h2>
            <DataTable headers={[t('inventory.variant'), t('inventory.onHand'), t('inventory.reserved'), t('inventory.signal'), t('inventory.available')]} empty={!data.data.stock.length}>
              {data.data.stock.map((stock) => {
                const available = Number(stock.quantityOnHand ?? 0) - Number(stock.quantityReserved ?? 0);
                return (
                  <tr key={`${stock.variantId}-${stock.warehouseId}`}>
                    <td>
                      <strong className="block text-sm">{stock.variant?.sku ?? stock.sku ?? stock.variantId}</strong>
                      <small className="block text-xs text-neutral-400">{stock.warehouse?.name ?? stock.warehouseId ?? t('inventory.defaultWarehouse')}</small>
                    </td>
                    <td>{numberOf(stock.quantityOnHand)}</td>
                    <td>{numberOf(stock.quantityReserved)}</td>
                    <td>
                      <span className={chipClass(available <= 5 ? 'warning' : 'success')}>
                        {available <= 5 ? t('inventory.lowStock') : t('inventory.available')}
                      </span>
                    </td>
                    <td>{numberOf(available)}</td>
                  </tr>
                );
              })}
            </DataTable>
          </div>

          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('inventory.movementHistory')}</h2>
            <DataTable headers={[t('inventory.date'), t('inventory.type'), t('inventory.delta'), t('inventory.reference')]} empty={!data.data.movements.length}>
              {data.data.movements.slice(0, 8).map((movement) => (
                <tr key={movement.id ?? movement.createdAt}>
                  <td>{dateOf(movement.createdAt)}</td>
                  <td>{movement.type ?? t('inventory.movement')}</td>
                  <td>{numberOf(movement.quantityChanged)}</td>
                  <td>{movement.reason ?? movement.referenceId ?? t('common.unknown')}</td>
                </tr>
              ))}
            </DataTable>
          </div>
        </div>

        <div className="space-y-2">
          <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('inventory.reservations')}</h2>
          <DataTable headers={[t('inventory.variant'), t('inventory.qty'), t('common.status'), t('inventory.expires'), t('inventory.customer')]} empty={!data.data.reservations.length}>
            {data.data.reservations.map((reservation) => (
              <tr key={reservation.id}>
                <td>
                  <strong className="block text-sm">{reservation.variant?.sku ?? reservation.variantId}</strong>
                  <small className="block text-xs text-neutral-400">{reservation.warehouse?.name ?? reservation.warehouseId}</small>
                </td>
                <td>{numberOf(reservation.quantity)}</td>
                <td>
                  <span className={chipClass(reservation.status)}>
                    {String(reservation.status ?? t('common.unknown'))}
                  </span>
                </td>
                <td>{dateOf(reservation.expiresAt)}</td>
                <td>{reservation.user?.email ?? t('common.guest')}</td>
              </tr>
            ))}
          </DataTable>
        </div>
      </div>
      <ConfirmModal action={action.action} busy={action.busy} error={action.error} fieldErrors={action.fieldErrors} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
