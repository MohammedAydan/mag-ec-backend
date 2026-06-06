import { Body, Controller, Get, Param, Patch, Post, UseGuards } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBadRequestResponse,
  ApiCreatedResponse,
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
import { CreateShipmentDto, UpdateShipmentStatusDto } from '../dto/fulfillment-admin.dto';
import { FulfillmentResponseDto } from '../dto/fulfillment-response.dto';
import { FulfillmentService } from '../services/fulfillment.service';

@ApiTags('Fulfillment Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@Controller('orders/admin/:orderId/shipments')
export class AdminFulfillmentController {
  constructor(private readonly fulfillmentService: FulfillmentService) {}

  @Get()
  @RequirePermissions(['orders.read'])
  @ApiOperation({ summary: 'List shipments for an order' })
  @ApiParam({ name: 'orderId', description: 'Order identifier' })
  @ApiOkResponse({ type: [FulfillmentResponseDto], description: 'List of shipments for the order' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiNotFoundResponse({ description: 'Order not found' })
  listShipments(@Param('orderId') orderId: string): Promise<FulfillmentResponseDto[]> {
    return this.fulfillmentService.listAdminShipments(orderId);
  }

  @Post()
  @RequirePermissions(['orders.write'])
  @ApiOperation({ summary: 'Create a shipment for an order' })
  @ApiParam({ name: 'orderId', description: 'Order identifier' })
  @ApiCreatedResponse({ type: FulfillmentResponseDto, description: 'Shipment created' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Order not found' })
  createShipment(
    @Param('orderId') orderId: string,
    @Body() dto: CreateShipmentDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ): Promise<FulfillmentResponseDto> {
    return this.fulfillmentService.createShipment(orderId, dto, currentUser.sub);
  }

  @Patch(':shipmentId/status')
  @RequirePermissions(['orders.write'])
  @ApiOperation({ summary: 'Update shipment status' })
  @ApiParam({ name: 'orderId', description: 'Order identifier' })
  @ApiParam({ name: 'shipmentId', description: 'Shipment identifier' })
  @ApiOkResponse({ type: FulfillmentResponseDto, description: 'Shipment status updated' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Order or shipment not found' })
  updateShipmentStatus(
    @Param('orderId') orderId: string,
    @Param('shipmentId') shipmentId: string,
    @Body() dto: UpdateShipmentStatusDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ): Promise<FulfillmentResponseDto> {
    return this.fulfillmentService.updateShipmentStatus(orderId, shipmentId, dto, currentUser.sub);
  }
}

