import { BadRequestException, ServiceUnavailableException } from '@nestjs/common';
import { Prisma } from '@prisma/client';

import { PaymentWebhookService } from './payment-webhook.service';

describe('PaymentWebhookService', () => {
  const paymentGatewayService = { verifyStripeWebhook: jest.fn() };
  const paymentAttemptService = { resolveWebhookAttempt: jest.fn() };
  const orderPaymentTransitionService = {
    markPaid: jest.fn(),
    markFailed: jest.fn(),
    markCancelled: jest.fn(),
  };
  const refundService = { reconcileProviderRefund: jest.fn() };
  const prisma = {
    paymentWebhookEvent: {
      create: jest.fn(),
      findUnique: jest.fn(),
      findUniqueOrThrow: jest.fn(),
      updateMany: jest.fn(),
      update: jest.fn(),
    },
  };
  const tx = { paymentWebhookEvent: { update: jest.fn() } };
  const prismaTransactionService = {
    runInTransaction: jest.fn(async (callback: (input: typeof tx) => Promise<unknown>) =>
      callback(tx),
    ),
  };

  let service: PaymentWebhookService;

  beforeEach(() => {
    jest.clearAllMocks();
    service = new PaymentWebhookService(
      paymentGatewayService as never,
      paymentAttemptService as never,
      orderPaymentTransitionService as never,
      refundService as never,
      prismaTransactionService as never,
      prisma as never,
    );
  });

  it('acknowledges an already processed duplicate without corrupting its canonical audit status', async () => {
    paymentGatewayService.verifyStripeWebhook.mockResolvedValue({
      provider: 'STRIPE',
      externalEventId: 'evt_1',
      eventType: 'payment_intent.succeeded',
      providerPaymentId: 'pi_1',
      metadata: {},
      payload: {},
    });
    prisma.paymentWebhookEvent.create.mockRejectedValue(
      new Prisma.PrismaClientKnownRequestError('duplicate', {
        code: 'P2002',
        clientVersion: 'test',
      }),
    );
    prisma.paymentWebhookEvent.findUnique.mockResolvedValue({
      id: 'webhook_1',
      status: 'PROCESSED',
    });

    await expect(service.handleStripeWebhook(Buffer.from('{}'), 'signature')).resolves.toEqual({
      received: true,
      duplicate: true,
    });
    expect(prisma.paymentWebhookEvent.update).not.toHaveBeenCalled();
    expect(orderPaymentTransitionService.markPaid).not.toHaveBeenCalled();
  });

  it('processes a successful payment webhook and transitions the order once', async () => {
    paymentGatewayService.verifyStripeWebhook.mockResolvedValue({
      provider: 'STRIPE',
      externalEventId: 'evt_paid',
      eventType: 'payment_intent.succeeded',
      providerPaymentId: 'pi_paid',
      metadata: { orderId: 'order_1' },
      payload: {},
    });
    prisma.paymentWebhookEvent.create.mockResolvedValue({ id: 'webhook_2' });
    paymentAttemptService.resolveWebhookAttempt.mockResolvedValue({
      id: 'attempt_1',
      orderId: 'order_1',
    });

    await expect(service.handleStripeWebhook(Buffer.from('{}'), 'signature')).resolves.toEqual({
      received: true,
      duplicate: false,
    });
    expect(orderPaymentTransitionService.markPaid).toHaveBeenCalledWith('order_1', 'attempt_1', tx);
    expect(tx.paymentWebhookEvent.update).toHaveBeenLastCalledWith({
      where: { id: 'webhook_2' },
      data: expect.objectContaining({ status: 'PROCESSED', processedAt: expect.any(Date) }),
    });
  });

  it('preserves a failed webhook outside the rolled-back business transaction for safe retries', async () => {
    paymentGatewayService.verifyStripeWebhook.mockResolvedValue({
      provider: 'STRIPE',
      externalEventId: 'evt_failed',
      eventType: 'payment_intent.succeeded',
      providerPaymentId: 'pi_missing',
      metadata: {},
      payload: {},
    });
    prisma.paymentWebhookEvent.create.mockResolvedValue({ id: 'webhook_3' });
    paymentAttemptService.resolveWebhookAttempt.mockResolvedValue(null);

    await expect(service.handleStripeWebhook(Buffer.from('{}'), 'signature')).rejects.toThrow(
      BadRequestException,
    );
    expect(prisma.paymentWebhookEvent.update).toHaveBeenCalledWith({
      where: { id: 'webhook_3' },
      data: expect.objectContaining({ status: 'FAILED', processedAt: expect.any(Date) }),
    });
  });

  it('rejects concurrent processing while a delivery lease remains active', async () => {
    paymentGatewayService.verifyStripeWebhook.mockResolvedValue({
      provider: 'STRIPE',
      externalEventId: 'evt_busy',
      eventType: 'payment_intent.succeeded',
      providerPaymentId: 'pi_busy',
      metadata: {},
      payload: {},
    });
    prisma.paymentWebhookEvent.create.mockRejectedValue(
      new Prisma.PrismaClientKnownRequestError('duplicate', {
        code: 'P2002',
        clientVersion: 'test',
      }),
    );
    prisma.paymentWebhookEvent.findUnique.mockResolvedValue({
      id: 'webhook_busy',
      status: 'RECEIVED',
    });
    prisma.paymentWebhookEvent.updateMany.mockResolvedValue({ count: 0 });

    await expect(service.handleStripeWebhook(Buffer.from('{}'), 'signature')).rejects.toThrow(
      ServiceUnavailableException,
    );
  });

  it('rejects spoofed webhook payloads before persistence', async () => {
    paymentGatewayService.verifyStripeWebhook.mockRejectedValue(
      new BadRequestException('Webhook signature verification failed'),
    );
    await expect(service.handleStripeWebhook(Buffer.from('{}'), 'bad-signature')).rejects.toThrow(
      BadRequestException,
    );
    expect(prisma.paymentWebhookEvent.create).not.toHaveBeenCalled();
  });
});
