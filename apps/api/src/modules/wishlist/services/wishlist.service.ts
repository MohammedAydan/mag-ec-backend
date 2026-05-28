import { ConflictException, Inject, Injectable, NotFoundException } from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';

@Injectable()
export class WishlistService {
  constructor(@Inject(PrismaService) private readonly prisma: PrismaService) {}

  async getOrCreateWishlist(userId: string, tx: Prisma.TransactionClient = this.prisma) {
    const existingWishlist = await tx.wishlist.findUnique({
      where: { userId },
      include: this.wishlistInclude,
    });

    if (existingWishlist) {
      return existingWishlist;
    }

    return tx.wishlist.create({
      data: { userId },
      include: this.wishlistInclude,
    });
  }

  async addItem(userId: string, variantId: string, tx: Prisma.TransactionClient = this.prisma) {
    await this.assertPublishedVariant(variantId, tx);
    const wishlist = await this.getOrCreateWishlist(userId, tx);

    const existingItem = await tx.wishlistItem.findUnique({
      where: {
        wishlistId_variantId: {
          wishlistId: wishlist.id,
          variantId,
        },
      },
    });

    if (existingItem) {
      throw new ConflictException(`Variant "${variantId}" is already in the wishlist`);
    }

    await tx.wishlistItem.create({
      data: {
        wishlistId: wishlist.id,
        variantId,
      },
    });

    return this.getWishlist(userId, tx);
  }

  async removeItem(userId: string, variantId: string, tx: Prisma.TransactionClient = this.prisma) {
    const wishlist = await this.getOrCreateWishlist(userId, tx);
    const existingItem = await tx.wishlistItem.findUnique({
      where: {
        wishlistId_variantId: {
          wishlistId: wishlist.id,
          variantId,
        },
      },
    });

    if (!existingItem) {
      throw new NotFoundException(`Variant "${variantId}" is not in the wishlist`);
    }

    await tx.wishlistItem.delete({
      where: { id: existingItem.id },
    });

    return this.getWishlist(userId, tx);
  }

  async getWishlist(userId: string, tx: Prisma.TransactionClient = this.prisma) {
    return this.getOrCreateWishlist(userId, tx);
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

  private readonly wishlistInclude = {
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
  } satisfies Prisma.WishlistInclude;
}
