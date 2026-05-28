import { IsBoolean, IsIn, IsNotEmpty, IsOptional, IsString, MaxLength } from 'class-validator';

const notificationChannels = ['EMAIL', 'PUSH', 'IN_APP'] as const;
const notificationStatuses = ['PENDING', 'PROCESSING', 'SENT', 'FAILED'] as const;
const pushPlatforms = ['android', 'ios', 'web'] as const;

export class UpsertNotificationPreferenceDto {
  @IsString()
  @IsIn(notificationChannels)
  channel!: (typeof notificationChannels)[number];

  @IsOptional()
  @IsBoolean()
  orderConfirmations?: boolean;

  @IsOptional()
  @IsBoolean()
  orderShipments?: boolean;

  @IsOptional()
  @IsBoolean()
  orderDeliveries?: boolean;

  @IsOptional()
  @IsBoolean()
  returnStatusUpdates?: boolean;

  @IsOptional()
  @IsBoolean()
  reviewReplies?: boolean;

  @IsOptional()
  @IsBoolean()
  backInStock?: boolean;

  @IsOptional()
  @IsBoolean()
  lowStockAlerts?: boolean;

  @IsOptional()
  @IsBoolean()
  promotionalMessages?: boolean;
}

export class ListNotificationsQueryDto {
  @IsOptional()
  @IsString()
  cursor?: string;

  @IsOptional()
  @IsString()
  @IsIn(notificationStatuses)
  @MaxLength(32)
  status?: (typeof notificationStatuses)[number];

  @IsOptional()
  @IsString()
  @IsIn(notificationChannels)
  @MaxLength(32)
  channel?: (typeof notificationChannels)[number];
}

export class RegisterPushDeviceDto {
  @IsString()
  @IsNotEmpty()
  @MaxLength(512)
  token!: string;

  @IsString()
  @IsIn(pushPlatforms)
  platform!: (typeof pushPlatforms)[number];
}
