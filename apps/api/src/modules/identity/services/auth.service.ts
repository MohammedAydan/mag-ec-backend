import { randomUUID } from 'node:crypto';
import {
  Inject,
  Injectable,
  ConflictException,
  ServiceUnavailableException,
  UnauthorizedException,
} from '@nestjs/common';
import { AuditCategory, Prisma, UserStatus, UserType } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';
import { AccountActionTokenService } from './account-action-token.service';
import { SessionService } from './session.service';
import { TokenService } from './token.service';
import { TransactionalEmailService } from './transactional-email.service';
import { UserService } from './user.service';

export interface RegisterInput {
  email: string;
  displayName: string;
  passwordRaw: string;
}

export interface AuthResponse {
  accessToken: string;
  refreshToken: string;
  user: {
    id: string;
    email: string;
    displayName: string;
    userType: UserType;
  };
}

@Injectable()
export class AuthService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(UserService) private readonly userService: UserService,
    @Inject(SessionService) private readonly sessionService: SessionService,
    @Inject(TokenService) private readonly tokenService: TokenService,
    @Inject(AccountActionTokenService)
    private readonly accountActionTokenService: AccountActionTokenService,
    @Inject(TransactionalEmailService)
    private readonly transactionalEmailService: TransactionalEmailService,
  ) {}

  async register(input: RegisterInput): Promise<AuthResponse['user']> {
    const existing = await this.userService.findByNormalizedEmail(input.email);
    if (existing) {
      await this.recordAuditEvent({
        category: AuditCategory.SECURITY,
        action: 'REGISTER_FAILED_DUPLICATE_EMAIL',
        entityType: 'User',
        entityId: existing.id,
        metadata: {
          normalizedEmail: this.userService.normalizeEmail(input.email),
        },
      });
      throw new ConflictException('User with this email already exists');
    }

    const user = await this.userService.createUser({
      email: input.email,
      displayName: input.displayName,
      passwordRaw: input.passwordRaw,
      userType: UserType.CUSTOMER,
    });

    // Write audit log
    await this.prisma.auditLog.create({
      data: {
        actorUserId: user.id,
        category: AuditCategory.AUTH,
        action: 'REGISTER',
        entityType: 'User',
        entityId: user.id,
        metadata: {
          email: user.email,
        },
      },
    });

    return {
      id: user.id,
      email: user.email,
      displayName: user.displayName,
      userType: user.userType,
    };
  }

  async login(
    email: string,
    passwordRaw: string,
    ipAddress?: string,
    userAgent?: string,
  ): Promise<AuthResponse> {
    const user = await this.userService.findByNormalizedEmail(email);
    if (!user || user.deletedAt) {
      await this.recordAuditEvent({
        category: AuditCategory.SECURITY,
        action: 'LOGIN_FAILED',
        entityType: 'User',
        metadata: {
          normalizedEmail: this.userService.normalizeEmail(email),
          reason: 'user_not_found_or_deleted',
        },
        ipAddress,
        userAgent,
      });
      throw new UnauthorizedException('Invalid credentials');
    }

    const isPasswordValid = await this.userService.verifyPassword(user.passwordHash, passwordRaw);
    if (!isPasswordValid) {
      await this.recordAuditEvent({
        actorUserId: user.id,
        category: AuditCategory.SECURITY,
        action: 'LOGIN_FAILED',
        entityType: 'User',
        entityId: user.id,
        metadata: {
          reason: 'invalid_password',
        },
        ipAddress,
        userAgent,
      });
      throw new UnauthorizedException('Invalid credentials');
    }

    this.userService.validateUserStatusOrThrow(user.status, user.deletedAt);

    // Get roles and permissions for access token
    const authDetails = await this.userService.getUserAuthDetails(user.id);
    if (!authDetails) {
      throw new UnauthorizedException('User account authorization details missing');
    }

    // Generate tokens and session
    const sessionId = randomUUID();
    const sessionFamily = randomUUID();

    const accessToken = await this.tokenService.signAccessToken({
      sub: user.id,
      email: user.email,
      userType: user.userType,
      roles: authDetails.roles,
      permissions: authDetails.permissions,
      tokenVersion: authDetails.tokenVersion,
    });

    const refreshToken = await this.tokenService.signRefreshToken({
      sub: user.id,
      sessionId,
      family: sessionFamily,
    });

    // Create session in DB
    await this.sessionService.createSession({
      id: sessionId,
      userId: user.id,
      token: refreshToken,
      ipAddress,
      userAgent,
      family: sessionFamily,
    });

    // Update last login
    await this.prisma.user.update({
      where: { id: user.id },
      data: { lastLoginAt: new Date() },
    });

    // Emit audit log
    await this.recordAuditEvent({
      actorUserId: user.id,
      category: AuditCategory.AUTH,
      action: 'LOGIN',
      entityType: 'User',
      entityId: user.id,
      ipAddress,
      userAgent,
    });

    return {
      accessToken,
      refreshToken,
      user: {
        id: user.id,
        email: user.email,
        displayName: user.displayName,
        userType: user.userType,
      },
    };
  }

  async refresh(
    refreshToken: string,
    ipAddress?: string,
    userAgent?: string,
  ): Promise<AuthResponse> {
    try {
      const payload = await this.tokenService.verifyRefreshToken(refreshToken);
      const user = await this.userService.findById(payload.sub);

      if (!user || user.deletedAt) {
        throw new UnauthorizedException('User not found');
      }

      this.userService.validateUserStatusOrThrow(user.status, user.deletedAt);

      const authDetails = await this.userService.getUserAuthDetails(user.id);
      if (!authDetails) {
        throw new UnauthorizedException('Authorization details missing');
      }

      const nextSessionId = randomUUID();

      const newAccessToken = await this.tokenService.signAccessToken({
        sub: user.id,
        email: user.email,
        userType: user.userType,
        roles: authDetails.roles,
        permissions: authDetails.permissions,
        tokenVersion: authDetails.tokenVersion,
      });

      const newRefreshToken = await this.tokenService.signRefreshToken({
        sub: user.id,
        sessionId: nextSessionId,
        family: payload.family,
      });

      // Rotate session in DB
      await this.sessionService.rotateSession({
        sessionId: payload.sessionId,
        newSessionId: nextSessionId,
        oldToken: refreshToken,
        newToken: newRefreshToken,
        ipAddress,
        userAgent,
      });

      return {
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
        user: {
          id: user.id,
          email: user.email,
          displayName: user.displayName,
          userType: user.userType,
        },
      };
    } catch (err) {
      await this.recordAuditEvent({
        category: AuditCategory.SECURITY,
        action: 'REFRESH_FAILED',
        entityType: 'RefreshSession',
        metadata: {
          reason: err instanceof Error ? err.message : 'unknown_error',
        },
        ipAddress,
        userAgent,
      });
      if (err instanceof UnauthorizedException) {
        throw err;
      }
      throw new UnauthorizedException('Invalid refresh token');
    }
  }

  async logout(refreshToken: string): Promise<void> {
    try {
      const payload = await this.tokenService.verifyRefreshToken(refreshToken);
      await this.sessionService.revokeSession(payload.sessionId);

      await this.recordAuditEvent({
        actorUserId: payload.sub,
        category: AuditCategory.AUTH,
        action: 'LOGOUT',
        entityType: 'User',
        entityId: payload.sub,
      });
    } catch {
      // Fail silently for security/robustness if token is invalid during logout
    }
  }

  async requestPasswordReset(
    email: string,
    ipAddress?: string,
    userAgent?: string,
  ): Promise<{ accepted: true }> {
    const user = await this.userService.findByNormalizedEmail(email);

    if (
      user &&
      !user.deletedAt &&
      (user.status === UserStatus.ACTIVE || user.status === UserStatus.INVITED)
    ) {
      const rawToken = await this.accountActionTokenService.issuePasswordResetToken(
        user.id,
        ipAddress,
        userAgent,
      );
      try {
        await this.transactionalEmailService.sendPasswordResetEmail(user.email, rawToken);
      } catch (error) {
        await this.accountActionTokenService.revokePasswordResetToken(rawToken);
        await this.recordAuditEvent({
          actorUserId: user.id,
          category: AuditCategory.SECURITY,
          action: 'PASSWORD_RESET_DELIVERY_FAILED',
          entityType: 'User',
          entityId: user.id,
          metadata: { reason: error instanceof Error ? error.name : 'delivery_failed' },
          ipAddress,
          userAgent,
        });
        return { accepted: true };
      }
      await this.recordAuditEvent({
        actorUserId: user.id,
        category: AuditCategory.AUTH,
        action: 'PASSWORD_RESET_REQUESTED',
        entityType: 'User',
        entityId: user.id,
        ipAddress,
        userAgent,
      });
    }

    return {
      accepted: true,
    };
  }

  async resetPassword(
    token: string,
    newPassword: string,
    ipAddress?: string,
    userAgent?: string,
  ): Promise<{ passwordReset: true }> {
    await this.prisma.$transaction(async (tx) => {
      // Validate and consume the token first, before performing expensive hashing.
      const actionToken = await this.accountActionTokenService.consumePasswordResetToken(token, tx);
      const account = await tx.user.findUnique({ where: { id: actionToken.userId } });
      if (
        !account ||
        account.deletedAt ||
        (account.status !== UserStatus.ACTIVE && account.status !== UserStatus.INVITED)
      ) {
        throw new UnauthorizedException('Invalid or expired account action token');
      }

      const passwordHash = await this.userService.hashPassword(newPassword);

      await tx.user.update({
        where: { id: actionToken.userId },
        data: {
          passwordHash,
          tokenVersion: { increment: 1 },
          status: account.status === UserStatus.INVITED ? UserStatus.ACTIVE : undefined,
          emailVerifiedAt: account.status === UserStatus.INVITED ? new Date() : undefined,
        },
      });
      await tx.refreshSession.updateMany({
        where: { userId: actionToken.userId, status: { not: 'REVOKED' } },
        data: { status: 'REVOKED', revokedAt: new Date() },
      });
      await tx.auditLog.create({
        data: {
          actorUserId: actionToken.userId,
          category: AuditCategory.AUTH,
          action: 'PASSWORD_RESET_COMPLETED',
          entityType: 'User',
          entityId: actionToken.userId,
          ipAddress,
          userAgent,
        },
      });
    });

    return { passwordReset: true };
  }

  async requestEmailVerification(
    userId: string,
    ipAddress?: string,
    userAgent?: string,
  ): Promise<{ accepted: true }> {
    const user = await this.userService.findById(userId);
    if (!user || user.deletedAt) {
      throw new UnauthorizedException('User not found');
    }

    this.userService.validateUserStatusOrThrow(user.status, user.deletedAt);

    if (!user.emailVerifiedAt) {
      const rawToken = await this.accountActionTokenService.issueEmailVerificationToken(
        user.id,
        ipAddress,
        userAgent,
      );
      try {
        await this.transactionalEmailService.sendEmailVerificationEmail(user.email, rawToken);
      } catch (error) {
        await this.accountActionTokenService.revokeEmailVerificationToken(rawToken);
        throw new ServiceUnavailableException('Unable to deliver email verification message', {
          cause: error,
        });
      }
      await this.recordAuditEvent({
        actorUserId: user.id,
        category: AuditCategory.AUTH,
        action: 'EMAIL_VERIFICATION_REQUESTED',
        entityType: 'User',
        entityId: user.id,
        ipAddress,
        userAgent,
      });
    }

    return {
      accepted: true,
    };
  }

  async verifyEmail(
    token: string,
    ipAddress?: string,
    userAgent?: string,
  ): Promise<{ verified: true }> {
    await this.prisma.$transaction(async (tx) => {
      const actionToken = await this.accountActionTokenService.consumeEmailVerificationToken(
        token,
        tx,
      );
      await tx.user.update({
        where: { id: actionToken.userId },
        data: { emailVerifiedAt: new Date() },
      });
      await tx.auditLog.create({
        data: {
          actorUserId: actionToken.userId,
          category: AuditCategory.AUTH,
          action: 'EMAIL_VERIFIED',
          entityType: 'User',
          entityId: actionToken.userId,
          ipAddress,
          userAgent,
        },
      });
    });

    return { verified: true };
  }

  async getCurrentUserProfile(userId: string) {
    const profile = await this.userService.getUserProfileById(userId);
    if (!profile) {
      throw new UnauthorizedException('User not found');
    }

    return profile;
  }

  private async recordAuditEvent(input: {
    actorUserId?: string;
    category: AuditCategory;
    action: string;
    entityType: string;
    entityId?: string;
    metadata?: Record<string, unknown>;
    ipAddress?: string;
    userAgent?: string;
  }): Promise<void> {
    await this.prisma.auditLog.create({
      data: {
        actorUserId: input.actorUserId,
        category: input.category,
        action: input.action,
        entityType: input.entityType,
        entityId: input.entityId,
        metadata: input.metadata as Prisma.InputJsonValue | undefined,
        ipAddress: input.ipAddress,
        userAgent: input.userAgent,
      },
    });
  }
}
