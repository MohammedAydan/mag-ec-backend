import 'dotenv/config';

import argon2 from 'argon2';

import {
  assertMysqlDatabaseAvailable,
  createMysqlTestPrismaClient,
} from './support/mysql-test-client';

const runMysqlIntegration = process.env.RUN_MYSQL_INTEGRATION === 'true';

const describeMysqlIntegration = runMysqlIntegration ? describe : describe.skip;

describeMysqlIntegration('seed integration', () => {
  const prisma = createMysqlTestPrismaClient();

  beforeAll(async () => {
    await assertMysqlDatabaseAvailable(prisma, 'seed integration');
  });

  afterAll(async () => {
    await prisma.$disconnect();
  });

  it('creates the seeded admin role, permissions, and store defaults', async () => {
    const adminEmail = (process.env.DEV_SEED_ADMIN_EMAIL ?? 'admin@example.com').trim();
    const adminPassword = process.env.DEV_SEED_ADMIN_PASSWORD ?? 'ChangeMe123!';
    const normalizedEmail = adminEmail.toLowerCase();

    const seededUser = await prisma.user.findUnique({
      where: { normalizedEmail },
      include: {
        userRoles: {
          include: {
            role: {
              include: {
                rolePermissions: {
                  include: {
                    permission: true,
                  },
                },
              },
            },
          },
        },
      },
    });

    expect(seededUser).not.toBeNull();
    expect(seededUser?.userRoles).toHaveLength(1);
    expect(await argon2.verify(seededUser!.passwordHash, adminPassword)).toBe(true);
    expect(seededUser?.userRoles[0]?.role.key).toBe('super_admin');

    const permissionKeys =
      seededUser?.userRoles[0]?.role.rolePermissions
        .map(({ permission }) => permission.key)
        .sort() ?? [];
    const allPermissionKeys = (await prisma.permission.findMany({ select: { key: true } }))
      .map(({ key }) => key)
      .sort();

    expect(permissionKeys).toEqual(allPermissionKeys);

    const storeSettings = await prisma.storeSetting.findMany({
      where: {
        key: {
          in: ['store.currency', 'store.locales'],
        },
      },
      orderBy: {
        key: 'asc',
      },
    });

    expect(storeSettings).toHaveLength(2);
    expect(storeSettings[0]?.key).toBe('store.currency');
    expect(storeSettings[1]?.key).toBe('store.locales');
  });
});
