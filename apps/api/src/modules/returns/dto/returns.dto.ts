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

const returnRequestDecisions = ['approve', 'reject'] as const;
const returnDispositions = ['RESTOCK', 'INSPECT', 'DISCARD'] as const;

export class CreateReturnRequestItemDto {
  @IsString()
  @IsNotEmpty()
  orderLineId!: string;

  @IsInt()
  @Min(1)
  quantity!: number;

  @IsOptional()
  @IsString()
  @IsIn(returnDispositions)
  requestedDisposition?: (typeof returnDispositions)[number];

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  reason?: string;
}

export class CreateReturnRequestDto {
  @IsString()
  @IsNotEmpty()
  @MaxLength(255)
  reason!: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  notes?: string;

  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested({ each: true })
  @Type(() => CreateReturnRequestItemDto)
  items!: CreateReturnRequestItemDto[];
}

export class ReviewReturnRequestDto {
  @IsString()
  @IsIn(returnRequestDecisions)
  decision!: (typeof returnRequestDecisions)[number];

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  reviewNotes?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  rejectionReason?: string;
}

export class ReceiveReturnRequestItemDto {
  @IsString()
  @IsNotEmpty()
  returnRequestItemId!: string;

  @IsInt()
  @Min(0)
  receivedQuantity!: number;

  @IsString()
  @IsIn(returnDispositions)
  finalDisposition!: (typeof returnDispositions)[number];

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  warehouseId?: string;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  conditionNotes?: string;
}

export class ReceiveReturnRequestDto {
  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested({ each: true })
  @Type(() => ReceiveReturnRequestItemDto)
  items!: ReceiveReturnRequestItemDto[];
}

export class ExecuteReturnRefundDto {
  @IsInt()
  @Min(1)
  amount!: number;

  @IsOptional()
  @IsString()
  @IsNotEmpty()
  reason?: string;
}
