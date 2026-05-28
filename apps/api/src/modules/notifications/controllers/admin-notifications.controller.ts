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
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import { ListNotificationsQueryDto } from '../dto/notifications.dto';
import { NotificationsService } from '../services/notifications.service';

@ApiTags('Notifications Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['notifications.read'])
@Controller('notifications/admin')
export class AdminNotificationsController {
  constructor(@Inject(NotificationsService) private readonly notificationsService: NotificationsService) {}

  @Get()
  listNotifications(@Query() query: ListNotificationsQueryDto) {
    return this.notificationsService.listAdminNotifications(query);
  }

  @Post(':notificationId/retry')
  @HttpCode(HttpStatus.OK)
  @RequirePermissions(['notifications.write'])
  retryNotification(@Param('notificationId') notificationId: string) {
    return this.notificationsService.retryFailedNotification(notificationId);
  }
}
