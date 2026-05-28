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
  @IsString()
  @IsNotEmpty()
  orderLineId!: string;

  @IsInt()
  @Min(1)
  quantity!: number;
}

export class CreateShipmentDto {
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(64)
  carrierKey?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(128)
  carrierName?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(128)
  trackingNumber?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  trackingUrl?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  notes?: string;

  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested({ each: true })
  @Type(() => CreateShipmentItemDto)
  items!: CreateShipmentItemDto[];
}

export class UpdateShipmentStatusDto {
  @IsString()
  @IsIn(shipmentStatuses)
  status!: (typeof shipmentStatuses)[number];

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @MaxLength(128)
  trackingNumber?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  trackingUrl?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  notes?: string;
}
