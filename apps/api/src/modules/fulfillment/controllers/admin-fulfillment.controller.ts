import { Body, Controller, Get, Param, Patch, Post, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { CreateShipmentDto, UpdateShipmentStatusDto } from '../dto/fulfillment-admin.dto';
import { FulfillmentService } from '../services/fulfillment.service';

@ApiTags('Fulfillment Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@Controller('orders/admin/:orderId/shipments')
export class AdminFulfillmentController {
  constructor(private readonly fulfillmentService: FulfillmentService) {}

  @Get()
  @RequirePermissions(['orders.read'])
  listShipments(@Param('orderId') orderId: string) {
    return this.fulfillmentService.listAdminShipments(orderId);
  }

  @Post()
  @RequirePermissions(['orders.write'])
  createShipment(
    @Param('orderId') orderId: string,
    @Body() dto: CreateShipmentDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.fulfillmentService.createShipment(orderId, dto, currentUser.sub);
  }

  @Patch(':shipmentId/status')
  @RequirePermissions(['orders.write'])
  updateShipmentStatus(
    @Param('orderId') orderId: string,
    @Param('shipmentId') shipmentId: string,
    @Body() dto: UpdateShipmentStatusDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.fulfillmentService.updateShipmentStatus(orderId, shipmentId, dto, currentUser.sub);
  }
}
