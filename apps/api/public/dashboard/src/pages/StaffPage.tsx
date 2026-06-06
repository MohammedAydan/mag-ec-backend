import { Plus, UserPlus } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useActionForm } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, dateOf, numberOf } from '@/lib/format';

export function StaffPage() {
  const { request } = useAuth();
  const { t } = useT();
  const result = useQuery({
    queryKey: ['staff'],
    queryFn: async () => {
      const [staff, roles, permissions, customers, carts, wishlists] = await Promise.all([
        request('/identity/admin/staff').catch(() => []),
        request('/identity/admin/roles').catch(() => []),
        request('/identity/admin/permissions').catch(() => []),
        request('/identity/admin/customers').catch(() => []),
        request('/support/admin/carts').catch(() => []),
        request('/support/admin/wishlists').catch(() => []),
      ]);
      return {
        staff: asArray(staff),
        roles: asArray(roles),
        permissions: asArray(permissions),
        customers: asArray(customers),
        carts: asArray(carts),
        wishlists: asArray(wishlists),
      };
    },
  });
  const action = useActionForm([['staff']]);

  if (result.isPending) {
    return (
      <PageShell title={t('staff.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (result.isError) {
    return (
      <PageShell title={t('staff.title')}>
        <LoadError error={result.error} />
      </PageShell>
    );
  }

  const data = result.data;
  const roleOptions = data.roles.map((role) => ({
    value: String(role.id),
    label: String(role.name ?? role.key ?? role.id),
    description: role.description ? String(role.description) : undefined,
  }));
  const permissionOptions = data.permissions.map((permission) => ({
    value: String(permission.key),
    label: String(permission.key),
    description: permission.description ? String(permission.description) : String(permission.group ?? ''),
  }));

  return (
    <PageShell
      title={t('staff.title')}
      subtitle={t('staff.subtitle')}
      actions={
        <>
          <button
            className="btn-primary"
            onClick={() =>
              action.open({
                title: t('staff.inviteStaff'),
                description: t('staff.inviteStaffDesc'),
                path: '/identity/admin/staff/invitations',
                method: 'POST',
                submitLabel: t('staff.sendInvitation'),
                values: { email: '', displayName: '', roleIds: [] },
                fields: [
                  {
                    name: 'displayName',
                    label: t('staff.displayName'),
                    type: 'text',
                    required: true,
                    width: 'half',
                  },
                  {
                    name: 'email',
                    label: t('staff.email'),
                    type: 'email',
                    required: true,
                    width: 'half',
                  },
                  {
                    name: 'roleIds',
                    label: t('staff.roles'),
                    type: 'checkbox-list',
                    required: true,
                    minItems: 1,
                    options: roleOptions,
                  },
                ],
              })
            }
          >
            <UserPlus size={16} /> {t('staff.inviteStaff')}
          </button>
          <button
            className="btn-primary"
            onClick={() =>
              action.open({
                title: t('staff.createStaffRole'),
                description: t('staff.createStaffRoleDesc'),
                path: '/identity/admin/roles',
                method: 'POST',
                submitLabel: t('staff.newRole'),
                values: {
                  name: '',
                  key: '',
                  description: '',
                  permissionKeys: [],
                },
                fields: [
                  {
                    name: 'name',
                    label: t('staff.roleName'),
                    type: 'text',
                    required: true,
                    width: 'half',
                  },
                  {
                    name: 'key',
                    label: t('staff.roleKey'),
                    type: 'text',
                    required: true,
                    description: t('staff.roleKeyDesc'),
                    width: 'half',
                  },
                  {
                    name: 'description',
                    label: t('common.description'),
                    type: 'textarea',
                    width: 'full',
                  },
                  {
                    name: 'permissionKeys',
                    label: t('staff.permissions'),
                    type: 'checkbox-list',
                    required: true,
                    minItems: 1,
                    options: permissionOptions,
                  },
                ],
              })
            }
          >
            <Plus size={16} /> {t('staff.newRole')}
          </button>
        </>
      }
    >
      <div className="space-y-6 p-6">
        <Feedback message={action.feedback} />

        <div className="grid gap-6 lg:grid-cols-2">
          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">
              {t('staff.staffAccounts')} · {data.staff.length} {t('staff.administrators')}
            </h2>
            <DataTable headers={[t('staff.account'), t('staff.rolesList'), t('common.status'), '']} empty={!data.staff.length}>
              {data.staff.map((account) => (
                <tr key={account.id}>
                  <td>
                    <strong className="block text-sm">{account.displayName ?? account.email}</strong>
                    <small className="block text-xs text-neutral-400">{account.email}</small>
                  </td>
                  <td className="max-w-32 truncate">
                    {asArray(account.userRoles)
                      .map((entry: { role?: { name?: string; key?: string } }) => entry.role?.name ?? entry.role?.key)
                      .filter(Boolean)
                      .join(', ') || t('staff.noRole')}
                  </td>
                  <td>
                    <span className={chipClass(account.status ?? (account.isActive ? 'ACTIVE' : 'PENDING'))}>
                      {String(account.status ?? (account.isActive ? 'ACTIVE' : 'PENDING'))}
                    </span>
                  </td>
                  <td>
                    <div className="flex justify-end">
                      <button
                        className="btn-table-default"
                        onClick={() =>
                          action.open({
                            title: t('staff.updateStaffStatus'),
                            description: t('staff.updateStaffStatusDesc'),
                            path: `/identity/admin/staff/${account.id}/status`,
                            method: 'PATCH',
                            submitLabel: t('common.update'),
                            values: {
                              status: String(account.status ?? (account.isActive ? 'ACTIVE' : 'PENDING')),
                            },
                            fields: [
                              {
                                name: 'status',
                                label: t('staff.accountStatus'),
                                type: 'radio',
                                required: true,
                                options: [
                                  { value: 'ACTIVE', label: t('common.active') },
                                  { value: 'SUSPENDED', label: t('staff.suspended') },
                                  { value: 'DISABLED', label: t('common.disabled') },
                                ],
                              },
                            ],
                          })
                        }
                      >
                        {t('staff.statusButton')}
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </DataTable>
          </div>

          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">
              {t('staff.rolesList')} · {data.permissions.length} {t('staff.platformPermissions')}
            </h2>
            <DataTable headers={[t('staff.roleCol'), t('staff.permissionsCol'), '']} empty={!data.roles.length}>
              {data.roles.map((role) => {
                const selectedPermissions = asArray(role.permissions ?? role.rolePermissions)
                  .map((entry: { key?: string; permission?: { key?: string } }) => entry.key ?? entry.permission?.key)
                  .filter((value): value is string => Boolean(value));

                return (
                  <tr key={role.id}>
                    <td>
                      <strong className="block text-sm">{role.name ?? role.key}</strong>
                    </td>
                    <td>{numberOf(selectedPermissions.length || role._count?.permissions || 0)}</td>
                    <td>
                      <div className="flex justify-end">
                        <button
                          className="btn-table-default"
                          onClick={() =>
                            action.open({
                              title: t('staff.updateRolePermissions'),
                              description: t('staff.updateRolePermissionsDesc'),
                              path: `/identity/admin/roles/${role.id}/permissions`,
                              method: 'PATCH',
                              submitLabel: t('staff.savePermissions'),
                              values: { permissionKeys: selectedPermissions },
                              fields: [
                                {
                                  name: 'permissionKeys',
                                  label: t('staff.permissions'),
                                  type: 'checkbox-list',
                                  required: true,
                                  minItems: 1,
                                  options: permissionOptions,
                                },
                              ],
                            })
                          }
                        >
                          {t('staff.permissionsButton')}
                        </button>
                      </div>
                    </td>
                  </tr>
                );
              })}
            </DataTable>
          </div>
        </div>

        <div className="space-y-2">
          <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">
              {t('staff.customersSection')} · {data.customers.length} {t('staff.recentAccounts')}
          </h2>
          <DataTable headers={[t('staff.customerCol'), t('common.status'), t('staff.ordersCol'), t('staff.reviewsCol'), t('staff.joinedCol')]} empty={!data.customers.length}>
            {data.customers.map((customer) => (
              <tr key={customer.id}>
                <td>
                  <strong className="block text-sm">{customer.displayName ?? customer.email}</strong>
                  <small className="block text-xs text-neutral-400">{customer.email}</small>
                </td>
                <td>
                  <span className={chipClass(customer.status)}>
                    {String(customer.status ?? t('common.unknown'))}
                  </span>
                </td>
                <td>{numberOf(customer._count?.orders)}</td>
                <td>{numberOf(customer._count?.reviews)}</td>
                <td>{dateOf(customer.createdAt)}</td>
              </tr>
            ))}
          </DataTable>
        </div>

        <div className="grid gap-6 lg:grid-cols-2">
          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('staff.activeCarts')}</h2>
            <DataTable headers={[t('staff.customerCol'), t('staff.itemsCol'), t('pricing.couponButton'), t('common.update')]} empty={!data.carts.length}>
              {data.carts.slice(0, 12).map((cart) => (
                <tr key={cart.id}>
                  <td>
                    <strong className="block text-sm">{cart.user?.displayName ?? cart.user?.email ?? t('staff.guestCart')}</strong>
                    <small className="block text-xs text-neutral-400">{cart.user?.email ?? t('staff.anonymousCheckout')}</small>
                  </td>
                  <td>
                    {numberOf(
                      asArray(cart.items).reduce(
                        (sum: number, item: { quantity?: number }) => sum + Number(item.quantity ?? 0),
                        0,
                      ),
                    )}
                  </td>
                  <td>{cart.couponCode ?? t('common.unknown')}</td>
                  <td>{dateOf(cart.updatedAt)}</td>
                </tr>
              ))}
            </DataTable>
          </div>

          <div className="space-y-2">
            <h2 className="text-sm font-semibold uppercase tracking-[0.15em] text-neutral-400">{t('staff.wishlists')}</h2>
            <DataTable headers={[t('staff.customerCol'), t('staff.itemsCol'), t('common.update')]} empty={!data.wishlists.length}>
              {data.wishlists.slice(0, 12).map((wishlist) => (
                <tr key={wishlist.id}>
                  <td>
                    <strong className="block text-sm">{wishlist.user?.displayName ?? wishlist.user?.email ?? t('staff.customerFallback')}</strong>
                    <small className="block text-xs text-neutral-400">{wishlist.user?.email ?? t('common.unknown')}</small>
                  </td>
                  <td>{numberOf(asArray(wishlist.items).length)}</td>
                  <td>{dateOf(wishlist.updatedAt)}</td>
                </tr>
              ))}
            </DataTable>
          </div>
        </div>
      </div>
      <ConfirmModal
        action={action.action}
        busy={action.busy}
        error={action.error}
        fieldErrors={action.fieldErrors}
        onClose={action.close}
        onSubmit={action.execute}
      />
    </PageShell>
  );
}
