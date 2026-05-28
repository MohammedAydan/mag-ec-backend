import { Controller, Get, Inject, Query, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import {
  ListPaymentAttemptsQueryDto,
  ListPaymentWebhookEventsQueryDto,
  ListRefundsQueryDto,
} from '../dto/admin-payments-query.dto';
import { PaymentAdminService } from '../services/payment-admin.service';

@ApiTags('Payments Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['payments.read'])
@Controller('payments/admin')
export class AdminPaymentsController {
  constructor(@Inject(PaymentAdminService) private readonly paymentAdminService: PaymentAdminService) {}

  @Get('attempts')
  listAttempts(@Query() query: ListPaymentAttemptsQueryDto) {
    return this.paymentAdminService.listAttempts(query);
  }

  @Get('webhook-events')
  listWebhookEvents(@Query() query: ListPaymentWebhookEventsQueryDto) {
    return this.paymentAdminService.listWebhookEvents(query);
  }

  @Get('refunds')
  listRefunds(@Query() query: ListRefundsQueryDto) {
    return this.paymentAdminService.listRefunds(query);
  }
}
