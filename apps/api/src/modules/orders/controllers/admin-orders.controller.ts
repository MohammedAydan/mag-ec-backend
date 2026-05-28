import { Controller, Get, Inject, Param, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import { OrderService } from '../services/order.service';

@ApiTags('Orders Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['orders.read'])
@Controller('orders/admin')
export class AdminOrdersController {
  constructor(@Inject(OrderService) private readonly orderService: OrderService) {}

  @Get()
  listOrders() {
    return this.orderService.listAdminOrders();
  }

  @Get(':orderId')
  getOrder(@Param('orderId') orderId: string) {
    return this.orderService.getAdminOrder(orderId);
  }
}
