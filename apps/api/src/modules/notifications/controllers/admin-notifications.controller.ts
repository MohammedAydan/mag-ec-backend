import {
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Inject,
  Param,
  Post,
  Query,
  UseGuards,
} from '@nestjs/common';
import {
  ApiExtension,
  ApiBearerAuth,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import { ListNotificationsQueryDto } from '../dto/notifications.dto';
import { PaginatedNotificationsDto, NotificationResponseDto } from '../dto/notifications-response.dto';
import { NotificationsService } from '../services/notifications.service';

@ApiTags('Notifications Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['notifications.read'])
@Controller('notifications/admin')
export class AdminNotificationsController {
  constructor(@Inject(NotificationsService) private readonly notificationsService: NotificationsService) {}

  @Get()
  @ApiOperation({ summary: 'List all notifications' })
  @ApiOkResponse({ type: PaginatedNotificationsDto, description: 'Paginated list of notifications' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  listNotifications(@Query() query: ListNotificationsQueryDto) {
    return this.notificationsService.listAdminNotifications(query);
  }

  @Post(':notificationId/retry')
  @HttpCode(HttpStatus.OK)
  @RequirePermissions(['notifications.write'])
  @ApiOperation({
    summary: 'Retry a failed notification',
  })
  @ApiParam({ name: 'notificationId', description: 'Notification identifier' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  @ApiOkResponse({ type: NotificationResponseDto, description: 'Notification retry initiated' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiNotFoundResponse({ description: 'Notification not found' })
  retryNotification(@Param('notificationId') notificationId: string) {
    return this.notificationsService.retryFailedNotification(notificationId);
  }
}
