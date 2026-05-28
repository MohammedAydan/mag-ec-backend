import { BadRequestException } from '@nestjs/common';

import { MoneyService } from './money.service';

describe('MoneyService', () => {
  const service = new MoneyService();

  it('adds values with the same currency', () => {
    expect(service.add(service.create(1500, 'usd'), service.create(500, 'USD'))).toEqual({
      amount: 2000,
      currencyCode: 'USD',
    });
  });

  it('rejects mismatched currency arithmetic', () => {
    expect(() => service.add(service.create(1500, 'USD'), service.create(500, 'EUR'))).toThrow(
      BadRequestException,
    );
  });

  it('applies basis points with deterministic rounding', () => {
    expect(service.applyBasisPoints(service.create(999, 'USD'), 250).amount).toBe(25);
    expect(service.applyBasisPoints(service.create(1999, 'USD'), 250).amount).toBe(50);
  });
});
