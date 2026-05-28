import { type ExecutionContext } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { Test, type TestingModule } from '@nestjs/testing';

import { RolesGuard } from './roles.guard';

describe('RolesGuard', () => {
  let guard: RolesGuard;
  let reflector: Reflector;

  const createMockContext = (roles: string[] | undefined, userRoles: string[] | undefined) => {
    const handler = () => {};
    const controller = class {};

    const request = {
      user: userRoles ? { roles: userRoles } : undefined,
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
        RolesGuard,
        {
          provide: Reflector,
          useValue: {
            get: jest.fn(),
          },
        },
      ],
    }).compile();

    guard = module.get<RolesGuard>(RolesGuard);
    reflector = module.get<Reflector>(Reflector);
  });

  it('should be defined', () => {
    expect(guard).toBeDefined();
  });

  it('should return true if no roles metadata is set', () => {
    jest.spyOn(reflector, 'get').mockReturnValue(undefined);
    const context = createMockContext(undefined, ['customer']);

    const result = guard.canActivate(context);

    expect(result).toBe(true);
  });

  it('should return true if user has required role', () => {
    jest.spyOn(reflector, 'get').mockReturnValue(['admin']);
    const context = createMockContext(['admin'], ['admin', 'customer']);

    const result = guard.canActivate(context);

    expect(result).toBe(true);
  });

  it('should return false if user does not have required role', () => {
    jest.spyOn(reflector, 'get').mockReturnValue(['admin']);
    const context = createMockContext(['admin'], ['customer']);

    const result = guard.canActivate(context);

    expect(result).toBe(false);
  });

  it('should return false if user is missing on request', () => {
    jest.spyOn(reflector, 'get').mockReturnValue(['admin']);
    const context = createMockContext(['admin'], undefined);

    const result = guard.canActivate(context);

    expect(result).toBe(false);
  });
});
