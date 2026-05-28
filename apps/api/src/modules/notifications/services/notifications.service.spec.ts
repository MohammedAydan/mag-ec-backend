import type { PrismaService } from '../../persistence/services/prisma.service';
import type { TaskDispatcherService } from '../../queue/task-dispatcher.service';
import type { NotificationDeliveryService } from './notification-delivery.service';
import { NotificationsService } from './notifications.service';

const makePrismaMock = () => ({
  notification: { upsert: jest.fn(), updateMany: jest.fn(), findUnique: jest.fn() },
  notificationPreference: { findUnique: jest.fn(), upsert: jest.fn() },
  pushDevice: { count: jest.fn(), upsert: jest.fn(), updateMany: jest.fn() },
});
const queueDispatcher = {
  usesQueue: true,
  dispatchNotification: jest.fn().mockResolvedValue(true),
};
const directDispatcher = {
  usesQueue: false,
  dispatchNotification: jest.fn().mockResolvedValue(false),
};
const delivery = { deliver: jest.fn().mockResolvedValue(true) };

function service(prisma: PrismaService, dispatcher = queueDispatcher) {
  return new NotificationsService(
    prisma,
    dispatcher as unknown as TaskDispatcherService,
    delivery as unknown as NotificationDeliveryService,
  );
}

describe('NotificationsService', () => {
  beforeEach(() => jest.clearAllMocks());

  it('dispatches a queued notification with retry settings through the dispatcher', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.notification.upsert as jest.Mock).mockResolvedValue({
      id: 'n-1',
      status: 'PENDING',
      deduplicationKey: 'k',
    });
    const svc = service(prisma);

    await expect(
      svc.enqueueNotification({
        userId: 'user-1',
        channel: 'EMAIL',
        eventType: 'order.created',
        title: 'Order created',
        body: null,
        relatedEntityType: null,
        relatedEntityId: null,
        deduplicationKey: 'k',
      }),
    ).resolves.toBeDefined();
    expect(queueDispatcher.dispatchNotification).toHaveBeenCalledWith('n-1');
    expect(delivery.deliver).not.toHaveBeenCalled();
  });

  it('delivers pending notifications synchronously in direct mode', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.notification.upsert as jest.Mock).mockResolvedValue({
      id: 'n-direct',
      status: 'PENDING',
    });
    (prisma.notification.findUnique as jest.Mock).mockResolvedValue({
      id: 'n-direct',
      status: 'SENT',
    });
    const svc = service(prisma, directDispatcher);

    await svc.enqueueNotification({
      userId: 'user-1',
      channel: 'EMAIL',
      eventType: 'order.created',
      title: 'Order created',
      body: null,
      relatedEntityType: null,
      relatedEntityId: null,
      deduplicationKey: 'direct-key',
    });
    expect(delivery.deliver).toHaveBeenCalledWith('n-direct');
    expect(directDispatcher.dispatchNotification).not.toHaveBeenCalled();
  });

  it('retries only failed notifications through direct delivery when queues are disabled', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.notification.updateMany as jest.Mock).mockResolvedValue({ count: 1 });
    (prisma.notification.findUnique as jest.Mock).mockResolvedValue({
      id: 'n-failed',
      status: 'SENT',
    });
    const svc = service(prisma, directDispatcher);

    await expect(svc.retryFailedNotification('n-failed')).resolves.toEqual({
      id: 'n-failed',
      status: 'SENT',
    });
    expect(delivery.deliver).toHaveBeenCalledWith('n-failed');
  });

  it('requires an active device before enabling push preferences', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.pushDevice.count as jest.Mock).mockResolvedValue(0);
    const svc = service(prisma, directDispatcher);
    await expect(svc.upsertMyPreference('user-1', { channel: 'PUSH' })).rejects.toThrow(
      'Register a push device before enabling PUSH notifications',
    );
  });
});
