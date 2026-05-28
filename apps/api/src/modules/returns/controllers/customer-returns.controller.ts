import { Body, Controller, Get, Inject, Param, Post, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { CreateReturnRequestDto } from '../dto/returns.dto';
import { ReturnsService } from '../services/returns.service';

@ApiTags('Returns')
@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('returns/me')
export class CustomerReturnsController {
  constructor(@Inject(ReturnsService) private readonly returnsService: ReturnsService) {}

  @Get()
  listMyReturns(@CurrentUser() currentUser: AccessTokenPayload) {
    return this.returnsService.listCustomerReturns(currentUser.sub);
  }

  @Get(':returnRequestId')
  getMyReturn(
    @Param('returnRequestId') returnRequestId: string,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.returnsService.getCustomerReturn(returnRequestId, currentUser.sub);
  }

  @Post('orders/:orderId')
  createReturn(
    @Param('orderId') orderId: string,
    @Body() dto: CreateReturnRequestDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    return this.returnsService.createCustomerReturn(orderId, currentUser.sub, dto);
  }
}
