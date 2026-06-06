import { Controller, Get, Inject, Param, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiForbiddenResponse, ApiNotFoundResponse, ApiOkResponse, ApiOperation, ApiParam, ApiTags, ApiUnauthorizedResponse } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { CustomerGuard } from '../../identity/guards/customer.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { OrderService } from '../services/order.service';
import { SerializedOrderDto } from '../dto/order-response.dto';

@ApiTags('Orders')
@ApiBearerAuth()
@ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
@ApiForbiddenResponse({ description: 'Customer-only resource; admin/staff tokens are rejected' })
@UseGuards(AuthGuard, CustomerGuard)
@Controller('orders')
export class CustomerOrdersController {
  constructor(@Inject(OrderService) private readonly orderService: OrderService) {}

  @Get('me')
  @ApiOperation({ summary: 'List authenticated customer orders' })
  @ApiOkResponse({ type: [SerializedOrderDto], description: 'List of customer orders' })
  listMyOrders(@CurrentUser() currentUser: AccessTokenPayload) {
    return this.orderService.listCustomerOrders(currentUser.sub);
  }

  @Get('me/:orderId')
  @ApiOperation({ summary: 'Get a single customer order by ID' })
  @ApiParam({ name: 'orderId', description: 'Order ID', required: true })
  @ApiOkResponse({ type: SerializedOrderDto, description: 'Customer order details' })
  @ApiNotFoundResponse({ description: 'Order not found' })
  getMyOrder(@Param('orderId') orderId: string, @CurrentUser() currentUser: AccessTokenPayload) {
    return this.orderService.getCustomerOrder(orderId, currentUser.sub);
  }
}

