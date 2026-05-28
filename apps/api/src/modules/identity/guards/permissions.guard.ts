import {
  type CanActivate,
  type ExecutionContext,
  Inject,
  Injectable,
  Optional,
} from '@nestjs/common';
import { ModuleRef } from '@nestjs/core';
import { Reflector } from '@nestjs/core';
import type { FastifyRequest } from 'fastify';

import { RequirePermissions } from '../decorators/permissions.decorator';
import type { AccessTokenPayload } from '../services/token.service';

@Injectable()
export class PermissionsGuard implements CanActivate {
  constructor(
    @Inject(Reflector) private readonly reflector: Reflector,
    @Optional() @Inject(ModuleRef) private readonly moduleRef?: ModuleRef,
  ) {}

  private getReflector(): Reflector {
    return this.reflector ?? this.moduleRef?.get(Reflector, { strict: false }) ?? new Reflector();
  }

  canActivate(context: ExecutionContext): boolean {
    const reflector = this.getReflector();
    const requiredPermissions =
      reflector.get(RequirePermissions, context.getHandler()) ||
      reflector.get(RequirePermissions, context.getClass());

    if (!requiredPermissions || requiredPermissions.length === 0) {
      return true;
    }

    const request = context
      .switchToHttp()
      .getRequest<FastifyRequest & { user?: AccessTokenPayload }>();
    const user = request.user;

    if (!user) {
      return false;
    }

    // Secure by default: User must have ALL of the required permissions
    return requiredPermissions.every((perm) => user.permissions.includes(perm));
  }
}
