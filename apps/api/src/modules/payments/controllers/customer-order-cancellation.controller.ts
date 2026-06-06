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
import { AuthGuard } from '../../identity/guards/auth.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { SerializedOrderDto } from '../../orders/dto/order-response.dto';
import { CancelOrderDto } from '../dto/cancel-order.dto';
import { OrderCancellationService } from '../services/order-cancellation.service';

@ApiTags('Orders')
@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('orders/me')
export class CustomerOrderCancellationController {
  constructor(@Inject(OrderCancellationService) private readonly orderCancellationService: OrderCancellationService) {}

  @Post(':orderId/cancel')
  @ApiOperation({ summary: 'Cancel an order' })
  @ApiParam({ name: 'orderId', description: 'Order identifier' })
  @ApiOkResponse({ type: SerializedOrderDto, description: 'Order cancelled' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Order cannot be cancelled by this authenticated user' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Order not found' })
  cancelOrder(
    @Param('orderId') orderId: string,
    @Body() dto: CancelOrderDto,
    @CurrentUser() user: AccessTokenPayload,
  ) {
    return this.orderCancellationService.cancelCustomerOrder(orderId, user.sub, dto.reason);
  }
}
