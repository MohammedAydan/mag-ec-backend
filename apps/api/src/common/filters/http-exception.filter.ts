import {
  ArgumentsHost,
  Catch,
  ExceptionFilter,
  HttpException,
  HttpStatus,
  Logger,
} from '@nestjs/common';
import type { FastifyReply, FastifyRequest } from 'fastify';

interface ErrorResponseShape {
  error: string;
  code: string;
  details?: unknown;
  requestId?: string;
  path?: string;
  timestamp: string;
}

@Catch()
export class HttpExceptionFilter implements ExceptionFilter {
  private readonly logger = new Logger(HttpExceptionFilter.name);

  catch(exception: unknown, host: ArgumentsHost): void {
    const context = host.switchToHttp();
    const reply = context.getResponse<FastifyReply>();
    const request = context.getRequest<FastifyRequest>();

    if (exception instanceof HttpException) {
      const status = exception.getStatus();
      const response = exception.getResponse();
      const details =
        typeof response === 'object' && response !== null && 'message' in response
          ? (response as { message?: unknown }).message
          : undefined;

      const payload: ErrorResponseShape = {
        error: exception.message,
        code: this.buildCode(status),
        details,
        path: request.url,
        requestId: request.id,
        timestamp: new Date().toISOString(),
      };

      void reply.status(status).send(payload);
      return;
    }

    this.logger.error(
      `Unhandled exception for ${request.method} ${request.url}`,
      exception instanceof Error ? exception.stack : String(exception),
    );

    const payload: ErrorResponseShape = {
      error: 'Internal server error',
      code: 'INTERNAL_SERVER_ERROR',
      path: request.url,
      requestId: request.id,
      timestamp: new Date().toISOString(),
    };

    void reply.status(HttpStatus.INTERNAL_SERVER_ERROR).send(payload);
  }

  private buildCode(status: HttpStatus): string {
    switch (status) {
      case HttpStatus.BAD_REQUEST:
        return 'BAD_REQUEST';
      case HttpStatus.UNAUTHORIZED:
        return 'UNAUTHORIZED';
      case HttpStatus.FORBIDDEN:
        return 'FORBIDDEN';
      case HttpStatus.NOT_FOUND:
        return 'NOT_FOUND';
      case HttpStatus.TOO_MANY_REQUESTS:
        return 'RATE_LIMIT_EXCEEDED';
      default:
        return 'HTTP_EXCEPTION';
    }
  }
}
