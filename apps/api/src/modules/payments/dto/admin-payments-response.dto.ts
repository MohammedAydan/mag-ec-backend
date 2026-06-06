import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class OrderBriefDto {
  @ApiProperty({ type: String })
  orderNumber!: string;

  @ApiProperty({ type: String })
  paymentStatus!: string;

  @ApiProperty({ type: String })
  status!: string;
}

export class PaymentAttemptResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  orderId!: string;

  @ApiProperty({ type: String })
  provider!: string;

  @ApiProperty({ type: String })
  method!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: String })
  currencyCode!: string;

  @ApiProperty({ type: Number })
  amount!: number;

  @ApiPropertyOptional({ type: String, nullable: true })
  providerPaymentId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  providerIntentStatus!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  providerReference!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  lastErrorCode!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  lastErrorMessage!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  succeededAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  failedAt!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;

  @ApiProperty({ type: () => OrderBriefDto })
  order!: OrderBriefDto;
}

export class PaymentWebhookEventResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  provider!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  externalEventId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  eventType!: string | null;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  paymentAttemptId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  orderId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  processingError!: string | null;

  @ApiProperty({ type: String })
  receivedAt!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  processedAt!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

export class RefundResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  orderId!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  paymentAttemptId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  returnRequestId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  requestedByUserId!: string | null;

  @ApiProperty({ type: String })
  provider!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: Number })
  amount!: number;

  @ApiProperty({ type: String })
  currencyCode!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  reason!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  providerRefundId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  providerReference!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  failureReason!: string | null;

  @ApiProperty({ type: String })
  requestedAt!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  processedAt!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;

  @ApiProperty({ type: () => OrderBriefDto })
  order!: OrderBriefDto;
}

export class PaginatedPaymentAttemptsDto {
  @ApiProperty({ type: () => [PaymentAttemptResponseDto] })
  items!: PaymentAttemptResponseDto[];

  @ApiPropertyOptional({ type: String, nullable: true })
  nextCursor!: string | null;
}

export class PaginatedPaymentWebhookEventsDto {
  @ApiProperty({ type: () => [PaymentWebhookEventResponseDto] })
  items!: PaymentWebhookEventResponseDto[];

  @ApiPropertyOptional({ type: String, nullable: true })
  nextCursor!: string | null;
}

export class PaginatedRefundsDto {
  @ApiProperty({ type: () => [RefundResponseDto] })
  items!: RefundResponseDto[];

  @ApiPropertyOptional({ type: String, nullable: true })
  nextCursor!: string | null;
}
