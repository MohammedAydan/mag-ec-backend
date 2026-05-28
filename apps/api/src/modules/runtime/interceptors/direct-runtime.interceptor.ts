import {
  Inject,
  Injectable,
  Logger,
  type CallHandler,
  type ExecutionContext,
  type NestInterceptor,
} from '@nestjs/common';
import type { Observable } from 'rxjs';
import { concatMap, from, map, switchMap } from 'rxjs';

import { DirectRuntimeService } from '../services/direct-runtime.service';

@Injectable()
export class DirectRuntimeInterceptor implements NestInterceptor {
  private readonly logger = new Logger(DirectRuntimeInterceptor.name);
  constructor(@Inject(DirectRuntimeService) private readonly runtime: DirectRuntimeService) {}

  intercept(context: ExecutionContext, next: CallHandler<unknown>): Observable<unknown> {
    const request = context.switchToHttp().getRequest<{ method: string; url: string }>();
    const mutating = ['POST', 'PUT', 'PATCH', 'DELETE'].includes(request.method);
    const skippedPath =
      request.url.includes('/system/maintenance/run') ||
      request.url.includes('/payments/webhooks/');
    if (!this.runtime.enabled || !mutating || skippedPath) return next.handle();

    return from(this.safeRun()).pipe(
      switchMap(() => next.handle()),
      concatMap((value) => from(this.safeRun()).pipe(map(() => value))),
    );
  }

  private async safeRun(): Promise<void> {
    try {
      await this.runtime.runMaintenance(10);
    } catch (error) {
      this.logger.warn(
        `Direct-mode maintenance failed: ${error instanceof Error ? error.message : 'unknown error'}`,
      );
    }
  }
}
