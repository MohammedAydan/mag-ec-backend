import { Body, Controller, Get, Inject, Param, Patch, Post, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../decorators/current-user.decorator';
import { RequirePermissions } from '../decorators/permissions.decorator';
import { AdminGuard } from '../guards/admin.guard';
import { AuthGuard } from '../guards/auth.guard';
import { PermissionsGuard } from '../guards/permissions.guard';
import type { AccessTokenPayload } from '../services/token.service';
import { AdminAccessService } from '../services/admin-access.service';
import {
  CreateAdminRoleDto,
  InviteStaffDto,
  UpdateAdminRolePermissionsDto,
  UpdateStaffRolesDto,
  UpdateStaffStatusDto,
} from '../dto/admin-access.dto';

@ApiTags('Identity Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['identity.read'])
@Controller('identity/admin')
export class AdminAccessController {
  constructor(@Inject(AdminAccessService) private readonly adminAccessService: AdminAccessService) {}

  @Get('permissions')
  listPermissions() {
    return this.adminAccessService.listPermissions();
  }

  @Get('roles')
  listRoles() {
    return this.adminAccessService.listRoles();
  }

  @Post('roles')
  @RequirePermissions(['identity.write'])
  createRole(@CurrentUser() actor: AccessTokenPayload, @Body() dto: CreateAdminRoleDto) {
    return this.adminAccessService.createRole(actor, dto);
  }

  @Patch('roles/:roleId/permissions')
  @RequirePermissions(['identity.write'])
  updateRolePermissions(
    @CurrentUser() actor: AccessTokenPayload,
    @Param('roleId') roleId: string,
    @Body() dto: UpdateAdminRolePermissionsDto,
  ) {
    return this.adminAccessService.updateRolePermissions(actor, roleId, dto);
  }

  @Get('staff')
  listStaff() {
    return this.adminAccessService.listStaff();
  }

  @Get('customers')
  listCustomers() {
    return this.adminAccessService.listCustomers();
  }

  @Post('staff/invitations')
  @RequirePermissions(['identity.write'])
  inviteStaff(@CurrentUser() actor: AccessTokenPayload, @Body() dto: InviteStaffDto) {
    return this.adminAccessService.inviteStaff(actor, dto);
  }

  @Post('staff/:staffId/resend-invitation')
  @RequirePermissions(['identity.write'])
  resendStaffInvitation(
    @CurrentUser() actor: AccessTokenPayload,
    @Param('staffId') staffId: string,
  ) {
    return this.adminAccessService.resendStaffInvitation(actor, staffId);
  }

  @Patch('staff/:staffId/roles')
  @RequirePermissions(['identity.write'])
  updateStaffRoles(
    @CurrentUser() actor: AccessTokenPayload,
    @Param('staffId') staffId: string,
    @Body() dto: UpdateStaffRolesDto,
  ) {
    return this.adminAccessService.updateStaffRoles(actor, staffId, dto);
  }

  @Patch('staff/:staffId/status')
  @RequirePermissions(['identity.write'])
  updateStaffStatus(
    @CurrentUser() actor: AccessTokenPayload,
    @Param('staffId') staffId: string,
    @Body() dto: UpdateStaffStatusDto,
  ) {
    return this.adminAccessService.updateStaffStatus(actor, staffId, dto);
  }
}
