import { Inject, Injectable, UnauthorizedException } from '@nestjs/common';
import { UserStatus, UserType } from '@prisma/client';
import * as argon2 from 'argon2';

import { PrismaService } from '../../persistence/services/prisma.service';

export interface CreateUserInput {
  email: string;
  displayName: string;
  passwordRaw: string;
  userType: UserType;
}

@Injectable()
export class UserService {
  constructor(@Inject(PrismaService) private readonly prisma: PrismaService) {}

  normalizeEmail(email: string): string {
    return email.trim().toLowerCase();
  }

  async hashPassword(password: string): Promise<string> {
    // argon2id is the default type in the argon2 library.
    return argon2.hash(password, {
      type: argon2.argon2id,
    });
  }

  async verifyPassword(passwordHash: string, passwordRaw: string): Promise<boolean> {
    try {
      return await argon2.verify(passwordHash, passwordRaw);
    } catch {
      return false;
    }
  }

  async createUser(input: CreateUserInput) {
    const normalizedEmail = this.normalizeEmail(input.email);
    const passwordHash = await this.hashPassword(input.passwordRaw);

    return this.prisma.user.create({
      data: {
        email: input.email.trim(),
        normalizedEmail,
        displayName: input.displayName.trim(),
        passwordHash,
        userType: input.userType,
        status: UserStatus.ACTIVE,
      },
    });
  }

  async findByNormalizedEmail(email: string) {
    const normalized = this.normalizeEmail(email);
    return this.prisma.user.findUnique({
      where: { normalizedEmail: normalized },
    });
  }

  async findById(id: string) {
    return this.prisma.user.findUnique({
      where: { id },
    });
  }

  async getUserProfileById(id: string) {
    const user = await this.prisma.user.findUnique({
      where: { id },
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

    if (!user || user.deletedAt) {
      return null;
    }

    const authDetails = await this.getUserAuthDetails(id);
    if (!authDetails) {
      return null;
    }

    return {
      id: user.id,
      email: user.email,
      displayName: user.displayName,
      userType: user.userType,
      status: user.status,
      emailVerifiedAt: user.emailVerifiedAt,
      lastLoginAt: user.lastLoginAt,
      roles: authDetails.roles,
      permissions: authDetails.permissions,
    };
  }

  async updatePassword(userId: string, passwordRaw: string): Promise<void> {
    const passwordHash = await this.hashPassword(passwordRaw);

    await this.prisma.user.update({
      where: { id: userId },
      data: {
        passwordHash,
      },
    });
  }

  async markEmailVerified(userId: string): Promise<void> {
    await this.prisma.user.update({
      where: { id: userId },
      data: {
        emailVerifiedAt: new Date(),
      },
    });
  }

  async getUserAuthDetails(userId: string) {
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
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

    if (!user || user.deletedAt) {
      return null;
    }

    const roles: string[] = [];
    const permissionsSet = new Set<string>();

    for (const userRole of user.userRoles) {
      const role = userRole.role;
      if (role.archivedAt) continue;

      roles.push(role.key);

      for (const rolePerm of role.rolePermissions) {
        const perm = rolePerm.permission;
        if (perm.archivedAt) continue;
        permissionsSet.add(perm.key);
      }
    }

    return {
      userId: user.id,
      email: user.email,
      userType: user.userType,
      status: user.status,
      roles,
      permissions: Array.from(permissionsSet),
    };
  }

  validateUserStatusOrThrow(status: UserStatus, deletedAt: Date | null) {
    if (deletedAt) {
      throw new UnauthorizedException('User account has been deleted');
    }
    if (status === UserStatus.DISABLED) {
      throw new UnauthorizedException('User account is disabled');
    }
    if (status === UserStatus.SUSPENDED) {
      throw new UnauthorizedException('User account is suspended');
    }
    if (status === UserStatus.INVITED) {
      throw new UnauthorizedException('User registration is not complete');
    }
  }
}
