import { ConflictException } from '@nestjs/common';
import { IdempotencyStatus, Prisma } from '@prisma/client';

import { CheckoutIdempotencyService } from './checkout-idempotency.service';

describe('CheckoutIdempotencyService', () => {
  const prisma = {
    idempotencyKey: {
      create: jest.fn(),
      findUnique: jest.fn(),
      update: jest.fn(),
    },
  };

  let service: CheckoutIdempotencyService;

  beforeEach(() => {
    jest.clearAllMocks();
    service = new CheckoutIdempotencyService(prisma as never);
  });

  it('persists a completed response for a new idempotent request', async () => {
    prisma.idempotencyKey.create.mockResolvedValue({
      id: 'idem_1',
      status: IdempotencyStatus.PENDING,
    });
    prisma.idempotencyKey.update.mockResolvedValue({});

    const result = await service.execute({
      scope: 'checkout.place:user:user_1',
      key: 'idem-key',
      actorUserId: 'user_1',
      requestBody: { cartId: 'cart_1' },
      execute: () =>
        Promise.resolve({
          responseCode: 201,
          responseBody: { orderId: 'order_1' },
        }),
    });

    expect(result).toEqual({
      replayed: false,
      responseCode: 201,
      responseBody: { orderId: 'order_1' },
    });
    expect(prisma.idempotencyKey.update).toHaveBeenCalledWith(
      expect.objectContaining({
        where: { id: 'idem_1' },
        data: expect.objectContaining({
          status: IdempotencyStatus.COMPLETED,
          responseCode: 201,
          responseBody: { orderId: 'order_1' },
        }),
      }),
    );
  });

  it('replays a completed response when the same key and payload are retried', async () => {
    prisma.idempotencyKey.create.mockRejectedValue(
      new Prisma.PrismaClientKnownRequestError('duplicate', {
        code: 'P2002',
        clientVersion: 'test',
      }),
    );
    prisma.idempotencyKey.findUnique.mockResolvedValue({
      id: 'idem_1',
      actorUserId: 'user_1',
      requestHash: service['hashRequestBody']({ cartId: 'cart_1' }),
      status: IdempotencyStatus.COMPLETED,
      responseCode: 201,
      responseBody: { orderId: 'order_1' },
    });

    const execute = jest.fn();
    const result = await service.execute({
      scope: 'checkout.place:user:user_1',
      key: 'idem-key',
      actorUserId: 'user_1',
      requestBody: { cartId: 'cart_1' },
      execute,
    });

    expect(result).toEqual({
      replayed: true,
      responseCode: 201,
      responseBody: { orderId: 'order_1' },
    });
    expect(execute).not.toHaveBeenCalled();
  });

  it('rejects reuse of an idempotency key with a different request payload', async () => {
    prisma.idempotencyKey.create.mockRejectedValue(
      new Prisma.PrismaClientKnownRequestError('duplicate', {
        code: 'P2002',
        clientVersion: 'test',
      }),
    );
    prisma.idempotencyKey.findUnique.mockResolvedValue({
      id: 'idem_1',
      actorUserId: 'user_1',
      requestHash: 'different-hash',
      status: IdempotencyStatus.COMPLETED,
      responseCode: 201,
      responseBody: { orderId: 'order_1' },
    });

    await expect(
      service.execute({
        scope: 'checkout.place:user:user_1',
        key: 'idem-key',
        actorUserId: 'user_1',
        requestBody: { cartId: 'cart_1' },
        execute: () =>
          Promise.resolve({
            responseCode: 201,
            responseBody: { orderId: 'order_1' },
          }),
      }),
    ).rejects.toThrow(ConflictException);
  });
});
