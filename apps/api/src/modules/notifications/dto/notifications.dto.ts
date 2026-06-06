import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsBoolean, IsIn, IsNotEmpty, IsOptional, IsString, MaxLength } from 'class-validator';

const notificationChannels = ['EMAIL', 'PUSH', 'IN_APP'] as const;
const notificationStatuses = ['PENDING', 'PROCESSING', 'SENT', 'FAILED'] as const;
const pushPlatforms = ['android', 'ios', 'web'] as const;

export class UpsertNotificationPreferenceDto {
  @ApiProperty({ description: 'Notification channel to configure', enum: notificationChannels })
  @IsString()
  @IsIn(notificationChannels)
  channel!: (typeof notificationChannels)[number];

  @ApiPropertyOptional({ description: 'Enable or disable order confirmation notifications' })
  @IsOptional()
  @IsBoolean()
  orderConfirmations?: boolean;

  @ApiPropertyOptional({ description: 'Enable or disable order shipment notifications' })
  @IsOptional()
  @IsBoolean()
  orderShipments?: boolean;

  @ApiPropertyOptional({ description: 'Enable or disable order delivery notifications' })
  @IsOptional()
  @IsBoolean()
  orderDeliveries?: boolean;

  @ApiPropertyOptional({ description: 'Enable or disable return status update notifications' })
  @IsOptional()
  @IsBoolean()
  returnStatusUpdates?: boolean;

  @ApiPropertyOptional({ description: 'Enable or disable review reply notifications' })
  @IsOptional()
  @IsBoolean()
  reviewReplies?: boolean;

  @ApiPropertyOptional({ description: 'Enable or disable back-in-stock notifications' })
  @IsOptional()
  @IsBoolean()
  backInStock?: boolean;

  @ApiPropertyOptional({ description: 'Enable or disable low stock alert notifications' })
  @IsOptional()
  @IsBoolean()
  lowStockAlerts?: boolean;

  @ApiPropertyOptional({ description: 'Enable or disable promotional message notifications' })
  @IsOptional()
  @IsBoolean()
  promotionalMessages?: boolean;
}

export class ListNotificationsQueryDto {
  @ApiPropertyOptional({ description: 'Cursor for pagination' })
  @IsOptional()
  @IsString()
  cursor?: string;

  @ApiPropertyOptional({ description: 'Filter by notification status', enum: notificationStatuses })
  @IsOptional()
  @IsString()
  @IsIn(notificationStatuses)
  @MaxLength(32)
  status?: (typeof notificationStatuses)[number];

  @ApiPropertyOptional({ description: 'Filter by notification channel', enum: notificationChannels })
  @IsOptional()
  @IsString()
  @IsIn(notificationChannels)
  @MaxLength(32)
  channel?: (typeof notificationChannels)[number];
}

export class RegisterPushDeviceDto {
  @ApiProperty({ description: 'Push notification device token' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(512)
  token!: string;

  @ApiProperty({ description: 'Push device platform', enum: pushPlatforms })
  @IsString()
  @IsIn(pushPlatforms)
  platform!: (typeof pushPlatforms)[number];
}
