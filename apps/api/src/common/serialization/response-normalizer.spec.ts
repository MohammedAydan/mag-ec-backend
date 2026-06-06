import { Prisma } from '@prisma/client';

import { normalizeResponsePayload } from './response-normalizer';

describe('normalizeResponsePayload', () => {
  it('converts dates, decimals, and bigint values recursively', () => {
    const createdAt = new Date('2026-06-05T00:00:00.000Z');
    const payload = {
      id: 'rec_1',
      createdAt,
      amount: new Prisma.Decimal('19.99'),
      sizeBytes: BigInt(42),
      nested: [{ updatedAt: createdAt, quantity: new Prisma.Decimal('3') }],
    };

    expect(normalizeResponsePayload(payload)).toEqual({
      id: 'rec_1',
      createdAt: '2026-06-05T00:00:00.000Z',
      amount: 19.99,
      sizeBytes: 42,
      nested: [{ updatedAt: '2026-06-05T00:00:00.000Z', quantity: 3 }],
    });
  });
});
