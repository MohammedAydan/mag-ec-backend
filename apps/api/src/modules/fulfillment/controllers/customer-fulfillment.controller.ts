import { Controller, Get, Param, UseGuards } from '@nestjs/common';
import {
  ApiBearerAuth,
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
import { CustomerGuard } from '../../identity/guards/customer.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { FulfillmentResponseDto } from '../dto/fulfillment-response.dto';
import { FulfillmentService } from '../services/fulfillment.service';

@ApiTags('Fulfillment')
@ApiBearerAuth()
@ApiForbiddenResponse({ description: 'Customer-only resource; admin/staff tokens are rejected' })
@UseGuards(AuthGuard, CustomerGuard)
@Controller('orders/me/:orderId/shipments')
export class CustomerFulfillmentController {
  constructor(private readonly fulfillmentService: FulfillmentService) {}

  @Get()
  @ApiOperation({ summary: 'List my order shipments' })
  @ApiParam({ name: 'orderId', description: 'Order identifier' })
  @ApiOkResponse({ type: [FulfillmentResponseDto], description: 'List of shipments for the order' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiNotFoundResponse({ description: 'Order not found' })
  listMyShipments(
    @Param('orderId') orderId: string,
    @CurrentUser() currentUser: AccessTokenPayload,
  ): Promise<FulfillmentResponseDto[]> {
    return this.fulfillmentService.listCustomerShipments(orderId, currentUser.sub);
  }
}

