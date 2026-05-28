import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';

import { AdminAccessController } from './controllers/admin-access.controller';
import { AuthController } from './controllers/auth.controller';
import { IdentityController } from './controllers/identity.controller';
import { AdminGuard } from './guards/admin.guard';
import { AuthGuard } from './guards/auth.guard';
import { PermissionsGuard } from './guards/permissions.guard';
import { RolesGuard } from './guards/roles.guard';
import { AccountActionTokenService } from './services/account-action-token.service';
import { AdminAccessService } from './services/admin-access.service';
import { AuthService } from './services/auth.service';
import { IdentityPolicyService } from './services/identity-policy.service';
import { SessionService } from './services/session.service';
import { TokenService } from './services/token.service';
import { TransactionalEmailService } from './services/transactional-email.service';
import { UserService } from './services/user.service';

@Module({
  imports: [JwtModule.register({})],
  controllers: [AuthController, IdentityController, AdminAccessController],
  providers: [
    AccountActionTokenService,
    AdminAccessService,
    TransactionalEmailService,
    TokenService,
    SessionService,
    UserService,
    AuthService,
    IdentityPolicyService,
    AuthGuard,
    AdminGuard,
    RolesGuard,
    PermissionsGuard,
  ],
  exports: [
    AccountActionTokenService,
    TokenService,
    SessionService,
    UserService,
    AuthService,
    IdentityPolicyService,
    AuthGuard,
    AdminGuard,
    RolesGuard,
    PermissionsGuard,
  ],
})
export class IdentityModule {}
