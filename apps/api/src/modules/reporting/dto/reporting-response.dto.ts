import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class ReportingCountMetricDto {
  @ApiProperty({ type: Number })
  _all!: number;
}

export class SalesSummaryAmountSumDto {
  @ApiPropertyOptional({ type: Number, nullable: true })
  grandTotalAmount?: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  subtotalAmount?: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  taxAmount?: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  shippingAmount?: number | null;
}

export class SalesSummaryMetricDto {
  @ApiProperty({ type: () => ReportingCountMetricDto })
  _count!: ReportingCountMetricDto;

  @ApiProperty({ type: () => SalesSummaryAmountSumDto })
  _sum!: SalesSummaryAmountSumDto;
}

export class SalesSummaryLinesSumDto {
  @ApiPropertyOptional({ type: Number, nullable: true })
  quantity?: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  lineSubtotalAmount?: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  taxAmount?: number | null;
}

export class SalesSummaryLinesMetricDto {
  @ApiProperty({ type: () => ReportingCountMetricDto })
  _count!: ReportingCountMetricDto;

  @ApiProperty({ type: () => SalesSummaryLinesSumDto })
  _sum!: SalesSummaryLinesSumDto;
}

export class SalesSummaryRefundsSumDto {
  @ApiPropertyOptional({ type: Number, nullable: true })
  amount?: number | null;
}

export class SalesSummaryRefundsMetricDto {
  @ApiProperty({ type: () => ReportingCountMetricDto })
  _count!: ReportingCountMetricDto;

  @ApiProperty({ type: () => SalesSummaryRefundsSumDto })
  _sum!: SalesSummaryRefundsSumDto;
}

export class SalesSummaryResponseDto {
  @ApiProperty({ type: () => SalesSummaryMetricDto })
  orders!: SalesSummaryMetricDto;

  @ApiProperty({ type: () => SalesSummaryLinesMetricDto })
  orderLines!: SalesSummaryLinesMetricDto;

  @ApiProperty({ type: () => SalesSummaryRefundsMetricDto })
  refunds!: SalesSummaryRefundsMetricDto;
}

export class InventoryKpisStockSumDto {
  @ApiPropertyOptional({ type: Number, nullable: true })
  quantityOnHand?: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  quantityReserved?: number | null;
}

export class InventoryKpisStockMetricDto {
  @ApiProperty({ type: () => ReportingCountMetricDto })
  _count!: ReportingCountMetricDto;

  @ApiProperty({ type: () => InventoryKpisStockSumDto })
  _sum!: InventoryKpisStockSumDto;
}

export class InventoryKpisResponseDto {
  @ApiProperty({ type: () => InventoryKpisStockMetricDto })
  stock!: InventoryKpisStockMetricDto;

  @ApiProperty({ type: Number })
  warehouses!: number;
}

export class ReportExportUserBriefDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  displayName!: string;

  @ApiProperty({ type: String })
  userType!: string;
}

export class ReportExportResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  reportType!: string;

  @ApiProperty({ type: Object })
  parametersJson!: Record<string, unknown>;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  resultObjectKey!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  errorMessage!: string | null;

  @ApiProperty({ type: String })
  requestedByUserId!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  startedAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  completedAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  failedAt!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;

  @ApiProperty({ type: () => ReportExportUserBriefDto })
  requestedBy!: ReportExportUserBriefDto;
}

export class ReportExportDownloadResponseDto {
  @ApiProperty({ type: String })
  exportId!: string;

  @ApiProperty({ type: String })
  downloadUrl!: string;

  @ApiProperty({ type: Number })
  expiresInSeconds!: number;
}

export class PaginatedReportExportsDto {
  @ApiProperty({ type: () => [ReportExportResponseDto] })
  items!: ReportExportResponseDto[];

  @ApiPropertyOptional({ type: String, nullable: true })
  nextCursor!: string | null;
}

export class TopProductSumDto {
  @ApiPropertyOptional({ type: Number, nullable: true })
  quantity?: number | null;

  @ApiPropertyOptional({ type: Number, nullable: true })
  lineSubtotalAmount?: number | null;
}

export class TopProductDto {
  @ApiProperty({ type: String })
  productId!: string;

  @ApiProperty({ type: String })
  productName!: string;

  @ApiProperty({ type: () => TopProductSumDto })
  _sum!: TopProductSumDto;
}

export class PromotionPerformanceSumDto {
  @ApiPropertyOptional({ type: Number, nullable: true })
  discountAmount?: number | null;
}

export class PromotionPerformanceDto {
  @ApiProperty({ type: String })
  promotionId!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;

  @ApiProperty({ type: String })
  source!: string;

  @ApiProperty({ type: () => ReportingCountMetricDto })
  _count!: ReportingCountMetricDto;

  @ApiProperty({ type: () => PromotionPerformanceSumDto })
  _sum!: PromotionPerformanceSumDto;
}
