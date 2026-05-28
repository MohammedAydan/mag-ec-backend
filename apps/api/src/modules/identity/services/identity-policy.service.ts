import { ForbiddenException, Injectable } from '@nestjs/common';

import type { AccessTokenPayload } from './token.service';

@Injectable()
export class IdentityPolicyService {
  canReadUser(requestActor: AccessTokenPayload, targetUserId: string): boolean {
    return (
      requestActor.sub === targetUserId ||
      requestActor.roles.includes('super_admin') ||
      requestActor.permissions.includes('identity.read')
    );
  }

  assertCanReadUser(requestActor: AccessTokenPayload, targetUserId: string): void {
    if (!this.canReadUser(requestActor, targetUserId)) {
      throw new ForbiddenException('You are not allowed to access this user');
    }
  }
}
