import { createParamDecorator, type ExecutionContext } from '@nestjs/common';
import type { FastifyRequest } from 'fastify';

import type { AccessTokenPayload } from '../services/token.service';

export const CurrentUser = createParamDecorator(
  (data: unknown, ctx: ExecutionContext): AccessTokenPayload | null => {
    const request = ctx.switchToHttp().getRequest<FastifyRequest & { user?: AccessTokenPayload }>();
    return request.user ?? null;
  },
);
