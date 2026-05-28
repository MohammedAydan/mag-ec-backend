import { Processor, WorkerHost } from '@nestjs/bullmq';
import type { Job } from 'bullmq';
import { PinoLogger } from 'nestjs-pino';

import { PrismaService } from '../persistence/prisma.service';
import { StripePaymentLifecycleService } from '../payments/stripe-payment-lifecycle.service';

const INVENTORY_EXPIRY_QUEUE = 'inventory-expiry';

interface ExpireReservationJobData {
  reservationId: string;
}

@Processor(INVENTORY_EXPIRY_QUEUE)
export class InventoryExpiryProcessor extends WorkerHost {
  constructor(
    private readonly prisma: PrismaService,
    private readonly logger: PinoLogger,
    private readonly stripePaymentLifecycleService: StripePaymentLifecycleService,
  ) {
    super();
  }

  async process(job: Job<ExpireReservationJobData>): Promise<void> {
    const { reservationId } = job.data;

    if (!reservationId) {
      this.logger.logger.warn(
        { jobId: job.id },
        'Inventory expiry job missing reservationId — skipping.',
      );
      return;
    }

    this.logger.logger.info(
      { jobId: job.id, reservationId },
      'Processing inventory reservation expiry.',
    );

    const reservation = await this.prisma.stockReservation.findUnique({
      where: { id: reservationId },
    });

    if (!reservation) {
      this.logger.logger.warn({ reservationId }, 'Reservation not found — skipping expiry.');
      return;
    }

    if (reservation.status !== 'RESERVED') {
      this.logger.logger.info(
        { reservationId, status: reservation.status },
        'Reservation is not in RESERVED status — no expiry needed.',
      );
      return;
    }

    if (reservation.expiresAt > new Date()) {
      this.logger.logger.info(
        { reservationId, expiresAt: reservation.expiresAt },
        'Reservation has not yet expired — skipping.',
      );
      return;
    }

    const stripeOrder = await this.prisma.order.findFirst({
      where: {
        reservationKey: reservation.reservationKey,
        paymentMethod: 'STRIPE_CARD',
        paymentStatus: 'PENDING',
      },
      include: {
        paymentAttempts: {
          where: { provider: 'STRIPE', status: { in: ['PROCESSING', 'AWAITING_CUSTOMER_ACTION'] } },
          orderBy: [{ createdAt: 'desc' }],
          take: 1,
        },
      },
    });

    const activeAttempt = stripeOrder?.paymentAttempts[0];
    if (activeAttempt?.providerPaymentId) {
      const cancellationResult =
        await this.stripePaymentLifecycleService.cancelUncapturedPaymentIntent(
          activeAttempt.providerPaymentId,
        );
      if (cancellationResult === 'captured') {
        if (!stripeOrder) {
          throw new Error('Stripe order disappeared during reservation expiry.');
        }
        this.logger.logger.error(
          { reservationId, orderId: stripeOrder.id, paymentAttemptId: activeAttempt.id },
          'Cannot release inventory because the Stripe payment is captured; awaiting webhook reconciliation.',
        );
        throw new Error(
          'Captured Stripe payment requires webhook reconciliation before reservation expiry.',
        );
      }
    }

    const expired = await this.prisma.$transaction(async (tx) => {
      const claimed = await tx.stockReservation.updateMany({
        where: { id: reservationId, status: 'RESERVED' },
        data: { status: 'EXPIRED' },
      });

      if (claimed.count === 0) {
        return false;
      }

      const updatedCount = await tx.$executeRaw`
        UPDATE StockLevel
        SET quantityReserved = quantityReserved - ${reservation.quantity}
        WHERE warehouseId = ${reservation.warehouseId}
          AND variantId = ${reservation.variantId}
          AND quantityReserved >= ${reservation.quantity}
      `;

      if (Number(updatedCount) !== 1) {
        throw new Error('Inventory reservation invariant violation during worker expiry.');
      }

      if (stripeOrder) {
        await tx.paymentAttempt.updateMany({
          where: {
            orderId: stripeOrder.id,
            status: { in: ['PROCESSING', 'AWAITING_CUSTOMER_ACTION'] },
          },
          data: { status: 'CANCELLED' },
        });
        const voided = await tx.order.updateMany({
          where: { id: stripeOrder.id, paymentStatus: 'PENDING' },
          data: { status: 'CANCELLED', paymentStatus: 'VOIDED' },
        });
        if (voided.count === 1) {
          await tx.outboxEvent.upsert({
            where: { deduplicationKey: `order.payment.expired:${stripeOrder.id}` },
            update: {},
            create: {
              aggregateType: 'ORDER',
              aggregateId: stripeOrder.id,
              eventType: 'order.payment.expired',
              deduplicationKey: `order.payment.expired:${stripeOrder.id}`,
              payload: { orderId: stripeOrder.id, paymentStatus: 'VOIDED' },
            },
          });
        }
      }

      return true;
    });

    if (!expired) {
      this.logger.logger.info(
        { reservationId },
        'Reservation expiry was already claimed by another worker or request.',
      );
      return;
    }

    this.logger.logger.info(
      { reservationId, quantity: reservation.quantity, variantId: reservation.variantId },
      'Stock reservation expired and stock released.',
    );
  }
}
