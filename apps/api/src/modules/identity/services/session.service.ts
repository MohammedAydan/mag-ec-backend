import { createHash, randomUUID } from 'node:crypto';
import { Inject, Injectable, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { RefreshSessionStatus } from '@prisma/client';

import type { AppConfig } from '../../../config/app.config';
import { PrismaService } from '../../persistence/services/prisma.service';

export interface CreateSessionInput {
  id?: string;
  userId: string;
  token: string;
  ipAddress?: string;
  userAgent?: string;
  family?: string;
}

export interface RotateSessionInput {
  sessionId: string;
  newSessionId: string;
  oldToken: string;
  newToken: string;
  ipAddress?: string;
  userAgent?: string;
}

@Injectable()
export class SessionService {
  private readonly jwtRefreshExpiresIn: string;

  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(ConfigService) private readonly configService: ConfigService,
  ) {
    const appConfig = this.configService.getOrThrow<AppConfig>('app');
    this.jwtRefreshExpiresIn = appConfig.jwtRefreshExpiresIn;
  }

  hashToken(token: string): string {
    return createHash('sha256').update(token).digest('hex');
  }

  parseDurationToExpiresAt(duration: string): Date {
    const match = duration.match(/^(\d+)([dhms])$/);
    if (!match) {
      // Default to 30 days if format is unrecognized
      const date = new Date();
      date.setDate(date.getDate() + 30);
      return date;
    }

    const value = Number.parseInt(match[1]!, 10);
    const unit = match[2]!;
    const ms = new Date().getTime();

    let offset = 0;
    switch (unit) {
      case 'd':
        offset = value * 24 * 60 * 60 * 1000;
        break;
      case 'h':
        offset = value * 60 * 60 * 1000;
        break;
      case 'm':
        offset = value * 60 * 1000;
        break;
      case 's':
        offset = value * 1000;
        break;
    }

    return new Date(ms + offset);
  }

  async createSession(input: CreateSessionInput) {
    const hashedToken = this.hashToken(input.token);
    const expiresAt = this.parseDurationToExpiresAt(this.jwtRefreshExpiresIn);
    const family = input.family ?? randomUUID();

    return this.prisma.refreshSession.create({
      data: {
        id: input.id,
        userId: input.userId,
        sessionFamily: family,
        hashedToken,
        status: RefreshSessionStatus.ACTIVE,
        expiresAt,
        ipAddress: input.ipAddress,
        userAgent: input.userAgent,
      },
    });
  }

  async rotateSession(input: RotateSessionInput) {
    const hashedOldToken = this.hashToken(input.oldToken);
    const hashedNewToken = this.hashToken(input.newToken);
    const expiresAt = this.parseDurationToExpiresAt(this.jwtRefreshExpiresIn);
    const now = new Date();

    const outcome = await this.prisma.$transaction(async (tx) => {
      const oldSession = await tx.refreshSession.findUnique({
        where: { id: input.sessionId },
      });

      if (!oldSession || oldSession.hashedToken !== hashedOldToken) {
        return { status: 'INVALID' as const };
      }

      if (oldSession.status === RefreshSessionStatus.ROTATED) {
        await tx.refreshSession.updateMany({
          where: { sessionFamily: oldSession.sessionFamily },
          data: {
            status: RefreshSessionStatus.REVOKED,
            revokedAt: now,
          },
        });
        return { status: 'REUSED' as const };
      }

      if (oldSession.status === RefreshSessionStatus.REVOKED) {
        return { status: 'REVOKED' as const };
      }

      if (oldSession.status === RefreshSessionStatus.EXPIRED || oldSession.expiresAt <= now) {
        await tx.refreshSession.updateMany({
          where: { id: oldSession.id, status: RefreshSessionStatus.ACTIVE },
          data: { status: RefreshSessionStatus.EXPIRED },
        });
        return { status: 'EXPIRED' as const };
      }

      // Claim this refresh token exactly once. A concurrent rotation loses the claim,
      // revokes the token family, and cannot issue a second active refresh token.
      const claimed = await tx.refreshSession.updateMany({
        where: {
          id: oldSession.id,
          hashedToken: hashedOldToken,
          status: RefreshSessionStatus.ACTIVE,
          expiresAt: { gt: now },
        },
        data: {
          status: RefreshSessionStatus.ROTATED,
          lastUsedAt: now,
          replacedBySessionId: input.newSessionId,
        },
      });

      if (claimed.count !== 1) {
        await tx.refreshSession.updateMany({
          where: { sessionFamily: oldSession.sessionFamily },
          data: {
            status: RefreshSessionStatus.REVOKED,
            revokedAt: now,
          },
        });
        return { status: 'REUSED' as const };
      }

      const newSession = await tx.refreshSession.create({
        data: {
          id: input.newSessionId,
          userId: oldSession.userId,
          sessionFamily: oldSession.sessionFamily,
          hashedToken: hashedNewToken,
          status: RefreshSessionStatus.ACTIVE,
          expiresAt,
          ipAddress: input.ipAddress,
          userAgent: input.userAgent,
        },
      });

      return { status: 'ROTATED' as const, session: newSession };
    });

    switch (outcome.status) {
      case 'ROTATED':
        return outcome.session;
      case 'REUSED':
        throw new UnauthorizedException(
          'Token reuse detected. The session family has been terminated.',
        );
      case 'REVOKED':
        throw new UnauthorizedException('Session is revoked');
      case 'EXPIRED':
        throw new UnauthorizedException('Session has expired');
      case 'INVALID':
        throw new UnauthorizedException('Invalid session token');
    }
  }

  async revokeSession(sessionId: string) {
    const session = await this.prisma.refreshSession.findUnique({
      where: { id: sessionId },
    });

    if (!session) {
      return;
    }

    // Revoke the entire family for security on explicit logout
    await this.prisma.refreshSession.updateMany({
      where: { sessionFamily: session.sessionFamily },
      data: {
        status: RefreshSessionStatus.REVOKED,
        revokedAt: new Date(),
      },
    });
  }

  async revokeAllUserSessions(userId: string) {
    await this.prisma.refreshSession.updateMany({
      where: {
        userId,
        status: {
          not: RefreshSessionStatus.REVOKED,
        },
      },
      data: {
        status: RefreshSessionStatus.REVOKED,
        revokedAt: new Date(),
      },
    });
  }
}
