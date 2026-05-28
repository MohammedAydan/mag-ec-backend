import { Inject, Injectable } from '@nestjs/common';

import { PrismaService } from '../../persistence/services/prisma.service';
import { MoneyService } from './money.service';
import type { TaxComputationInput, TaxComputationResult, TaxStrategy } from '../pricing.types';

@Injectable()
export class ManualTaxStrategyService implements TaxStrategy {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(MoneyService) private readonly moneyService: MoneyService,
  ) {}

  async computeTax(input: TaxComputationInput): Promise<TaxComputationResult> {
    if (!input.taxClassId) {
      return { amount: 0, rateBps: 0, isIncludedInPrice: false };
    }

    const rate = await this.prisma.manualTaxRate.findUnique({
      where: {
        taxClassId_countryCode: {
          taxClassId: input.taxClassId,
          countryCode: input.countryCode.trim().toUpperCase(),
        },
      },
    });

    if (!rate) {
      return { amount: 0, rateBps: 0, isIncludedInPrice: false };
    }

    const subtotal = this.moneyService.create(input.subtotalAmount, input.currencyCode);
    const amount = rate.isIncludedInPrice
      ? this.moneyService.roundDivision(subtotal.amount * rate.rateBps, 10_000 + rate.rateBps)
      : this.moneyService.applyBasisPoints(subtotal, rate.rateBps).amount;

    return {
      amount,
      rateBps: rate.rateBps,
      isIncludedInPrice: rate.isIncludedInPrice,
    };
  }
}
