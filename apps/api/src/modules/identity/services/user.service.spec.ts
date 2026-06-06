import { UnauthorizedException } from '@nestjs/common';
import { Test, type TestingModule } from '@nestjs/testing';
import { UserStatus, UserType } from '@prisma/client';
import * as argon2 from 'argon2';

import { PrismaService } from '../../persistence/services/prisma.service';
import { UserService } from './user.service';

jest.mock('argon2');

describe('UserService', () => {
  let service: UserService;
  let prisma: PrismaService;

  const mockPrismaService = {
    user: {
      create: jest.fn(),
      findUnique: jest.fn(),
    },
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        UserService,
        {
          provide: PrismaService,
          useValue: mockPrismaService,
        },
      ],
    }).compile();

    service = module.get<UserService>(UserService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('normalizeEmail', () => {
    it('should lowercase and trim email addresses', () => {
      expect(service.normalizeEmail('  TEST@Example.COM  ')).toBe('test@example.com');
    });
  });

  describe('Password Hashing & Verification', () => {
    it('should hash passwords using argon2id', async () => {
      const password = 'mySecretPassword';
      const hash = 'hashed_value';
      (argon2.hash as jest.Mock).mockResolvedValue(hash);

      const result = await service.hashPassword(password);

      expect(result).toBe(hash);
      expect(argon2.hash).toHaveBeenCalledWith(password, { type: argon2.argon2id });
    });

    it('should verify correct password using argon2.verify', async () => {
      const password = 'mySecretPassword';
      const hash = 'hashed_value';
      (argon2.verify as jest.Mock).mockResolvedValue(true);

      const result = await service.verifyPassword(hash, password);

      expect(result).toBe(true);
      expect(argon2.verify).toHaveBeenCalledWith(hash, password);
    });

    it('should return false if password verification fails or throws', async () => {
      const password = 'mySecretPassword';
      const hash = 'hashed_value';
      (argon2.verify as jest.Mock).mockRejectedValue(new Error('Argon error'));

      const result = await service.verifyPassword(hash, password);

      expect(result).toBe(false);
    });
  });

  describe('createUser', () => {
    it('should create a user in DB with hashed password and normalized email', async () => {
      const input = {
        email: '  test@example.com  ',
        displayName: '  Test User  ',
        passwordRaw: 'password123',
        userType: UserType.CUSTOMER,
      };

      const hashed = 'hashed_password';
      (argon2.hash as jest.Mock).mockResolvedValue(hashed);
      mockPrismaService.user.create.mockResolvedValue({ id: 'user_1', email: 'test@example.com' });

      const result = await service.createUser(input);

      expect(result).toEqual({ id: 'user_1', email: 'test@example.com' });
      expect(prisma.user.create).toHaveBeenCalledWith({
        data: {
          email: 'test@example.com',
          normalizedEmail: 'test@example.com',
          displayName: 'Test User',
          passwordHash: hashed,
          userType: UserType.CUSTOMER,
          status: UserStatus.ACTIVE,
        },
      });
    });
  });

  describe('getUserAuthDetails', () => {
    it('should return active roles and flat list of permissions', async () => {
      const mockUser = {
        id: 'user_1',
        email: 'test@example.com',
        userType: UserType.CUSTOMER,
        status: UserStatus.ACTIVE,
        deletedAt: null,
        userRoles: [
          {
            role: {
              key: 'customer',
              archivedAt: null,
              rolePermissions: [
                {
                  permission: {
                    key: 'read:profile',
                    archivedAt: null,
                  },
                },
                {
                  permission: {
                    key: 'write:profile',
                    archivedAt: new Date(), // Archived permission, should be skipped
                  },
                },
              ],
            },
          },
          {
            role: {
              key: 'suspended_role',
              archivedAt: new Date(), // Archived role, should be skipped
              rolePermissions: [
                {
                  permission: {
                    key: 'special:access',
                    archivedAt: null,
                  },
                },
              ],
            },
          },
        ],
      };

      mockPrismaService.user.findUnique.mockResolvedValue(mockUser);

      const result = await service.getUserAuthDetails('user_1');

      expect(result).toEqual({
        userId: 'user_1',
        email: 'test@example.com',
        userType: UserType.CUSTOMER,
        status: UserStatus.ACTIVE,
        roles: ['customer'],
        permissions: ['read:profile'],
      });
    });

    it('should return null if user is not found or soft-deleted', async () => {
      mockPrismaService.user.findUnique.mockResolvedValue(null);
      const result1 = await service.getUserAuthDetails('user_1');
      expect(result1).toBeNull();

      mockPrismaService.user.findUnique.mockResolvedValue({ id: 'user_1', deletedAt: new Date() });
      const result2 = await service.getUserAuthDetails('user_1');
      expect(result2).toBeNull();
    });
  });

  describe('getUserProfileById', () => {
    it('serializes profile dates and roles for the documented API DTO', async () => {
      const createdAt = new Date('2026-05-31T00:00:00.000Z');
      const mockUser = {
        id: 'user_1',
        email: 'test@example.com',
        displayName: 'Test User',
        userType: UserType.CUSTOMER,
        status: UserStatus.ACTIVE,
        deletedAt: null,
        emailVerifiedAt: null,
        lastLoginAt: null,
        createdAt,
        userRoles: [
          {
            role: {
              id: 'role_1',
              key: 'customer',
              name: 'Customer',
              archivedAt: null,
              rolePermissions: [
                {
                  permission: {
                    key: 'read:profile',
                    archivedAt: null,
                  },
                },
              ],
            },
          },
        ],
      };

      mockPrismaService.user.findUnique.mockResolvedValue(mockUser);

      await expect(service.getUserProfileById('user_1')).resolves.toMatchObject({
        id: 'user_1',
        email: 'test@example.com',
        displayName: 'Test User',
        userType: UserType.CUSTOMER,
        status: UserStatus.ACTIVE,
        emailVerifiedAt: null,
        lastLoginAt: null,
        createdAt: createdAt.toISOString(),
        roles: [{ id: 'role_1', key: 'customer', name: 'Customer' }],
        permissions: ['read:profile'],
      });
    });
  });

  describe('validateUserStatusOrThrow', () => {
    it('should not throw if status is ACTIVE and user not deleted', () => {
      expect(() => service.validateUserStatusOrThrow(UserStatus.ACTIVE, null)).not.toThrow();
    });

    it('should throw UnauthorizedException if user has deletedAt date', () => {
      expect(() => service.validateUserStatusOrThrow(UserStatus.ACTIVE, new Date())).toThrow(
        UnauthorizedException,
      );
    });

    it('should throw UnauthorizedException if user status is DISABLED', () => {
      expect(() => service.validateUserStatusOrThrow(UserStatus.DISABLED, null)).toThrow(
        UnauthorizedException,
      );
    });

    it('should throw UnauthorizedException if user status is SUSPENDED', () => {
      expect(() => service.validateUserStatusOrThrow(UserStatus.SUSPENDED, null)).toThrow(
        UnauthorizedException,
      );
    });

    it('should throw UnauthorizedException if user status is INVITED', () => {
      expect(() => service.validateUserStatusOrThrow(UserStatus.INVITED, null)).toThrow(
        UnauthorizedException,
      );
    });
  });
});
