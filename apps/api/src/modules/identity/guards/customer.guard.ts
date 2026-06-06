import { type CanActivate, type ExecutionContext, Injectable } from '@nestjs/common';
import type { FastifyRequest } from 'fastify';

import type { AccessTokenPayload } from '../services/token.service';

/** Restricts customer-facing APIs to CUSTOMER accounts — rejects admin/staff JWTs with 403. */
@Injectable()
export class CustomerGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const request = context
      .switchToHttp()
      .getRequest<FastifyRequest & { user?: AccessTokenPayload }>();
    return request.user?.userType === 'CUSTOMER';
  }
}
