import { BadRequestException, ForbiddenException } from '@nestjs/common';

import { OrderCancellationService } from './order-cancellation.service';

describe('OrderCancellationService', () => {
  const baseOrder = {
    id: 'order_1',
    userId: 'user_1',
    status: 'PLACED',
    paymentStatus: 'PENDING',
    paymentMethod: 'CASH_ON_DELIVERY',
    fulfillmentStatus: 'UNFULFILLED',
    reservationKey: 'reservation_1',
    paymentAttempts: [],
    shipments: [],
  };
  const tx = {
    $queryRaw: jest.fn(),
    order: { findUnique: jest.fn(), update: jest.fn() },
    paymentAttempt: { updateMany: jest.fn() },
    auditLog: { create: jest.fn() },
  };
  const prisma = { order: { findUnique: jest.fn() } };
  const transactions = {
    runInTransaction: jest.fn((callback: (trx: typeof tx) => unknown) => callback(tx)),
  };
  const inventory = { restockRedeemedReservation: jest.fn(), releaseStockReservation: jest.fn() };
  const outbox = { emitStatusChanged: jest.fn(), emitEvent: jest.fn() };
  const orders = { getSerializedOrderById: jest.fn() };
  const gateway = { cancelOnlinePayment: jest.fn() };
  let service: OrderCancellationService;

  beforeEach(() => {
    jest.clearAllMocks();
    service = new OrderCancellationService(
      prisma as never,
      transactions as never,
      inventory as never,
      outbox as never,
      orders as never,
      gateway as never,
    );
    prisma.order.findUnique.mockResolvedValue(baseOrder);
    tx.order.findUnique.mockResolvedValue(baseOrder);
    tx.order.update.mockResolvedValue({
      ...baseOrder,
      status: 'CANCELLED',
      paymentStatus: 'VOIDED',
    });
    orders.getSerializedOrderById.mockResolvedValue({ id: baseOrder.id, status: 'CANCELLED' });
  });

  it('restocks a cancelled unpaid COD order exactly through its redeemed reservations', async () => {
    await expect(
      service.cancelCustomerOrder('order_1', 'user_1', 'changed mind'),
    ).resolves.toMatchObject({
      status: 'CANCELLED',
    });
    expect(inventory.restockRedeemedReservation).toHaveBeenCalledWith(
      'reservation_1',
      'order_1',
      'user_1',
      tx,
    );
    expect(outbox.emitEvent).toHaveBeenCalledWith(
      expect.objectContaining({ eventType: 'order.cancelled' }),
      tx,
    );
  });

  it('cancels Stripe before releasing an unpaid online reservation', async () => {
    const onlineOrder = {
      ...baseOrder,
      paymentMethod: 'STRIPE_CARD',
      paymentAttempts: [{ id: 'attempt_1', providerPaymentId: 'pi_1' }],
    };
    prisma.order.findUnique.mockResolvedValue(onlineOrder);
    tx.order.findUnique.mockResolvedValue(onlineOrder);
    gateway.cancelOnlinePayment.mockResolvedValue({ status: 'cancelled' });

    await service.cancelCustomerOrder('order_1', 'user_1');
    expect(gateway.cancelOnlinePayment).toHaveBeenCalledWith('pi_1');
    expect(inventory.releaseStockReservation).toHaveBeenCalledWith('reservation_1', tx);
  });

  it('rejects another customer and rejects captured payments', async () => {
    await expect(service.cancelCustomerOrder('order_1', 'user_2')).rejects.toThrow(
      ForbiddenException,
    );
    prisma.order.findUnique.mockResolvedValue({ ...baseOrder, paymentStatus: 'PAID' });
    await expect(service.cancelCustomerOrder('order_1', 'user_1')).rejects.toThrow(
      BadRequestException,
    );
  });
});
