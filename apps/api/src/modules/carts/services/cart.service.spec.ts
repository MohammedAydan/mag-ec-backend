import { ForbiddenException, NotFoundException, UnauthorizedException } from '@nestjs/common';

import { CartService } from './cart.service';

describe('CartService', () => {
  type CartServiceDependencies = ConstructorParameters<typeof CartService>;

  const validGuestToken = 'a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d';
  const otherGuestToken = 'b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e';

  const prisma = {
    cart: {
      findFirst: jest.fn(),
      findUnique: jest.fn(),
      create: jest.fn(),
      update: jest.fn(),
    },
    cartItem: {
      findUnique: jest.fn(),
      create: jest.fn(),
      update: jest.fn(),
      delete: jest.fn(),
      deleteMany: jest.fn(),
    },
    catalogProductVariant: {
      findFirst: jest.fn(),
    },
  };

  const couponNormalizerService = {
    normalize: jest.fn((value: string) => value.trim().toUpperCase()),
  };

  let service: CartService;

  beforeEach(() => {
    jest.clearAllMocks();
    service = new CartService(
      prisma as unknown as CartServiceDependencies[0],
      couponNormalizerService,
    );
  });

  it('returns an existing active guest cart', async () => {
    prisma.cart.findFirst.mockResolvedValue({
      id: 'cart_1',
      guestToken: service.hashGuestToken(validGuestToken),
      items: [],
    });

    await expect(service.getOrCreateCart(validGuestToken)).resolves.toMatchObject({
      id: 'cart_1',
    });
    expect(prisma.cart.create).not.toHaveBeenCalled();
  });

  it('creates a guest cart when one does not exist', async () => {
    prisma.cart.findFirst.mockResolvedValue(null);
    prisma.cart.create.mockResolvedValue({
      id: 'cart_2',
      guestToken: service.hashGuestToken(validGuestToken),
      items: [],
    });

    await expect(service.getOrCreateCart(validGuestToken)).resolves.toMatchObject({
      id: 'cart_2',
      guestToken: service.hashGuestToken(validGuestToken),
    });
  });

  it('increments quantity when adding an existing cart item', async () => {
    prisma.catalogProductVariant.findFirst.mockResolvedValue({ id: 'variant_1' });
    prisma.cartItem.findUnique.mockResolvedValue({ id: 'item_1', quantity: 2 });
    prisma.cart.findUnique.mockResolvedValue({
      id: 'cart_1',
      guestToken: service.hashGuestToken('guest-token'),
      userId: null,
      items: [{ id: 'item_1', variantId: 'variant_1', quantity: 5 }],
    });

    await service.addItem('cart_1', 'variant_1', 3);

    expect(prisma.cartItem.update).toHaveBeenCalledWith({
      where: { id: 'item_1' },
      data: { quantity: 5 },
    });
  });

  it('normalizes coupon codes when applying them', async () => {
    prisma.cart.update.mockResolvedValue(undefined);
    prisma.cart.findUnique.mockResolvedValue({
      id: 'cart_1',
      couponCode: 'save10',
      normalizedCouponCode: 'SAVE10',
      items: [],
    });

    await service.applyCoupon('cart_1', ' save10 ');

    expect(couponNormalizerService.normalize).toHaveBeenCalledWith(' save10 ');
    expect(prisma.cart.update).toHaveBeenCalledWith({
      where: { id: 'cart_1' },
      data: {
        couponCode: 'save10',
        normalizedCouponCode: 'SAVE10',
      },
    });
  });

  it('merges guest cart items into the authenticated cart', async () => {
    prisma.cart.findFirst
      .mockResolvedValueOnce({
        id: 'guest_cart',
        guestToken: service.hashGuestToken(validGuestToken),
        couponCode: 'SAVE10',
        normalizedCouponCode: 'SAVE10',
        items: [{ id: 'guest_item', variantId: 'variant_1', quantity: 2 }],
      })
      .mockResolvedValueOnce({
        id: 'user_cart',
        userId: 'user_1',
        couponCode: null,
        normalizedCouponCode: null,
        items: [{ id: 'user_item', variantId: 'variant_1', quantity: 1 }],
      });
    prisma.cart.findUnique.mockResolvedValue({
      id: 'user_cart',
      userId: 'user_1',
      couponCode: 'SAVE10',
      normalizedCouponCode: 'SAVE10',
      items: [{ id: 'user_item', variantId: 'variant_1', quantity: 3 }],
    });

    await service.mergeGuestCartIntoUserCart(validGuestToken, 'user_1');

    expect(prisma.cartItem.update).toHaveBeenCalledWith({
      where: { id: 'user_item' },
      data: { quantity: 3 },
    });
    expect(prisma.cartItem.deleteMany).toHaveBeenCalledWith({
      where: { cartId: 'guest_cart' },
    });
    expect(prisma.cart.update).toHaveBeenCalledWith({
      where: { id: 'guest_cart' },
      data: { status: 'MERGED' },
    });
  });

  it('rejects access to authenticated carts without a user context', () => {
    expect(() =>
      service.assertCartAccess({ id: 'cart_1', guestToken: null, userId: 'user_1' }, {}),
    ).toThrow(UnauthorizedException);
  });

  it('rejects guest cart access when the token does not match', () => {
    expect(() =>
      service.assertCartAccess(
        { id: 'cart_1', guestToken: service.hashGuestToken(validGuestToken), userId: null },
        { guestToken: otherGuestToken },
      ),
    ).toThrow(ForbiddenException);
  });

  it('throws when a published variant cannot be found while adding an item', async () => {
    prisma.catalogProductVariant.findFirst.mockResolvedValue(null);

    await expect(service.addItem('cart_1', 'missing_variant', 1)).rejects.toThrow(
      NotFoundException,
    );
  });
});
