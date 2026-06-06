import {
  BadRequestException,
  NotImplementedException,
  ServiceUnavailableException,
} from '@nestjs/common';

import { RefundService } from './refund.service';

describe('RefundService', () => {
  const paymentGatewayService = { createRefund: jest.fn() };
  const orderOutboxService = { emitStatusChanged: jest.fn(), emitEvent: jest.fn() };
  const servicePrisma = { refund: { update: jest.fn() }, auditLog: { create: jest.fn() } };
  const tx = {
    $queryRaw: jest.fn(),
    order: { findUnique: jest.fn(), findUniqueOrThrow: jest.fn(), update: jest.fn() },
    refund: {
      create: jest.fn(),
      findUnique: jest.fn(),
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
      servicePrisma as never,
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

  it('rejects webhook refund reconciliation when the Stripe payment intent differs from the refund payment attempt (SEC-013)', async () => {
    tx.refund.findUnique.mockResolvedValue({
      id: 'refund_sec013',
      orderId: 'order_sec013',
      providerRefundId: 're_evil',
      amount: 500,
      currencyCode: 'USD',
      returnRequestId: null,
      status: 'PENDING',
      paymentAttempt: {
        id: 'attempt_sec013',
        providerPaymentId: 'pi_legit',
      },
    });

    const event = {
      provider: 'STRIPE' as const,
      externalEventId: 'evt_sec013',
      eventType: 'refund.updated',
      status: 'RECEIVED' as const,
      providerPaymentId: 'pi_evil',
      providerRefundId: 're_evil',
      providerObjectStatus: 'succeeded',
      metadata: { refundId: 'refund_sec013' },
      payload: {},
    };

    await expect(service.reconcileProviderRefund(event, tx as never)).rejects.toThrow(BadRequestException);
    expect(tx.refund.updateMany).not.toHaveBeenCalled();
    expect(servicePrisma.auditLog.create).toHaveBeenCalledWith({
      data: expect.objectContaining({
        category: 'SECURITY',
        action: 'refund.pi_ownership_mismatch',
        entityType: 'Refund',
        entityId: 'refund_sec013',
      }),
    });
  });

  it('succeeds in webhook refund reconciliation when the Stripe payment intent matches the refund payment attempt (SEC-013)', async () => {
    tx.refund.findUnique.mockResolvedValue({
      id: 'refund_sec013_ok',
      orderId: 'order_sec013_ok',
      providerRefundId: 're_match',
      amount: 500,
      currencyCode: 'USD',
      returnRequestId: null,
      status: 'PENDING',
      paymentAttempt: {
        id: 'attempt_sec013_ok',
        providerPaymentId: 'pi_legit',
      },
    });
    tx.refund.updateMany.mockResolvedValue({ count: 1 });
    tx.refund.findUniqueOrThrow.mockResolvedValue({
      id: 'refund_sec013_ok',
      orderId: 'order_sec013_ok',
      amount: 500,
      currencyCode: 'USD',
      returnRequestId: null,
      status: 'SUCCEEDED',
      providerRefundId: 're_match',
    });
    tx.order.findUniqueOrThrow.mockResolvedValue({
      id: 'order_sec013_ok',
      grandTotalAmount: 1000,
    });
    tx.refund.aggregate.mockResolvedValue({ _sum: { amount: 500 } });
    tx.order.update.mockResolvedValue({
      id: 'order_sec013_ok',
      paymentStatus: 'PARTIALLY_REFUNDED',
    });

    const event = {
      provider: 'STRIPE' as const,
      externalEventId: 'evt_sec013_ok',
      eventType: 'refund.updated',
      status: 'RECEIVED' as const,
      providerPaymentId: 'pi_legit',
      providerRefundId: 're_match',
      providerObjectStatus: 'succeeded',
      metadata: { refundId: 'refund_sec013_ok' },
      payload: {},
    };

    await expect(
      service.reconcileProviderRefund(event, tx as never),
    ).resolves.toMatchObject({ id: 'refund_sec013_ok' });
  });

  it('merges caller-supplied metadata into the pending refund record (SEC-014)', async () => {
    tx.order.findUnique.mockResolvedValue({
      id: 'order_5',
      grandTotalAmount: 5000,
      currencyCode: 'USD',
      paymentStatus: 'PAID',
      paymentAttempts: [{ id: 'attempt_5', provider: 'STRIPE', providerPaymentId: 'pi_5' }],
      refunds: [],
    });
    tx.refund.create.mockResolvedValue({
      id: 'refund_5',
      orderId: 'order_5',
      amount: 3000,
      currencyCode: 'USD',
      returnRequestId: 'return_5',
    });
    paymentGatewayService.createRefund.mockResolvedValue({
      providerRefundId: 're_5',
      providerReference: 'ch_5',
      rawStatus: 'succeeded',
    });
    tx.refund.updateMany.mockResolvedValue({ count: 1 });
    tx.refund.findUniqueOrThrow.mockResolvedValue({
      id: 'refund_5',
      orderId: 'order_5',
      amount: 3000,
      currencyCode: 'USD',
      returnRequestId: 'return_5',
      status: 'SUCCEEDED',
      providerRefundId: 're_5',
    });
    tx.order.findUniqueOrThrow.mockResolvedValue({ id: 'order_5', grandTotalAmount: 5000 });
    tx.refund.aggregate.mockResolvedValue({ _sum: { amount: 3000 } });
    tx.order.update.mockResolvedValue({ id: 'order_5', paymentStatus: 'PARTIALLY_REFUNDED' });

    const extraMetadata = { overrideCap: true, receivedItemsCap: 2500, overrideReason: 'Goodwill' };

    await expect(
      service.executeRefund({
        orderId: 'order_5',
        returnRequestId: 'return_5',
        amount: 3000,
        metadata: extraMetadata,
      }),
    ).resolves.toMatchObject({ id: 'refund_5' });

    // Verify the createPendingRefund call merged the extra metadata
    expect(tx.refund.create).toHaveBeenCalledWith(
      expect.objectContaining({
        data: expect.objectContaining({
          metadata: expect.objectContaining({
            overrideCap: true,
            receivedItemsCap: 2500,
            overrideReason: 'Goodwill',
            orderId: 'order_5',
            paymentAttemptId: 'attempt_5',
            returnRequestId: 'return_5',
          }),
        }),
      }),
    );
  });
});
