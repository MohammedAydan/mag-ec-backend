import {
  BadRequestException,
  NotImplementedException,
  ServiceUnavailableException,
} from '@nestjs/common';

import { RefundService } from './refund.service';

describe('RefundService', () => {
  const paymentGatewayService = { createRefund: jest.fn() };
  const orderOutboxService = { emitStatusChanged: jest.fn(), emitEvent: jest.fn() };
  const tx = {
    $queryRaw: jest.fn(),
    order: { findUnique: jest.fn(), findUniqueOrThrow: jest.fn(), update: jest.fn() },
    refund: {
      create: jest.fn(),
      findUniqueOrThrow: jest.fn(),
      update: jest.fn(),
      updateMany: jest.fn(),
      aggregate: jest.fn(),
    },
    returnRequest: { updateMany: jest.fn() },
    auditLog: { create: jest.fn() },
  };
  const prismaTransactionService = {
    runInTransaction: jest.fn(async (callback: (input: typeof tx) => Promise<unknown>) =>
      callback(tx),
    ),
  };
  let service: RefundService;

  beforeEach(() => {
    jest.clearAllMocks();
    service = new RefundService(
      { refund: { update: jest.fn() } } as never,
      prismaTransactionService as never,
      paymentGatewayService as never,
      orderOutboxService as never,
    );
  });

  it('locks the order, submits an idempotent Stripe refund and marks a partial refund successful', async () => {
    tx.order.findUnique.mockResolvedValue({
      id: 'order_1',
      grandTotalAmount: 1000,
      currencyCode: 'USD',
      paymentStatus: 'PAID',
      paymentAttempts: [{ id: 'attempt_1', provider: 'STRIPE', providerPaymentId: 'pi_1' }],
      refunds: [],
    });
    tx.refund.create.mockResolvedValue({
      id: 'refund_1',
      orderId: 'order_1',
      amount: 300,
      currencyCode: 'USD',
      returnRequestId: null,
    });
    paymentGatewayService.createRefund.mockResolvedValue({
      providerRefundId: 're_1',
      providerReference: 'ch_1',
      rawStatus: 'succeeded',
    });
    tx.refund.updateMany.mockResolvedValue({ count: 1 });
    tx.refund.findUniqueOrThrow.mockResolvedValue({
      id: 'refund_1',
      orderId: 'order_1',
      amount: 300,
      currencyCode: 'USD',
      returnRequestId: null,
      status: 'SUCCEEDED',
      providerRefundId: 're_1',
    });
    tx.order.findUniqueOrThrow.mockResolvedValue({ id: 'order_1', grandTotalAmount: 1000 });
    tx.refund.aggregate.mockResolvedValue({ _sum: { amount: 300 } });
    tx.order.update.mockResolvedValue({ id: 'order_1', paymentStatus: 'PARTIALLY_REFUNDED' });

    await expect(service.executeRefund({ orderId: 'order_1', amount: 300 })).resolves.toMatchObject(
      { id: 'refund_1' },
    );
    expect(tx.$queryRaw).toHaveBeenCalled();
    expect(paymentGatewayService.createRefund).toHaveBeenCalledWith(
      expect.objectContaining({
        providerPaymentId: 'pi_1',
        amount: 300,
        idempotencyKey: 'refund:refund_1',
      }),
    );
    expect(tx.refund.updateMany).toHaveBeenCalledWith(
      expect.objectContaining({ where: { id: 'refund_1', status: { not: 'SUCCEEDED' } } }),
    );
    expect(tx.order.update).toHaveBeenCalledWith({
      where: { id: 'order_1' },
      data: { paymentStatus: 'PARTIALLY_REFUNDED' },
    });
  });

  it('rejects a refund exceeding the remaining balance before calling Stripe', async () => {
    tx.order.findUnique.mockResolvedValue({
      id: 'order_2',
      grandTotalAmount: 1000,
      currencyCode: 'USD',
      paymentStatus: 'PAID',
      paymentAttempts: [{ id: 'attempt_2', provider: 'STRIPE', providerPaymentId: 'pi_2' }],
      refunds: [{ amount: 900 }],
    });
    await expect(service.executeRefund({ orderId: 'order_2', amount: 200 })).rejects.toThrow(
      BadRequestException,
    );
    expect(paymentGatewayService.createRefund).not.toHaveBeenCalled();
  });

  it('rejects automatic refunds for non-Stripe captured orders', async () => {
    tx.order.findUnique.mockResolvedValue({
      id: 'order_3',
      grandTotalAmount: 1000,
      currencyCode: 'USD',
      paymentStatus: 'PAID',
      paymentAttempts: [{ id: 'attempt_3', provider: 'COD', providerPaymentId: null }],
      refunds: [],
    });
    await expect(service.executeRefund({ orderId: 'order_3', amount: 100 })).rejects.toThrow(
      NotImplementedException,
    );
  });
  it('keeps a provider-timeout refund reserved for reconciliation instead of allowing over-refunds', async () => {
    tx.order.findUnique.mockResolvedValue({
      id: 'order_4',
      grandTotalAmount: 1000,
      currencyCode: 'USD',
      paymentStatus: 'PAID',
      paymentAttempts: [{ id: 'attempt_4', provider: 'STRIPE', providerPaymentId: 'pi_4' }],
      refunds: [],
    });
    tx.refund.create.mockResolvedValue({
      id: 'refund_4',
      orderId: 'order_4',
      amount: 100,
      currencyCode: 'USD',
    });
    paymentGatewayService.createRefund.mockRejectedValue(new Error('provider timeout'));
    tx.refund.update.mockResolvedValue({});
    tx.auditLog.create.mockResolvedValue({});

    await expect(service.executeRefund({ orderId: 'order_4', amount: 100 })).rejects.toThrow(
      ServiceUnavailableException,
    );
    expect(tx.refund.update).toHaveBeenCalledWith(
      expect.objectContaining({
        where: { id: 'refund_4' },
        data: expect.objectContaining({ status: 'PENDING' }),
      }),
    );
  });
});
