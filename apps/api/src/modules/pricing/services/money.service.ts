import { BadRequestException, Injectable } from '@nestjs/common';

import type { MoneyValue } from '../pricing.types';

@Injectable()
export class MoneyService {
  normalizeCurrencyCode(currencyCode: string): string {
    return currencyCode.trim().toUpperCase();
  }

  create(amount: number, currencyCode: string): MoneyValue {
    return {
      amount,
      currencyCode: this.normalizeCurrencyCode(currencyCode),
    };
  }

  assertSameCurrency(left: MoneyValue, right: MoneyValue): void {
    if (
      this.normalizeCurrencyCode(left.currencyCode) !==
      this.normalizeCurrencyCode(right.currencyCode)
    ) {
      throw new BadRequestException('Currency mismatch');
    }
  }

  add(left: MoneyValue, right: MoneyValue): MoneyValue {
    this.assertSameCurrency(left, right);

    return {
      amount: left.amount + right.amount,
      currencyCode: this.normalizeCurrencyCode(left.currencyCode),
    };
  }

  multiply(amount: MoneyValue, quantity: number): MoneyValue {
    if (!Number.isInteger(quantity) || quantity < 0) {
      throw new BadRequestException('Quantity must be a non-negative integer');
    }

    return {
      amount: amount.amount * quantity,
      currencyCode: this.normalizeCurrencyCode(amount.currencyCode),
    };
  }

  applyBasisPoints(amount: MoneyValue, basisPoints: number): MoneyValue {
    if (!Number.isInteger(basisPoints) || basisPoints < 0) {
      throw new BadRequestException('Basis points must be a non-negative integer');
    }

    return {
      amount: this.roundDivision(amount.amount * basisPoints, 10_000),
      currencyCode: this.normalizeCurrencyCode(amount.currencyCode),
    };
  }

  roundDivision(numerator: number, denominator: number): number {
    if (!Number.isInteger(numerator) || !Number.isInteger(denominator) || denominator <= 0) {
      throw new BadRequestException('Invalid division operands');
    }

    const quotient = Math.trunc(numerator / denominator);
    const remainder = Math.abs(numerator % denominator);
    const shouldRoundAwayFromZero = remainder * 2 >= denominator;

    if (!shouldRoundAwayFromZero) {
      return quotient;
    }

    return numerator >= 0 ? quotient + 1 : quotient - 1;
  }
}
