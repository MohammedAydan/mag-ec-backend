import { Body, Controller, Get, Inject, Param, Patch, Post, UseGuards } from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiExtension,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

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
import {
  AdminCustomerSummaryDto,
  AdminPermissionDto,
  AdminRoleDto,
  InvitationSentResponseDto,
  StaffDetailDto,
  StaffStatusResponseDto,
  StaffSummaryDto,
} from '../dto/identity-response.dto';

@ApiTags('Identity Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['identity.read'])
@Controller('identity/admin')
export class AdminAccessController {
  constructor(@Inject(AdminAccessService) private readonly adminAccessService: AdminAccessService) {}

  @Get('permissions')
  @ApiOperation({ summary: 'List all available admin permissions' })
  @ApiOkResponse({ type: [AdminPermissionDto], description: 'All available permissions' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Missing required role or permission' })
  listPermissions(): Promise<AdminPermissionDto[]> {
    return this.adminAccessService.listPermissions();
  }

  @Get('roles')
  @ApiOperation({ summary: 'List all admin roles' })
  @ApiOkResponse({ type: [AdminRoleDto], description: 'All admin roles' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Missing required role or permission' })
  listRoles(): Promise<AdminRoleDto[]> {
    return this.adminAccessService.listRoles();
  }

  @Post('roles')
  @RequirePermissions(['identity.write'])
  @ApiOperation({ summary: 'Create a new admin role' })
  @ApiCreatedResponse({ type: AdminRoleDto, description: 'Role created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Missing required role or permission' })
  createRole(@CurrentUser() actor: AccessTokenPayload, @Body() dto: CreateAdminRoleDto): Promise<AdminRoleDto> {
    return this.adminAccessService.createRole(actor, dto);
  }

  @Patch('roles/:roleId/permissions')
  @RequirePermissions(['identity.write'])
  @ApiOperation({ summary: 'Update an admin role\'s permission set' })
  @ApiParam({ name: 'roleId', description: 'UUID of the admin role to update' })
  @ApiOkResponse({ type: AdminRoleDto, description: 'Role permissions updated' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Missing required role or permission' })
  @ApiNotFoundResponse({ description: 'Requested role not found' })
  updateRolePermissions(
    @CurrentUser() actor: AccessTokenPayload,
    @Param('roleId') roleId: string,
    @Body() dto: UpdateAdminRolePermissionsDto,
  ): Promise<AdminRoleDto> {
    return this.adminAccessService.updateRolePermissions(actor, roleId, dto);
  }

  @Get('staff')
  @ApiOperation({ summary: 'List all staff members' })
  @ApiOkResponse({ type: [StaffSummaryDto], description: 'All staff members' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Missing required role or permission' })
  listStaff(): Promise<StaffSummaryDto[]> {
    return this.adminAccessService.listStaff();
  }

  @Get('customers')
  @ApiOperation({ summary: 'List all customers' })
  @ApiOkResponse({ type: [AdminCustomerSummaryDto], description: 'All customers' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Missing required role or permission' })
  listCustomers() {
    return this.adminAccessService.listCustomers();
  }

  @Post('staff/invitations')
  @RequirePermissions(['identity.write'])
  @ApiOperation({ summary: 'Create a staff member invitation' })
  @ApiCreatedResponse({ type: StaffSummaryDto, description: 'Staff invitation created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Missing required role or permission' })
  inviteStaff(
    @CurrentUser() actor: AccessTokenPayload,
    @Body() dto: InviteStaffDto,
  ): Promise<StaffSummaryDto> {
    return this.adminAccessService.inviteStaff(actor, dto);
  }

  @Post('staff/:staffId/resend-invitation')
  @RequirePermissions(['identity.write'])
  @ApiOperation({ summary: 'Resend a staff member invitation' })
  @ApiParam({ name: 'staffId', description: 'UUID of the staff member to resend invitation to' })
  @ApiOkResponse({ type: InvitationSentResponseDto, description: 'Invitation resent' })
  @ApiBadRequestResponse({ description: 'Invalid request parameters' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Missing required role or permission' })
  @ApiNotFoundResponse({ description: 'Requested staff member not found' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  resendStaffInvitation(
    @CurrentUser() actor: AccessTokenPayload,
    @Param('staffId') staffId: string,
    @Body() _body?: Record<string, unknown>,
  ): Promise<InvitationSentResponseDto> {
    return this.adminAccessService.resendStaffInvitation(actor, staffId);
  }

  @Patch('staff/:staffId/roles')
  @RequirePermissions(['identity.write'])
  @ApiOperation({ summary: 'Update a staff member\'s role assignments' })
  @ApiParam({ name: 'staffId', description: 'UUID of the staff member to update' })
  @ApiOkResponse({ type: StaffDetailDto, description: 'Staff roles updated' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Missing required role or permission' })
  @ApiNotFoundResponse({ description: 'Requested staff member not found' })
  updateStaffRoles(
    @CurrentUser() actor: AccessTokenPayload,
    @Param('staffId') staffId: string,
    @Body() dto: UpdateStaffRolesDto,
  ): Promise<StaffDetailDto> {
    return this.adminAccessService.updateStaffRoles(actor, staffId, dto);
  }

  @Patch('staff/:staffId/status')
  @RequirePermissions(['identity.write'])
  @ApiOperation({ summary: 'Update a staff member\'s account status' })
  @ApiParam({ name: 'staffId', description: 'UUID of the staff member to update' })
  @ApiOkResponse({ type: StaffStatusResponseDto, description: 'Staff status updated' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Missing required role or permission' })
  @ApiNotFoundResponse({ description: 'Requested staff member not found' })
  updateStaffStatus(
    @CurrentUser() actor: AccessTokenPayload,
    @Param('staffId') staffId: string,
    @Body() dto: UpdateStaffStatusDto,
  ): Promise<StaffStatusResponseDto> {
    return this.adminAccessService.updateStaffStatus(actor, staffId, dto);
  }
}
