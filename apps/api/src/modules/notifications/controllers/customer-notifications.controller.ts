import { Body, Controller, Delete, Get, Inject, Param, Post, Put, Query, UseGuards } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBadRequestResponse,
  ApiCreatedResponse,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { CustomerGuard } from '../../identity/guards/customer.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import {
  ListNotificationsQueryDto,
  RegisterPushDeviceDto,
  UpsertNotificationPreferenceDto,
} from '../dto/notifications.dto';
import {
  NotificationPreferenceResponseDto,
  PushDeviceResponseDto,
  UnregisterPushDeviceResponseDto,
  PaginatedNotificationsDto,
} from '../dto/notifications-response.dto';
import { NotificationsService } from '../services/notifications.service';

@ApiTags('Notifications')
@ApiBearerAuth()
@ApiForbiddenResponse({ description: 'Customer-only resource; admin/staff tokens are rejected' })
@UseGuards(AuthGuard, CustomerGuard)
@Controller('notifications')
export class CustomerNotificationsController {
  constructor(@Inject(NotificationsService) private readonly notificationsService: NotificationsService) {}

  @Get('me')
  @ApiOperation({ summary: 'List my notifications' })
  @ApiOkResponse({ type: PaginatedNotificationsDto, description: 'Paginated list of notifications' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  listMyNotifications(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Query() query: ListNotificationsQueryDto,
  ) {
    return this.notificationsService.listMyNotifications(currentUser.sub, query);
  }

  @Get('me/preferences')
  @ApiOperation({ summary: 'Get my notification preferences' })
  @ApiOkResponse({ type: NotificationPreferenceResponseDto, description: 'Notification preferences' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  getPreference(@CurrentUser() currentUser: AccessTokenPayload) {
    return this.notificationsService.getMyPreference(currentUser.sub);
  }

  @Put('me/preferences')
  @ApiOperation({ summary: 'Upsert notification preferences' })
  @ApiOkResponse({ type: NotificationPreferenceResponseDto, description: 'Updated notification preferences' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  upsertPreference(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Body() dto: UpsertNotificationPreferenceDto,
  ) {
    return this.notificationsService.upsertMyPreference(currentUser.sub, dto);
  }

  @Post('me/push-devices')
  @ApiOperation({ summary: 'Register a push device' })
  @ApiCreatedResponse({ type: PushDeviceResponseDto, description: 'Push device registered' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  registerPushDevice(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Body() dto: RegisterPushDeviceDto,
  ) {
    return this.notificationsService.registerMyPushDevice(currentUser.sub, dto);
  }

  @Delete('me/push-devices/:deviceId')
  @ApiOperation({ summary: 'Unregister a push device' })
  @ApiParam({ name: 'deviceId', description: 'Push device identifier' })
  @ApiOkResponse({ type: UnregisterPushDeviceResponseDto, description: 'Push device unregistered' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiNotFoundResponse({ description: 'Push device not found' })
  unregisterPushDevice(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Param('deviceId') deviceId: string,
  ) {
    return this.notificationsService.unregisterMyPushDevice(currentUser.sub, deviceId);
  }
}

