import { Inject, Injectable, BadRequestException, NotFoundException } from '@nestjs/common';
import { type Prisma } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';
import { TaskDispatcherService } from '../../queue/task-dispatcher.service';
import { ObjectStorageService } from '../../storage/object-storage.service';
import type { CreateReportExportDto, ListReportExportsQueryDto } from '../dto/reporting.dto';
import { ReportExportExecutionService } from './report-export-execution.service';

const reportExportInclude = {
  requestedBy: {
    select: {
      id: true,
      displayName: true,
      userType: true,
    },
  },
} satisfies Prisma.ReportExportInclude;

const allowedReportTypes = new Set([
  'sales_summary',
  'top_products',
  'promotion_performance',
  'inventory_kpis',
]);

@Injectable()
export class ReportingService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
    @Inject(TaskDispatcherService) private readonly taskDispatcher: TaskDispatcherService,
    @Inject(ReportExportExecutionService)
    private readonly executionService: ReportExportExecutionService,
    @Inject(ObjectStorageService)
    private readonly storage: ObjectStorageService,
  ) {}

  async getSalesSummary() {
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

    return {
      orders,
      orderLines,
      refunds,
    };
  }

  async getTopProducts() {
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

    return rows;
  }

  async getPromotionPerformance() {
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

    return rows;
  }

  async getInventoryKpis() {
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

    return {
      stock,
      warehouses,
    };
  }

  async createExport(actorUserId: string, dto: CreateReportExportDto) {
    if (!allowedReportTypes.has(dto.reportType)) {
      throw new BadRequestException('Unsupported report type');
    }

    const reportExport = await this.prisma.reportExport.create({
      data: {
        reportType: dto.reportType,
        parametersJson: (dto.parameters ?? {}) as Prisma.InputJsonValue,
        requestedByUserId: actorUserId,
        status: 'PENDING',
      },
      include: reportExportInclude,
    });

    if (this.taskDispatcher.usesQueue) {
      await this.taskDispatcher.generateReportExport(reportExport.id);
      return reportExport;
    }

    await this.executionService.execute(reportExport.id);
    return this.prisma.reportExport.findUniqueOrThrow({
      where: { id: reportExport.id },
      include: reportExportInclude,
    });
  }

  async createExportDownloadUrl(exportId: string) {
    const reportExport = await this.prisma.reportExport.findUnique({
      where: { id: exportId },
    });

    if (!reportExport) {
      throw new NotFoundException(`Report export "${exportId}" was not found`);
    }

    if (reportExport.status !== 'COMPLETED' || !reportExport.resultObjectKey) {
      throw new BadRequestException('Report export is not ready for download');
    }

    return {
      exportId: reportExport.id,
      downloadUrl: this.storage.createPrivateDownloadUrl(reportExport.resultObjectKey),
      expiresInSeconds: 300,
    };
  }

  async listExports(query: ListReportExportsQueryDto) {
    const exports = await this.prisma.reportExport.findMany({
      include: reportExportInclude,
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
      ...(query.cursor ? { cursor: { id: query.cursor }, skip: 1 } : {}),
      take: (query.limit ?? 20) + 1,
    });

    const hasNextPage = exports.length > (query.limit ?? 20);
    const items = hasNextPage ? exports.slice(0, query.limit ?? 20) : exports;

    return {
      items,
      nextCursor: hasNextPage ? (items[items.length - 1]?.id ?? null) : null,
    };
  }
}
