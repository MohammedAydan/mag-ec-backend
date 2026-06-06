import {
  BadRequestException,
  ForbiddenException,
  NotFoundException,
  ServiceUnavailableException,
} from '@nestjs/common';

import { ReturnsService } from './returns.service';

describe('ReturnsService', () => {
  const refundService = { executeRefund: jest.fn() };
  const inventoryCoreService = { adjustStock: jest.fn() };
  const orderPostPurchaseService = { syncOrderPostPurchaseState: jest.fn().mockResolvedValue(undefined) };
  const orderOutboxService = { emitEvent: jest.fn(), emitStatusChanged: jest.fn() };

  const tx = {
    returnRequest: {
      findUniqueOrThrow: jest.fn(),
      findUnique: jest.fn(),
      create: jest.fn(),
      update: jest.fn(),
      updateMany: jest.fn(),
    },
    returnRequestItem: { createMany: jest.fn(), update: jest.fn() },
    order: { findUnique: jest.fn() },
    auditLog: { create: jest.fn() },
    stockLevel: { upsert: jest.fn() },
    stockMovement: { create: jest.fn() },
    stockReservation: { updateMany: jest.fn() },
    couponRedemption: { findMany: jest.fn() },
    promotionRedemption: { findMany: jest.fn() },
  };

  const prismaTransactionService = {
    runInTransaction: jest.fn(async (callback: (input: typeof tx) => Promise<unknown>) =>
      callback(tx),
    ),
  };

  let service: ReturnsService;

  const makeReceivedReturn = (overrides: Record<string, unknown> = {}) => ({
    id: 'return_1',
    orderId: 'order_1',
    order: {
      userId: 'user_1',
      lines: [],
      shipments: [],
      returnRequests: [],
    },
    status: 'RECEIVED',
    reason: 'Damaged item',
    notes: null,
    reviewNotes: null,
    rejectionReason: null,
    approvedAt: new Date().toISOString(),
    rejectedAt: null,
    receivedAt: new Date().toISOString(),
    closedAt: null,
    createdAt: new Date().toISOString(),
    updatedAt: new Date().toISOString(),
    returnNumber: 'RET-001',
    requestedByUserId: 'user_1',
    reviewedByUserId: 'admin_1',
    receivedByUserId: 'admin_1',
    items: [
      {
        id: 'item_1',
        orderLineId: 'line_1',
        quantity: 2,
        receivedQuantity: 2,
        requestedDisposition: 'RESTOCK',
        finalDisposition: 'RESTOCK',
        warehouseId: 'wh_1',
        reason: 'Broken',
        conditionNotes: null,
        restockedAt: new Date().toISOString(),
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        orderLine: {
          id: 'line_1',
          orderId: 'order_1',
          variantId: 'variant_1',
          productId: 'product_1',
          sku: 'SKU-1',
          productName: 'Test Product',
          variantName: 'Default',
          quantity: 2,
          currencyCode: 'USD',
          unitBaseAmount: 1000,
          unitSaleAmount: null,
          effectiveUnitAmount: 1000,
          lineSubtotalAmount: 2000,
          taxAmount: 0,
          createdAt: new Date().toISOString(),
          updatedAt: new Date().toISOString(),
        },
      },
      {
        id: 'item_2',
        orderLineId: 'line_2',
        quantity: 1,
        receivedQuantity: 1,
        requestedDisposition: 'DISCARD',
        finalDisposition: 'DISCARD',
        warehouseId: null,
        reason: 'Torn',
        conditionNotes: null,
        restockedAt: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        orderLine: {
          id: 'line_2',
          orderId: 'order_1',
          variantId: 'variant_2',
          productId: 'product_2',
          sku: 'SKU-2',
          productName: 'Test Product 2',
          variantName: 'Large',
          quantity: 1,
          currencyCode: 'USD',
          unitBaseAmount: 500,
          unitSaleAmount: null,
          effectiveUnitAmount: 500,
          lineSubtotalAmount: 500,
          taxAmount: 0,
          createdAt: new Date().toISOString(),
          updatedAt: new Date().toISOString(),
        },
      },
    ],
    refunds: [],
    ...overrides,
  });

  beforeEach(() => {
    jest.clearAllMocks();
    service = new ReturnsService(
      {
        returnRequest: { findUnique: jest.fn(), updateMany: jest.fn() },
      } as never,
      prismaTransactionService as never,
      refundService as never,
      inventoryCoreService as never,
      orderPostPurchaseService as never,
      orderOutboxService as never,
    );
  });

  // ── SEC-005 / SEC-014: Refund execution validation ──

  it('rejects refund when return request is not found', async () => {
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(null);

    await expect(
      service.executeReturnRefund('return_missing', { amount: 1000 }, 'admin_1'),
    ).rejects.toThrow(NotFoundException);
  });

  it('rejects refund when return request is not in RECEIVED status', async () => {
    const record = makeReceivedReturn({ status: 'APPROVED' });
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(record);

    await expect(
      service.executeReturnRefund('return_1', { amount: 1000 }, 'admin_1'),
    ).rejects.toThrow(BadRequestException);
  });

  // ── SEC-014: Received-items refund cap ──

  it('computes cap as sum of (receivedQuantity * effectiveUnitAmount) across all items', async () => {
    // cap = 2*1000 + 1*500 = 2500
    const record = makeReceivedReturn();
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock; updateMany: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(record);
    (service as never as { prisma: { returnRequest: { updateMany: jest.Mock } } }).prisma.returnRequest.updateMany.mockResolvedValue({ count: 1 });

    refundService.executeRefund.mockResolvedValue({ id: 'refund_1' });
    const getAdminReturnSpy = jest.spyOn(service, 'getAdminReturn').mockResolvedValue({ id: 'return_1', status: 'CLOSED' } as never);

    const result = await service.executeReturnRefund('return_1', { amount: 2500 }, 'admin_1');

    expect(result).toEqual({ id: 'return_1', status: 'CLOSED' });
    expect(refundService.executeRefund).toHaveBeenCalledWith(
      expect.objectContaining({ amount: 2500, metadata: undefined }),
    );
    getAdminReturnSpy.mockRestore();
  });

  it('allows refund below cap without override', async () => {
    // cap = 2500, amount = 1000
    const record = makeReceivedReturn();
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock; updateMany: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(record);
    (service as never as { prisma: { returnRequest: { updateMany: jest.Mock } } }).prisma.returnRequest.updateMany.mockResolvedValue({ count: 1 });

    refundService.executeRefund.mockResolvedValue({ id: 'refund_1' });
    const getAdminReturnSpy = jest.spyOn(service, 'getAdminReturn').mockResolvedValue({ id: 'return_1', status: 'CLOSED' } as never);

    await expect(
      service.executeReturnRefund('return_1', { amount: 1000 }, 'admin_1'),
    ).resolves.toEqual({ id: 'return_1', status: 'CLOSED' });

    expect(refundService.executeRefund).toHaveBeenCalledWith(
      expect.objectContaining({ amount: 1000, metadata: undefined }),
    );
    getAdminReturnSpy.mockRestore();
  });

  it('rejects refund above cap without override flags', async () => {
    // cap = 2500, amount = 3000
    const record = makeReceivedReturn();
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(record);

    await expect(
      service.executeReturnRefund('return_1', { amount: 3000 }, 'admin_1'),
    ).rejects.toThrow(BadRequestException);

    // Must mention the cap in the error
    await expect(
      service.executeReturnRefund('return_1', { amount: 3000 }, 'admin_1'),
    ).rejects.toThrow(/2500/);
  });

  it('rejects refund above cap when isOverride is true but overrideReason is missing', async () => {
    const record = makeReceivedReturn();
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(record);

    await expect(
      service.executeReturnRefund(
        'return_1',
        { amount: 3000, isOverride: true },
        'admin_1',
      ),
    ).rejects.toThrow(BadRequestException);

    await expect(
      service.executeReturnRefund(
        'return_1',
        { amount: 3000, isOverride: true, overrideReason: '   ' },
        'admin_1',
      ),
    ).rejects.toThrow(BadRequestException);
  });

  it('rejects refund above cap when override flags are present but user lacks refunds.override_cap', async () => {
    const record = makeReceivedReturn();
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(record);

    await expect(
      service.executeReturnRefund(
        'return_1',
        { amount: 3000, isOverride: true, overrideReason: 'Goodwill credit' },
        'admin_1',
        ['returns.write', 'refunds.write'], // NO refunds.override_cap
      ),
    ).rejects.toThrow(ForbiddenException);
  });

  it('allows refund above cap with override flags AND refunds.override_cap permission', async () => {
    // cap = 2500, amount = 3000
    const record = makeReceivedReturn();
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock; updateMany: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(record);
    (service as never as { prisma: { returnRequest: { updateMany: jest.Mock } } }).prisma.returnRequest.updateMany.mockResolvedValue({ count: 1 });

    refundService.executeRefund.mockResolvedValue({ id: 'refund_1' });
    const getAdminReturnSpy = jest.spyOn(service, 'getAdminReturn').mockResolvedValue({ id: 'return_1', status: 'CLOSED' } as never);

    await expect(
      service.executeReturnRefund(
        'return_1',
        { amount: 3000, isOverride: true, overrideReason: 'Goodwill credit' },
        'admin_1',
        ['returns.write', 'refunds.write', 'refunds.override_cap'],
      ),
    ).resolves.toEqual({ id: 'return_1', status: 'CLOSED' });

    // Must pass override metadata through to refund service
    expect(refundService.executeRefund).toHaveBeenCalledWith(
      expect.objectContaining({
        amount: 3000,
        metadata: {
          overrideCap: true,
          receivedItemsCap: 2500,
          overrideReason: 'Goodwill credit',
        },
      }),
    );
    getAdminReturnSpy.mockRestore();
  });

  it('handles zero received quantities for cap calculation', async () => {
    // One item has receivedQuantity = 0, so cap = 0*1000 + 1*500 = 500
    const record = makeReceivedReturn();
    record.items[0]!.receivedQuantity = 0;
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock; updateMany: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(record);
    (service as never as { prisma: { returnRequest: { updateMany: jest.Mock } } }).prisma.returnRequest.updateMany.mockResolvedValue({ count: 1 });

    refundService.executeRefund.mockResolvedValue({ id: 'refund_1' });
    const getAdminReturnSpy = jest.spyOn(service, 'getAdminReturn').mockResolvedValue({ id: 'return_1', status: 'CLOSED' } as never);

    // amount 500 = cap, should pass without override
    await expect(
      service.executeReturnRefund('return_1', { amount: 500 }, 'admin_1'),
    ).resolves.toEqual({ id: 'return_1', status: 'CLOSED' });

    // amount 501 > cap (500), should reject unless overridden
    await expect(
      service.executeReturnRefund('return_1', { amount: 501 }, 'admin_1'),
    ).rejects.toThrow(BadRequestException);
    getAdminReturnSpy.mockRestore();
  });

  it('rejects refund when the claim operation fails (already being processed)', async () => {
    const record = makeReceivedReturn();
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock; updateMany: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(record);
    (service as never as { prisma: { returnRequest: { updateMany: jest.Mock } } }).prisma.returnRequest.updateMany.mockResolvedValue({ count: 0 });

    await expect(
      service.executeReturnRefund('return_1', { amount: 1000 }, 'admin_1'),
    ).rejects.toThrow(BadRequestException);
  });

  it('rolls back status to RECEIVED when refund execution throws a non-ServiceUnavailable error', async () => {
    const record = makeReceivedReturn();
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock; updateMany: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(record);
    (service as never as { prisma: { returnRequest: { updateMany: jest.Mock } } }).prisma.returnRequest.updateMany
      .mockResolvedValueOnce({ count: 1 }) // claim
      .mockResolvedValueOnce({ count: 1 }); // rollback

    refundService.executeRefund.mockRejectedValue(new BadRequestException('Some validation error'));

    await expect(
      service.executeReturnRefund('return_1', { amount: 1000 }, 'admin_1'),
    ).rejects.toThrow(BadRequestException);

    // Must have called updateMany twice: claim + rollback
    expect(
      (service as never as { prisma: { returnRequest: { updateMany: jest.Mock } } }).prisma.returnRequest.updateMany,
    ).toHaveBeenCalledTimes(2);
  });

  it('does NOT roll back status when refund throws ServiceUnavailableException', async () => {
    const record = makeReceivedReturn();
    (service as never as { prisma: { returnRequest: { findUnique: jest.Mock; updateMany: jest.Mock } } }).prisma.returnRequest.findUnique.mockResolvedValue(record);
    (service as never as { prisma: { returnRequest: { updateMany: jest.Mock } } }).prisma.returnRequest.updateMany.mockResolvedValue({ count: 1 });

    refundService.executeRefund.mockRejectedValue(new ServiceUnavailableException('Provider down'));

    await expect(
      service.executeReturnRefund('return_1', { amount: 1000 }, 'admin_1'),
    ).rejects.toThrow(ServiceUnavailableException);

    // Must have called updateMany only once (claim), not twice (no rollback)
    expect(
      (service as never as { prisma: { returnRequest: { updateMany: jest.Mock } } }).prisma.returnRequest.updateMany,
    ).toHaveBeenCalledTimes(1);
  });
});
