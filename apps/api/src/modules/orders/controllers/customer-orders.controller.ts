import { Controller, Get, Inject, Param, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { OrderService } from '../services/order.service';

@ApiTags('Orders')
@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('orders')
export class CustomerOrdersController {
  constructor(@Inject(OrderService) private readonly orderService: OrderService) {}

  @Get('me')
  listMyOrders(@CurrentUser() currentUser: AccessTokenPayload) {
    return this.orderService.listCustomerOrders(currentUser.sub);
  }

  @Get('me/:orderId')
  getMyOrder(@Param('orderId') orderId: string, @CurrentUser() currentUser: AccessTokenPayload) {
    return this.orderService.getCustomerOrder(orderId, currentUser.sub);
  }
}
