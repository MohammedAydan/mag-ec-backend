import { Body, Controller, Get, Inject, Param, Post, UseGuards } from '@nestjs/common';
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
import { AuthGuard } from '../../identity/guards/auth.guard';
import { CustomerGuard } from '../../identity/guards/customer.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { CreateReturnRequestDto } from '../dto/returns.dto';
import { ReturnRequestResponseDto } from '../dto/returns-response.dto';
import { ReturnsService } from '../services/returns.service';

@ApiTags('Returns')
@ApiBearerAuth()
@ApiForbiddenResponse({ description: 'Customer-only resource; admin/staff tokens are rejected' })
@UseGuards(AuthGuard, CustomerGuard)
@Controller('returns/me')
export class CustomerReturnsController {
  constructor(@Inject(ReturnsService) private readonly returnsService: ReturnsService) {}

  @Get()
  @ApiOperation({ summary: 'List my return requests' })
  @ApiOkResponse({ type: [ReturnRequestResponseDto], description: 'List of customer return requests' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  listMyReturns(@CurrentUser() currentUser: AccessTokenPayload) {
    return this.returnsService.listCustomerReturns(currentUser.sub);
  }

  @Get(':returnRequestId')
  @ApiOperation({ summary: 'Get a return request by ID' })
  @ApiParam({ name: 'returnRequestId', description: 'Return request identifier' })
  @ApiOkResponse({ type: ReturnRequestResponseDto, description: 'Return request details' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiNotFoundResponse({ description: 'Return request not found' })
  getMyReturn(
    @Param('returnRequestId') returnRequestId: string,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.returnsService.getCustomerReturn(returnRequestId, currentUser.sub);
  }

  @Post('orders/:orderId')
  @ApiOperation({ summary: 'Create a return request for an order' })
  @ApiParam({ name: 'orderId', description: 'Order identifier' })
  @ApiCreatedResponse({ type: ReturnRequestResponseDto, description: 'Return request created' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Order not found' })
  createReturn(
    @Param('orderId') orderId: string,
    @Body() dto: CreateReturnRequestDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.returnsService.createCustomerReturn(orderId, currentUser.sub, dto);
  }
}

