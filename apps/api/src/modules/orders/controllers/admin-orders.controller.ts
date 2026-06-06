import { Controller, Get, Inject, Param, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiForbiddenResponse, ApiNotFoundResponse, ApiOkResponse, ApiOperation, ApiParam, ApiTags, ApiUnauthorizedResponse } from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import { OrderService } from '../services/order.service';
import { SerializedOrderDto } from '../dto/order-response.dto';

@ApiTags('Orders Admin')
@ApiBearerAuth()
@ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
@ApiForbiddenResponse({ description: 'Insufficient permissions' })
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['orders.read'])
@Controller('orders/admin')
export class AdminOrdersController {
  constructor(@Inject(OrderService) private readonly orderService: OrderService) {}

  @Get()
  @ApiOperation({ summary: 'List all orders (admin view)' })
  @ApiOkResponse({ type: [SerializedOrderDto], description: 'List of all orders (admin view)' })
  listOrders() {
    return this.orderService.listAdminOrders();
  }

  @Get(':orderId')
  @ApiOperation({ summary: 'Get a single order by ID (admin view)' })
  @ApiParam({ name: 'orderId', description: 'Order ID', required: true })
  @ApiOkResponse({ type: SerializedOrderDto, description: 'Order details (admin view)' })
  @ApiNotFoundResponse({ description: 'Order not found' })
  getOrder(@Param('orderId') orderId: string) {
    return this.orderService.getAdminOrder(orderId);
  }
}

