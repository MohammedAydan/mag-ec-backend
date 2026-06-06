import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  ArrayMinSize,
  IsArray,
  IsIn,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsString,
  MaxLength,
  Min,
  ValidateNested,
} from 'class-validator';

const shipmentStatuses = ['PENDING', 'SHIPPED', 'DELIVERED', 'CANCELLED'] as const;

export class CreateShipmentItemDto {
  @ApiProperty({ description: 'Order line identifier to include in the shipment' })
  @IsString()
  @IsNotEmpty()
  orderLineId!: string;

  @ApiProperty({ description: 'Quantity to ship for this order line' })
  @IsInt()
  @Min(1)
  quantity!: number;
}

export class CreateShipmentDto {
  @ApiPropertyOptional({ description: 'Carrier service key (e.g., ups_ground)' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(64)
  carrierKey?: string;

  @ApiPropertyOptional({ description: 'Human-readable carrier name' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(128)
  carrierName?: string;

  @ApiPropertyOptional({ description: 'Shipment tracking number' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(128)
  trackingNumber?: string;

  @ApiPropertyOptional({ description: 'Tracking URL for the shipment' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  trackingUrl?: string;

  @ApiPropertyOptional({ description: 'Internal notes about the shipment' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  notes?: string;

  @ApiProperty({ description: 'Shipment line items', type: [CreateShipmentItemDto] })
  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested({ each: true })
  @Type(() => CreateShipmentItemDto)
  items!: CreateShipmentItemDto[];
}

export class UpdateShipmentStatusDto {
  @ApiProperty({ enum: shipmentStatuses })
  @IsString()
  @IsIn(shipmentStatuses)
  status!: (typeof shipmentStatuses)[number];

  @ApiPropertyOptional({ type: String })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(128)
  trackingNumber?: string;

  @ApiPropertyOptional({ type: String })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  trackingUrl?: string;

  @ApiPropertyOptional({ type: String })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  notes?: string;
}
