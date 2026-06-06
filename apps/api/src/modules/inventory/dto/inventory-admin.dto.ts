import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
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
  @ApiProperty({ description: 'Warehouse identifier' })
  @IsString()
  @IsNotEmpty()
  warehouseId!: string;

  @ApiProperty({ description: 'Catalog variant identifier' })
  @IsString()
  @IsNotEmpty()
  variantId!: string;

  @ApiProperty({ description: 'Quantity change (positive or negative, must not be zero)' })
  @IsInt()
  @NotEquals(0, { message: 'quantityChanged must not be zero' })
  quantityChanged!: number;

  @ApiProperty({ description: 'Movement type', enum: stockMovementTypes })
  @IsString()
  @IsIn(stockMovementTypes)
  type!: (typeof stockMovementTypes)[number];

  @ApiPropertyOptional({ description: 'Reference type for traceability (e.g. order, return)' })
  @IsOptional()
  @IsString()
  @MaxLength(64)
  referenceType?: string;

  @ApiPropertyOptional({ description: 'Reference identifier for traceability' })
  @IsOptional()
  @IsString()
  @MaxLength(64)
  referenceId?: string;

  @ApiPropertyOptional({ description: 'Human-readable reason for the adjustment' })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  reason?: string;
}

export class QueryStockLevelsDto {
  @ApiPropertyOptional({ description: 'Filter by warehouse identifier' })
  @IsOptional()
  @IsString()
  warehouseId?: string;

  @ApiPropertyOptional({ description: 'Filter by variant identifier' })
  @IsOptional()
  @IsString()
  variantId?: string;

  @ApiPropertyOptional({ description: 'Filter by variant SKU' })
  @IsOptional()
  @IsString()
  sku?: string;
}

export class QueryStockMovementsDto {
  @ApiPropertyOptional({ description: 'Filter by warehouse identifier' })
  @IsOptional()
  @IsString()
  warehouseId?: string;

  @ApiPropertyOptional({ description: 'Filter by variant identifier' })
  @IsOptional()
  @IsString()
  variantId?: string;

  @ApiPropertyOptional({ description: 'Filter by movement type', enum: stockMovementTypes })
  @IsOptional()
  @IsString()
  @IsIn(stockMovementTypes)
  type?: (typeof stockMovementTypes)[number];

  @ApiPropertyOptional({ type: 'integer', minimum: 1, description: 'Page number (1-based)' })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  page?: number;

  @ApiPropertyOptional({ type: 'integer', minimum: 1, description: 'Results per page (minimum 1)' })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  limit?: number;
}

export class QueryStockReservationsDto {
  @ApiPropertyOptional({ description: 'Filter by warehouse identifier' })
  @IsOptional()
  @IsString()
  warehouseId?: string;

  @ApiPropertyOptional({ description: 'Filter by variant identifier' })
  @IsOptional()
  @IsString()
  variantId?: string;

  @ApiPropertyOptional({ description: 'Filter by reservation status', enum: stockReservationStatuses })
  @IsOptional()
  @IsString()
  @IsIn(stockReservationStatuses)
  status?: (typeof stockReservationStatuses)[number];

  @ApiPropertyOptional({ type: 'integer', minimum: 1, maximum: 100, description: 'Maximum results to return (1-100)' })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number;
}
