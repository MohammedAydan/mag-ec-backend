import { ForbiddenException } from '@nestjs/common';

import { IdentityPolicyService } from './identity-policy.service';

describe('IdentityPolicyService', () => {
  const service = new IdentityPolicyService();

  it('allows a user to read their own profile', () => {
    expect(
      service.canReadUser(
        {
          sub: 'user_1',
          email: 'user@example.com',
          userType: 'CUSTOMER',
          roles: [],
          permissions: [],
        },
        'user_1',
      ),
    ).toBe(true);
  });

  it('allows an administrative actor with identity.read permission', () => {
    expect(
      service.canReadUser(
        {
          sub: 'admin_1',
          email: 'admin@example.com',
          userType: 'ADMIN',
          roles: ['super_admin'],
          permissions: ['identity.read'],
        },
        'user_2',
      ),
    ).toBe(true);
  });

  it('throws for a BOLA-style access attempt by another customer', () => {
    expect(() =>
      service.assertCanReadUser(
        {
          sub: 'user_1',
          email: 'user@example.com',
          userType: 'CUSTOMER',
          roles: [],
          permissions: [],
        },
        'user_2',
      ),
    ).toThrow(ForbiddenException);
  });
});
