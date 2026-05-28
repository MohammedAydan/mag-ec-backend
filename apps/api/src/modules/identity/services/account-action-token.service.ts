import { createHash, randomBytes } from 'node:crypto';
import { Inject, Injectable, UnauthorizedException } from '@nestjs/common';
import { AccountActionTokenType, type Prisma } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';

const PASSWORD_RESET_TTL_MS = 60 * 60 * 1000;
const EMAIL_VERIFICATION_TTL_MS = 48 * 60 * 60 * 1000;

interface IssueAccountActionTokenInput {
  userId: string;
  type: AccountActionTokenType;
  ttlMs: number;
  ipAddress?: string;
  userAgent?: string;
}

@Injectable()
export class AccountActionTokenService {
  constructor(@Inject(PrismaService) private readonly prisma: PrismaService) {}

  hashToken(token: string): string {
    return createHash('sha256').update(token).digest('hex');
  }

  async issuePasswordResetToken(
    userId: string,
    ipAddress?: string,
    userAgent?: string,
  ): Promise<string> {
    return this.issueToken({
      userId,
      type: AccountActionTokenType.PASSWORD_RESET,
      ttlMs: PASSWORD_RESET_TTL_MS,
      ipAddress,
      userAgent,
    });
  }

  async issueEmailVerificationToken(
    userId: string,
    ipAddress?: string,
    userAgent?: string,
  ): Promise<string> {
    return this.issueToken({
      userId,
      type: AccountActionTokenType.EMAIL_VERIFICATION,
      ttlMs: EMAIL_VERIFICATION_TTL_MS,
      ipAddress,
      userAgent,
    });
  }

  async consumePasswordResetToken(rawToken: string, tx?: Prisma.TransactionClient) {
    return this.consumeToken(rawToken, AccountActionTokenType.PASSWORD_RESET, tx);
  }

  async revokePasswordResetToken(rawToken: string): Promise<void> {
    await this.revokeToken(rawToken, AccountActionTokenType.PASSWORD_RESET);
  }

  async revokeEmailVerificationToken(rawToken: string): Promise<void> {
    await this.revokeToken(rawToken, AccountActionTokenType.EMAIL_VERIFICATION);
  }

  async consumeEmailVerificationToken(rawToken: string, tx?: Prisma.TransactionClient) {
    return this.consumeToken(rawToken, AccountActionTokenType.EMAIL_VERIFICATION, tx);
  }

  private async issueToken(input: IssueAccountActionTokenInput): Promise<string> {
    const rawToken = randomBytes(32).toString('base64url');
    const hashedToken = this.hashToken(rawToken);
    const now = new Date();
    const expiresAt = new Date(now.getTime() + input.ttlMs);

    await this.prisma.$transaction(async (tx) => {
      await tx.accountActionToken.updateMany({
        where: {
          userId: input.userId,
          type: input.type,
          consumedAt: null,
          expiresAt: {
            gt: now,
          },
        },
        data: {
          consumedAt: now,
        },
      });

      await tx.accountActionToken.create({
        data: {
          userId: input.userId,
          type: input.type,
          hashedToken,
          expiresAt,
          requestedIpAddress: input.ipAddress,
          requestedUserAgent: input.userAgent,
        },
      });
    });

    return rawToken;
  }

  private async revokeToken(rawToken: string, type: AccountActionTokenType): Promise<void> {
    await this.prisma.accountActionToken.updateMany({
      where: {
        hashedToken: this.hashToken(rawToken),
        type,
        consumedAt: null,
      },
      data: { consumedAt: new Date() },
    });
  }

  private async consumeToken(
    rawToken: string,
    type: AccountActionTokenType,
    tx?: Prisma.TransactionClient,
  ) {
    const consume = async (client: Prisma.TransactionClient) => {
      const hashedToken = this.hashToken(rawToken);
      const token = await client.accountActionToken.findUnique({
        where: { hashedToken },
      });

      if (!token || token.type !== type) {
        throw new UnauthorizedException('Invalid or expired account action token');
      }

      const consumedAt = new Date();
      if (token.consumedAt || token.expiresAt <= consumedAt) {
        throw new UnauthorizedException('Invalid or expired account action token');
      }

      const claimed = await client.accountActionToken.updateMany({
        where: {
          id: token.id,
          type,
          consumedAt: null,
          expiresAt: { gt: consumedAt },
        },
        data: { consumedAt },
      });

      if (claimed.count !== 1) {
        throw new UnauthorizedException('Invalid or expired account action token');
      }

      return { ...token, consumedAt };
    };

    return tx ? consume(tx) : this.prisma.$transaction(consume);
  }
}
