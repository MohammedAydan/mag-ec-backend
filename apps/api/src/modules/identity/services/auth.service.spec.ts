import { ConflictException, UnauthorizedException } from '@nestjs/common';
import { Test, type TestingModule } from '@nestjs/testing';
import { AuditCategory, UserStatus, UserType } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';
import { AccountActionTokenService } from './account-action-token.service';
import { AuthService } from './auth.service';
import { SessionService } from './session.service';
import { TokenService } from './token.service';
import { TransactionalEmailService } from './transactional-email.service';
import { UserService } from './user.service';

describe('AuthService', () => {
  let service: AuthService;
  let prisma: PrismaService;
  let userService: UserService;
  let sessionService: SessionService;

  const mockPrismaService = {
    auditLog: {
      create: jest.fn(),
    },
    user: {
      findUnique: jest.fn(),
      update: jest.fn(),
    },
    refreshSession: {
      updateMany: jest.fn(),
    },
    $transaction: jest.fn(),
  };

  const mockUserService = {
    normalizeEmail: jest.fn((email: string) => email.trim().toLowerCase()),
    findByNormalizedEmail: jest.fn(),
    createUser: jest.fn(),
    findById: jest.fn(),
    verifyPassword: jest.fn(),
    validateUserStatusOrThrow: jest.fn(),
    getUserAuthDetails: jest.fn(),
    hashPassword: jest.fn(),
    updatePassword: jest.fn(),
    markEmailVerified: jest.fn(),
  };

  const mockSessionService = {
    createSession: jest.fn(),
    rotateSession: jest.fn(),
    revokeSession: jest.fn(),
    revokeAllUserSessions: jest.fn(),
  };

  const mockTokenService = {
    signAccessToken: jest.fn(),
    signRefreshToken: jest.fn(),
    verifyRefreshToken: jest.fn(),
  };

  const mockAccountActionTokenService = {
    issuePasswordResetToken: jest.fn(),
    consumePasswordResetToken: jest.fn(),
    issueEmailVerificationToken: jest.fn(),
    consumeEmailVerificationToken: jest.fn(),
    revokePasswordResetToken: jest.fn(),
    revokeEmailVerificationToken: jest.fn(),
  };

  const mockTransactionalEmailService = {
    sendPasswordResetEmail: jest.fn(),
    sendEmailVerificationEmail: jest.fn(),
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        AuthService,
        { provide: PrismaService, useValue: mockPrismaService },
        { provide: UserService, useValue: mockUserService },
        { provide: SessionService, useValue: mockSessionService },
        { provide: TokenService, useValue: mockTokenService },
        { provide: AccountActionTokenService, useValue: mockAccountActionTokenService },
        { provide: TransactionalEmailService, useValue: mockTransactionalEmailService },
      ],
    }).compile();

    service = module.get<AuthService>(AuthService);
    prisma = module.get<PrismaService>(PrismaService);
    userService = module.get<UserService>(UserService);
    sessionService = module.get<SessionService>(SessionService);
    mockPrismaService.$transaction.mockImplementation((callback) => callback(mockPrismaService));
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('register', () => {
    it('should register a new user successfully and write an audit log', async () => {
      const input = {
        email: 'customer@example.com',
        displayName: 'Customer User',
        passwordRaw: 'password123',
      };

      mockUserService.findByNormalizedEmail.mockResolvedValue(null);
      mockUserService.createUser.mockResolvedValue({
        id: 'user_1',
        email: 'customer@example.com',
        displayName: 'Customer User',
        userType: UserType.CUSTOMER,
      });

      const result = await service.register(input);

      expect(result).toEqual({
        id: 'user_1',
        email: 'customer@example.com',
        displayName: 'Customer User',
        userType: UserType.CUSTOMER,
      });
      expect(userService.createUser).toHaveBeenCalledWith({
        email: input.email,
        displayName: input.displayName,
        passwordRaw: input.passwordRaw,
        userType: UserType.CUSTOMER,
      });
      expect(prisma.auditLog.create).toHaveBeenCalledWith({
        data: expect.objectContaining({
          actorUserId: 'user_1',
          category: AuditCategory.AUTH,
          action: 'REGISTER',
          entityType: 'User',
          entityId: 'user_1',
        }),
      });
    });

    it('should throw ConflictException if user already exists', async () => {
      const input = {
        email: 'customer@example.com',
        displayName: 'Customer User',
        passwordRaw: 'password123',
      };

      mockUserService.findByNormalizedEmail.mockResolvedValue({ id: 'user_1' });

      await expect(service.register(input)).rejects.toThrow(ConflictException);
      expect(prisma.auditLog.create).toHaveBeenCalledWith({
        data: expect.objectContaining({
          category: AuditCategory.SECURITY,
          action: 'REGISTER_FAILED_DUPLICATE_EMAIL',
        }),
      });
    });
  });

  describe('login', () => {
    const mockUser = {
      id: 'user_1',
      email: 'customer@example.com',
      displayName: 'Customer User',
      passwordHash: 'hashed_pw',
      userType: UserType.CUSTOMER,
      status: UserStatus.ACTIVE,
      deletedAt: null,
    };

    const mockAuthDetails = {
      roles: ['customer'],
      permissions: ['read:profile'],
    };

    it('should authenticate user and return access and refresh tokens', async () => {
      mockUserService.findByNormalizedEmail.mockResolvedValue(mockUser);
      mockUserService.verifyPassword.mockResolvedValue(true);
      mockUserService.getUserAuthDetails.mockResolvedValue(mockAuthDetails);
      mockTokenService.signAccessToken.mockResolvedValue('access_token_jwt');
      mockTokenService.signRefreshToken.mockResolvedValue('refresh_token_jwt');

      const result = await service.login(
        'customer@example.com',
        'password123',
        '127.0.0.1',
        'Mozilla',
      );

      expect(result).toEqual({
        accessToken: 'access_token_jwt',
        refreshToken: 'refresh_token_jwt',
        user: {
          id: mockUser.id,
          email: mockUser.email,
          displayName: mockUser.displayName,
          userType: mockUser.userType,
        },
      });

      expect(userService.validateUserStatusOrThrow).toHaveBeenCalledWith(
        mockUser.status,
        mockUser.deletedAt,
      );
      expect(sessionService.createSession).toHaveBeenCalledWith({
        id: expect.any(String),
        userId: mockUser.id,
        token: 'refresh_token_jwt',
        ipAddress: '127.0.0.1',
        userAgent: 'Mozilla',
        family: expect.any(String),
      });
      expect(prisma.user.update).toHaveBeenCalledWith({
        where: { id: mockUser.id },
        data: { lastLoginAt: expect.any(Date) },
      });
      expect(prisma.auditLog.create).toHaveBeenCalledWith({
        data: expect.objectContaining({
          actorUserId: mockUser.id,
          category: AuditCategory.AUTH,
          action: 'LOGIN',
          entityType: 'User',
          entityId: mockUser.id,
        }),
      });
    });

    it('should throw UnauthorizedException if user not found', async () => {
      mockUserService.findByNormalizedEmail.mockResolvedValue(null);

      await expect(service.login('customer@example.com', 'password123')).rejects.toThrow(
        UnauthorizedException,
      );
      expect(prisma.auditLog.create).toHaveBeenCalledWith({
        data: expect.objectContaining({
          category: AuditCategory.SECURITY,
          action: 'LOGIN_FAILED',
        }),
      });
    });

    it('should throw UnauthorizedException if password verification fails', async () => {
      mockUserService.findByNormalizedEmail.mockResolvedValue(mockUser);
      mockUserService.verifyPassword.mockResolvedValue(false);

      await expect(service.login('customer@example.com', 'password123')).rejects.toThrow(
        UnauthorizedException,
      );
      expect(prisma.auditLog.create).toHaveBeenCalledWith({
        data: expect.objectContaining({
          actorUserId: mockUser.id,
          category: AuditCategory.SECURITY,
          action: 'LOGIN_FAILED',
        }),
      });
    });
  });

  describe('refresh', () => {
    const mockUser = {
      id: 'user_1',
      email: 'customer@example.com',
      displayName: 'Customer User',
      status: UserStatus.ACTIVE,
      deletedAt: null,
      userType: UserType.CUSTOMER,
    };

    const mockAuthDetails = {
      roles: ['customer'],
      permissions: ['read:profile'],
    };

    it('should verify token, rotate session, and return new token set', async () => {
      mockTokenService.verifyRefreshToken.mockResolvedValue({
        sub: 'user_1',
        sessionId: 'session_1',
        family: 'family_123',
      });
      mockUserService.findById.mockResolvedValue(mockUser);
      mockUserService.getUserAuthDetails.mockResolvedValue(mockAuthDetails);
      mockTokenService.signAccessToken.mockResolvedValue('new_access_token');
      mockTokenService.signRefreshToken.mockResolvedValue('new_refresh_token');

      const result = await service.refresh('old_refresh_token', '127.0.0.1', 'Chrome');

      expect(result).toEqual({
        accessToken: 'new_access_token',
        refreshToken: 'new_refresh_token',
        user: {
          id: mockUser.id,
          email: mockUser.email,
          displayName: mockUser.displayName,
          userType: mockUser.userType,
        },
      });

      expect(sessionService.rotateSession).toHaveBeenCalledWith({
        sessionId: 'session_1',
        newSessionId: expect.any(String),
        oldToken: 'old_refresh_token',
        newToken: 'new_refresh_token',
        ipAddress: '127.0.0.1',
        userAgent: 'Chrome',
      });
    });

    it('should throw UnauthorizedException if token verification fails', async () => {
      mockTokenService.verifyRefreshToken.mockRejectedValue(new Error('Invalid signature'));

      await expect(service.refresh('invalid_token')).rejects.toThrow(UnauthorizedException);
      expect(prisma.auditLog.create).toHaveBeenCalledWith({
        data: expect.objectContaining({
          category: AuditCategory.SECURITY,
          action: 'REFRESH_FAILED',
        }),
      });
    });
  });

  describe('logout', () => {
    it('should verify token, revoke session, and write an audit log', async () => {
      mockTokenService.verifyRefreshToken.mockResolvedValue({
        sub: 'user_1',
        sessionId: 'session_1',
        family: 'family_123',
      });

      await service.logout('valid_refresh_token');

      expect(sessionService.revokeSession).toHaveBeenCalledWith('session_1');
      expect(prisma.auditLog.create).toHaveBeenCalledWith({
        data: expect.objectContaining({
          actorUserId: 'user_1',
          category: AuditCategory.AUTH,
          action: 'LOGOUT',
          entityType: 'User',
          entityId: 'user_1',
        }),
      });
    });

    it('should fail silently if token is invalid during logout', async () => {
      mockTokenService.verifyRefreshToken.mockRejectedValue(new Error('Invalid token'));

      await expect(service.logout('invalid_token')).resolves.not.toThrow();
      expect(sessionService.revokeSession).not.toHaveBeenCalled();
    });
  });

  describe('password reset', () => {
    it('should accept password reset requests without exposing account existence', async () => {
      mockUserService.findByNormalizedEmail.mockResolvedValue({
        id: 'user_1',
        email: 'customer@example.com',
        status: UserStatus.ACTIVE,
        deletedAt: null,
      });
      mockAccountActionTokenService.issuePasswordResetToken.mockResolvedValue('reset-token');

      await expect(
        service.requestPasswordReset('customer@example.com', '127.0.0.1', 'Browser'),
      ).resolves.toEqual({ accepted: true });

      expect(mockAccountActionTokenService.issuePasswordResetToken).toHaveBeenCalledWith(
        'user_1',
        '127.0.0.1',
        'Browser',
      );
      expect(mockTransactionalEmailService.sendPasswordResetEmail).toHaveBeenCalledWith(
        'customer@example.com',
        'reset-token',
      );
    });

    it('should consume reset tokens, change the password, and revoke active sessions', async () => {
      mockAccountActionTokenService.consumePasswordResetToken.mockResolvedValue({
        userId: 'user_1',
      });
      mockUserService.hashPassword.mockResolvedValue('new-password-hash');
      mockPrismaService.user.findUnique.mockResolvedValue({
        id: 'user_1',
        status: UserStatus.ACTIVE,
        deletedAt: null,
      });

      await expect(
        service.resetPassword('reset_token', 'NewPassword123', '127.0.0.1', 'Browser'),
      ).resolves.toEqual({ passwordReset: true });

      expect(mockUserService.hashPassword).toHaveBeenCalledWith('NewPassword123');
      expect(mockAccountActionTokenService.consumePasswordResetToken).toHaveBeenCalledWith(
        'reset_token',
        mockPrismaService,
      );
      expect(mockPrismaService.user.update).toHaveBeenCalledWith({
        where: { id: 'user_1' },
        data: {
          passwordHash: 'new-password-hash',
          status: undefined,
          emailVerifiedAt: undefined,
        },
      });
      expect(mockPrismaService.refreshSession.updateMany).toHaveBeenCalledWith(
        expect.objectContaining({ where: expect.objectContaining({ userId: 'user_1' }) }),
      );
      expect(prisma.auditLog.create).toHaveBeenCalledWith({
        data: expect.objectContaining({
          actorUserId: 'user_1',
          action: 'PASSWORD_RESET_COMPLETED',
        }),
      });
    });
  });

  describe('email verification', () => {
    it('should issue an email verification token for an authenticated user', async () => {
      mockUserService.findById.mockResolvedValue({
        id: 'user_1',
        email: 'customer@example.com',
        status: UserStatus.ACTIVE,
        deletedAt: null,
        emailVerifiedAt: null,
      });
      mockAccountActionTokenService.issueEmailVerificationToken.mockResolvedValue('verify-token');

      await expect(
        service.requestEmailVerification('user_1', '127.0.0.1', 'Browser'),
      ).resolves.toEqual({ accepted: true });

      expect(mockAccountActionTokenService.issueEmailVerificationToken).toHaveBeenCalledWith(
        'user_1',
        '127.0.0.1',
        'Browser',
      );
      expect(mockTransactionalEmailService.sendEmailVerificationEmail).toHaveBeenCalledWith(
        'customer@example.com',
        'verify-token',
      );
    });

    it('should consume an email verification token and mark the user verified', async () => {
      mockAccountActionTokenService.consumeEmailVerificationToken.mockResolvedValue({
        userId: 'user_1',
      });

      await expect(service.verifyEmail('verify_token', '127.0.0.1', 'Browser')).resolves.toEqual({
        verified: true,
      });

      expect(mockAccountActionTokenService.consumeEmailVerificationToken).toHaveBeenCalledWith(
        'verify_token',
        mockPrismaService,
      );
      expect(mockPrismaService.user.update).toHaveBeenCalledWith({
        where: { id: 'user_1' },
        data: { emailVerifiedAt: expect.any(Date) },
      });
      expect(prisma.auditLog.create).toHaveBeenCalledWith({
        data: expect.objectContaining({
          actorUserId: 'user_1',
          action: 'EMAIL_VERIFIED',
        }),
      });
    });
  });
});
