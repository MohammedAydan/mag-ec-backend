import { createHash, randomUUID } from 'node:crypto';

import {
  BadRequestException,
  ConflictException,
  ForbiddenException,
  Inject,
  Injectable,
  NotFoundException,
  ServiceUnavailableException,
} from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { CartService } from '../../carts/services/cart.service';
import { InventoryCoreService } from '../../inventory/services/inventory-core.service';
import { OrderOutboxService } from '../../orders/services/order-outbox.service';
import { OrderService } from '../../orders/services/order.service';
import { PaymentAttemptService } from '../../payments/services/payment-attempt.service';
import { PrismaTransactionService } from '../../persistence/services/prisma-transaction.service';
import { PrismaService } from '../../persistence/services/prisma.service';
import type { CheckoutPreviewDto } from '../../pricing/dto/pricing-public.dto';
import { PricingPreviewService } from '../../pricing/services/pricing-preview.service';
import { PromotionUsageService } from '../../promotions/services/promotion-usage.service';
import {
  type CheckoutAddressDto,
  type CheckoutPlaceOrderDto,
  CheckoutPaymentMethod,
} from '../dto/checkout.dto';
import { CheckoutIdempotencyService } from './checkout-idempotency.service';
import { CodPaymentService } from '../../payments/services/cod-payment.service';

@Injectable()
export class CheckoutPlacementService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
    @Inject(CartService)
    private readonly cartService: CartService,
    @Inject(PricingPreviewService)
    private readonly pricingPreviewService: PricingPreviewService,
    @Inject(InventoryCoreService)
    private readonly inventoryCoreService: InventoryCoreService,
    @Inject(PrismaTransactionService)
    private readonly prismaTransactionService: PrismaTransactionService,
    @Inject(CheckoutIdempotencyService)
    private readonly checkoutIdempotencyService: CheckoutIdempotencyService,
    @Inject(CodPaymentService)
    private readonly codPaymentService: CodPaymentService,
    @Inject(PaymentAttemptService)
    private readonly paymentAttemptService: PaymentAttemptService,
    @Inject(PromotionUsageService)
    private readonly promotionUsageService: PromotionUsageService,
    @Inject(OrderOutboxService)
    private readonly orderOutboxService: OrderOutboxService,
    @Inject(OrderService)
    private readonly orderService: OrderService,
  ) {}

  async placeOrder(
    dto: CheckoutPlaceOrderDto,
    options: {
      actorUserId?: string;
      guestToken?: string;
      idempotencyKey: string;
    },
  ) {
    const cart = await this.cartService.getCartOrThrow(dto.cartId);
    this.cartService.assertCartAccess(cart, {
      userId: options.actorUserId,
      guestToken: options.guestToken,
    });

    const normalizedIdempotencyKey = options.idempotencyKey.trim();
    if (!normalizedIdempotencyKey) {
      throw new BadRequestException('Idempotency-Key header is required');
    }

    if (normalizedIdempotencyKey.length > 128) {
      throw new BadRequestException(
        'Idempotency-Key header must not exceed 128 characters',
      );
    }

    if (!/^[a-zA-Z0-9_-]{1,128}$/.test(normalizedIdempotencyKey)) {
      throw new BadRequestException(
        'Idempotency-Key header may only contain alphanumeric characters, dashes, and underscores',
      );
    }

    const scope = this.resolveIdempotencyScope(options.actorUserId, options.guestToken);

    const executionResult = await this.checkoutIdempotencyService.execute({
      scope,
      key: normalizedIdempotencyKey,
      actorUserId: options.actorUserId,
      requestBody: {
        actorUserId: options.actorUserId ?? null,
        guestTokenHash: options.guestToken
          ? createHash('sha256').update(options.guestToken.trim()).digest('hex')
          : null,
        ...dto,
      },
      execute: async (idempotencyKeyId: string) => {
        const placement = await this.prismaTransactionService.runInTransaction(async (tx) => {
          const transactionalCart = await this.cartService.getCartOrThrow(dto.cartId, tx);
          this.cartService.assertCartAccess(transactionalCart, {
            userId: options.actorUserId,
            guestToken: options.guestToken,
          });

          if (transactionalCart.items.length === 0) {
            throw new BadRequestException(
              'Cart must contain at least one item before checkout placement',
            );
          }

          // ── Atomically claim the cart to prevent concurrent checkout ──
          const cartClaim = await tx.cart.updateMany({
            where: { id: transactionalCart.id, status: 'ACTIVE' },
            data: { status: 'ABANDONED' },
          });

          if (cartClaim.count !== 1) {
            throw new ConflictException(
              'This cart is no longer active or is already being checked out',
            );
          }
          // ────────────────────────────────────────────────────────────────

          this.paymentAttemptService.assertCheckoutMethodAllowed(dto.paymentMethod);
          const pricingPreview = await this.pricingPreviewService.previewCheckout(
            this.buildPricingPreviewInput(dto, transactionalCart, options.actorUserId),
          );

          const shippingMethod = pricingPreview.shippingMethods.find(
            (method) => method.key === dto.shippingMethodKey,
          );
          if (!shippingMethod) {
            throw new BadRequestException(
              `Shipping method "${dto.shippingMethodKey}" is not available for this checkout`,
            );
          }
          const shippingMethodRecord = await tx.shippingMethod.findUnique({
            where: {
              id: shippingMethod.methodId,
            },
          });
          if (!shippingMethodRecord) {
            throw new NotFoundException(
              `Shipping method "${dto.shippingMethodKey}" could not be resolved`,
            );
          }

          const reservationKey =
            dto.reservationKey?.trim() || `order:${transactionalCart.id}:${randomUUID()}`;
          if (dto.reservationKey) {
            await this.assertReusableReservation(
              reservationKey,
              transactionalCart.items.map((item) => ({
                variantId: item.variantId,
                quantity: item.quantity,
              })),
              options.actorUserId,
              tx,
            );
          } else {
            await this.reserveStockForOrder(
              reservationKey,
              transactionalCart.items.map((item) => ({
                variantId: item.variantId,
                quantity: item.quantity,
              })),
              options.actorUserId,
              tx,
            );
          }

          const variantSnapshots = await this.loadVariantSnapshots(
            transactionalCart.items.map((item) => item.variantId),
            dto.customerLocale,
            tx,
          );

          const paymentDecision =
            dto.paymentMethod === CheckoutPaymentMethod.CASH_ON_DELIVERY
              ? this.codPaymentService.assertPlacementAllowed(dto.paymentMethod)
              : {
                  paymentMethod: 'STRIPE_CARD' as const,
                  paymentStatus: 'PENDING' as const,
                };

          const order = await tx.order.create({
            data: {
              orderNumber: this.generateOrderNumber(),
              userId: options.actorUserId ?? transactionalCart.userId ?? null,
              cartId: transactionalCart.id,
              idempotencyKeyId,
              reservationKey,
              customerEmail: dto.customerEmail.trim(),
              customerName: dto.shippingAddress.recipientName.trim(),
              customerPhone: dto.shippingAddress.phoneNumber.trim(),
              currencyCode: pricingPreview.currencyCode,
              countryCode: pricingPreview.countryCode,
              status: 'PLACED',
              paymentMethod: paymentDecision.paymentMethod,
              paymentStatus: paymentDecision.paymentStatus,
              fulfillmentStatus: 'UNFULFILLED',
              shippingMethodKey: shippingMethod.key,
              shippingMethodName: shippingMethod.name,
              shippingRateType: shippingMethodRecord.rateType,
              shippingEstimatedMinDays: shippingMethod.estimatedMinDays,
              shippingEstimatedMaxDays: shippingMethod.estimatedMaxDays,
              couponCode: transactionalCart.couponCode,
              subtotalAmount: pricingPreview.subtotalAmount,
              subtotalDiscountAmount: pricingPreview.subtotalDiscountAmount,
              discountedSubtotalAmount: pricingPreview.discountedSubtotalAmount,
              shippingAmount: shippingMethod.amount,
              taxAmount: pricingPreview.taxAmount,
              grandTotalAmount: shippingMethod.totalAmount,
            },
          });

          const paymentAttempt =
            dto.paymentMethod === CheckoutPaymentMethod.ONLINE_CARD
              ? await this.paymentAttemptService.createPendingOnlinePaymentAttempt(
                  {
                    id: order.id,
                    orderNumber: order.orderNumber,
                    currencyCode: order.currencyCode,
                    grandTotalAmount: order.grandTotalAmount,
                    customerEmail: order.customerEmail,
                  },
                  tx,
                )
              : null;

          await tx.orderAddress.createMany({
            data: this.buildAddressRows(order.id, dto.shippingAddress, dto.billingAddress),
          });

          await tx.orderLine.createMany({
            data: pricingPreview.items.map((item) => {
              const variantSnapshot = variantSnapshots.get(item.variantId);
              if (!variantSnapshot) {
                throw new NotFoundException(
                  `Catalog snapshot for variant "${item.variantId}" was not found`,
                );
              }

              return {
                orderId: order.id,
                variantId: item.variantId,
                productId: variantSnapshot.productId,
                sku: item.sku,
                productName: variantSnapshot.productName,
                variantName: variantSnapshot.variantName,
                quantity: item.quantity,
                currencyCode: item.currencyCode,
                unitBaseAmount: item.unitBaseAmount,
                unitSaleAmount: item.unitSaleAmount,
                effectiveUnitAmount: item.effectiveUnitAmount,
                lineSubtotalAmount: item.lineSubtotalAmount,
                taxAmount: item.taxAmount,
              };
            }),
          });

          if (pricingPreview.appliedPromotions.length > 0) {
            await tx.orderAppliedPromotion.createMany({
              data: pricingPreview.appliedPromotions.map((promotion) => ({
                orderId: order.id,
                promotionId: promotion.promotionId,
                key: promotion.key,
                name: promotion.name,
                rewardType: promotion.rewardType,
                discountAmount: promotion.discountAmount,
                freeShipping: promotion.freeShipping,
                source: promotion.source,
                couponCode: promotion.couponCode,
              })),
            });
          }

          await this.promotionUsageService.redeemAppliedPromotions(
            pricingPreview.appliedPromotions,
            order.id,
            options.actorUserId ?? transactionalCart.userId ?? undefined,
            tx,
          );

          if (dto.paymentMethod === CheckoutPaymentMethod.CASH_ON_DELIVERY) {
            await this.inventoryCoreService.redeemStockReservation(reservationKey, order.id, tx);
          }

          await this.orderOutboxService.emitPlaced(order, tx);

          const serializedOrder = await this.orderService.getSerializedOrderById(order.id, tx);
          return { serializedOrder, order, paymentAttempt };
        });

        if (!placement.paymentAttempt) {
          return {
            responseCode: 201,
            responseBody: placement.serializedOrder,
          };
        }

        try {
          const payment = await this.paymentAttemptService.initializeOnlinePaymentAttempt(
            placement.paymentAttempt.id,
            {
              id: placement.order.id,
              orderNumber: placement.order.orderNumber,
              currencyCode: placement.order.currencyCode,
              grandTotalAmount: placement.order.grandTotalAmount,
              customerEmail: placement.order.customerEmail,
            },
            {
              paymentMethod: dto.paymentMethod,
              requestIdempotencyKey: `${scope}:${normalizedIdempotencyKey}`,
            },
          );

          return {
            responseCode: 201,
            responseBody: { ...placement.serializedOrder, payment },
          };
        } catch (error) {
          // A provider timeout or a local persistence failure is ambiguous: a PaymentIntent
          // may already exist. Keep the reservation until a signed webhook or expiry job
          // establishes the definitive outcome; releasing it here can oversell paid stock.
          throw new ServiceUnavailableException(
            {
              message:
                'Payment initialization is pending reconciliation. Check this order before retrying.',
              orderId: placement.order.id,
              orderNumber: placement.order.orderNumber,
              paymentAttemptId: placement.paymentAttempt.id,
            },
            { cause: error },
          );
        }
      },
    });

    return executionResult.responseBody;
  }

  private buildPricingPreviewInput(
    dto: CheckoutPlaceOrderDto,
    cart: {
      couponCode: string | null;
      userId: string | null;
      items: Array<{ variantId: string; quantity: number }>;
    },
    actorUserId?: string,
  ): CheckoutPreviewDto {
    return {
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
  }

  private async reserveStockForOrder(
    reservationKey: string,
    items: Array<{ variantId: string; quantity: number }>,
    actorUserId: string | undefined,
    tx: Prisma.TransactionClient,
  ) {
    const defaultWarehouse = await tx.warehouse.findFirst({
      where: { isDefault: true },
      orderBy: [{ createdAt: 'asc' }],
    });

    if (!defaultWarehouse) {
      throw new NotFoundException('Default warehouse is not configured');
    }

    const expiresAt = new Date(Date.now() + 15 * 60 * 1000);
    for (const item of items) {
      await this.inventoryCoreService.reserveStock(
        defaultWarehouse.id,
        item.variantId,
        item.quantity,
        reservationKey,
        expiresAt,
        actorUserId,
        tx,
      );
    }
  }

  private async assertReusableReservation(
    reservationKey: string,
    items: Array<{ variantId: string; quantity: number }>,
    actorUserId: string | undefined,
    tx: Prisma.TransactionClient,
  ) {
    const reservations = await tx.stockReservation.findMany({
      where: {
        reservationKey,
        status: 'RESERVED',
      },
    });

    if (reservations.length === 0) {
      throw new BadRequestException('The supplied reservation key is not active');
    }

    if (
      actorUserId &&
      reservations.some(
        (reservation) => reservation.userId !== null && reservation.userId !== actorUserId,
      )
    ) {
      throw new ForbiddenException(
        'The supplied reservation key does not belong to the current user',
      );
    }

    if (!actorUserId && reservations.some((reservation) => reservation.userId !== null)) {
      throw new ForbiddenException('Guest checkout cannot reuse an authenticated reservation key');
    }

    const expected = new Map(items.map((item) => [item.variantId, item.quantity]));
    const actual = new Map(
      reservations.map((reservation) => [reservation.variantId, reservation.quantity]),
    );

    if (expected.size !== actual.size) {
      throw new BadRequestException(
        'The supplied reservation key does not match the current cart contents',
      );
    }

    for (const [variantId, quantity] of expected.entries()) {
      if (actual.get(variantId) !== quantity) {
        throw new BadRequestException(
          'The supplied reservation key does not match the current cart contents',
        );
      }
    }
  }

  private async loadVariantSnapshots(
    variantIds: string[],
    customerLocale: string | undefined,
    tx: Prisma.TransactionClient,
  ) {
    const variants = await tx.catalogProductVariant.findMany({
      where: {
        id: {
          in: variantIds,
        },
      },
      include: {
        translations: true,
        product: {
          include: {
            translations: true,
          },
        },
      },
    });

    const locale = customerLocale?.trim().toLowerCase();
    return new Map(
      variants.map((variant) => [
        variant.id,
        {
          productId: variant.productId,
          productName:
            this.resolveLocalizedName(
              variant.product.translations.map((translation) => ({
                locale: translation.locale,
                value: translation.name,
              })),
              locale,
            ) ?? variant.product.sku,
          variantName:
            this.resolveLocalizedName(
              variant.translations.map((translation) => ({
                locale: translation.locale,
                value: translation.name,
              })),
              locale,
            ) ?? variant.sku,
        },
      ]),
    );
  }

  private resolveLocalizedName(
    values: Array<{ locale: string; value: string }>,
    requestedLocale?: string,
  ) {
    if (requestedLocale) {
      const exact = values.find((value) => value.locale.toLowerCase() === requestedLocale);
      if (exact) {
        return exact.value;
      }
    }

    const english = values.find((value) => value.locale.toLowerCase() === 'en');
    return english?.value ?? values[0]?.value;
  }

  private buildAddressRows(
    orderId: string,
    shippingAddress: CheckoutAddressDto,
    billingAddress?: CheckoutAddressDto,
  ) {
    const billing = billingAddress ?? shippingAddress;

    return [
      this.mapAddressRow(orderId, 'SHIPPING', shippingAddress),
      this.mapAddressRow(orderId, 'BILLING', billing),
    ];
  }

  private mapAddressRow(
    orderId: string,
    type: 'SHIPPING' | 'BILLING',
    address: CheckoutAddressDto,
  ) {
    return {
      orderId,
      type,
      recipientName: address.recipientName.trim(),
      phoneNumber: address.phoneNumber.trim(),
      countryCode: address.countryCode.trim().toUpperCase(),
      city: address.city.trim(),
      state: address.state?.trim() || null,
      postalCode: address.postalCode?.trim() || null,
      addressLine1: address.addressLine1.trim(),
      addressLine2: address.addressLine2?.trim() || null,
      company: address.company?.trim() || null,
    };
  }

  private resolveIdempotencyScope(actorUserId?: string, guestToken?: string) {
    if (actorUserId) {
      return `checkout.place:user:${actorUserId}`;
    }

    const normalizedGuestToken = guestToken?.trim();
    if (!normalizedGuestToken) {
      throw new BadRequestException('Guest checkout requires an x-guest-cart-token header');
    }

    return `checkout.place:guest:${createHash('sha256').update(normalizedGuestToken).digest('hex')}`;
  }

  private generateOrderNumber() {
    const datePart = new Date().toISOString().slice(0, 10).replace(/-/g, '');
    const randomPart = randomUUID().slice(0, 8).toUpperCase();
    return `ORD-${datePart}-${randomPart}`;
  }
}
