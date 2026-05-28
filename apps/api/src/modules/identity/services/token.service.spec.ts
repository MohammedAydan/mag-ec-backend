import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { Test, type TestingModule } from '@nestjs/testing';

import { TokenService } from './token.service';

describe('TokenService', () => {
  let service: TokenService;
  let jwtService: JwtService;

  const mockAppConfig = {
    jwtAccessSecret: 'access_secret_key_at_least_32_bytes_long',
    jwtAccessExpiresIn: '15m',
    jwtRefreshSecret: 'refresh_secret_key_at_least_32_bytes_long',
    jwtRefreshExpiresIn: '30d',
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        TokenService,
        {
          provide: JwtService,
          useValue: {
            signAsync: jest.fn().mockResolvedValue('signed_token'),
            verifyAsync: jest.fn().mockResolvedValue({ sub: 'user_1' }),
          },
        },
        {
          provide: ConfigService,
          useValue: {
            getOrThrow: jest.fn().mockReturnValue(mockAppConfig),
          },
        },
      ],
    }).compile();

    service = module.get<TokenService>(TokenService);
    jwtService = module.get<JwtService>(JwtService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('AccessToken', () => {
    it('should sign access token with configured secret and expiration', async () => {
      const payload = {
        sub: 'user_1',
        email: 'test@example.com',
        userType: 'CUSTOMER' as const,
        roles: ['customer'],
        permissions: ['read:profile'],
      };

      const token = await service.signAccessToken(payload);

      expect(token).toBe('signed_token');
      expect(jwtService.signAsync).toHaveBeenCalledWith(payload, {
        secret: mockAppConfig.jwtAccessSecret,
        expiresIn: mockAppConfig.jwtAccessExpiresIn,
      });
    });

    it('should verify access token with correct secret', async () => {
      const token = 'valid_token';
      const payload = await service.verifyAccessToken(token);

      expect(payload).toEqual({ sub: 'user_1' });
      expect(jwtService.verifyAsync).toHaveBeenCalledWith(token, {
        secret: mockAppConfig.jwtAccessSecret,
      });
    });
  });

  describe('RefreshToken', () => {
    it('should sign refresh token with configured secret and expiration', async () => {
      const payload = {
        sub: 'user_1',
        sessionId: 'session_123',
        family: 'family_123',
      };

      const token = await service.signRefreshToken(payload);

      expect(token).toBe('signed_token');
      expect(jwtService.signAsync).toHaveBeenCalledWith(payload, {
        secret: mockAppConfig.jwtRefreshSecret,
        expiresIn: mockAppConfig.jwtRefreshExpiresIn,
      });
    });

    it('should verify refresh token with correct secret', async () => {
      const token = 'valid_token';
      const payload = await service.verifyRefreshToken(token);

      expect(payload).toEqual({ sub: 'user_1' });
      expect(jwtService.verifyAsync).toHaveBeenCalledWith(token, {
        secret: mockAppConfig.jwtRefreshSecret,
      });
    });
  });
});
