import { mkdir, writeFile } from 'node:fs/promises';
import path from 'node:path';

import { Inject, Injectable } from '@nestjs/common';
import { ReportExportStatus } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';
import { ObjectStorageService } from '../../storage/object-storage.service';

@Injectable()
export class ReportExportExecutionService {
  constructor(
    @Inject(PrismaService) private readonly prisma: PrismaService,
    @Inject(ObjectStorageService) private readonly storage: ObjectStorageService,
  ) {}

  async execute(reportExportId: string): Promise<void> {
    const claimed = await this.prisma.reportExport.updateMany({
      where: {
        id: reportExportId,
        status: { in: [ReportExportStatus.PENDING, ReportExportStatus.FAILED] },
      },
      data: { status: ReportExportStatus.PROCESSING, failureReason: null },
    });
    if (claimed.count !== 1) return;

    const reportExport = await this.prisma.reportExport.findUniqueOrThrow({
      where: { id: reportExportId },
    });
    try {
      const csv = await this.generateCsv(reportExport.reportType);
      const objectKey = `reports/${reportExportId}.csv`;
      if (this.storage.usesObjectStorage) {
        await this.storage.putPrivateObject(objectKey, csv, 'text/csv; charset=utf-8');
      } else {
        const reportsDir = path.resolve(process.cwd(), 'tmp', 'reports');
        await mkdir(reportsDir, { recursive: true });
        await writeFile(path.join(reportsDir, `${reportExportId}.csv`), csv, 'utf8');
      }
      await this.prisma.reportExport.update({
        where: { id: reportExportId },
        data: {
          status: ReportExportStatus.COMPLETED,
          completedAt: new Date(),
          resultObjectKey: this.storage.usesObjectStorage
            ? objectKey
            : `tmp/reports/${reportExportId}.csv`,
          failureReason: null,
        },
      });
    } catch (error) {
      await this.prisma.reportExport.update({
        where: { id: reportExportId },
        data: {
          status: ReportExportStatus.FAILED,
          failureReason: error instanceof Error ? error.message : 'Report export failed',
        },
      });
      throw error;
    }
  }

  private async generateCsv(reportType: string): Promise<string> {
    switch (reportType) {
      case 'sales_summary':
        return this.salesSummary();
      case 'top_products':
        return this.topProducts();
      case 'promotion_performance':
        return this.promotionPerformance();
      case 'inventory_kpis':
        return this.inventoryKpis();
      default:
        throw new Error(`Unsupported report type: ${reportType}`);
    }
  }

  private async salesSummary(): Promise<string> {
    const [orders, lines, refunds] = await Promise.all([
      this.prisma.order.aggregate({
        _count: { _all: true },
        _sum: {
          grandTotalAmount: true,
          subtotalAmount: true,
          taxAmount: true,
          shippingAmount: true,
        },
      }),
      this.prisma.orderLine.aggregate({
        _count: { _all: true },
        _sum: { quantity: true, lineSubtotalAmount: true, taxAmount: true },
      }),
      this.prisma.refund.aggregate({
        where: { status: 'SUCCEEDED' },
        _count: { _all: true },
        _sum: { amount: true },
      }),
    ]);
    return this.toCsv(
      ['metric', 'value'],
      [
        ['orders_count', orders._count._all ?? 0],
        ['orders_grand_total_amount', orders._sum.grandTotalAmount ?? 0],
        ['orders_subtotal_amount', orders._sum.subtotalAmount ?? 0],
        ['orders_tax_amount', orders._sum.taxAmount ?? 0],
        ['orders_shipping_amount', orders._sum.shippingAmount ?? 0],
        ['order_lines_count', lines._count._all ?? 0],
        ['order_lines_quantity', lines._sum.quantity ?? 0],
        ['order_lines_subtotal_amount', lines._sum.lineSubtotalAmount ?? 0],
        ['refunds_count', refunds._count._all ?? 0],
        ['refunds_amount', refunds._sum.amount ?? 0],
      ],
    );
  }

  private async topProducts(): Promise<string> {
    const rows = await this.prisma.orderLine.groupBy({
      by: ['productId', 'productName'],
      _sum: { quantity: true, lineSubtotalAmount: true },
      orderBy: { _sum: { quantity: 'desc' } },
      take: 100,
    });
    return this.toCsv(
      ['productId', 'productName', 'quantitySold', 'subtotalAmount'],
      rows.map((row) => [
        row.productId,
        row.productName,
        row._sum.quantity ?? 0,
        row._sum.lineSubtotalAmount ?? 0,
      ]),
    );
  }

  private async promotionPerformance(): Promise<string> {
    const rows = await this.prisma.orderAppliedPromotion.groupBy({
      by: ['promotionId', 'key', 'name', 'source'],
      _count: { _all: true },
      _sum: { discountAmount: true },
      orderBy: { _sum: { discountAmount: 'desc' } },
      take: 100,
    });
    return this.toCsv(
      ['promotionId', 'key', 'name', 'source', 'applications', 'discountAmount'],
      rows.map((row) => [
        row.promotionId,
        row.key,
        row.name,
        row.source,
        row._count._all ?? 0,
        row._sum.discountAmount ?? 0,
      ]),
    );
  }

  private async inventoryKpis(): Promise<string> {
    const [stock, warehouses] = await Promise.all([
      this.prisma.stockLevel.aggregate({
        _count: { _all: true },
        _sum: { quantityOnHand: true, quantityReserved: true },
      }),
      this.prisma.warehouse.count(),
    ]);
    return this.toCsv(
      ['metric', 'value'],
      [
        ['stock_levels_count', stock._count._all ?? 0],
        ['quantity_on_hand', stock._sum.quantityOnHand ?? 0],
        ['quantity_reserved', stock._sum.quantityReserved ?? 0],
        ['warehouses_count', warehouses],
      ],
    );
  }

  private toCsv(headers: string[], rows: Array<Array<string | number | null>>): string {
    return (
      [
        headers.join(','),
        ...rows.map((row) => row.map((value) => this.escape(value)).join(',')),
      ].join('\n') + '\n'
    );
  }
  private escape(value: string | number | null): string {
    if (value === null) return '';
    let output = String(value);
    if (/^[=+\-@\t\r]/.test(output)) output = `'${output}`;
    return /[",\n]/.test(output) ? `"${output.replace(/"/g, '""')}"` : output;
  }
}
