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
  @IsOptional()
  @IsString()
  cursor?: string;

  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number;

  @IsOptional()
  @IsString()
  orderId?: string;
}

export class ListPaymentAttemptsQueryDto extends PaymentAdminPageQueryDto {
  @IsOptional()
  @IsIn(paymentAttemptStatuses)
  status?: (typeof paymentAttemptStatuses)[number];

  @IsOptional()
  @IsIn(paymentProviders)
  provider?: (typeof paymentProviders)[number];
}

export class ListPaymentWebhookEventsQueryDto extends PaymentAdminPageQueryDto {
  @IsOptional()
  @IsIn(webhookStatuses)
  status?: (typeof webhookStatuses)[number];

  @IsOptional()
  @IsIn(paymentProviders)
  provider?: (typeof paymentProviders)[number];
}

export class ListRefundsQueryDto extends PaymentAdminPageQueryDto {
  @IsOptional()
  @IsIn(refundStatuses)
  status?: (typeof refundStatuses)[number];

  @IsOptional()
  @IsIn(paymentProviders)
  provider?: (typeof paymentProviders)[number];
}
