import { UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { RefreshSessionStatus } from '@prisma/client';
import { Test, type TestingModule } from '@nestjs/testing';

import { PrismaService } from '../../persistence/services/prisma.service';
import { SessionService } from './session.service';

describe('SessionService', () => {
  let service: SessionService;

  const prisma = {
    refreshSession: {
      create: jest.fn(),
      findUnique: jest.fn(),
      updateMany: jest.fn(),
    },
    $transaction: jest.fn(),
  };

  const configService = {
    getOrThrow: jest.fn().mockReturnValue({ jwtRefreshExpiresIn: '30d' }),
  };

  beforeEach(async () => {
    jest.clearAllMocks();
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        SessionService,
        { provide: PrismaService, useValue: prisma },
        { provide: ConfigService, useValue: configService },
      ],
    }).compile();
    service = module.get(SessionService);
  });

  it('hashes tokens without retaining the raw bearer secret', () => {
    expect(service.hashToken('raw-token')).toHaveLength(64);
    expect(service.hashToken('raw-token')).toBe(service.hashToken('raw-token'));
  });

  it('creates a refresh session with a caller-provided JWT session id', async () => {
    prisma.refreshSession.create.mockResolvedValue({ id: 'session_1' });
    await service.createSession({
      id: 'session_1',
      userId: 'user_1',
      token: 'refresh',
      family: 'family_1',
    });
    expect(prisma.refreshSession.create).toHaveBeenCalledWith({
      data: expect.objectContaining({
        id: 'session_1',
        userId: 'user_1',
        sessionFamily: 'family_1',
        hashedToken: service.hashToken('refresh'),
        status: RefreshSessionStatus.ACTIVE,
      }),
    });
  });

  it('atomically rotates a refresh token into the exact next JWT session id', async () => {
    const oldSession = {
      id: 'session_1',
      userId: 'user_1',
      sessionFamily: 'family_1',
      hashedToken: service.hashToken('old-token'),
      status: RefreshSessionStatus.ACTIVE,
      expiresAt: new Date(Date.now() + 60_000),
    };
    const tx = {
      refreshSession: {
        findUnique: jest.fn().mockResolvedValue(oldSession),
        updateMany: jest.fn().mockResolvedValue({ count: 1 }),
        create: jest.fn().mockResolvedValue({ id: 'session_2', userId: 'user_1' }),
      },
    };
    prisma.$transaction.mockImplementation((callback) => callback(tx));

    await expect(
      service.rotateSession({
        sessionId: 'session_1',
        newSessionId: 'session_2',
        oldToken: 'old-token',
        newToken: 'new-token',
      }),
    ).resolves.toEqual({ id: 'session_2', userId: 'user_1' });

    expect(tx.refreshSession.updateMany).toHaveBeenCalledWith({
      where: expect.objectContaining({ id: 'session_1', status: RefreshSessionStatus.ACTIVE }),
      data: expect.objectContaining({
        status: RefreshSessionStatus.ROTATED,
        replacedBySessionId: 'session_2',
      }),
    });
    expect(tx.refreshSession.create).toHaveBeenCalledWith({
      data: expect.objectContaining({
        id: 'session_2',
        hashedToken: service.hashToken('new-token'),
      }),
    });
  });

  it('revokes a session family when a concurrent refresh loses the claim', async () => {
    const tx = {
      refreshSession: {
        findUnique: jest.fn().mockResolvedValue({
          id: 'session_1',
          userId: 'user_1',
          sessionFamily: 'family_1',
          hashedToken: service.hashToken('old-token'),
          status: RefreshSessionStatus.ACTIVE,
          expiresAt: new Date(Date.now() + 60_000),
        }),
        updateMany: jest
          .fn()
          .mockResolvedValueOnce({ count: 0 })
          .mockResolvedValueOnce({ count: 1 }),
        create: jest.fn(),
      },
    };
    prisma.$transaction.mockImplementation((callback) => callback(tx));

    await expect(
      service.rotateSession({
        sessionId: 'session_1',
        newSessionId: 'session_2',
        oldToken: 'old-token',
        newToken: 'new-token',
      }),
    ).rejects.toThrow(UnauthorizedException);

    expect(tx.refreshSession.updateMany).toHaveBeenLastCalledWith({
      where: { sessionFamily: 'family_1' },
      data: { status: RefreshSessionStatus.REVOKED, revokedAt: expect.any(Date) },
    });
    expect(tx.refreshSession.create).not.toHaveBeenCalled();
  });

  it('rejects an invalid token', async () => {
    const tx = { refreshSession: { findUnique: jest.fn().mockResolvedValue(null) } };
    prisma.$transaction.mockImplementation((callback) => callback(tx));
    await expect(
      service.rotateSession({
        sessionId: 'missing',
        newSessionId: 'next',
        oldToken: 'bad',
        newToken: 'new',
      }),
    ).rejects.toThrow(UnauthorizedException);
  });

  it('revokes the full session family during logout', async () => {
    prisma.refreshSession.findUnique.mockResolvedValue({ sessionFamily: 'family_1' });
    await service.revokeSession('session_1');
    expect(prisma.refreshSession.updateMany).toHaveBeenCalledWith({
      where: { sessionFamily: 'family_1' },
      data: { status: RefreshSessionStatus.REVOKED, revokedAt: expect.any(Date) },
    });
  });
});
