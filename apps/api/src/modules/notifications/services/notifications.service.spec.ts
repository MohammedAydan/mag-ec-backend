import type { PrismaService } from '../../persistence/services/prisma.service';
import type { TaskDispatcherService } from '../../queue/task-dispatcher.service';
import type { NotificationDeliveryService } from './notification-delivery.service';
import { NotificationsService } from './notifications.service';

const makePrismaMock = () => ({
  notification: {
    upsert: jest.fn(),
    updateMany: jest.fn(),
    findUnique: jest.fn(),
    findMany: jest.fn(),
  },
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

  describe('response serialization security', () => {
    const notificationWithSensitiveUser = {
      id: 'n-1',
      userId: 'user-1',
      recipientEmail: 'u@example.com',
      channel: 'EMAIL',
      eventType: 'order.created',
      title: 'Order Created',
      body: 'Your order was placed.',
      status: 'SENT',
      relatedEntityType: 'Order',
      relatedEntityId: 'ord-1',
      deduplicationKey: 'dk-1',
      lastError: null,
      attempts: 1,
      processedAt: new Date('2026-06-01T00:00:00.000Z'),
      createdAt: new Date('2026-06-01T00:00:00.000Z'),
      updatedAt: new Date('2026-06-01T00:00:00.000Z'),
      user: {
        id: 'user-1',
        email: 'u@example.com',
        displayName: 'Test User',
        userType: 'CUSTOMER',
        // Sensitive fields that MUST NOT appear in the response
        passwordHash: 'secret-hash-123',
        normalizedEmail: 'U@EXAMPLE.COM',
      },
    } as Record<string, unknown>;

    it('listMyNotifications excludes passwordHash and normalizedEmail from the user object', async () => {
      const prisma = makePrismaMock() as unknown as PrismaService;
      (prisma.notification.findMany as jest.Mock).mockResolvedValue([
        notificationWithSensitiveUser,
      ]);
      const svc = service(prisma);

      const result = await svc.listMyNotifications('user-1', {});

      expect(result.items).toHaveLength(1);
      const user = (result.items[0] as Record<string, unknown>).user as Record<string, unknown>;
      expect(user).toBeDefined();
      expect(user).toHaveProperty('id');
      expect(user).toHaveProperty('email');
      expect(user).toHaveProperty('displayName');
      expect(user).toHaveProperty('userType');
      expect(user).not.toHaveProperty('passwordHash');
      expect(user).not.toHaveProperty('normalizedEmail');
    });

    it('listAdminNotifications excludes passwordHash and normalizedEmail from the user object', async () => {
      const prisma = makePrismaMock() as unknown as PrismaService;
      (prisma.notification.findMany as jest.Mock).mockResolvedValue([
        notificationWithSensitiveUser,
      ]);
      const svc = service(prisma);

      const result = await svc.listAdminNotifications({});

      expect(result.items).toHaveLength(1);
      const user = (result.items[0] as Record<string, unknown>).user as Record<string, unknown>;
      expect(user).toBeDefined();
      expect(user).toHaveProperty('id');
      expect(user).toHaveProperty('email');
      expect(user).toHaveProperty('displayName');
      expect(user).toHaveProperty('userType');
      expect(user).not.toHaveProperty('passwordHash');
      expect(user).not.toHaveProperty('normalizedEmail');
    });

    it('listMyNotifications returns user null when notification has no user', async () => {
      const prisma = makePrismaMock() as unknown as PrismaService;
      const noUserNotification = { ...notificationWithSensitiveUser, userId: null, user: null };
      (prisma.notification.findMany as jest.Mock).mockResolvedValue([noUserNotification]);
      const svc = service(prisma);

      const result = await svc.listMyNotifications('user-1', {});

      expect(result.items).toHaveLength(1);
      expect((result.items[0] as Record<string, unknown>).user).toBeNull();
    });
  });
});
