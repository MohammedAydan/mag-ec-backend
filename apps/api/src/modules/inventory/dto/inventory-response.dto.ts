import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

// ─── Stock Adjustment ─────────────────────────────────────────────────────────

export class StockAdjustmentResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  warehouseId!: string;

  @ApiProperty({ type: String })
  variantId!: string;

  @ApiProperty({ type: String })
  type!: string;

  @ApiProperty({ type: Number })
  quantityChanged!: number;

  @ApiPropertyOptional({ type: String, nullable: true })
  referenceType!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  referenceId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  actorUserId!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;
}

// ─── Stock Movement Item ──────────────────────────────────────────────────────

export class StockMovementVariantDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  sku!: string;
}

export class StockMovementWarehouseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;
}

export class StockMovementActorDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  displayName!: string;

  @ApiProperty({ type: String })
  email!: string;
}

export class StockMovementItemDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  type!: string;

  @ApiProperty({ type: Number })
  quantityChanged!: number;

  @ApiPropertyOptional({ type: String, nullable: true })
  referenceType!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  referenceId!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: () => StockMovementVariantDto })
  variant!: StockMovementVariantDto;

  @ApiProperty({ type: () => StockMovementWarehouseDto })
  warehouse!: StockMovementWarehouseDto;

  @ApiPropertyOptional({ type: () => StockMovementActorDto, nullable: true })
  actorUser!: StockMovementActorDto | null;
}

// ─── Paginated Stock Movements ────────────────────────────────────────────────

export class PaginationDto {
  @ApiProperty({ type: 'integer' })
  page!: number;

  @ApiProperty({ type: 'integer' })
  limit!: number;

  @ApiProperty({ type: 'integer' })
  total!: number;

  @ApiProperty({ type: 'integer' })
  totalPages!: number;
}

export class PaginatedStockMovementsDto {
  @ApiProperty({ type: () => [StockMovementItemDto] })
  items!: StockMovementItemDto[];

  @ApiProperty({ type: () => PaginationDto })
  pagination!: PaginationDto;
}

// ─── Stock Levels ─────────────────────────────────────────────────────────────

export class StockLevelWarehouseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;
}

export class StockLevelVariantDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  sku!: string;

  @ApiProperty({ type: Boolean })
  isDefault!: boolean;
}

export class StockLevelResponseDto {
  @ApiProperty({ type: String })
  warehouseId!: string;

  @ApiProperty({ type: String })
  variantId!: string;

  @ApiProperty({ type: Number })
  quantityAvailable!: number;

  @ApiProperty({ type: Number })
  quantityReserved!: number;

  @ApiProperty({ type: Number })
  quantityIncoming!: number;

  @ApiProperty({ type: () => StockLevelWarehouseDto })
  warehouse!: StockLevelWarehouseDto;

  @ApiProperty({ type: () => StockLevelVariantDto })
  variant!: StockLevelVariantDto;
}

// ─── Stock Reservations ────────────────────────────────────────────────────────

export class StockReservationWarehouseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;
}

export class StockReservationVariantDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  sku!: string;
}

export class StockReservationUserDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  email!: string;

  @ApiProperty({ type: String })
  displayName!: string;
}

export class StockReservationResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  warehouseId!: string;

  @ApiProperty({ type: String })
  variantId!: string;

  @ApiProperty({ type: Number })
  quantity!: number;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  expiresAt!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: () => StockReservationWarehouseDto })
  warehouse!: StockReservationWarehouseDto;

  @ApiProperty({ type: () => StockReservationVariantDto })
  variant!: StockReservationVariantDto;

  @ApiPropertyOptional({ type: () => StockReservationUserDto, nullable: true })
  user!: StockReservationUserDto | null;
}
