import { type ExecutionContext, UnauthorizedException } from '@nestjs/common';
import { Test, type TestingModule } from '@nestjs/testing';

import { TokenService } from '../services/token.service';
import { AuthGuard } from './auth.guard';

describe('AuthGuard', () => {
  let guard: AuthGuard;
  let tokenService: TokenService;

  const mockTokenService = {
    verifyAccessToken: jest.fn(),
  };

  const createMockContext = (authHeader?: string) => {
    const request = {
      headers: {
        authorization: authHeader,
      },
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
      providers: [AuthGuard, { provide: TokenService, useValue: mockTokenService }],
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

  it('should return true and assign payload to request.user if access token is valid', async () => {
    const mockPayload = { sub: 'user_1', email: 'test@example.com' };
    mockTokenService.verifyAccessToken.mockResolvedValue(mockPayload);
    const { context, request } = createMockContext('Bearer valid_token');

    const result = await guard.canActivate(context);

    expect(result).toBe(true);
    expect(request.user).toEqual(mockPayload);
    expect(tokenService.verifyAccessToken).toHaveBeenCalledWith('valid_token');
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
