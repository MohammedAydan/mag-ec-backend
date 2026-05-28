import { mkdir, writeFile } from 'node:fs/promises';
import path from 'node:path';

import { Processor, WorkerHost } from '@nestjs/bullmq';
import { ReportExportStatus } from '@prisma/client';
import type { Job } from 'bullmq';
import { PinoLogger } from 'nestjs-pino';

import { PrismaService } from '../persistence/prisma.service';
import { WorkerStorageService } from '../storage/worker-storage.service';

const REPORT_EXPORT_QUEUE = 'report-export';

interface ReportExportJobData {
  reportExportId: string;
}

@Processor(REPORT_EXPORT_QUEUE)
export class ReportExportProcessor extends WorkerHost {
  constructor(
    private readonly prisma: PrismaService,
    private readonly logger: PinoLogger,
    private readonly storage: WorkerStorageService,
  ) {
    super();
  }

  async process(job: Job<ReportExportJobData>): Promise<void> {
    const { reportExportId } = job.data;

    if (!reportExportId) {
      this.logger.logger.warn(
        { jobId: job.id },
        'Report export job missing reportExportId, skipping.',
      );
      return;
    }

    const reportExport = await this.prisma.reportExport.findUnique({
      where: { id: reportExportId },
    });

    if (!reportExport) {
      this.logger.logger.warn({ reportExportId }, 'Report export was not found, skipping.');
      return;
    }

    if (reportExport.status === ReportExportStatus.COMPLETED) {
      this.logger.logger.info({ reportExportId }, 'Report export already completed, skipping.');
      return;
    }

    await this.prisma.reportExport.update({
      where: { id: reportExportId },
      data: {
        status: ReportExportStatus.PROCESSING,
        failureReason: null,
      },
    });

    try {
      const csv = await this.generateCsv(reportExport.reportType);
      const filename = `${reportExportId}.csv`;
      const objectKey = `reports/${filename}`;

      if (this.storage.usesObjectStorage) {
        this.logger.logger.info(
          { reportExportId, reportType: reportExport.reportType },
          'Uploading report export to private object storage.',
        );
        await this.storage.putPrivateObject(objectKey, csv, 'text/csv; charset=utf-8');
      } else {
        this.logger.logger.warn(
          { reportExportId, reportType: reportExport.reportType },
          'Writing report export to local disk; this mode is for development only.',
        );
        const reportsDir = path.resolve(process.cwd(), 'tmp', 'reports');
        await mkdir(reportsDir, { recursive: true });
        await writeFile(path.join(reportsDir, filename), csv, 'utf8');
      }

      await this.prisma.reportExport.update({
        where: { id: reportExportId },
        data: {
          status: ReportExportStatus.COMPLETED,
          completedAt: new Date(),
          resultObjectKey: this.storage.usesObjectStorage ? objectKey : `tmp/reports/${filename}`,
          failureReason: null,
        },
      });
    } catch (error) {
      const failureReason = error instanceof Error ? error.message : 'Unknown export failure';

      this.logger.logger.error({ reportExportId, err: error }, 'Report export processing failed.');

      await this.prisma.reportExport.update({
        where: { id: reportExportId },
        data: {
          status: ReportExportStatus.FAILED,
          failureReason,
        },
      });

      throw error;
    }
  }

  private async generateCsv(reportType: string) {
    switch (reportType) {
      case 'sales_summary':
        return this.generateSalesSummaryCsv();
      case 'top_products':
        return this.generateTopProductsCsv();
      case 'promotion_performance':
        return this.generatePromotionPerformanceCsv();
      case 'inventory_kpis':
        return this.generateInventoryKpisCsv();
      default:
        throw new Error(`Unsupported report type: ${reportType}`);
    }
  }

  private async generateSalesSummaryCsv() {
    const [orders, orderLines, refunds] = await Promise.all([
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
        _sum: {
          quantity: true,
          lineSubtotalAmount: true,
          taxAmount: true,
        },
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
        ['order_lines_count', orderLines._count._all ?? 0],
        ['order_lines_quantity', orderLines._sum.quantity ?? 0],
        ['order_lines_subtotal_amount', orderLines._sum.lineSubtotalAmount ?? 0],
        ['order_lines_tax_amount', orderLines._sum.taxAmount ?? 0],
        ['refunds_count', refunds._count._all ?? 0],
        ['refunds_amount', refunds._sum.amount ?? 0],
      ],
    );
  }

  private async generateTopProductsCsv() {
    const rows = await this.prisma.orderLine.groupBy({
      by: ['productId', 'productName'],
      _sum: {
        quantity: true,
        lineSubtotalAmount: true,
      },
      orderBy: {
        _sum: {
          quantity: 'desc',
        },
      },
      take: 10,
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

  private async generatePromotionPerformanceCsv() {
    const rows = await this.prisma.orderAppliedPromotion.groupBy({
      by: ['promotionId', 'key', 'name', 'source'],
      _count: { _all: true },
      _sum: { discountAmount: true },
      orderBy: {
        _sum: {
          discountAmount: 'desc',
        },
      },
      take: 10,
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

  private async generateInventoryKpisCsv() {
    const [stock, warehouses] = await Promise.all([
      this.prisma.stockLevel.aggregate({
        _count: { _all: true },
        _sum: {
          quantityOnHand: true,
          quantityReserved: true,
        },
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

  private toCsv(headers: string[], rows: Array<Array<string | number | null>>) {
    const dataRows = rows.map((row) => row.map((value) => this.escapeCsvCell(value)).join(','));
    return [headers.join(','), ...dataRows].join('\n') + '\n';
  }

  private escapeCsvCell(value: string | number | null) {
    if (value === null) {
      return '';
    }

    let stringValue = String(value);
    if (/^[=+\-@\t\r]/.test(stringValue)) {
      stringValue = `'${stringValue}`;
    }

    return /[",\n]/.test(stringValue) ? `"${stringValue.replace(/"/g, '""')}"` : stringValue;
  }
}
