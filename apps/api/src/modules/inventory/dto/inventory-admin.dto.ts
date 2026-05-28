import {
  IsIn,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsString,
  Max,
  MaxLength,
  Min,
  NotEquals,
} from 'class-validator';
import { Type } from 'class-transformer';

const stockMovementTypes = ['RECEIPT', 'ADJUSTMENT', 'SALE', 'RETURN_RESTOCK', 'WASTE'] as const;
const stockReservationStatuses = ['RESERVED', 'REDEEMED', 'RELEASED', 'EXPIRED'] as const;

export class AdjustStockDto {
  @IsString()
  @IsNotEmpty()
  warehouseId!: string;

  @IsString()
  @IsNotEmpty()
  variantId!: string;

  @IsInt()
  @NotEquals(0, { message: 'quantityChanged must not be zero' })
  quantityChanged!: number;

  @IsString()
  @IsIn(stockMovementTypes)
  type!: (typeof stockMovementTypes)[number];

  @IsOptional()
  @IsString()
  @MaxLength(64)
  referenceType?: string;

  @IsOptional()
  @IsString()
  @MaxLength(64)
  referenceId?: string;

  @IsOptional()
  @IsString()
  @MaxLength(255)
  reason?: string;
}

export class QueryStockLevelsDto {
  @IsOptional()
  @IsString()
  warehouseId?: string;

  @IsOptional()
  @IsString()
  variantId?: string;

  @IsOptional()
  @IsString()
  sku?: string;
}

export class QueryStockMovementsDto {
  @IsOptional()
  @IsString()
  warehouseId?: string;

  @IsOptional()
  @IsString()
  variantId?: string;

  @IsOptional()
  @IsString()
  @IsIn(stockMovementTypes)
  type?: (typeof stockMovementTypes)[number];

  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  page?: number;

  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  limit?: number;
}

export class QueryStockReservationsDto {
  @IsOptional()
  @IsString()
  warehouseId?: string;

  @IsOptional()
  @IsString()
  variantId?: string;

  @IsOptional()
  @IsString()
  @IsIn(stockReservationStatuses)
  status?: (typeof stockReservationStatuses)[number];

  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number;
}
