import { AuditService } from './audit.service';
import type { PrismaService } from '../../persistence/services/prisma.service';

const makePrismaMock = () => ({
  auditLog: { findMany: jest.fn() },
});

describe('AuditService', () => {
  it('redacts sensitive keys from metadata and diff', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    const sample = [
      {
        id: 'a-1',
        metadata: {
          Email: 'secret@example.com',
          refreshToken: 'jwt',
          phoneNumber: '+20100',
          other: 'keep',
        },
        diff: { token: 's', nested: { password: 'p', providerClientSecret: 'pi_secret' } },
        createdAt: new Date(),
      },
    ];

    (prisma.auditLog.findMany as jest.Mock).mockResolvedValue(sample);

    const svc = new AuditService(prisma);
    const res = await svc.listAuditLogs({});

    const metadata = res.items[0]?.metadata as unknown as {
      Email: string;
      refreshToken: string;
      phoneNumber: string;
      other: string;
    };
    const diff = res.items[0]?.diff as unknown as {
      token: string;
      nested: { password: string; providerClientSecret: string };
    };

    expect(metadata?.Email).toBe('[Redacted]');
    expect(metadata?.refreshToken).toBe('[Redacted]');
    expect(metadata?.phoneNumber).toBe('[Redacted]');
    expect(metadata?.other).toBe('keep');
    expect(diff?.token).toBe('[Redacted]');
    expect(diff?.nested?.password).toBe('[Redacted]');
    expect(diff?.nested?.providerClientSecret).toBe('[Redacted]');
  });
});
