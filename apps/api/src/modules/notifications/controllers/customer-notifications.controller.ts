import { Body, Controller, Delete, Get, Inject, Param, Post, Put, Query, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import {
  ListNotificationsQueryDto,
  RegisterPushDeviceDto,
  UpsertNotificationPreferenceDto,
} from '../dto/notifications.dto';
import { NotificationsService } from '../services/notifications.service';

@ApiTags('Notifications')
@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('notifications')
export class CustomerNotificationsController {
  constructor(@Inject(NotificationsService) private readonly notificationsService: NotificationsService) {}

  @Get('me')
  listMyNotifications(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Query() query: ListNotificationsQueryDto,
  ) {
    return this.notificationsService.listMyNotifications(currentUser.sub, query);
  }

  @Get('me/preferences')
  getPreference(@CurrentUser() currentUser: AccessTokenPayload) {
    return this.notificationsService.getMyPreference(currentUser.sub);
  }

  @Put('me/preferences')
  upsertPreference(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Body() dto: UpsertNotificationPreferenceDto,
  ) {
    return this.notificationsService.upsertMyPreference(currentUser.sub, dto);
  }

  @Post('me/push-devices')
  registerPushDevice(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Body() dto: RegisterPushDeviceDto,
  ) {
    return this.notificationsService.registerMyPushDevice(currentUser.sub, dto);
  }

  @Delete('me/push-devices/:deviceId')
  unregisterPushDevice(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Param('deviceId') deviceId: string,
  ) {
    return this.notificationsService.unregisterMyPushDevice(currentUser.sub, deviceId);
  }
}
