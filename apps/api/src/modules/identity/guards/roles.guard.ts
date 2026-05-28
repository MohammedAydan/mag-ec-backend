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

import { Roles } from '../decorators/roles.decorator';
import type { AccessTokenPayload } from '../services/token.service';

@Injectable()
export class RolesGuard implements CanActivate {
  constructor(
    @Inject(Reflector) private readonly reflector: Reflector,
    @Optional() @Inject(ModuleRef) private readonly moduleRef?: ModuleRef,
  ) {}

  private getReflector(): Reflector {
    return this.reflector ?? this.moduleRef?.get(Reflector, { strict: false }) ?? new Reflector();
  }

  canActivate(context: ExecutionContext): boolean {
    const reflector = this.getReflector();
    const requiredRoles =
      reflector.get(Roles, context.getHandler()) || reflector.get(Roles, context.getClass());

    if (!requiredRoles || requiredRoles.length === 0) {
      return true;
    }

    const request = context
      .switchToHttp()
      .getRequest<FastifyRequest & { user?: AccessTokenPayload }>();
    const user = request.user;

    if (!user) {
      return false;
    }

    // Check if the user has at least one of the required roles
    return requiredRoles.some((role) => user.roles.includes(role));
  }
}
