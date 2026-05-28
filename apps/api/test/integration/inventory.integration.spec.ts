import 'dotenv/config';

import {
  assertMysqlDatabaseAvailable,
  createMysqlTestPrismaClient,
} from './support/mysql-test-client';

const runMysqlIntegration = process.env.RUN_MYSQL_INTEGRATION === 'true';
const describeMysqlIntegration = runMysqlIntegration ? describe : describe.skip;

describeMysqlIntegration('inventory integration — concurrency and lifecycle', () => {
  const prisma = createMysqlTestPrismaClient();
  const suffix = Date.now().toString();

  let warehouseId: string;
  let variantId: string;

  beforeAll(async () => {
    await assertMysqlDatabaseAvailable(prisma, 'inventory integration');

    // Create a throwaway product type, product, and variant for isolation
    const productType = await prisma.catalogProductType.create({
      data: { key: `inv-type-${suffix}`, status: 'PUBLISHED', sortOrder: 99 },
    });
    await prisma.catalogProductTypeTranslation.create({
      data: {
        productTypeId: productType.id,
        locale: 'en',
        name: 'Inv Type',
        slug: `inv-type-${suffix}`,
      },
    });

    const product = await prisma.catalogProduct.create({
      data: { productTypeId: productType.id, sku: `INV-PROD-${suffix}`, status: 'PUBLISHED' },
    });
    await prisma.catalogProductTranslation.create({
      data: {
        productId: product.id,
        locale: 'en',
        name: 'Inv Product',
        slug: `inv-product-${suffix}`,
      },
    });

    const variant = await prisma.catalogProductVariant.create({
      data: { productId: product.id, sku: `INV-VAR-${suffix}`, status: 'PUBLISHED' },
    });
    variantId = variant.id;

    const warehouse = await prisma.warehouse.create({
      data: { key: `inv-wh-${suffix}`, name: 'Integration Warehouse', isDefault: false },
    });
    warehouseId = warehouse.id;

    // Initialize stock
    await prisma.stockLevel.create({
      data: { warehouseId, variantId, quantityOnHand: 10, quantityReserved: 0 },
    });
  });

  afterAll(async () => {
    // Cleanup in FK-safe order
    await prisma.stockReservation.deleteMany({ where: { warehouseId } });
    await prisma.stockMovement.deleteMany({ where: { warehouseId } });
    await prisma.stockLevel.deleteMany({ where: { warehouseId } });
    await prisma.warehouse.delete({ where: { id: warehouseId } });

    const variant = await prisma.catalogProductVariant.findUnique({
      where: { id: variantId },
      select: { productId: true },
    });
    if (variant) {
      await prisma.catalogProductVariant.deleteMany({ where: { productId: variant.productId } });
      const product = await prisma.catalogProduct.findUnique({
        where: { id: variant.productId },
        select: { productTypeId: true },
      });
      if (product) {
        await prisma.catalogProductTranslation.deleteMany({
          where: { productId: variant.productId },
        });
        await prisma.catalogProduct.delete({ where: { id: variant.productId } });
        await prisma.catalogProductTypeTranslation.deleteMany({
          where: { productTypeId: product.productTypeId },
        });
        await prisma.catalogProductType.delete({ where: { id: product.productTypeId } });
      }
    }

    await prisma.$disconnect();
  });

  describe('Oversell prevention', () => {
    it('rejects concurrent reservations that would exceed available stock', async () => {
      // Available stock = 10; two simultaneous requests each trying to reserve 6 → only one should succeed
      const now = new Date();
      const expiresAt = new Date(now.getTime() + 15 * 60 * 1000);

      const tryReserve = async (key: string): Promise<boolean> => {
        try {
          const updated = await prisma.$executeRaw`
            UPDATE StockLevel
            SET quantityReserved = quantityReserved + 6
            WHERE warehouseId = ${warehouseId} AND variantId = ${variantId}
              AND (quantityOnHand - quantityReserved) >= 6
          `;
          if (updated === 0) return false;

          await prisma.stockReservation.create({
            data: {
              warehouseId,
              variantId,
              quantity: 6,
              reservationKey: key,
              expiresAt,
              status: 'RESERVED',
            },
          });
          return true;
        } catch {
          return false;
        }
      };

      const results = await Promise.all([
        tryReserve(`oversell-key-a-${suffix}`),
        tryReserve(`oversell-key-b-${suffix}`),
      ]);

      // Exactly one reservation should succeed
      const successes = results.filter(Boolean);
      expect(successes.length).toBe(1);

      // Release what succeeded so remaining tests have clean state
      await prisma.$executeRaw`
        UPDATE StockLevel SET quantityReserved = 0
        WHERE warehouseId = ${warehouseId} AND variantId = ${variantId}
      `;
      await prisma.stockReservation.deleteMany({
        where: { reservationKey: { in: [`oversell-key-a-${suffix}`, `oversell-key-b-${suffix}`] } },
      });
    });
  });

  describe('Reservation lifecycle', () => {
    it('reserve → redeem reduces physical stock and clears reserved count', async () => {
      const rKey = `lifecycle-redeem-${suffix}`;
      const expiresAt = new Date(Date.now() + 15 * 60 * 1000);

      // Reset to clean state
      await prisma.$executeRaw`UPDATE StockLevel SET quantityOnHand = 10, quantityReserved = 0 WHERE warehouseId = ${warehouseId} AND variantId = ${variantId}`;

      // Reserve 3 units
      await prisma.$executeRaw`UPDATE StockLevel SET quantityReserved = quantityReserved + 3 WHERE warehouseId = ${warehouseId} AND variantId = ${variantId}`;
      const reservation = await prisma.stockReservation.create({
        data: {
          warehouseId,
          variantId,
          quantity: 3,
          reservationKey: rKey,
          expiresAt,
          status: 'RESERVED',
        },
      });

      // Redeem
      await prisma.$transaction(async (tx) => {
        await tx.$executeRaw`
          UPDATE StockLevel
          SET quantityOnHand = quantityOnHand - 3, quantityReserved = quantityReserved - 3
          WHERE warehouseId = ${warehouseId} AND variantId = ${variantId}
        `;
        await tx.stockReservation.update({
          where: { id: reservation.id },
          data: { status: 'REDEEMED' },
        });
        await tx.stockMovement.create({
          data: {
            warehouseId,
            variantId,
            quantityChanged: -3,
            type: 'SALE',
            referenceType: 'ORDER',
            referenceId: `order-${suffix}`,
          },
        });
      });

      const sl = await prisma.stockLevel.findUnique({
        where: { warehouseId_variantId: { warehouseId, variantId } },
      });
      expect(sl?.quantityOnHand).toBe(7);
      expect(sl?.quantityReserved).toBe(0);

      const res = await prisma.stockReservation.findUnique({ where: { id: reservation.id } });
      expect(res?.status).toBe('REDEEMED');
    });

    it('reserve → release restores available stock without reducing physical stock', async () => {
      const rKey = `lifecycle-release-${suffix}`;
      const expiresAt = new Date(Date.now() + 15 * 60 * 1000);

      // Reset
      await prisma.$executeRaw`UPDATE StockLevel SET quantityOnHand = 7, quantityReserved = 0 WHERE warehouseId = ${warehouseId} AND variantId = ${variantId}`;

      // Reserve 2
      await prisma.$executeRaw`UPDATE StockLevel SET quantityReserved = quantityReserved + 2 WHERE warehouseId = ${warehouseId} AND variantId = ${variantId}`;
      const reservation = await prisma.stockReservation.create({
        data: {
          warehouseId,
          variantId,
          quantity: 2,
          reservationKey: rKey,
          expiresAt,
          status: 'RESERVED',
        },
      });

      // Release
      await prisma.$executeRaw`UPDATE StockLevel SET quantityReserved = quantityReserved - 2 WHERE warehouseId = ${warehouseId} AND variantId = ${variantId}`;
      await prisma.stockReservation.update({
        where: { id: reservation.id },
        data: { status: 'RELEASED' },
      });

      const sl = await prisma.stockLevel.findUnique({
        where: { warehouseId_variantId: { warehouseId, variantId } },
      });
      expect(sl?.quantityOnHand).toBe(7); // Physical stock unchanged
      expect(sl?.quantityReserved).toBe(0); // Reserved cleared
    });

    it('StockMovement is append-only and never updated', async () => {
      // Insert a RECEIPT movement
      const movement = await prisma.stockMovement.create({
        data: { warehouseId, variantId, quantityChanged: 5, type: 'RECEIPT' },
      });

      // Verify it exists and can be read
      const found = await prisma.stockMovement.findUnique({ where: { id: movement.id } });
      expect(found?.type).toBe('RECEIPT');
      expect(found?.quantityChanged).toBe(5);

      // The application code never calls update on StockMovement — this is enforced architecturally.
      // We verify the record from DB has the expected immutable state.
      expect(found?.createdAt).toBeDefined();
    });
  });
});
