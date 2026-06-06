import { Body, Controller, Inject, Param, Post, UseGuards } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBadRequestResponse,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { SerializedOrderDto } from '../../orders/dto/order-response.dto';
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
  @ApiOperation({ summary: 'Admin cancel an order' })
  @ApiParam({ name: 'orderId', description: 'Order identifier' })
  @ApiOkResponse({ type: SerializedOrderDto, description: 'Order cancelled' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Order not found' })
  cancelOrder(
    @Param('orderId') orderId: string,
    @Body() dto: CancelOrderDto,
    @CurrentUser() user: AccessTokenPayload,
  ) {
    return this.orderCancellationService.cancelAdminOrder(orderId, user.sub, dto.reason);
  }
}
