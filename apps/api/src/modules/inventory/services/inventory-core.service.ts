import {
  Inject,
  Injectable,
  BadRequestException,
  InternalServerErrorException,
  Logger,
} from '@nestjs/common';
import type { Prisma, StockLevel, StockMovement } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';
import { TaskDispatcherService } from '../../queue/task-dispatcher.service';

@Injectable()
export class InventoryCoreService {
  private readonly logger = new Logger(InventoryCoreService.name);

  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(TaskDispatcherService) private readonly taskDispatcher: TaskDispatcherService,
  ) {}

  /**
   * Adjusts the stock level of a variant in a warehouse.
   * Creates an append-only StockMovement log record.
   */
  async adjustStock(
    warehouseId: string,
    variantId: string,
    quantityChanged: number,
    type: 'RECEIPT' | 'ADJUSTMENT' | 'SALE' | 'RETURN_RESTOCK' | 'WASTE',
    referenceType?: string,
    referenceId?: string,
    actorUserId?: string,
    metadata?: Record<string, unknown>,
    tx?: Prisma.TransactionClient,
  ): Promise<{ stockLevel: StockLevel; movement: StockMovement }> {
    if (!tx) {
      return this.prisma.$transaction(
        async (transaction): Promise<{ stockLevel: StockLevel; movement: StockMovement }> =>
          this.adjustStock(
            warehouseId,
            variantId,
            quantityChanged,
            type,
            referenceType,
            referenceId,
            actorUserId,
            metadata,
            transaction,
          ),
      );
    }

    // 1. Verify variant exists
    const variant = await tx.catalogProductVariant.findUnique({
      where: { id: variantId },
    });
    if (!variant) {
      throw new BadRequestException(`Variant with ID "${variantId}" not found.`);
    }

    // 2. Verify warehouse exists
    const warehouse = await tx.warehouse.findUnique({
      where: { id: warehouseId },
    });
    if (!warehouse) {
      throw new BadRequestException(`Warehouse with ID "${warehouseId}" not found.`);
    }

    // 3. Ensure the stock row exists, then update it atomically. An admin
    // adjustment must not lose a concurrent receipt, cancellation, or sale.
    await tx.stockLevel.upsert({
      where: {
        warehouseId_variantId: { warehouseId, variantId },
      },
      update: {},
      create: {
        warehouseId,
        variantId,
        quantityOnHand: 0,
        quantityReserved: 0,
      },
    });

    const updatedCount = await tx.$executeRaw`
      UPDATE StockLevel
      SET quantityOnHand = quantityOnHand + ${quantityChanged}
      WHERE warehouseId = ${warehouseId}
        AND variantId = ${variantId}
        AND quantityOnHand + ${quantityChanged} >= 0
    `;

    if (Number(updatedCount) !== 1) {
      throw new BadRequestException(
        `Insufficient physical stock: Cannot apply adjustment of ${quantityChanged} units for variant "${variant.sku}".`,
      );
    }

    const updatedStockLevel = await tx.stockLevel.findUniqueOrThrow({
      where: {
        warehouseId_variantId: { warehouseId, variantId },
      },
    });

    // 5. Write to StockMovement
    const movement = await tx.stockMovement.create({
      data: {
        warehouseId,
        variantId,
        quantityChanged,
        type,
        referenceType,
        referenceId,
        metadata: metadata ? (metadata as Prisma.InputJsonValue) : undefined,
        actorUserId,
      },
    });

    // 6. Low stock check
    const available = updatedStockLevel.quantityOnHand - updatedStockLevel.quantityReserved;
    if (available < 10) {
      this.logWarning(
        {
          warehouseId,
          variantId,
          sku: variant.sku,
          quantityOnHand: updatedStockLevel.quantityOnHand,
          quantityReserved: updatedStockLevel.quantityReserved,
          available,
        },
        `Low stock warning for variant "${variant.sku}". Available stock is ${available}.`,
      );
    }

    return {
      stockLevel: updatedStockLevel,
      movement,
    };
  }

  /**
   * Thread-safe stock reservation.
   * Returns the created reservation or throws BadRequestException if stock is unavailable.
   */
  async reserveStock(
    warehouseId: string,
    variantId: string,
    quantity: number,
    reservationKey: string,
    expiresAt: Date,
    userId?: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    if (quantity <= 0) {
      throw new BadRequestException('Reservation quantity must be greater than zero.');
    }

    // Check if variant exists
    const variant = await tx.catalogProductVariant.findUnique({
      where: { id: variantId },
    });
    if (!variant) {
      throw new BadRequestException(`Variant with ID "${variantId}" not found.`);
    }

    // Ensure StockLevel record exists for the variant
    const stockLevel = await tx.stockLevel.findUnique({
      where: {
        warehouseId_variantId: { warehouseId, variantId },
      },
    });

    if (!stockLevel) {
      throw new BadRequestException(
        `No stock level initialized for variant "${variant.sku}" in warehouse "${warehouseId}".`,
      );
    }

    // Perform atomic update to reserve stock (concurrency protection)
    const updatedCount = await tx.$executeRaw`
      UPDATE StockLevel
      SET quantityReserved = quantityReserved + ${quantity}
      WHERE warehouseId = ${warehouseId} AND variantId = ${variantId} AND (quantityOnHand - quantityReserved) >= ${quantity}
    `;

    if (updatedCount === 0) {
      const available = stockLevel.quantityOnHand - stockLevel.quantityReserved;
      throw new BadRequestException(
        `Insufficient stock for variant "${variant.sku}": requested ${quantity}, but only ${available} is available.`,
      );
    }

    // Create reservation record
    const reservation = await tx.stockReservation.create({
      data: {
        warehouseId,
        variantId,
        quantity,
        reservationKey,
        userId,
        expiresAt,
        status: 'RESERVED',
      },
    });

    // Queue mode schedules a delayed job; direct mode releases expired reservations via
    // the synchronous maintenance runner before/after mutating requests and via cron.
    const scheduled = await this.taskDispatcher.scheduleReservationExpiry(
      reservation.id,
      expiresAt,
    );
    if (scheduled) {
      this.logInfo({ reservationId: reservation.id }, 'Enqueued reservation expiry job.');
    }

    return reservation;
  }

  /**
   * Releases stock reservation back to available stock.
   */
  async releaseStockReservation(
    reservationKey: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    const reservations = await tx.stockReservation.findMany({
      where: { reservationKey, status: 'RESERVED' },
    });

    for (const reservation of reservations) {
      const claimed = await tx.stockReservation.updateMany({
        where: { id: reservation.id, status: 'RESERVED' },
        data: { status: 'RELEASED' },
      });

      if (claimed.count === 0) {
        continue;
      }

      const updatedCount = await tx.$executeRaw`
        UPDATE StockLevel
        SET quantityReserved = quantityReserved - ${reservation.quantity}
        WHERE warehouseId = ${reservation.warehouseId}
          AND variantId = ${reservation.variantId}
          AND quantityReserved >= ${reservation.quantity}
      `;

      if (Number(updatedCount) !== 1) {
        throw new InternalServerErrorException(
          'Inventory reservation invariant violation during release.',
        );
      }

      this.logInfo(
        { reservationId: reservation.id, reservationKey },
        'Released stock reservation.',
      );
    }
  }

  /**
   * Redeems a stock reservation (physically deducts stock and resolves reservation).
   */
  async redeemStockReservation(
    reservationKey: string,
    referenceId: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    let redeemedCount = 0;
    const reservations = await tx.stockReservation.findMany({
      where: { reservationKey, status: 'RESERVED' },
    });

    for (const reservation of reservations) {
      const claimed = await tx.stockReservation.updateMany({
        where: { id: reservation.id, status: 'RESERVED' },
        data: { status: 'REDEEMED' },
      });

      if (claimed.count === 0) {
        continue;
      }

      redeemedCount += 1;

      // Physically deduct stock only for the transaction that claimed this reservation.
      const updatedCount = await tx.$executeRaw`
        UPDATE StockLevel
        SET quantityOnHand = quantityOnHand - ${reservation.quantity},
            quantityReserved = quantityReserved - ${reservation.quantity}
        WHERE warehouseId = ${reservation.warehouseId}
          AND variantId = ${reservation.variantId}
          AND quantityOnHand >= ${reservation.quantity}
          AND quantityReserved >= ${reservation.quantity}
      `;

      if (Number(updatedCount) !== 1) {
        throw new InternalServerErrorException(
          'Inventory reservation invariant violation during redemption.',
        );
      }

      // Write StockMovement (SALE)
      await tx.stockMovement.create({
        data: {
          warehouseId: reservation.warehouseId,
          variantId: reservation.variantId,
          quantityChanged: -reservation.quantity,
          type: 'SALE',
          referenceType: 'ORDER',
          referenceId,
        },
      });

      this.logInfo(
        { reservationId: reservation.id, reservationKey, orderId: referenceId },
        'Redeemed stock reservation for order.',
      );
    }

    return redeemedCount;
  }

  /**
   * Restocks inventory already redeemed for an order that is cancelled before fulfillment.
   * Each redeemed reservation may be restored exactly once.
   */
  async restockRedeemedReservation(
    reservationKey: string,
    referenceId: string,
    actorUserId?: string,
    tx: Prisma.TransactionClient = this.prisma,
  ) {
    let restockedCount = 0;
    const reservations = await tx.stockReservation.findMany({
      where: { reservationKey, status: 'REDEEMED' },
    });

    for (const reservation of reservations) {
      const claimed = await tx.stockReservation.updateMany({
        where: { id: reservation.id, status: 'REDEEMED' },
        data: { status: 'RELEASED' },
      });
      if (claimed.count === 0) {
        continue;
      }

      const updatedCount = await tx.$executeRaw`
        UPDATE StockLevel
        SET quantityOnHand = quantityOnHand + ${reservation.quantity}
        WHERE warehouseId = ${reservation.warehouseId}
          AND variantId = ${reservation.variantId}
      `;
      if (Number(updatedCount) !== 1) {
        throw new InternalServerErrorException(
          'Inventory reservation invariant violation during cancellation restock.',
        );
      }

      await tx.stockMovement.create({
        data: {
          warehouseId: reservation.warehouseId,
          variantId: reservation.variantId,
          quantityChanged: reservation.quantity,
          type: 'RETURN_RESTOCK',
          referenceType: 'ORDER_CANCELLATION',
          referenceId,
          actorUserId,
          metadata: { reservationId: reservation.id },
        },
      });
      restockedCount += 1;
    }

    return restockedCount;
  }

  /**
   * Expires a single reservation if it is still in RESERVED status.
   */
  async expireStockReservation(reservationId: string, tx: Prisma.TransactionClient = this.prisma) {
    const reservation = await tx.stockReservation.findUnique({
      where: { id: reservationId },
    });

    if (!reservation || reservation.status !== 'RESERVED') {
      return;
    }

    const claimed = await tx.stockReservation.updateMany({
      where: { id: reservationId, status: 'RESERVED' },
      data: { status: 'EXPIRED' },
    });

    if (claimed.count === 0) {
      return;
    }

    const updatedCount = await tx.$executeRaw`
      UPDATE StockLevel
      SET quantityReserved = quantityReserved - ${reservation.quantity}
      WHERE warehouseId = ${reservation.warehouseId}
        AND variantId = ${reservation.variantId}
        AND quantityReserved >= ${reservation.quantity}
    `;

    if (Number(updatedCount) !== 1) {
      throw new InternalServerErrorException(
        'Inventory reservation invariant violation during expiry.',
      );
    }

    this.logInfo({ reservationId }, 'Expired stock reservation.');
  }

  private logInfo(payload: Record<string, unknown>, message: string) {
    this.logger.log(`${message} ${JSON.stringify(payload)}`);
  }

  private logWarning(payload: Record<string, unknown>, message: string) {
    this.logger.warn(`${message} ${JSON.stringify(payload)}`);
  }
}
