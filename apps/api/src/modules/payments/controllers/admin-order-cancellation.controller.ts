import { Body, Controller, Inject, Param, Post, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { CancelOrderDto } from '../dto/cancel-order.dto';
import { OrderCancellationService } from '../services/order-cancellation.service';

@ApiTags('Orders Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['orders.write'])
@Controller('orders/admin')
export class AdminOrderCancellationController {
  constructor(@Inject(OrderCancellationService) private readonly orderCancellationService: OrderCancellationService) {}

  @Post(':orderId/cancel')
  cancelOrder(
    @Param('orderId') orderId: string,
    @Body() dto: CancelOrderDto,
    @CurrentUser() user: AccessTokenPayload,
  ) {
    return this.orderCancellationService.cancelAdminOrder(orderId, user.sub, dto.reason);
  }
}
