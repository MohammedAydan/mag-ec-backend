import { Controller, Get, Param, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { FulfillmentService } from '../services/fulfillment.service';

@ApiTags('Fulfillment')
@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('orders/me/:orderId/shipments')
export class CustomerFulfillmentController {
  constructor(private readonly fulfillmentService: FulfillmentService) {}

  @Get()
  listMyShipments(
    @Param('orderId') orderId: string,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.fulfillmentService.listCustomerShipments(orderId, currentUser.sub);
  }
}
