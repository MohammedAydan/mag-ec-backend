import { ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsIn, IsInt, IsOptional, IsString, Max, Min } from 'class-validator';

const paymentAttemptStatuses = [
  'AWAITING_CUSTOMER_ACTION',
  'PROCESSING',
  'SUCCEEDED',
  'FAILED',
  'CANCELLED',
] as const;
const paymentProviders = ['COD', 'STRIPE'] as const;
const webhookStatuses = ['RECEIVED', 'PROCESSED', 'DUPLICATE', 'FAILED'] as const;
const refundStatuses = ['PENDING', 'SUCCEEDED', 'FAILED'] as const;

class PaymentAdminPageQueryDto {
  @ApiPropertyOptional({ type: String, description: 'Pagination cursor (opaque token from previous page)' })
  @IsOptional()
  @IsString()
  cursor?: string;

  @ApiPropertyOptional({ type: 'integer', minimum: 1, maximum: 100, description: 'Page size (1-100, default server-defined)' })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number;

  @ApiPropertyOptional({ type: String, description: 'Filter by order ID' })
  @IsOptional()
  @IsString()
  orderId?: string;
}

export class ListPaymentAttemptsQueryDto extends PaymentAdminPageQueryDto {
  @ApiPropertyOptional({
    enum: paymentAttemptStatuses,
    description: 'Filter by payment-attempt status',
  })
  @IsOptional()
  @IsIn(paymentAttemptStatuses)
  status?: (typeof paymentAttemptStatuses)[number];

  @ApiPropertyOptional({
    enum: paymentProviders,
    description: 'Filter by payment provider',
  })
  @IsOptional()
  @IsIn(paymentProviders)
  provider?: (typeof paymentProviders)[number];
}

export class ListPaymentWebhookEventsQueryDto extends PaymentAdminPageQueryDto {
  @ApiPropertyOptional({
    enum: webhookStatuses,
    description: 'Filter by webhook-event status',
  })
  @IsOptional()
  @IsIn(webhookStatuses)
  status?: (typeof webhookStatuses)[number];

  @ApiPropertyOptional({
    enum: paymentProviders,
    description: 'Filter by payment provider',
  })
  @IsOptional()
  @IsIn(paymentProviders)
  provider?: (typeof paymentProviders)[number];
}

export class ListRefundsQueryDto extends PaymentAdminPageQueryDto {
  @ApiPropertyOptional({
    enum: refundStatuses,
    description: 'Filter by refund status',
  })
  @IsOptional()
  @IsIn(refundStatuses)
  status?: (typeof refundStatuses)[number];

  @ApiPropertyOptional({
    enum: paymentProviders,
    description: 'Filter by payment provider',
  })
  @IsOptional()
  @IsIn(paymentProviders)
  provider?: (typeof paymentProviders)[number];
}
