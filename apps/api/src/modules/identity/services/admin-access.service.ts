import { randomBytes } from 'node:crypto';
import {
  BadRequestException,
  ConflictException,
  Inject,
  Injectable,
  NotFoundException,
  ServiceUnavailableException,
} from '@nestjs/common';
import { AuditCategory, type Prisma, UserStatus, UserType } from '@prisma/client';

import type { AccessTokenPayload } from './token.service';
import type {
  CreateAdminRoleDto,
  InviteStaffDto,
  UpdateAdminRolePermissionsDto,
  UpdateStaffRolesDto,
  UpdateStaffStatusDto,
} from '../dto/admin-access.dto';
import { PrismaService } from '../../persistence/services/prisma.service';
import { AccountActionTokenService } from './account-action-token.service';
import { TransactionalEmailService } from './transactional-email.service';
import { UserService } from './user.service';
import type {
  AdminPermissionDto,
  AdminRoleDto,
  StaffDetailDto,
} from '../dto/identity-response.dto';

type RoleWithPermissions = {
  id: string;
  key: string;
  name: string;
  description: string | null;
  createdAt: Date;
  updatedAt: Date;
  rolePermissions: Array<{
    permission: {
      key: string;
      module: string;
      description: string | null;
      name?: string;
    };
  }>;
  _count?: {
    userRoles: number;
  };
};

type StaffWithRoles = {
  id: string;
  email: string;
  displayName: string;
  status: string;
  userRoles: Array<{
    role: {
      id: string;
      key: string;
      name: string;
    };
  }>;
};

@Injectable()
export class AdminAccessService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(UserService) private readonly users: UserService,
    @Inject(AccountActionTokenService) private readonly accountTokens: AccountActionTokenService,
    @Inject(TransactionalEmailService) private readonly email: TransactionalEmailService,
  ) {}

  listPermissions() {
    return this.prisma.permission
      .findMany({
        where: { archivedAt: null },
        orderBy: [{ module: 'asc' }, { key: 'asc' }],
        select: { id: true, key: true, name: true, module: true, description: true },
      })
      .then((permissions) => permissions.map((permission) => this.serializePermission(permission)));
  }

  listRoles() {
    return this.prisma.role
      .findMany({
        where: { archivedAt: null },
        orderBy: [{ isSystem: 'desc' }, { key: 'asc' }],
        include: {
          rolePermissions: { include: { permission: true } },
          _count: { select: { userRoles: true } },
        },
      })
      .then((roles) => roles.map((role) => this.serializeRole(role)));
  }

  listStaff() {
    return this.prisma.user.findMany({
      where: { userType: UserType.ADMIN, deletedAt: null },
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
      select: {
        id: true,
        email: true,
        displayName: true,
        status: true,
        emailVerifiedAt: true,
        lastLoginAt: true,
        createdAt: true,
        userRoles: { include: { role: true } },
      },
    });
  }

  listCustomers() {
    return this.prisma.user.findMany({
      where: { userType: UserType.CUSTOMER, deletedAt: null },
      take: 100,
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
      select: {
        id: true,
        email: true,
        displayName: true,
        status: true,
        emailVerifiedAt: true,
        lastLoginAt: true,
        createdAt: true,
        _count: { select: { orders: true, reviews: true } },
      },
    });
  }

  async createRole(actor: AccessTokenPayload, dto: CreateAdminRoleDto) {
    const permissionIds = await this.resolvePermissionIds(dto.permissionKeys);
    return this.prisma.$transaction(async (tx) => {
      const role = await tx.role.create({
        data: {
          key: dto.key.trim().toLowerCase(),
          name: dto.name.trim(),
          description: dto.description?.trim(),
          isSystem: false,
          rolePermissions: { create: permissionIds.map((permissionId) => ({ permissionId })) },
        },
        include: { rolePermissions: { include: { permission: true } } },
      });
      await tx.auditLog.create({
        data: {
          actorUserId: actor.sub,
          category: AuditCategory.DATA_CHANGE,
          action: 'ADMIN_ROLE_CREATED',
          entityType: 'Role',
          entityId: role.id,
          metadata: { key: role.key, permissionKeys: dto.permissionKeys },
        },
      });
      return this.serializeRole(role);
    });
  }

  async updateRolePermissions(
    actor: AccessTokenPayload,
    roleId: string,
    dto: UpdateAdminRolePermissionsDto,
  ) {
    const role = await this.prisma.role.findUnique({ where: { id: roleId } });
    if (!role || role.archivedAt) throw new NotFoundException('Administrative role not found');
    if (role.isSystem)
      throw new BadRequestException('System roles cannot be modified through this endpoint');
    const permissionIds = await this.resolvePermissionIds(dto.permissionKeys);
    return this.prisma.$transaction(async (tx) => {
      await tx.rolePermission.deleteMany({ where: { roleId } });
      await tx.rolePermission.createMany({
        data: permissionIds.map((permissionId) => ({ roleId, permissionId })),
      });
      await tx.auditLog.create({
        data: {
          actorUserId: actor.sub,
          category: AuditCategory.DATA_CHANGE,
          action: 'ADMIN_ROLE_PERMISSIONS_UPDATED',
          entityType: 'Role',
          entityId: roleId,
          metadata: { permissionKeys: dto.permissionKeys },
        },
      });
      const updatedRole = await tx.role.findUniqueOrThrow({
        where: { id: roleId },
        include: {
          rolePermissions: { include: { permission: true } },
          _count: { select: { userRoles: true } },
        },
      });
      return this.serializeRole(updatedRole);
    });
  }

  async inviteStaff(actor: AccessTokenPayload, dto: InviteStaffDto) {
    const normalizedEmail = this.users.normalizeEmail(dto.email);
    if (await this.prisma.user.findUnique({ where: { normalizedEmail } })) {
      throw new ConflictException('A user with this email already exists');
    }
    const roles = await this.resolveAssignableRoles(actor, dto.roleIds);
    const passwordHash = await this.users.hashPassword(randomBytes(32).toString('base64url'));
    const staff = await this.prisma.$transaction(async (tx) => {
      const created = await tx.user.create({
        data: {
          email: dto.email.trim(),
          normalizedEmail,
          displayName: dto.displayName.trim(),
          passwordHash,
          userType: UserType.ADMIN,
          status: UserStatus.INVITED,
          userRoles: { create: roles.map((role) => ({ roleId: role.id })) },
        },
        select: { id: true, email: true, displayName: true, status: true },
      });
      await tx.auditLog.create({
        data: {
          actorUserId: actor.sub,
          category: AuditCategory.DATA_CHANGE,
          action: 'ADMIN_STAFF_INVITED',
          entityType: 'User',
          entityId: created.id,
          metadata: { roleIds: roles.map((role) => role.id) },
        },
      });
      return created;
    });

    const token = await this.accountTokens.issuePasswordResetToken(staff.id);
    let emailDelivered = false;
    try {
      await this.email.sendPasswordResetEmail(staff.email, token);
      emailDelivered = true;
    } catch (_error) {
      await this.accountTokens.revokePasswordResetToken(token);
      // Don't rollback — keep the account; the dashboard can show a warning.
    }
    return { ...staff, emailDelivered };
  }

  async resendStaffInvitation(actor: AccessTokenPayload, staffId: string) {
    const staff = await this.findStaffOrThrow(staffId);
    if (staff.status === UserStatus.ACTIVE) {
      throw new BadRequestException(
        'Active staff members should use the standard password-reset flow',
      );
    }
    if (staff.status === UserStatus.SUSPENDED) {
      throw new BadRequestException('Suspended staff members cannot receive invitations');
    }

    const token = await this.accountTokens.issuePasswordResetToken(staff.id);
    let emailDelivered = false;
    try {
      await this.email.sendPasswordResetEmail(staff.email, token);
      emailDelivered = true;
      await this.prisma.$transaction(async (tx) => {
        await tx.user.update({ where: { id: staff.id }, data: { status: UserStatus.INVITED } });
        await tx.auditLog.create({
          data: {
            actorUserId: actor.sub,
            category: AuditCategory.AUTH,
            action: 'ADMIN_STAFF_INVITATION_RESENT',
            entityType: 'User',
            entityId: staff.id,
          },
        });
      });
    } catch (_error) {
      await this.accountTokens.revokePasswordResetToken(token);
      // Don't throw — return warning instead
    }
    return { invitationSent: true, emailDelivered };
  }

  async updateStaffRoles(actor: AccessTokenPayload, staffId: string, dto: UpdateStaffRolesDto) {
    const staff = await this.findStaffOrThrow(staffId);
    const roles = await this.resolveAssignableRoles(actor, dto.roleIds);
    await this.assertLastSuperAdminIsPreserved(
      staff,
      roles.map((role) => role.key),
    );
    return this.prisma.$transaction(async (tx) => {
      await tx.userRole.deleteMany({ where: { userId: staffId } });
      await tx.userRole.createMany({
        data: roles.map((role) => ({ userId: staffId, roleId: role.id })),
      });
      await tx.user.update({
        where: { id: staffId },
        data: { tokenVersion: { increment: 1 } },
      });
      await tx.auditLog.create({
        data: {
          actorUserId: actor.sub,
          category: AuditCategory.DATA_CHANGE,
          action: 'ADMIN_STAFF_ROLES_UPDATED',
          entityType: 'User',
          entityId: staffId,
          metadata: { roleIds: roles.map((role) => role.id) },
        },
      });
      return this.serializeStaffDetail(await this.findStaffOrThrow(staffId, tx));
    });
  }

  async updateStaffStatus(actor: AccessTokenPayload, staffId: string, dto: UpdateStaffStatusDto) {
    if (actor.sub === staffId && dto.status !== 'ACTIVE') {
      throw new BadRequestException('An administrator cannot disable or suspend their own account');
    }
    const staff = await this.findStaffOrThrow(staffId);
    if (dto.status !== 'ACTIVE') await this.assertLastSuperAdminIsPreserved(staff, []);
    return this.prisma.$transaction(async (tx) => {
      const updated = await tx.user.update({
        where: { id: staffId },
        data: { status: dto.status, tokenVersion: { increment: 1 } },
        select: { id: true, email: true, displayName: true, status: true },
      });
      if (dto.status !== 'ACTIVE') {
        await tx.refreshSession.updateMany({
          where: { userId: staffId, status: { not: 'REVOKED' } },
          data: { status: 'REVOKED', revokedAt: new Date() },
        });
      }
      await tx.auditLog.create({
        data: {
          actorUserId: actor.sub,
          category: AuditCategory.SECURITY,
          action: 'ADMIN_STAFF_STATUS_UPDATED',
          entityType: 'User',
          entityId: staffId,
          metadata: { status: dto.status },
        },
      });
      return updated;
    });
  }

  private async resolvePermissionIds(permissionKeys: string[]) {
    const uniqueKeys = [...new Set(permissionKeys.map((key) => key.trim()))];
    const permissions = await this.prisma.permission.findMany({
      where: { key: { in: uniqueKeys }, archivedAt: null },
      select: { id: true, key: true },
    });
    if (permissions.length !== uniqueKeys.length)
      throw new BadRequestException('One or more permissions are invalid');
    return permissions.map((permission) => permission.id);
  }

  private async resolveAssignableRoles(actor: AccessTokenPayload, roleIds: string[]) {
    const uniqueRoleIds = [...new Set(roleIds)];
    if (uniqueRoleIds.length === 0)
      throw new BadRequestException('At least one administrative role is required');
    const roles = await this.prisma.role.findMany({
      where: { id: { in: uniqueRoleIds }, archivedAt: null },
    });
    if (roles.length !== uniqueRoleIds.length)
      throw new BadRequestException('One or more roles are invalid');
    if (roles.some((role) => role.key === 'super_admin') && !actor.roles.includes('super_admin')) {
      throw new BadRequestException('Only a super administrator may assign the super_admin role');
    }
    return roles;
  }

  private async findStaffOrThrow(
    staffId: string,
    client: Prisma.TransactionClient | PrismaService = this.prisma,
  ) {
    const staff = await client.user.findFirst({
      where: { id: staffId, userType: UserType.ADMIN, deletedAt: null },
      include: { userRoles: { include: { role: true } } },
    });
    if (!staff) throw new NotFoundException('Administrative staff member not found');
    return staff;
  }

  private async assertLastSuperAdminIsPreserved(
    staff: { userRoles: Array<{ role: { key: string } }> },
    nextRoleKeys: string[],
  ) {
    const currentlySuperAdmin = staff.userRoles.some(
      (userRole) => userRole.role.key === 'super_admin',
    );
    if (!currentlySuperAdmin || nextRoleKeys.includes('super_admin')) return;
    const count = await this.prisma.user.count({
      where: {
        userType: UserType.ADMIN,
        status: UserStatus.ACTIVE,
        deletedAt: null,
        userRoles: { some: { role: { key: 'super_admin' } } },
      },
    });
    if (count <= 1)
      throw new BadRequestException(
        'The last active super administrator cannot be removed or disabled',
      );
  }

  private serializePermission(permission: {
    key: string;
    module: string;
    description: string | null;
    name?: string;
  }): AdminPermissionDto {
    return {
      key: permission.key,
      group: permission.module,
      description: permission.description ?? permission.name ?? permission.key,
    };
  }

  private serializeRole(role: RoleWithPermissions): AdminRoleDto {
    return {
      id: role.id,
      key: role.key,
      name: role.name,
      description: role.description,
      permissions: role.rolePermissions.map(({ permission }) =>
        this.serializePermission(permission),
      ),
      staffCount: role._count?.userRoles ?? null,
      createdAt: role.createdAt.toISOString(),
      updatedAt: role.updatedAt.toISOString(),
    };
  }

  private serializeStaffDetail(staff: StaffWithRoles): StaffDetailDto {
    return {
      id: staff.id,
      email: staff.email,
      displayName: staff.displayName,
      status: staff.status,
      roles: staff.userRoles.map(({ role }) => ({
        id: role.id,
        key: role.key,
        name: role.name,
      })),
    };
  }
}
