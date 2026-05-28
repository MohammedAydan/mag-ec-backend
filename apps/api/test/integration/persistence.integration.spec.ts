import 'dotenv/config';

import argon2 from 'argon2';
import { UserType } from '@prisma/client';

import {
  assertMysqlDatabaseAvailable,
  createMysqlTestPrismaClient,
} from './support/mysql-test-client';

const runMysqlIntegration = process.env.RUN_MYSQL_INTEGRATION === 'true';

const describeMysqlIntegration = runMysqlIntegration ? describe : describe.skip;

describeMysqlIntegration('persistence integration', () => {
  const prisma = createMysqlTestPrismaClient();

  beforeAll(async () => {
    await assertMysqlDatabaseAvailable(prisma, 'persistence integration');
  });

  afterAll(async () => {
    await prisma.$disconnect();
  });

  it('connects to MySQL and enforces unique normalized emails', async () => {
    const normalizedEmail = `integration-${Date.now()}@example.com`;
    const passwordHash = await argon2.hash('Integration123!');

    const user = await prisma.user.create({
      data: {
        email: normalizedEmail,
        normalizedEmail,
        displayName: 'Integration User',
        passwordHash,
        userType: UserType.ADMIN,
      },
    });

    await expect(
      prisma.user.create({
        data: {
          email: normalizedEmail,
          normalizedEmail,
          displayName: 'Duplicate User',
          passwordHash,
          userType: UserType.ADMIN,
        },
      }),
    ).rejects.toThrow();

    await prisma.user.delete({
      where: { id: user.id },
    });
  });

  it('commits transaction-safe role assignment flows', async () => {
    const suffix = `${Date.now()}`;
    const normalizedEmail = `tx-${suffix}@example.com`;
    const passwordHash = await argon2.hash('Integration123!');

    await prisma.$transaction(async (tx) => {
      const permission = await tx.permission.create({
        data: {
          key: `integration.permission.${suffix}`,
          name: 'Integration Permission',
          module: 'integration',
          isSystem: false,
        },
      });

      const role = await tx.role.create({
        data: {
          key: `integration-role-${suffix}`,
          name: 'Integration Role',
          isSystem: false,
        },
      });

      const user = await tx.user.create({
        data: {
          email: normalizedEmail,
          normalizedEmail,
          displayName: 'Transaction User',
          passwordHash,
          userType: UserType.ADMIN,
        },
      });

      await tx.rolePermission.create({
        data: {
          roleId: role.id,
          permissionId: permission.id,
        },
      });

      await tx.userRole.create({
        data: {
          userId: user.id,
          roleId: role.id,
        },
      });
    });

    const persistedUser = await prisma.user.findUnique({
      where: { normalizedEmail },
      include: {
        userRoles: {
          include: {
            role: {
              include: {
                rolePermissions: true,
              },
            },
          },
        },
      },
    });

    if (!persistedUser) {
      throw new Error('Expected persisted user to exist after transaction.');
    }

    expect(persistedUser.userRoles).toHaveLength(1);
    expect(persistedUser.userRoles[0]?.role.rolePermissions).toHaveLength(1);

    await prisma.userRole.deleteMany({
      where: { userId: persistedUser.id },
    });
    await prisma.rolePermission.deleteMany({
      where: { roleId: persistedUser.userRoles[0]?.roleId },
    });
    await prisma.role.deleteMany({
      where: { key: `integration-role-${suffix}` },
    });
    await prisma.permission.deleteMany({
      where: { key: `integration.permission.${suffix}` },
    });
    await prisma.user.delete({
      where: { id: persistedUser.id },
    });
  });
});
