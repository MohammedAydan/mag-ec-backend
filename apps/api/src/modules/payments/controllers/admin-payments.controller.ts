import { Controller, Get, Inject, Query, UseGuards } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiForbiddenResponse,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import {
  ListPaymentAttemptsQueryDto,
  ListPaymentWebhookEventsQueryDto,
  ListRefundsQueryDto,
} from '../dto/admin-payments-query.dto';
import {
  PaginatedPaymentAttemptsDto,
  PaginatedPaymentWebhookEventsDto,
  PaginatedRefundsDto,
} from '../dto/admin-payments-response.dto';
import { PaymentAdminService } from '../services/payment-admin.service';

@ApiTags('Payments Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['payments.read'])
@Controller('payments/admin')
export class AdminPaymentsController {
  constructor(@Inject(PaymentAdminService) private readonly paymentAdminService: PaymentAdminService) {}

  @Get('attempts')
  @ApiOperation({ summary: 'List all payment attempts' })
  @ApiOkResponse({ type: PaginatedPaymentAttemptsDto, description: 'Paginated list of payment attempts' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  listAttempts(@Query() query: ListPaymentAttemptsQueryDto) {
    return this.paymentAdminService.listAttempts(query);
  }

  @Get('webhook-events')
  @ApiOperation({ summary: 'List all payment webhook events' })
  @ApiOkResponse({ type: PaginatedPaymentWebhookEventsDto, description: 'Paginated list of payment webhook events' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  listWebhookEvents(@Query() query: ListPaymentWebhookEventsQueryDto) {
    return this.paymentAdminService.listWebhookEvents(query);
  }

  @Get('refunds')
  @ApiOperation({ summary: 'List all refunds' })
  @ApiOkResponse({ type: PaginatedRefundsDto, description: 'Paginated list of refunds' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  listRefunds(@Query() query: ListRefundsQueryDto) {
    return this.paymentAdminService.listRefunds(query);
  }
}

