import { Plus, UserPlus } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { ActionButton, Badge, DataTable, Feedback, JsonActionDialog, LoadError, PageLoading, Panel, layout } from '@/components/ui/AdminUi';
import { useJsonAction } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { asArray, dateOf, numberOf } from '@/lib/format';

export function StaffPage() {
  const { request } = useAuth();
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
  const action = useJsonAction([['staff']]);

  if (result.isPending) return <PageShell title="Staff & access"><PageLoading /></PageShell>;
  if (result.isError) return <PageShell title="Staff & access"><LoadError error={result.error} /></PageShell>;

  const data = result.data;

  return (
    <PageShell
      title="Staff & access"
      subtitle="Role-based access control and customer visibility for safe store operations."
      actions={<>
        <ActionButton tone="primary" onClick={() => action.open({
          title: 'Invite staff member',
          description: 'Create a staff invitation and assign initial roles.',
          path: '/identity/admin/staff/invitations',
          method: 'POST',
          payload: { email: 'staff@example.com', displayName: 'Store Manager', roleIds: [] },
        })}><UserPlus size={16} /> Invite staff</ActionButton>
        <ActionButton onClick={() => action.open({
          title: 'Create staff role',
          description: 'Create a role with least-privilege permissions.',
          path: '/identity/admin/roles',
          method: 'POST',
          payload: { name: 'Operations Manager', key: 'operations_manager', permissionKeys: ['orders.read', 'inventory.read'] },
        })}><Plus size={16} /> New role</ActionButton>
      </>}
    >
      <Feedback message={action.feedback} />
      <section className={layout.grid2}>
        <Panel title="Staff accounts" subtitle={`${data.staff.length} administrators`}>
          <DataTable headers={['Account', 'Roles', 'Status', '']} empty={!data.staff.length}>
            {data.staff.map((account) => (
              <tr key={account.id}>
                <td><strong>{account.displayName ?? account.email}</strong><small>{account.email}</small></td>
                <td>{asArray(account.userRoles).map((entry) => entry.role?.name ?? entry.role?.key).filter(Boolean).join(', ') || 'No role'}</td>
                <td><Badge value={account.status ?? (account.isActive ? 'ACTIVE' : 'PENDING')} /></td>
                <td>
                  <ActionButton onClick={() => action.open({
                    title: 'Update staff status',
                    description: 'Enable or suspend an administrator account.',
                    path: `/identity/admin/staff/${account.id}/status`,
                    method: 'PATCH',
                    payload: { status: 'ACTIVE' },
                  })}>Status</ActionButton>
                </td>
              </tr>
            ))}
          </DataTable>
        </Panel>
        <Panel title="Roles" subtitle={`${data.permissions.length} platform permissions`}>
          <DataTable headers={['Role', 'Permissions', '']} empty={!data.roles.length}>
            {data.roles.map((role) => (
              <tr key={role.id}>
                <td><strong>{role.name ?? role.key}</strong></td>
                <td>{numberOf(asArray(role.rolePermissions).length || role._count?.permissions || 0)}</td>
                <td>
                  <ActionButton onClick={() => action.open({
                    title: 'Update role permissions',
                    description: 'Assign permissions explicitly to this role.',
                    path: `/identity/admin/roles/${role.id}/permissions`,
                    method: 'PATCH',
                    payload: { permissionKeys: ['orders.read', 'orders.write', 'inventory.read'] },
                  })}>Permissions</ActionButton>
                </td>
              </tr>
            ))}
          </DataTable>
        </Panel>
      </section>
      <Panel title="Customers" subtitle={`${data.customers.length} recent customer accounts`}>
        <DataTable headers={['Customer', 'Status', 'Orders', 'Reviews', 'Joined']} empty={!data.customers.length}>
          {data.customers.map((customer) => (
            <tr key={customer.id}>
              <td><strong>{customer.displayName ?? customer.email}</strong><small>{customer.email}</small></td>
              <td><Badge value={customer.status} /></td>
              <td>{numberOf(customer._count?.orders)}</td>
              <td>{numberOf(customer._count?.reviews)}</td>
              <td>{dateOf(customer.createdAt)}</td>
            </tr>
          ))}
        </DataTable>
      </Panel>
      <section className={layout.grid2}>
        <Panel title="Active carts" subtitle="Support visibility without exposing guest tokens">
          <DataTable headers={['Customer', 'Items', 'Coupon', 'Updated']} empty={!data.carts.length}>
            {data.carts.slice(0, 12).map((cart) => (
              <tr key={cart.id}>
                <td><strong>{cart.user?.displayName ?? cart.user?.email ?? 'Guest cart'}</strong><small>{cart.user?.email ?? 'Anonymous checkout'}</small></td>
                <td>{numberOf(asArray(cart.items).reduce((sum, item) => sum + Number(item.quantity ?? 0), 0))}</td>
                <td>{cart.couponCode ?? '—'}</td>
                <td>{dateOf(cart.updatedAt)}</td>
              </tr>
            ))}
          </DataTable>
        </Panel>
        <Panel title="Wishlists" subtitle="Recent saved-product activity">
          <DataTable headers={['Customer', 'Items', 'Updated']} empty={!data.wishlists.length}>
            {data.wishlists.slice(0, 12).map((wishlist) => (
              <tr key={wishlist.id}>
                <td><strong>{wishlist.user?.displayName ?? wishlist.user?.email ?? 'Customer'}</strong><small>{wishlist.user?.email ?? '—'}</small></td>
                <td>{numberOf(asArray(wishlist.items).length)}</td>
                <td>{dateOf(wishlist.updatedAt)}</td>
              </tr>
            ))}
          </DataTable>
        </Panel>
      </section>
      <JsonActionDialog {...action} onClose={action.close} onSubmit={action.execute} />
    </PageShell>
  );
}
