import {
  Inject,
  type CanActivate,
  type ExecutionContext,
  Injectable,
  Logger,
  UnauthorizedException,
} from '@nestjs/common';
import type { FastifyRequest } from 'fastify';

import { PrismaService } from '../../persistence/services/prisma.service';
import { TokenService } from '../services/token.service';

@Injectable()
export class AuthGuard implements CanActivate {
  private readonly logger = new Logger(AuthGuard.name);

  constructor(
    @Inject(TokenService) private readonly tokenService: TokenService,
    @Inject(PrismaService) private readonly prisma: PrismaService,
  ) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest<FastifyRequest & { user?: unknown }>();
    const authorization = request.headers.authorization;

    if (!authorization) {
      throw new UnauthorizedException('Authorization header is missing');
    }

    const [type, token] = authorization.split(' ');

    if (type !== 'Bearer' || !token) {
      throw new UnauthorizedException('Invalid authorization header format');
    }

    try {
      const payload = await this.tokenService.verifyAccessToken(token);

      // Verify the user record still exists, is not deleted, and the tokenVersion matches.
      // This catches privilege/status/password changes that happened after the JWT was issued.
      const user = await this.prisma.user.findUnique({
        where: { id: payload.sub },
        select: { id: true, tokenVersion: true, status: true, deletedAt: true },
      });

      if (!user) {
        throw new UnauthorizedException('User associated with this token no longer exists');
      }

      if (user.deletedAt) {
        throw new UnauthorizedException('User account has been deleted');
      }

      if (user.status === 'DISABLED' || user.status === 'SUSPENDED') {
        throw new UnauthorizedException('User account is no longer active');
      }

      if (user.tokenVersion !== payload.tokenVersion) {
        this.logger.warn(
          `Token version mismatch for user ${payload.sub}: token=${payload.tokenVersion}, db=${user.tokenVersion}`,
        );
        throw new UnauthorizedException('Access token is no longer valid due to account changes');
      }

      request.user = payload;
      return true;
    } catch (error) {
      if (error instanceof UnauthorizedException) {
        throw error;
      }
      this.logger.warn(
        `Access token verification failed for ${request.url}: ${error instanceof Error ? error.message : 'unknown error'}`,
      );
      throw new UnauthorizedException('Invalid or expired access token');
    }
  }
}
