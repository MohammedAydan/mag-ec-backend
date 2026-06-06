import { Body, Controller, Get, HttpCode, HttpStatus, Inject, Param, Post, UseGuards } from '@nestjs/common';
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
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import {
  ExecuteReturnRefundDto,
  ReceiveReturnRequestDto,
  ReviewReturnRequestDto,
} from '../dto/returns.dto';
import { ReturnRequestResponseDto } from '../dto/returns-response.dto';
import { ReturnsService } from '../services/returns.service';

@ApiTags('Returns Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@Controller('returns/admin')
export class AdminReturnsController {
  constructor(@Inject(ReturnsService) private readonly returnsService: ReturnsService) {}

  @Get()
  @RequirePermissions(['returns.read'])
  @ApiOperation({ summary: 'List all return requests' })
  @ApiOkResponse({ type: [ReturnRequestResponseDto], description: 'List of all return requests' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  listReturns() {
    return this.returnsService.listAdminReturns();
  }

  @Get(':returnRequestId')
  @RequirePermissions(['returns.read'])
  @ApiOperation({ summary: 'Get a return request by ID' })
  @ApiParam({ name: 'returnRequestId', description: 'Return request identifier' })
  @ApiOkResponse({ type: ReturnRequestResponseDto, description: 'Return request details' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiNotFoundResponse({ description: 'Return request not found' })
  getReturn(@Param('returnRequestId') returnRequestId: string) {
    return this.returnsService.getAdminReturn(returnRequestId);
  }

  @Post(':returnRequestId/review')
  @HttpCode(HttpStatus.OK)
  @RequirePermissions(['returns.write'])
  @ApiOperation({ summary: 'Review a return request' })
  @ApiParam({ name: 'returnRequestId', description: 'Return request identifier' })
  @ApiOkResponse({ type: ReturnRequestResponseDto, description: 'Return request reviewed' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Return request not found' })
  reviewReturn(
    @Param('returnRequestId') returnRequestId: string,
    @Body() dto: ReviewReturnRequestDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.returnsService.reviewReturnRequest(returnRequestId, dto, currentUser.sub);
  }

  @Post(':returnRequestId/receive')
  @HttpCode(HttpStatus.OK)
  @RequirePermissions(['returns.write', 'inventory.write'])
  @ApiOperation({ summary: 'Receive a return request' })
  @ApiParam({ name: 'returnRequestId', description: 'Return request identifier' })
  @ApiOkResponse({ type: ReturnRequestResponseDto, description: 'Return request received' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Return request not found' })
  receiveReturn(
    @Param('returnRequestId') returnRequestId: string,
    @Body() dto: ReceiveReturnRequestDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.returnsService.receiveReturnRequest(returnRequestId, dto, currentUser.sub);
  }

  @Post(':returnRequestId/refund')
  @HttpCode(HttpStatus.OK)
  @RequirePermissions(['returns.write', 'refunds.write'])
  @ApiOperation({ summary: 'Execute a refund for a return request' })
  @ApiParam({ name: 'returnRequestId', description: 'Return request identifier' })
  @ApiOkResponse({ type: ReturnRequestResponseDto, description: 'Return refund executed' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Return request not found' })
  refundReturn(
    @Param('returnRequestId') returnRequestId: string,
    @Body() dto: ExecuteReturnRefundDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.returnsService.executeReturnRefund(
      returnRequestId,
      dto,
      currentUser.sub,
      currentUser.permissions,
    );
  }
}
