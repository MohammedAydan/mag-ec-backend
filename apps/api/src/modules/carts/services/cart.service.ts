import { createHash, randomUUID, timingSafeEqual } from 'node:crypto';

import {
  BadRequestException,
  ForbiddenException,
  Inject,
  Injectable,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { CouponNormalizerService } from '../../promotions/services/coupon-normalizer.service';
import { PrismaService } from '../../persistence/services/prisma.service';

type CartAccessContext = {
  guestToken?: string;
  userId?: string;
};

@Injectable()
export class CartService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(CouponNormalizerService)
    private readonly couponNormalizerService: CouponNormalizerService,
  ) {}

  async getOrCreateCart(
    guestToken?: string,
    userId?: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    if (!guestToken && !userId) {
      throw new BadRequestException('Either guestToken or userId is required to resolve a cart');
    }

    if (userId) {
      const existingUserCart = await this.findActiveCartByUserId(userId, tx);
      if (existingUserCart) {
        return existingUserCart;
      }

      return tx.cart.create({
        data: { userId, status: 'ACTIVE' },
        include: this.cartInclude,
      });
    }

    const normalizedGuestToken = this.normalizeGuestToken(guestToken);
    const guestTokenHash = this.hashGuestToken(normalizedGuestToken);
    const existingGuestCart = await this.findActiveCartByGuestToken(guestTokenHash, tx);
    if (existingGuestCart) {
      return existingGuestCart;
    }

    return tx.cart.create({
      data: {
        // The public guest token is a bearer secret; persist its SHA-256 digest only.
        guestToken: guestTokenHash,
        status: 'ACTIVE',
      },
      include: this.cartInclude,
    });
  }

  async createGuestCart(tx: Prisma.TransactionClient = this.prisma) {
    return this.getOrCreateCart(randomUUID(), undefined, tx);
  }

  async getCartOrThrow(id: string, tx: Prisma.TransactionClient = this.prisma) {
    const cart = await tx.cart.findUnique({
      where: { id },
      include: this.cartInclude,
    });

    if (!cart) {
      throw new NotFoundException(`Cart "${id}" was not found`);
    }

    return cart;
  }

  assertCartAccess(
    cart: {
      id: string;
      guestToken: string | null;
      userId: string | null;
    },
    context: CartAccessContext,
  ) {
    if (cart.userId) {
      if (!context.userId) {
        throw new UnauthorizedException('Authentication is required to access this cart');
      }

      if (context.userId !== cart.userId) {
        throw new ForbiddenException('You do not have access to this cart');
      }

      return;
    }

    const normalizedGuestToken = this.normalizeGuestToken(context.guestToken);
    const suppliedHash = this.hashGuestToken(normalizedGuestToken);
    if (!cart.guestToken || !this.constantTimeEqual(suppliedHash, cart.guestToken)) {
      throw new ForbiddenException('A valid guest cart token is required to access this cart');
    }
  }

  async addItem(
    cartId: string,
    variantId: string,
    quantity: number,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    if (quantity <= 0) {
      throw new BadRequestException('Cart item quantity must be greater than zero');
    }

    await this.assertPublishedVariant(variantId, tx);

    const existingItem = await tx.cartItem.findUnique({
      where: {
        cartId_variantId: {
          cartId,
          variantId,
        },
      },
    });

    if (existingItem) {
      await tx.cartItem.update({
        where: { id: existingItem.id },
        data: {
          quantity: existingItem.quantity + quantity,
        },
      });
    } else {
      await tx.cartItem.create({
        data: {
          cartId,
          variantId,
          quantity,
        },
      });
    }

    return this.getCartOrThrow(cartId, tx);
  }

  async updateItemQuantity(
    cartId: string,
    variantId: string,
    quantity: number,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    const existingItem = await tx.cartItem.findUnique({
      where: {
        cartId_variantId: {
          cartId,
          variantId,
        },
      },
    });

    if (!existingItem) {
      throw new NotFoundException(`Cart item for variant "${variantId}" was not found`);
    }

    if (quantity <= 0) {
      await tx.cartItem.delete({
        where: { id: existingItem.id },
      });
      return this.getCartOrThrow(cartId, tx);
    }

    await this.assertPublishedVariant(variantId, tx);
    await tx.cartItem.update({
      where: { id: existingItem.id },
      data: { quantity },
    });

    return this.getCartOrThrow(cartId, tx);
  }

  async removeItem(cartId: string, variantId: string, tx: Prisma.TransactionClient = this.prisma) {
    const existingItem = await tx.cartItem.findUnique({
      where: {
        cartId_variantId: {
          cartId,
          variantId,
        },
      },
    });

    if (!existingItem) {
      throw new NotFoundException(`Cart item for variant "${variantId}" was not found`);
    }

    await tx.cartItem.delete({
      where: { id: existingItem.id },
    });

    return this.getCartOrThrow(cartId, tx);
  }

  async applyCoupon(
    cartId: string,
    couponCode: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    const normalizedCouponCode = this.couponNormalizerService.normalize(couponCode);
    await tx.cart.update({
      where: { id: cartId },
      data: {
        couponCode: couponCode.trim(),
        normalizedCouponCode,
      },
    });

    return this.getCartOrThrow(cartId, tx);
  }

  async removeCoupon(cartId: string, tx: Prisma.TransactionClient = this.prisma) {
    await tx.cart.update({
      where: { id: cartId },
      data: {
        couponCode: null,
        normalizedCouponCode: null,
      },
    });

    return this.getCartOrThrow(cartId, tx);
  }

  async mergeGuestCartIntoUserCart(
    guestToken: string,
    userId: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    const normalizedGuestToken = this.normalizeGuestToken(guestToken);
    const guestCart = await this.findActiveCartByGuestToken(
      this.hashGuestToken(normalizedGuestToken),
      tx,
    );

    if (!guestCart) {
      return this.getOrCreateCart(undefined, userId, tx);
    }

    const userCart = await this.getOrCreateCart(undefined, userId, tx);

    if (guestCart.id === userCart.id) {
      return userCart;
    }

    for (const guestItem of guestCart.items) {
      const existingItem = userCart.items.find((item) => item.variantId === guestItem.variantId);

      if (existingItem) {
        await tx.cartItem.update({
          where: { id: existingItem.id },
          data: {
            quantity: existingItem.quantity + guestItem.quantity,
          },
        });
      } else {
        await tx.cartItem.create({
          data: {
            cartId: userCart.id,
            variantId: guestItem.variantId,
            quantity: guestItem.quantity,
          },
        });
      }
    }

    if (!userCart.couponCode && guestCart.couponCode) {
      await tx.cart.update({
        where: { id: userCart.id },
        data: {
          couponCode: guestCart.couponCode,
          normalizedCouponCode: guestCart.normalizedCouponCode,
        },
      });
    }

    await tx.cartItem.deleteMany({
      where: { cartId: guestCart.id },
    });
    await tx.cart.update({
      where: { id: guestCart.id },
      data: { status: 'MERGED' },
    });

    return this.getCartOrThrow(userCart.id, tx);
  }

  async abandonCart(cartId: string, tx: Prisma.TransactionClient = this.prisma) {
    await tx.cart.update({
      where: { id: cartId },
      data: { status: 'ABANDONED' },
    });

    return this.getCartOrThrow(cartId, tx);
  }

  private async findActiveCartByGuestToken(guestTokenHash: string, tx: Prisma.TransactionClient) {
    return tx.cart.findFirst({
      where: {
        guestToken: guestTokenHash,
        status: 'ACTIVE',
      },
      include: this.cartInclude,
    });
  }

  private async findActiveCartByUserId(userId: string, tx: Prisma.TransactionClient) {
    return tx.cart.findFirst({
      where: {
        userId,
        status: 'ACTIVE',
      },
      include: this.cartInclude,
    });
  }

  private async assertPublishedVariant(variantId: string, tx: Prisma.TransactionClient) {
    const variant = await tx.catalogProductVariant.findFirst({
      where: {
        id: variantId,
        status: 'PUBLISHED',
        product: {
          status: 'PUBLISHED',
        },
      },
      select: {
        id: true,
      },
    });

    if (!variant) {
      throw new NotFoundException(`Published catalog variant "${variantId}" was not found`);
    }
  }

  hashGuestToken(guestToken: string): string {
    return createHash('sha256').update(guestToken).digest('hex');
  }

  private constantTimeEqual(left: string, right: string): boolean {
    const leftBuffer = Buffer.from(left);
    const rightBuffer = Buffer.from(right);

    return leftBuffer.length === rightBuffer.length && timingSafeEqual(leftBuffer, rightBuffer);
  }

  private readonly UUIDV4_PATTERN =
    /^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;

  private normalizeGuestToken(guestToken?: string) {
    const normalizedGuestToken = guestToken?.trim();

    if (!normalizedGuestToken) {
      throw new BadRequestException('Guest cart token is required');
    }

    if (!this.UUIDV4_PATTERN.test(normalizedGuestToken)) {
      throw new BadRequestException(
        'Guest cart token must be a valid UUIDv4 for adequate entropy',
      );
    }

    return normalizedGuestToken;
  }

  private readonly cartInclude = {
    user: {
      select: {
        id: true,
        email: true,
        displayName: true,
      },
    },
    items: {
      orderBy: [{ createdAt: 'asc' as const }],
      include: {
        variant: {
          include: {
            price: true,
            product: {
              select: {
                id: true,
                sku: true,
                status: true,
              },
            },
          },
        },
      },
    },
  } satisfies Prisma.CartInclude;
}
