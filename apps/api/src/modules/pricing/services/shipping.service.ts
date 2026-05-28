import { BadRequestException, Inject, Injectable } from '@nestjs/common';

import { PrismaService } from '../../persistence/services/prisma.service';
import { MoneyService } from './money.service';

@Injectable()
export class ShippingService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(MoneyService) private readonly moneyService: MoneyService,
  ) {}

  async estimateAvailableMethods(input: {
    countryCode: string;
    currencyCode: string;
    subtotalAmount: number;
    itemQuantity: number;
  }) {
    const currencyCode = this.moneyService.normalizeCurrencyCode(input.currencyCode);
    const subtotal = this.moneyService.create(input.subtotalAmount, currencyCode);
    const zones = await this.prisma.shippingZone.findMany({
      where: {
        isActive: true,
        countries: {
          some: {
            countryCode: input.countryCode.trim().toUpperCase(),
          },
        },
      },
      include: {
        methods: {
          where: { isActive: true },
          orderBy: [{ sortOrder: 'asc' }, { createdAt: 'asc' }],
        },
      },
      orderBy: [{ createdAt: 'asc' }],
    });

    return zones.flatMap((zone) =>
      zone.methods
        .filter((method) => {
          if (this.moneyService.normalizeCurrencyCode(method.currencyCode) !== currencyCode) {
            return false;
          }
          if (method.minSubtotalAmount !== null && subtotal.amount < method.minSubtotalAmount) {
            return false;
          }
          if (method.maxSubtotalAmount !== null && subtotal.amount > method.maxSubtotalAmount) {
            return false;
          }
          if (method.minItemQuantity !== null && input.itemQuantity < method.minItemQuantity) {
            return false;
          }
          if (method.maxItemQuantity !== null && input.itemQuantity > method.maxItemQuantity) {
            return false;
          }
          return true;
        })
        .map((method) => ({
          methodId: method.id,
          key: method.key,
          name: method.name,
          zone: {
            id: zone.id,
            key: zone.key,
            name: zone.name,
          },
          amount:
            method.rateType === 'FLAT'
              ? (method.flatAmount ?? 0)
              : this.moneyService.applyBasisPoints(subtotal, method.percentageBps ?? 0).amount,
          currencyCode,
          estimatedMinDays: method.estimatedMinDays,
          estimatedMaxDays: method.estimatedMaxDays,
        })),
    );
  }

  validateShippingMethodDto(
    rateType: 'FLAT' | 'PERCENTAGE_OF_SUBTOTAL',
    flatAmount?: number,
    percentageBps?: number,
  ) {
    if (rateType === 'FLAT' && flatAmount === undefined) {
      throw new BadRequestException('Flat shipping methods require flatAmount');
    }

    if (rateType === 'PERCENTAGE_OF_SUBTOTAL' && percentageBps === undefined) {
      throw new BadRequestException('Percentage shipping methods require percentageBps');
    }
  }
}
