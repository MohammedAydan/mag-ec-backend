import { createHash } from 'node:crypto';

import {
  ConflictException,
  Inject,
  Injectable,
  InternalServerErrorException,
} from '@nestjs/common';
import { IdempotencyStatus, Prisma } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';

type IdempotentExecutionParams<T> = {
  scope: string;
  key: string;
  actorUserId?: string;
  requestBody: unknown;
  execute: () => Promise<{ responseCode: number; responseBody: T }>;
};

type IdempotentExecutionResult<T> = {
  replayed: boolean;
  responseCode: number;
  responseBody: T;
};

@Injectable()
export class CheckoutIdempotencyService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
  ) {}

  async execute<T extends Record<string, unknown>>(
    params: IdempotentExecutionParams<T>,
  ): Promise<IdempotentExecutionResult<T>> {
    const requestHash = this.hashRequestBody(params.requestBody);
    const idempotencyKey = await this.acquireKey({
      scope: params.scope,
      key: params.key,
      actorUserId: params.actorUserId,
      requestHash,
    });

    if (
      idempotencyKey.status === IdempotencyStatus.COMPLETED &&
      idempotencyKey.responseBody !== null &&
      idempotencyKey.responseCode !== null
    ) {
      return {
        replayed: true,
        responseCode: idempotencyKey.responseCode,
        responseBody: idempotencyKey.responseBody as T,
      };
    }

    try {
      const result = await params.execute();

      await this.prisma.idempotencyKey.update({
        where: { id: idempotencyKey.id },
        data: {
          status: IdempotencyStatus.COMPLETED,
          responseCode: result.responseCode,
          responseBody: result.responseBody as Prisma.InputJsonValue,
          completedAt: new Date(),
        },
      });

      return {
        replayed: false,
        responseCode: result.responseCode,
        responseBody: result.responseBody,
      };
    } catch (error) {
      await this.prisma.idempotencyKey.update({
        where: { id: idempotencyKey.id },
        data: {
          status: IdempotencyStatus.FAILED,
        },
      });

      throw error;
    }
  }

  private async acquireKey(input: {
    scope: string;
    key: string;
    actorUserId?: string;
    requestHash: string;
  }) {
    try {
      return await this.prisma.idempotencyKey.create({
        data: {
          scope: input.scope,
          key: input.key,
          actorUserId: input.actorUserId,
          requestHash: input.requestHash,
          status: IdempotencyStatus.PENDING,
          lockedAt: new Date(),
          expiresAt: new Date(Date.now() + 24 * 60 * 60 * 1000),
        },
      });
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError && error.code === 'P2002') {
        const existing = await this.prisma.idempotencyKey.findUnique({
          where: {
            scope_key: {
              scope: input.scope,
              key: input.key,
            },
          },
        });

        if (!existing) {
          throw new InternalServerErrorException('Idempotency key lookup failed unexpectedly');
        }

        if (existing.requestHash !== input.requestHash) {
          throw new ConflictException(
            'Idempotency key was already used with a different request payload',
          );
        }

        if (existing.actorUserId !== (input.actorUserId ?? null)) {
          throw new ConflictException('Idempotency key scope does not match the current actor');
        }

        if (existing.status === IdempotencyStatus.PENDING) {
          throw new ConflictException(
            'An identical checkout placement request is already in progress',
          );
        }

        if (existing.status === IdempotencyStatus.COMPLETED) {
          return existing;
        }

        throw new ConflictException(
          'A previous attempt using this idempotency key failed. Verify order status before using a new key.',
        );
      }

      throw error;
    }
  }

  private hashRequestBody(value: unknown) {
    return createHash('sha256')
      .update(JSON.stringify(this.sortValue(value)))
      .digest('hex');
  }

  private sortValue(value: unknown): unknown {
    if (Array.isArray(value)) {
      return value.map((item) => this.sortValue(item));
    }

    if (value !== null && typeof value === 'object') {
      return Object.fromEntries(
        Object.entries(value as Record<string, unknown>)
          .sort(([left], [right]) => left.localeCompare(right))
          .map(([key, entry]) => [key, this.sortValue(entry)]),
      );
    }

    return value;
  }
}
