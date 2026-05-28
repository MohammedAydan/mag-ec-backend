import { BadRequestException } from '@nestjs/common';
import type { Prisma } from '@prisma/client';
import type { PrismaService } from '../../persistence/services/prisma.service';
import { InventoryCoreService } from './inventory-core.service';

const WAREHOUSE_ID = 'wh_1';
const VARIANT_ID = 'var_1';
const VARIANT_SKU = 'TEST-SKU-001';
const RESERVATION_KEY = 'res_key_123';

type PrismaMock = {
  catalogProductVariant: { findUnique: jest.Mock };
  warehouse: { findUnique: jest.Mock };
  stockLevel: {
    findUnique: jest.Mock;
    findUniqueOrThrow: jest.Mock;
    upsert: jest.Mock;
    create: jest.Mock;
    update: jest.Mock;
  };
  stockMovement: { create: jest.Mock };
  stockReservation: {
    findMany: jest.Mock;
    findUnique: jest.Mock;
    create: jest.Mock;
    update: jest.Mock;
    updateMany: jest.Mock;
  };
  $executeRaw: jest.Mock;
  $transaction: jest.Mock;
};

function buildPrismaMock(): PrismaMock {
  const mock: PrismaMock = {
    catalogProductVariant: {
      findUnique: jest.fn(),
    },
    warehouse: {
      findUnique: jest.fn(),
    },
    stockLevel: {
      findUnique: jest.fn(),
      findUniqueOrThrow: jest.fn(),
      upsert: jest.fn(),
      create: jest.fn(),
      update: jest.fn(),
    },
    stockMovement: {
      create: jest.fn(),
    },
    stockReservation: {
      findMany: jest.fn(),
      findUnique: jest.fn(),
      create: jest.fn(),
      update: jest.fn(),
      updateMany: jest.fn(),
    },
    $executeRaw: jest.fn(),
    $transaction: jest.fn((fn: (tx: PrismaMock) => Promise<unknown>) => fn(buildPrismaMock())),
  };
  return mock;
}

/** Cast our minimal mock to the TransactionClient shape expected by InventoryCoreService. */
function asTx(mock: PrismaMock): Prisma.TransactionClient {
  return mock as unknown as Prisma.TransactionClient;
}

describe('InventoryCoreService', () => {
  let prisma: ReturnType<typeof buildPrismaMock>;
  let service: InventoryCoreService;
  const taskDispatcher = { scheduleReservationExpiry: jest.fn().mockResolvedValue(false) };
  const mockLogger = {
    log: jest.fn(),
    warn: jest.fn(),
    error: jest.fn(),
  };

  beforeEach(() => {
    jest.clearAllMocks();
    prisma = buildPrismaMock();
    service = new InventoryCoreService(prisma as unknown as PrismaService, taskDispatcher as never);
    Object.defineProperty(service, 'logger', {
      value: mockLogger,
    });
  });

  describe('adjustStock', () => {
    it('creates stock level and movement on first receipt', async () => {
      prisma.catalogProductVariant.findUnique.mockResolvedValue({
        id: VARIANT_ID,
        sku: VARIANT_SKU,
      });
      prisma.warehouse.findUnique.mockResolvedValue({ id: WAREHOUSE_ID, key: 'default' });
      prisma.stockLevel.upsert.mockResolvedValue({ id: 'sl_1' });
      prisma.$executeRaw.mockResolvedValue(1);
      prisma.stockLevel.findUniqueOrThrow.mockResolvedValue({
        id: 'sl_1',
        warehouseId: WAREHOUSE_ID,
        variantId: VARIANT_ID,
        quantityOnHand: 50,
        quantityReserved: 0,
      });
      prisma.stockMovement.create.mockResolvedValue({
        id: 'sm_1',
        quantityChanged: 50,
        type: 'RECEIPT',
      });

      const result = await service.adjustStock(
        WAREHOUSE_ID,
        VARIANT_ID,
        50,
        'RECEIPT',
        undefined,
        undefined,
        'user_1',
        undefined,
        asTx(prisma),
      );

      expect(prisma.stockLevel.upsert).toHaveBeenCalledTimes(1);
      expect(prisma.$executeRaw).toHaveBeenCalledTimes(1);
      expect(prisma.stockMovement.create).toHaveBeenCalledWith(
        expect.objectContaining({
          data: expect.objectContaining({ quantityChanged: 50, type: 'RECEIPT' }),
        }),
      );
      expect(result.stockLevel.quantityOnHand).toBe(50);
    });

    it('throws if variant not found', async () => {
      prisma.catalogProductVariant.findUnique.mockResolvedValue(null);

      await expect(
        service.adjustStock(
          WAREHOUSE_ID,
          VARIANT_ID,
          10,
          'ADJUSTMENT',
          undefined,
          undefined,
          undefined,
          undefined,
          asTx(prisma),
        ),
      ).rejects.toThrow(BadRequestException);
    });

    it('throws if adjustment would make stock negative', async () => {
      prisma.catalogProductVariant.findUnique.mockResolvedValue({
        id: VARIANT_ID,
        sku: VARIANT_SKU,
      });
      prisma.warehouse.findUnique.mockResolvedValue({ id: WAREHOUSE_ID });
      prisma.stockLevel.upsert.mockResolvedValue({ id: 'sl_1' });
      prisma.$executeRaw.mockResolvedValue(0);

      await expect(
        service.adjustStock(
          WAREHOUSE_ID,
          VARIANT_ID,
          -10,
          'WASTE',
          undefined,
          undefined,
          undefined,
          undefined,
          asTx(prisma),
        ),
      ).rejects.toThrow(BadRequestException);
    });

    it('emits low stock warning when available drops below 10', async () => {
      prisma.catalogProductVariant.findUnique.mockResolvedValue({
        id: VARIANT_ID,
        sku: VARIANT_SKU,
      });
      prisma.warehouse.findUnique.mockResolvedValue({ id: WAREHOUSE_ID });
      prisma.stockLevel.upsert.mockResolvedValue({ id: 'sl_1' });
      prisma.$executeRaw.mockResolvedValue(1);
      prisma.stockLevel.findUniqueOrThrow.mockResolvedValue({
        id: 'sl_1',
        quantityOnHand: 9,
        quantityReserved: 0,
      });
      prisma.stockMovement.create.mockResolvedValue({});

      await service.adjustStock(
        WAREHOUSE_ID,
        VARIANT_ID,
        -6,
        'ADJUSTMENT',
        undefined,
        undefined,
        undefined,
        undefined,
        asTx(prisma),
      );

      expect(mockLogger.warn).toHaveBeenCalledWith(expect.stringContaining('Low stock warning'));
    });
  });

  describe('reserveStock', () => {
    const expiresAt = new Date(Date.now() + 15 * 60 * 1000);

    it('reserves stock atomically and creates a reservation record', async () => {
      prisma.catalogProductVariant.findUnique.mockResolvedValue({
        id: VARIANT_ID,
        sku: VARIANT_SKU,
      });
      prisma.stockLevel.findUnique.mockResolvedValue({
        id: 'sl_1',
        quantityOnHand: 100,
        quantityReserved: 0,
      });
      prisma.$executeRaw.mockResolvedValue(1);
      prisma.stockReservation.create.mockResolvedValue({
        id: 'res_1',
        reservationKey: RESERVATION_KEY,
        quantity: 2,
        status: 'RESERVED',
      });

      const result = await service.reserveStock(
        WAREHOUSE_ID,
        VARIANT_ID,
        2,
        RESERVATION_KEY,
        expiresAt,
        'user_1',
        asTx(prisma),
      );

      expect(prisma.$executeRaw).toHaveBeenCalledTimes(1);
      expect(prisma.stockReservation.create).toHaveBeenCalledWith(
        expect.objectContaining({
          data: expect.objectContaining({ quantity: 2, status: 'RESERVED' }),
        }),
      );
      expect(result.status).toBe('RESERVED');
    });

    it('throws BadRequestException when no stock is available (executeRaw returns 0 updated rows)', async () => {
      prisma.catalogProductVariant.findUnique.mockResolvedValue({
        id: VARIANT_ID,
        sku: VARIANT_SKU,
      });
      prisma.stockLevel.findUnique.mockResolvedValue({
        id: 'sl_1',
        quantityOnHand: 1,
        quantityReserved: 1,
      });
      prisma.$executeRaw.mockResolvedValue(0);

      await expect(
        service.reserveStock(
          WAREHOUSE_ID,
          VARIANT_ID,
          5,
          RESERVATION_KEY,
          expiresAt,
          undefined,
          asTx(prisma),
        ),
      ).rejects.toThrow(BadRequestException);
      expect(prisma.stockReservation.create).not.toHaveBeenCalled();
    });

    it('throws if quantity is zero or negative', async () => {
      await expect(
        service.reserveStock(
          WAREHOUSE_ID,
          VARIANT_ID,
          0,
          RESERVATION_KEY,
          expiresAt,
          undefined,
          asTx(prisma),
        ),
      ).rejects.toThrow(BadRequestException);
    });

    it('throws if no stock level exists for variant', async () => {
      prisma.catalogProductVariant.findUnique.mockResolvedValue({
        id: VARIANT_ID,
        sku: VARIANT_SKU,
      });
      prisma.stockLevel.findUnique.mockResolvedValue(null);

      await expect(
        service.reserveStock(
          WAREHOUSE_ID,
          VARIANT_ID,
          1,
          RESERVATION_KEY,
          expiresAt,
          undefined,
          asTx(prisma),
        ),
      ).rejects.toThrow(BadRequestException);
    });
  });

  describe('releaseStockReservation', () => {
    it('updates stock level and marks reservation as RELEASED', async () => {
      prisma.stockReservation.findMany.mockResolvedValue([
        {
          id: 'res_1',
          quantity: 3,
          warehouseId: WAREHOUSE_ID,
          variantId: VARIANT_ID,
          status: 'RESERVED',
        },
      ]);
      prisma.$executeRaw.mockResolvedValue(1);
      prisma.stockReservation.updateMany.mockResolvedValue({ count: 1 });

      await service.releaseStockReservation(RESERVATION_KEY, asTx(prisma));

      expect(prisma.$executeRaw).toHaveBeenCalledTimes(1);
      expect(prisma.stockReservation.updateMany).toHaveBeenCalledWith(
        expect.objectContaining({
          where: expect.objectContaining({ status: 'RESERVED' }),
          data: { status: 'RELEASED' },
        }),
      );
    });

    it('is a no-op when no RESERVED reservations found for key', async () => {
      prisma.stockReservation.findMany.mockResolvedValue([]);

      await service.releaseStockReservation('missing_key', asTx(prisma));

      expect(prisma.$executeRaw).not.toHaveBeenCalled();
      expect(prisma.stockReservation.updateMany).not.toHaveBeenCalled();
    });

    it('does not release stock twice when another actor already claimed the reservation', async () => {
      prisma.stockReservation.findMany.mockResolvedValue([
        {
          id: 'res_1',
          quantity: 3,
          warehouseId: WAREHOUSE_ID,
          variantId: VARIANT_ID,
          status: 'RESERVED',
        },
      ]);
      prisma.stockReservation.updateMany.mockResolvedValue({ count: 0 });

      await service.releaseStockReservation(RESERVATION_KEY, asTx(prisma));

      expect(prisma.$executeRaw).not.toHaveBeenCalled();
    });
  });

  describe('redeemStockReservation', () => {
    it('deducts stock, decrements reservation count, and creates a SALE movement', async () => {
      prisma.stockReservation.findMany.mockResolvedValue([
        {
          id: 'res_1',
          quantity: 2,
          warehouseId: WAREHOUSE_ID,
          variantId: VARIANT_ID,
          status: 'RESERVED',
        },
      ]);
      prisma.$executeRaw.mockResolvedValue(1);
      prisma.stockReservation.updateMany.mockResolvedValue({ count: 1 });
      prisma.stockMovement.create.mockResolvedValue({});

      await service.redeemStockReservation(RESERVATION_KEY, 'order_1', asTx(prisma));

      expect(prisma.$executeRaw).toHaveBeenCalledTimes(1);
      expect(prisma.stockReservation.updateMany).toHaveBeenCalledWith(
        expect.objectContaining({
          where: expect.objectContaining({ status: 'RESERVED' }),
          data: { status: 'REDEEMED' },
        }),
      );
      expect(prisma.stockMovement.create).toHaveBeenCalledWith(
        expect.objectContaining({
          data: expect.objectContaining({
            type: 'SALE',
            quantityChanged: -2,
            referenceId: 'order_1',
          }),
        }),
      );
    });
  });

  describe('restockRedeemedReservation', () => {
    it('restocks a redeemed order reservation once and records a reversal movement', async () => {
      prisma.stockReservation.findMany.mockResolvedValue([
        {
          id: 'res_1',
          quantity: 2,
          warehouseId: WAREHOUSE_ID,
          variantId: VARIANT_ID,
          status: 'REDEEMED',
        },
      ]);
      prisma.stockReservation.updateMany.mockResolvedValue({ count: 1 });
      prisma.$executeRaw.mockResolvedValue(1);
      prisma.stockMovement.create.mockResolvedValue({});

      await expect(
        service.restockRedeemedReservation(RESERVATION_KEY, 'order_1', 'admin_1', asTx(prisma)),
      ).resolves.toBe(1);

      expect(prisma.stockMovement.create).toHaveBeenCalledWith(
        expect.objectContaining({
          data: expect.objectContaining({
            type: 'RETURN_RESTOCK',
            referenceType: 'ORDER_CANCELLATION',
            referenceId: 'order_1',
          }),
        }),
      );
    });
  });

  describe('expireStockReservation', () => {
    it('releases stock and marks reservation as EXPIRED', async () => {
      prisma.stockReservation.findUnique.mockResolvedValue({
        id: 'res_1',
        quantity: 1,
        warehouseId: WAREHOUSE_ID,
        variantId: VARIANT_ID,
        status: 'RESERVED',
      });
      prisma.$executeRaw.mockResolvedValue(1);
      prisma.stockReservation.updateMany.mockResolvedValue({ count: 1 });

      await service.expireStockReservation('res_1', asTx(prisma));

      expect(prisma.$executeRaw).toHaveBeenCalledTimes(1);
      expect(prisma.stockReservation.updateMany).toHaveBeenCalledWith(
        expect.objectContaining({
          where: expect.objectContaining({ status: 'RESERVED' }),
          data: { status: 'EXPIRED' },
        }),
      );
    });

    it('is a no-op when reservation is already in a terminal status', async () => {
      prisma.stockReservation.findUnique.mockResolvedValue({ id: 'res_1', status: 'REDEEMED' });

      await service.expireStockReservation('res_1', asTx(prisma));

      expect(prisma.$executeRaw).not.toHaveBeenCalled();
    });

    it('is a no-op when reservation does not exist', async () => {
      prisma.stockReservation.findUnique.mockResolvedValue(null);

      await service.expireStockReservation('res_999', asTx(prisma));

      expect(prisma.$executeRaw).not.toHaveBeenCalled();
    });
  });
});
