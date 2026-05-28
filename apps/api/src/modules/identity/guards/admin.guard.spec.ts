import type { ExecutionContext } from '@nestjs/common';

import { AdminGuard } from './admin.guard';

function makeContext(user?: { userType: 'ADMIN' | 'CUSTOMER' | 'SYSTEM' }): ExecutionContext {
  return {
    switchToHttp: () => ({ getRequest: () => ({ user }) }),
  } as unknown as ExecutionContext;
}

describe('AdminGuard', () => {
  const guard = new AdminGuard();

  it('allows authenticated administrative staff accounts', () => {
    expect(guard.canActivate(makeContext({ userType: 'ADMIN' }))).toBe(true);
  });

  it('rejects customers even when they reach an administrative route', () => {
    expect(guard.canActivate(makeContext({ userType: 'CUSTOMER' }))).toBe(false);
  });

  it('rejects anonymous requests', () => {
    expect(guard.canActivate(makeContext())).toBe(false);
  });
});
