import { type ExecutionContext } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { Test, type TestingModule } from '@nestjs/testing';

import { PermissionsGuard } from './permissions.guard';

describe('PermissionsGuard', () => {
  let guard: PermissionsGuard;
  let reflector: Reflector;

  const createMockContext = (
    requiredPerms: string[] | undefined,
    userPerms: string[] | undefined,
  ) => {
    const handler = () => {};
    const controller = class {};

    const request = {
      user: userPerms ? { permissions: userPerms } : undefined,
    };

    return {
      getHandler: () => handler,
      getClass: () => controller,
      switchToHttp: () => ({
        getRequest: () => request,
      }),
    } as unknown as ExecutionContext;
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        PermissionsGuard,
        {
          provide: Reflector,
          useValue: {
            get: jest.fn(),
          },
        },
      ],
    }).compile();

    guard = module.get<PermissionsGuard>(PermissionsGuard);
    reflector = module.get<Reflector>(Reflector);
  });

  it('should be defined', () => {
    expect(guard).toBeDefined();
  });

  it('should return true if no permissions metadata is set', () => {
    jest.spyOn(reflector, 'get').mockReturnValue(undefined);
    const context = createMockContext(undefined, ['read:profile']);

    const result = guard.canActivate(context);

    expect(result).toBe(true);
  });

  it('should return true if user has ALL required permissions', () => {
    jest.spyOn(reflector, 'get').mockReturnValue(['read:profile', 'write:profile']);
    const context = createMockContext(
      ['read:profile', 'write:profile'],
      ['read:profile', 'write:profile', 'delete:profile'],
    );

    const result = guard.canActivate(context);

    expect(result).toBe(true);
  });

  it('should return false if user is missing any required permission', () => {
    jest.spyOn(reflector, 'get').mockReturnValue(['read:profile', 'write:profile']);
    const context = createMockContext(['read:profile', 'write:profile'], ['read:profile']);

    const result = guard.canActivate(context);

    expect(result).toBe(false);
  });

  it('should return false if user is missing on request', () => {
    jest.spyOn(reflector, 'get').mockReturnValue(['read:profile']);
    const context = createMockContext(['read:profile'], undefined);

    const result = guard.canActivate(context);

    expect(result).toBe(false);
  });
});
