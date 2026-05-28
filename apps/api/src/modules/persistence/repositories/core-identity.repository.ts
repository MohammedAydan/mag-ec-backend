import { Injectable } from '@nestjs/common';
import { type Prisma, type Role, type User, UserStatus, UserType } from '@prisma/client';

export interface BootstrapPermissionInput {
  key: string;
  name: string;
  module: string;
  description?: string;
}

export interface BootstrapRoleInput {
  key: string;
  name: string;
  description?: string;
}

export interface BootstrapUserInput {
  email: string;
  normalizedEmail: string;
  displayName: string;
  passwordHash: string;
}

@Injectable()
export class CoreIdentityRepository {
  async upsertPermission(tx: Prisma.TransactionClient, permission: BootstrapPermissionInput) {
    return tx.permission.upsert({
      where: { key: permission.key },
      update: {
        name: permission.name,
        module: permission.module,
        description: permission.description,
        isSystem: true,
      },
      create: {
        key: permission.key,
        name: permission.name,
        module: permission.module,
        description: permission.description,
        isSystem: true,
      },
    });
  }

  async upsertRole(tx: Prisma.TransactionClient, role: BootstrapRoleInput): Promise<Role> {
    return tx.role.upsert({
      where: { key: role.key },
      update: {
        name: role.name,
        description: role.description,
        isSystem: true,
      },
      create: {
        key: role.key,
        name: role.name,
        description: role.description,
        isSystem: true,
      },
    });
  }

  async assignPermissionToRole(
    tx: Prisma.TransactionClient,
    roleId: string,
    permissionId: string,
  ): Promise<void> {
    await tx.rolePermission.upsert({
      where: {
        roleId_permissionId: {
          roleId,
          permissionId,
        },
      },
      update: {},
      create: {
        roleId,
        permissionId,
      },
    });
  }

  async upsertAdminUser(tx: Prisma.TransactionClient, user: BootstrapUserInput): Promise<User> {
    return tx.user.upsert({
      where: { normalizedEmail: user.normalizedEmail },
      update: {
        email: user.email,
        displayName: user.displayName,
        passwordHash: user.passwordHash,
        userType: UserType.ADMIN,
        status: UserStatus.ACTIVE,
      },
      create: {
        email: user.email,
        normalizedEmail: user.normalizedEmail,
        displayName: user.displayName,
        passwordHash: user.passwordHash,
        userType: UserType.ADMIN,
        status: UserStatus.ACTIVE,
      },
    });
  }

  async assignRoleToUser(
    tx: Prisma.TransactionClient,
    userId: string,
    roleId: string,
  ): Promise<void> {
    await tx.userRole.upsert({
      where: {
        userId_roleId: {
          userId,
          roleId,
        },
      },
      update: {},
      create: {
        userId,
        roleId,
      },
    });
  }

  async upsertStoreSetting(
    tx: Prisma.TransactionClient,
    key: string,
    value: Prisma.InputJsonValue,
    description: string,
  ): Promise<void> {
    await tx.storeSetting.upsert({
      where: { key },
      update: {
        value,
        description,
      },
      create: {
        key,
        value,
        description,
      },
    });
  }
}
