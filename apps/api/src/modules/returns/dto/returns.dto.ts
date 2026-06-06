import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  ArrayMinSize,
  IsArray,
  IsBoolean,
  IsIn,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsString,
  MaxLength,
  Min,
  ValidateNested,
} from 'class-validator';

const returnRequestDecisions = ['approve', 'reject'] as const;
const returnDispositions = ['RESTOCK', 'INSPECT', 'DISCARD'] as const;

export class CreateReturnRequestItemDto {
  @ApiProperty({ description: 'Order line identifier to return' })
  @IsString()
  @IsNotEmpty()
  orderLineId!: string;

  @ApiProperty({ description: 'Quantity to return for this order line' })
  @IsInt()
  @Min(1)
  quantity!: number;

  @ApiPropertyOptional({ description: 'Requested disposition for the returned item', enum: returnDispositions })
  @IsOptional()
  @IsString()
  @IsIn(returnDispositions)
  requestedDisposition?: (typeof returnDispositions)[number];

  @ApiPropertyOptional({ description: 'Reason for returning this specific item' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  reason?: string;
}

export class CreateReturnRequestDto {
  @ApiProperty({ description: 'Overall reason for the return request' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(255)
  reason!: string;

  @ApiPropertyOptional({ description: 'Additional notes for the return request' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  notes?: string;

  @ApiProperty({ description: 'List of order line items to return', type: [CreateReturnRequestItemDto] })
  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested({ each: true })
  @Type(() => CreateReturnRequestItemDto)
  items!: CreateReturnRequestItemDto[];
}

export class ReviewReturnRequestDto {
  @ApiProperty({ description: 'Review decision for the return request', enum: returnRequestDecisions })
  @IsString()
  @IsIn(returnRequestDecisions)
  decision!: (typeof returnRequestDecisions)[number];

  @ApiPropertyOptional({ description: 'Internal review notes' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  reviewNotes?: string;

  @ApiPropertyOptional({ description: 'Reason for rejection (required when decision is reject)' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  rejectionReason?: string;
}

export class ReceiveReturnRequestItemDto {
  @ApiProperty({ description: 'Return request item identifier' })
  @IsString()
  @IsNotEmpty()
  returnRequestItemId!: string;

  @ApiProperty({ description: 'Quantity actually received' })
  @IsInt()
  @Min(0)
  receivedQuantity!: number;

  @ApiProperty({ description: 'Final disposition after inspection', enum: returnDispositions })
  @IsString()
  @IsIn(returnDispositions)
  finalDisposition!: (typeof returnDispositions)[number];

  @ApiPropertyOptional({ description: 'Warehouse identifier for restocking' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  warehouseId?: string;

  @ApiPropertyOptional({ description: 'Condition notes after inspection' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  conditionNotes?: string;
}

export class ReceiveReturnRequestDto {
  @ApiProperty({ description: 'List of received return items', type: [ReceiveReturnRequestItemDto] })
  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested({ each: true })
  @Type(() => ReceiveReturnRequestItemDto)
  items!: ReceiveReturnRequestItemDto[];
}

export class ExecuteReturnRefundDto {
  @ApiProperty({ description: 'Refund amount in the smallest currency unit (e.g., cents)' })
  @IsInt()
  @Min(1)
  amount!: number;

  @ApiPropertyOptional({ description: 'Reason for the refund' })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  reason?: string;

  @ApiPropertyOptional({
    description:
      'Set to true to override the automatic refund cap derived from received return items. Requires refunds.override_cap permission.',
  })
  @IsOptional()
  @IsBoolean()
  isOverride?: boolean;

  @ApiPropertyOptional({
    description:
      'Required when isOverride is true. Explains why the refund exceeds the received-items cap.',
  })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  overrideReason?: string;
}
