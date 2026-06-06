import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class NotificationPreferenceResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  userId!: string;

  @ApiProperty({ type: String })
  channel!: string;

  @ApiProperty({ type: Boolean })
  orderConfirmations!: boolean;

  @ApiProperty({ type: Boolean })
  orderShipments!: boolean;

  @ApiProperty({ type: Boolean })
  orderDeliveries!: boolean;

  @ApiProperty({ type: Boolean })
  returnStatusUpdates!: boolean;

  @ApiProperty({ type: Boolean })
  reviewReplies!: boolean;

  @ApiProperty({ type: Boolean })
  backInStock!: boolean;

  @ApiProperty({ type: Boolean })
  lowStockAlerts!: boolean;

  @ApiProperty({ type: Boolean })
  promotionalMessages!: boolean;

  @ApiProperty({ type: Date })
  createdAt!: Date;

  @ApiProperty({ type: Date })
  updatedAt!: Date;
}

export class NotificationUserBriefDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  email!: string;

  @ApiProperty({ type: String })
  displayName!: string;

  @ApiProperty({ type: String })
  userType!: string;
}

export class NotificationResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  userId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  recipientEmail!: string | null;

  @ApiProperty({ type: String })
  channel!: string;

  @ApiProperty({ type: String })
  eventType!: string;

  @ApiProperty({ type: String })
  title!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  body!: string | null;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  relatedEntityType!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  relatedEntityId!: string | null;

  @ApiProperty({ type: String })
  deduplicationKey!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  lastError!: string | null;

  @ApiProperty({ type: Number })
  attempts!: number;

  @ApiPropertyOptional({ type: String, nullable: true })
  availableAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  processedAt!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;

  @ApiPropertyOptional({ type: () => NotificationUserBriefDto, nullable: true })
  user?: NotificationUserBriefDto | null;
}

export class PushDeviceResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  userId!: string;

  @ApiProperty({ type: String })
  token!: string;

  @ApiProperty({ type: String })
  platform!: string;

  @ApiProperty({ type: Boolean })
  isActive!: boolean;

  @ApiProperty({ type: Date })
  createdAt!: Date;

  @ApiProperty({ type: Date })
  updatedAt!: Date;
}

export class UnregisterPushDeviceResponseDto {
  @ApiProperty({ type: Boolean })
  removed!: boolean;
}

export class PaginatedNotificationsDto {
  @ApiProperty({ type: () => [NotificationResponseDto] })
  items!: NotificationResponseDto[];

  @ApiPropertyOptional({ type: String, nullable: true })
  nextCursor!: string | null;
}
