import { UnauthorizedException } from '@nestjs/common';
import { Test, type TestingModule } from '@nestjs/testing';
import { AccountActionTokenType } from '@prisma/client/index';

import { PrismaService } from '../../persistence/services/prisma.service';
import { AccountActionTokenService } from './account-action-token.service';

describe('AccountActionTokenService', () => {
  let service: AccountActionTokenService;
  let prisma: PrismaService;

  const mockPrismaService = {
    accountActionToken: {
      findUnique: jest.fn(),
      update: jest.fn(),
    },
    $transaction: jest.fn(),
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        AccountActionTokenService,
        {
          provide: PrismaService,
          useValue: mockPrismaService,
        },
      ],
    }).compile();

    service = module.get<AccountActionTokenService>(AccountActionTokenService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should hash action tokens to sha256 hex strings', () => {
    const first = service.hashToken('plain-token');
    const second = service.hashToken('plain-token');

    expect(first).toHaveLength(64);
    expect(first).toBe(second);
  });

  it('should issue a password reset token and persist only its hash', async () => {
    mockPrismaService.$transaction.mockImplementation((callback) => {
      const tx = {
        accountActionToken: {
          updateMany: jest.fn(),
          create: jest.fn(),
        },
      };

      return callback(tx);
    });

    const rawToken = await service.issuePasswordResetToken('user_1', '127.0.0.1', 'Browser');

    expect(rawToken).toBeTruthy();
    expect(prisma.$transaction).toHaveBeenCalled();
  });

  it('should consume an active verification token', async () => {
    const hashedToken = service.hashToken('verify-token');
    const tokenRecord = {
      id: 'token_1',
      userId: 'user_1',
      type: AccountActionTokenType.EMAIL_VERIFICATION,
      hashedToken,
      expiresAt: new Date(Date.now() + 60_000),
      consumedAt: null,
    };

    mockPrismaService.$transaction.mockImplementation((callback) =>
      callback({
        accountActionToken: {
          findUnique: jest.fn().mockResolvedValue(tokenRecord),
          updateMany: jest.fn().mockResolvedValue({ count: 1 }),
        },
      }),
    );

    await expect(service.consumeEmailVerificationToken('verify-token')).resolves.toEqual({
      ...tokenRecord,
      consumedAt: expect.any(Date),
    });
  });

  it('should reject a token when another request consumed it first', async () => {
    const tokenRecord = {
      id: 'token_1',
      userId: 'user_1',
      type: AccountActionTokenType.EMAIL_VERIFICATION,
      hashedToken: service.hashToken('verify-token'),
      expiresAt: new Date(Date.now() + 60_000),
      consumedAt: null,
    };

    mockPrismaService.$transaction.mockImplementation((callback) =>
      callback({
        accountActionToken: {
          findUnique: jest.fn().mockResolvedValue(tokenRecord),
          updateMany: jest.fn().mockResolvedValue({ count: 0 }),
        },
      }),
    );

    await expect(service.consumeEmailVerificationToken('verify-token')).rejects.toThrow(
      UnauthorizedException,
    );
  });

  it('should reject expired account-action tokens', async () => {
    const hashedToken = service.hashToken('expired-token');
    mockPrismaService.$transaction.mockImplementation((callback) =>
      callback({
        accountActionToken: {
          findUnique: jest.fn().mockResolvedValue({
            id: 'token_1',
            userId: 'user_1',
            type: AccountActionTokenType.PASSWORD_RESET,
            hashedToken,
            expiresAt: new Date(Date.now() - 60_000),
            consumedAt: null,
          }),
          updateMany: jest.fn(),
        },
      }),
    );

    await expect(service.consumePasswordResetToken('expired-token')).rejects.toThrow(
      UnauthorizedException,
    );
  });
});
