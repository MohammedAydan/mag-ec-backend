import { ConflictException, NotFoundException } from '@nestjs/common';

import { WishlistService } from './wishlist.service';

describe('WishlistService', () => {
  const prisma = {
    wishlist: {
      findUnique: jest.fn(),
      create: jest.fn(),
    },
    wishlistItem: {
      findUnique: jest.fn(),
      create: jest.fn(),
      delete: jest.fn(),
    },
    catalogProductVariant: {
      findFirst: jest.fn(),
    },
  };

  let service: WishlistService;

  beforeEach(() => {
    jest.clearAllMocks();
    service = new WishlistService(prisma as never);
  });

  it('creates a wishlist on first access', async () => {
    prisma.wishlist.findUnique.mockResolvedValueOnce(null);
    prisma.wishlist.create.mockResolvedValue({
      id: 'wishlist_1',
      userId: 'user_1',
      items: [],
    });

    await expect(service.getWishlist('user_1')).resolves.toMatchObject({
      id: 'wishlist_1',
      userId: 'user_1',
    });
  });

  it('adds a published variant to the wishlist', async () => {
    prisma.catalogProductVariant.findFirst.mockResolvedValue({ id: 'variant_1' });
    prisma.wishlist.findUnique.mockResolvedValue({
      id: 'wishlist_1',
      userId: 'user_1',
      items: [],
    });
    prisma.wishlistItem.findUnique.mockResolvedValue(null);

    await service.addItem('user_1', 'variant_1');

    expect(prisma.wishlistItem.create).toHaveBeenCalledWith({
      data: {
        wishlistId: 'wishlist_1',
        variantId: 'variant_1',
      },
    });
  });

  it('rejects duplicate wishlist items', async () => {
    prisma.catalogProductVariant.findFirst.mockResolvedValue({ id: 'variant_1' });
    prisma.wishlist.findUnique.mockResolvedValue({
      id: 'wishlist_1',
      userId: 'user_1',
      items: [],
    });
    prisma.wishlistItem.findUnique.mockResolvedValue({
      id: 'wishlist_item_1',
      wishlistId: 'wishlist_1',
      variantId: 'variant_1',
    });

    await expect(service.addItem('user_1', 'variant_1')).rejects.toThrow(ConflictException);
  });

  it('rejects removal when the variant is not in the wishlist', async () => {
    prisma.wishlist.findUnique.mockResolvedValue({
      id: 'wishlist_1',
      userId: 'user_1',
      items: [],
    });
    prisma.wishlistItem.findUnique.mockResolvedValue(null);

    await expect(service.removeItem('user_1', 'variant_1')).rejects.toThrow(NotFoundException);
  });
});
