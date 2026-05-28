import { BadRequestException } from '@nestjs/common';
import { ReviewsService } from './reviews.service';
import type { PrismaService } from '../../persistence/services/prisma.service';
import type { CreateReviewDto } from '../dto/reviews.dto';

type ReviewTransactionMock = {
  orderLine: {
    findUnique: jest.Mock;
  };
  review: {
    findUnique: jest.Mock;
    create: jest.Mock;
  };
  auditLog: {
    create: jest.Mock;
  };
};

const makePrismaMock = () => {
  const auditLog = { create: jest.fn() };

  return {
    $transaction: jest.fn().mockImplementation((cb: (tx: ReviewTransactionMock) => unknown) => {
      const tx: ReviewTransactionMock = {
        orderLine: { findUnique: jest.fn() },
        review: { findUnique: jest.fn(), create: jest.fn() },
        auditLog,
      };
      return cb(tx);
    }),
  };
};

describe('ReviewsService', () => {
  it('throws on invalid rating', async () => {
    const prisma = makePrismaMock();
    const svc = new ReviewsService(prisma as unknown as PrismaService);
    const dto: CreateReviewDto = { rating: 0, title: 'x', body: 'y' };

    await expect(svc.createVerifiedReview('ol-1', 'user-1', dto)).rejects.toThrow(
      BadRequestException,
    );
  });

  it('creates a review when order line exists and not previously reviewed', async () => {
    const prisma = makePrismaMock();

    // set up order line
    prisma.$transaction.mockImplementation((cb: (tx: ReviewTransactionMock) => unknown) => {
      const tx: ReviewTransactionMock = {
        orderLine: {
          findUnique: jest
            .fn()
            .mockResolvedValue({
              id: 'ol-1',
              productId: 'p-1',
              order: { userId: 'user-1' },
              product: { id: 'p-1' },
            }),
        },
        review: {
          findUnique: jest.fn().mockResolvedValue(null),
          create: jest
            .fn()
            .mockResolvedValue({ id: 'r-1', productId: 'p-1', userId: 'user-1', rating: 5 }),
        },
        auditLog: { create: jest.fn().mockResolvedValue({}) },
      };

      return cb(tx);
    });

    const svc = new ReviewsService(prisma as unknown as PrismaService);

    const result = await svc.createVerifiedReview('ol-1', 'user-1', {
      rating: 5,
      title: 'Good',
      body: 'Nice',
    });

    expect(result).toBeDefined();
    expect(result.id).toBe('r-1');
  });
});
