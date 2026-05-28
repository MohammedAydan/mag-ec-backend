import { Body, Controller, Inject, Param, Post, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { CancelOrderDto } from '../dto/cancel-order.dto';
import { OrderCancellationService } from '../services/order-cancellation.service';

@ApiTags('Orders')
@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('orders/me')
export class CustomerOrderCancellationController {
  constructor(@Inject(OrderCancellationService) private readonly orderCancellationService: OrderCancellationService) {}

  @Post(':orderId/cancel')
  cancelOrder(
    @Param('orderId') orderId: string,
    @Body() dto: CancelOrderDto,
    @CurrentUser() user: AccessTokenPayload,
  ) {
    return this.orderCancellationService.cancelCustomerOrder(orderId, user.sub, dto.reason);
  }
}
