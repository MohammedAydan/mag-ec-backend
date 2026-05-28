import type { Prisma } from '@prisma/client';

import type { PrismaService } from '../../persistence/services/prisma.service';
import { OrderPostPurchaseService } from './order-post-purchase.service';

type PrismaMock = {
  order: {
    findUniqueOrThrow: jest.Mock;
    update: jest.Mock;
  };
};

function asTx(mock: PrismaMock): Prisma.TransactionClient {
  return mock as unknown as Prisma.TransactionClient;
}

describe('OrderPostPurchaseService', () => {
  let prisma: PrismaMock;
  let orderOutboxService: { emitStatusChanged: jest.Mock };
  let service: OrderPostPurchaseService;

  beforeEach(() => {
    prisma = {
      order: {
        findUniqueOrThrow: jest.fn(),
        update: jest.fn(),
      },
    };

    orderOutboxService = {
      emitStatusChanged: jest.fn(),
    };

    service = new OrderPostPurchaseService(
      prisma as unknown as PrismaService,
      orderOutboxService as never,
    );
  });

  it('marks an order partially fulfilled when only some lines are shipped', async () => {
    prisma.order.findUniqueOrThrow.mockResolvedValue({
      id: 'order_1',
      status: 'PLACED',
      paymentStatus: 'PAID',
      fulfillmentStatus: 'UNFULFILLED',
      lines: [
        { id: 'line_1', quantity: 2 },
        { id: 'line_2', quantity: 1 },
      ],
      shipments: [
        {
          status: 'SHIPPED',
          lines: [{ orderLineId: 'line_1', quantity: 2 }],
        },
      ],
      returnRequests: [],
    });
    prisma.order.update.mockResolvedValue({
      id: 'order_1',
      status: 'PLACED',
      paymentStatus: 'PAID',
      fulfillmentStatus: 'PARTIALLY_FULFILLED',
    });

    await service.syncOrderPostPurchaseState('order_1', asTx(prisma));

    expect(prisma.order.update).toHaveBeenCalledWith({
      where: { id: 'order_1' },
      data: {
        fulfillmentStatus: 'PARTIALLY_FULFILLED',
        status: 'PLACED',
      },
    });
    expect(orderOutboxService.emitStatusChanged).toHaveBeenCalled();
  });

  it('marks an order returned when every line is fully received back', async () => {
    prisma.order.findUniqueOrThrow.mockResolvedValue({
      id: 'order_2',
      status: 'FULFILLED',
      paymentStatus: 'REFUNDED',
      fulfillmentStatus: 'FULFILLED',
      lines: [{ id: 'line_1', quantity: 1 }],
      shipments: [
        {
          status: 'DELIVERED',
          lines: [{ orderLineId: 'line_1', quantity: 1 }],
        },
      ],
      returnRequests: [
        {
          items: [{ orderLineId: 'line_1', receivedQuantity: 1 }],
        },
      ],
    });
    prisma.order.update.mockResolvedValue({
      id: 'order_2',
      status: 'FULFILLED',
      paymentStatus: 'REFUNDED',
      fulfillmentStatus: 'RETURNED',
    });

    await service.syncOrderPostPurchaseState('order_2', asTx(prisma));

    expect(prisma.order.update).toHaveBeenCalledWith({
      where: { id: 'order_2' },
      data: {
        fulfillmentStatus: 'RETURNED',
        status: 'FULFILLED',
      },
    });
  });

  it('does not write when the derived state is unchanged', async () => {
    const order = {
      id: 'order_3',
      status: 'PLACED',
      paymentStatus: 'PAID',
      fulfillmentStatus: 'UNFULFILLED',
      lines: [{ id: 'line_1', quantity: 1 }],
      shipments: [],
      returnRequests: [],
    };
    prisma.order.findUniqueOrThrow.mockResolvedValue(order);

    const result = await service.syncOrderPostPurchaseState('order_3', asTx(prisma));

    expect(prisma.order.update).not.toHaveBeenCalled();
    expect(orderOutboxService.emitStatusChanged).not.toHaveBeenCalled();
    expect(result).toBe(order);
  });
});
