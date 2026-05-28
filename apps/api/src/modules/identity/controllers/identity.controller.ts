import { Controller, Get, Inject, NotFoundException, Param, UseGuards } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiForbiddenResponse,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

import { CurrentUser } from '../decorators/current-user.decorator';
import { RequirePermissions } from '../decorators/permissions.decorator';
import { AuthGuard } from '../guards/auth.guard';
import { PermissionsGuard } from '../guards/permissions.guard';
import { AdminGuard } from '../guards/admin.guard';
import { IdentityPolicyService } from '../services/identity-policy.service';
import type { AccessTokenPayload } from '../services/token.service';
import { UserService } from '../services/user.service';

@ApiTags('Identity')
@ApiBearerAuth()
@Controller('identity')
export class IdentityController {
  constructor(
    @Inject(UserService) private readonly userService: UserService,
    @Inject(IdentityPolicyService) private readonly identityPolicyService: IdentityPolicyService,
  ) {}

  @Get('users/:userId/profile')
  @UseGuards(AuthGuard)
  @ApiOperation({
    summary: 'Read a user profile when the actor owns it or has identity.read access',
  })
  @ApiOkResponse({ description: 'User profile returned' })
  @ApiUnauthorizedResponse({ description: 'Authentication is required' })
  @ApiForbiddenResponse({ description: 'Object-level access denied' })
  async getUserProfile(
    @Param('userId') userId: string,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    this.identityPolicyService.assertCanReadUser(currentUser, userId);
    const profile = await this.userService.getUserProfileById(userId);
    if (!profile) {
      throw new NotFoundException('User not found');
    }

    return profile;
  }

  @Get('admin/access-check')
  @UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
  @RequirePermissions(['identity.read'])
  @ApiOperation({ summary: 'Verify privileged identity access for administrative actors' })
  @ApiOkResponse({ description: 'Administrative identity access is allowed' })
  @ApiUnauthorizedResponse({ description: 'Authentication is required' })
  @ApiForbiddenResponse({ description: 'Missing required role or permission' })
  getAdminAccessCheck() {
    return {
      allowed: true,
    };
  }
}
