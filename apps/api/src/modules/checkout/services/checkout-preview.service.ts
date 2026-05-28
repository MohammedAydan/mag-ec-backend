import { BadRequestException, Inject, Injectable, NotFoundException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

import type { AppConfig } from '../../../config/app.config';
import type { CheckoutPreviewDto } from '../../pricing/dto/pricing-public.dto';
import { PricingPreviewService } from '../../pricing/services/pricing-preview.service';
import { PrismaTransactionService } from '../../persistence/services/prisma-transaction.service';
import { PrismaService } from '../../persistence/services/prisma.service';
import { InventoryCoreService } from '../../inventory/services/inventory-core.service';
import { CartService } from '../../carts/services/cart.service';
import type { CheckoutCartPreviewDto } from '../dto/checkout.dto';

@Injectable()
export class CheckoutPreviewService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(ConfigService) private readonly configService: ConfigService,
    @Inject(CartService) private readonly cartService: CartService,
    @Inject(PricingPreviewService)
    private readonly pricingPreviewService: PricingPreviewService,
    @Inject(InventoryCoreService)
    private readonly inventoryCoreService: InventoryCoreService,
    @Inject(PrismaTransactionService)
    private readonly prismaTransactionService: PrismaTransactionService,
  ) {}

  async previewFromCart(dto: CheckoutCartPreviewDto, actorUserId?: string) {
    const cart = await this.cartService.getCartOrThrow(dto.cartId);

    if (cart.items.length === 0) {
      throw new BadRequestException('Cart must contain at least one item before checkout preview');
    }

    const pricingPreviewInput: CheckoutPreviewDto = {
      currencyCode: dto.currencyCode,
      countryCode: dto.countryCode,
      customerLocale: dto.customerLocale,
      customerId: actorUserId ?? cart.userId ?? undefined,
      couponCodes: cart.couponCode ? [cart.couponCode] : undefined,
      items: cart.items.map((item) => ({
        variantId: item.variantId,
        quantity: item.quantity,
      })),
    };

    const [pricingPreview, defaultWarehouse, stockLevels] = await Promise.all([
      this.pricingPreviewService.previewCheckout(pricingPreviewInput),
      this.prisma.warehouse.findFirst({
        where: { isDefault: true },
        orderBy: [{ createdAt: 'asc' }],
      }),
      this.prisma.stockLevel.findMany({
        where: {
          variantId: {
            in: cart.items.map((item) => item.variantId),
          },
          warehouse: {
            isDefault: true,
          },
        },
      }),
    ]);

    if (!defaultWarehouse) {
      throw new NotFoundException('Default warehouse is not configured');
    }

    const stockLevelByVariantId = new Map(
      stockLevels.map((stockLevel) => [stockLevel.variantId, stockLevel]),
    );

    let reservationKey: string | null = null;
    let reservationExpiresAt: string | null = null;
    const reservedVariantQuantities = new Map<string, number>();

    if (dto.reserveStockOnPreview) {
      reservationKey = `checkout-preview-${cart.id}-${Date.now()}`;
      const expiresAt = new Date(Date.now() + 15 * 60 * 1000);

      await this.prismaTransactionService.runInTransaction(async (tx) => {
        for (const cartItem of cart.items) {
          await this.inventoryCoreService.reserveStock(
            defaultWarehouse.id,
            cartItem.variantId,
            cartItem.quantity,
            reservationKey as string,
            expiresAt,
            actorUserId,
            tx,
          );
          reservedVariantQuantities.set(cartItem.variantId, cartItem.quantity);
        }
      });

      reservationExpiresAt = expiresAt.toISOString();
    }

    return {
      cartId: cart.id,
      reservationKey,
      reservationExpiresAt,
      paymentReadiness: {
        cashOnDeliveryAvailable: true,
        onlinePaymentAvailable:
          this.configService.getOrThrow<AppConfig>('app').paymentProvider === 'stripe',
      },
      ...pricingPreview,
      items: pricingPreview.items.map((item) => {
        const stockLevel = stockLevelByVariantId.get(item.variantId);
        const availableBeforeReservation = stockLevel
          ? stockLevel.quantityOnHand - stockLevel.quantityReserved
          : 0;
        const reservedQuantity = reservedVariantQuantities.get(item.variantId) ?? 0;
        const availableQuantity = Math.max(availableBeforeReservation - reservedQuantity, 0);

        return {
          ...item,
          stockAvailability: {
            availableQuantity,
            isAvailable: availableBeforeReservation >= item.quantity,
          },
        };
      }),
    };
  }
}
