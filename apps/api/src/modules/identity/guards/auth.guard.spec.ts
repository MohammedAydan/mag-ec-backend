import { type ExecutionContext, UnauthorizedException } from '@nestjs/common';
import { Test, type TestingModule } from '@nestjs/testing';

import { PrismaService } from '../../persistence/services/prisma.service';
import { TokenService } from '../services/token.service';
import { AuthGuard } from './auth.guard';

describe('AuthGuard', () => {
  let guard: AuthGuard;
  let tokenService: TokenService;

  const mockTokenService = {
    verifyAccessToken: jest.fn(),
  };

  const mockPrismaService = {
    user: {
      findUnique: jest.fn(),
    },
  };

  const createMockContext = (authHeader?: string) => {
    const request = {
      headers: {
        authorization: authHeader,
      },
      url: '/api/v1/test',
      user: undefined as any,
    };
    const context = {
      switchToHttp: () => ({
        getRequest: () => request,
      }),
    } as unknown as ExecutionContext;
    return { context, request };
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        AuthGuard,
        { provide: TokenService, useValue: mockTokenService },
        { provide: PrismaService, useValue: mockPrismaService },
      ],
    }).compile();

    guard = module.get<AuthGuard>(AuthGuard);
    tokenService = module.get<TokenService>(TokenService);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should be defined', () => {
    expect(guard).toBeDefined();
  });

  it('should return true and assign payload to request.user if access token is valid and tokenVersion matches', async () => {
    const mockPayload = { sub: 'user_1', email: 'test@example.com', tokenVersion: 1 };
    mockTokenService.verifyAccessToken.mockResolvedValue(mockPayload);
    mockPrismaService.user.findUnique.mockResolvedValue({
      id: 'user_1',
      tokenVersion: 1,
      status: 'ACTIVE',
      deletedAt: null,
    });
    const { context, request } = createMockContext('Bearer valid_token');

    const result = await guard.canActivate(context);

    expect(result).toBe(true);
    expect(request.user).toEqual(mockPayload);
    expect(tokenService.verifyAccessToken).toHaveBeenCalledWith('valid_token');
    expect(mockPrismaService.user.findUnique).toHaveBeenCalledWith({
      where: { id: 'user_1' },
      select: { id: true, tokenVersion: true, status: true, deletedAt: true },
    });
  });

  it('should throw UnauthorizedException if tokenVersion does not match', async () => {
    const mockPayload = { sub: 'user_1', email: 'test@example.com', tokenVersion: 1 };
    mockTokenService.verifyAccessToken.mockResolvedValue(mockPayload);
    mockPrismaService.user.findUnique.mockResolvedValue({
      id: 'user_1',
      tokenVersion: 3,
      status: 'ACTIVE',
      deletedAt: null,
    });
    const { context } = createMockContext('Bearer stale_token');

    await expect(guard.canActivate(context)).rejects.toThrow(
      new UnauthorizedException('Access token is no longer valid due to account changes'),
    );
  });

  it('should throw UnauthorizedException if user record no longer exists', async () => {
    const mockPayload = { sub: 'user_1', email: 'test@example.com', tokenVersion: 1 };
    mockTokenService.verifyAccessToken.mockResolvedValue(mockPayload);
    mockPrismaService.user.findUnique.mockResolvedValue(null);
    const { context } = createMockContext('Bearer valid_token');

    await expect(guard.canActivate(context)).rejects.toThrow(
      new UnauthorizedException('User associated with this token no longer exists'),
    );
  });

  it('should throw UnauthorizedException if user is deleted', async () => {
    const mockPayload = { sub: 'user_1', email: 'test@example.com', tokenVersion: 1 };
    mockTokenService.verifyAccessToken.mockResolvedValue(mockPayload);
    mockPrismaService.user.findUnique.mockResolvedValue({
      id: 'user_1',
      tokenVersion: 1,
      status: 'ACTIVE',
      deletedAt: new Date(),
    });
    const { context } = createMockContext('Bearer valid_token');

    await expect(guard.canActivate(context)).rejects.toThrow(
      new UnauthorizedException('User account has been deleted'),
    );
  });

  it('should throw UnauthorizedException if user status is DISABLED', async () => {
    const mockPayload = { sub: 'user_1', email: 'test@example.com', tokenVersion: 1 };
    mockTokenService.verifyAccessToken.mockResolvedValue(mockPayload);
    mockPrismaService.user.findUnique.mockResolvedValue({
      id: 'user_1',
      tokenVersion: 1,
      status: 'DISABLED',
      deletedAt: null,
    });
    const { context } = createMockContext('Bearer valid_token');

    await expect(guard.canActivate(context)).rejects.toThrow(
      new UnauthorizedException('User account is no longer active'),
    );
  });

  it('should throw UnauthorizedException if user status is SUSPENDED', async () => {
    const mockPayload = { sub: 'user_1', email: 'test@example.com', tokenVersion: 1 };
    mockTokenService.verifyAccessToken.mockResolvedValue(mockPayload);
    mockPrismaService.user.findUnique.mockResolvedValue({
      id: 'user_1',
      tokenVersion: 1,
      status: 'SUSPENDED',
      deletedAt: null,
    });
    const { context } = createMockContext('Bearer valid_token');

    await expect(guard.canActivate(context)).rejects.toThrow(
      new UnauthorizedException('User account is no longer active'),
    );
  });

  it('should throw UnauthorizedException if Authorization header is missing', async () => {
    const { context } = createMockContext(undefined);

    await expect(guard.canActivate(context)).rejects.toThrow(
      new UnauthorizedException('Authorization header is missing'),
    );
  });

  it('should throw UnauthorizedException if header is not Bearer', async () => {
    const { context } = createMockContext('Basic basic_token');

    await expect(guard.canActivate(context)).rejects.toThrow(
      new UnauthorizedException('Invalid authorization header format'),
    );
  });

  it('should throw UnauthorizedException if token verification fails', async () => {
    mockTokenService.verifyAccessToken.mockRejectedValue(new Error('Invalid signature'));
    const { context } = createMockContext('Bearer invalid_token');

    await expect(guard.canActivate(context)).rejects.toThrow(
      new UnauthorizedException('Invalid or expired access token'),
    );
  });
});
