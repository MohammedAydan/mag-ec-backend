import { Body, Controller, Get, Inject, Param, Post, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

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
import { ReturnsService } from '../services/returns.service';

@ApiTags('Returns Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@Controller('returns/admin')
export class AdminReturnsController {
  constructor(@Inject(ReturnsService) private readonly returnsService: ReturnsService) {}

  @Get()
  @RequirePermissions(['returns.read'])
  listReturns() {
    return this.returnsService.listAdminReturns();
  }

  @Get(':returnRequestId')
  @RequirePermissions(['returns.read'])
  getReturn(@Param('returnRequestId') returnRequestId: string) {
    return this.returnsService.getAdminReturn(returnRequestId);
  }

  @Post(':returnRequestId/review')
  @RequirePermissions(['returns.write'])
  reviewReturn(
    @Param('returnRequestId') returnRequestId: string,
    @Body() dto: ReviewReturnRequestDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.returnsService.reviewReturnRequest(returnRequestId, dto, currentUser.sub);
  }

  @Post(':returnRequestId/receive')
  @RequirePermissions(['returns.write', 'inventory.write'])
  receiveReturn(
    @Param('returnRequestId') returnRequestId: string,
    @Body() dto: ReceiveReturnRequestDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.returnsService.receiveReturnRequest(returnRequestId, dto, currentUser.sub);
  }

  @Post(':returnRequestId/refund')
  @RequirePermissions(['returns.write'])
  refundReturn(
    @Param('returnRequestId') returnRequestId: string,
    @Body() dto: ExecuteReturnRefundDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.returnsService.executeReturnRefund(returnRequestId, dto, currentUser.sub);
  }
}
