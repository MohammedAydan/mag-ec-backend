import { Body, Controller, Get, Inject, Param, Post, Query, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { CreateReportExportDto, ListReportExportsQueryDto } from '../dto/reporting.dto';
import { ReportingService } from '../services/reporting.service';

@ApiTags('Reporting Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['reports.read'])
@Controller('reports/admin')
export class AdminReportingController {
  constructor(@Inject(ReportingService) private readonly reportingService: ReportingService) {}

  @Get('sales-summary')
  getSalesSummary() {
    return this.reportingService.getSalesSummary();
  }

  @Get('top-products')
  getTopProducts() {
    return this.reportingService.getTopProducts();
  }

  @Get('promotion-performance')
  getPromotionPerformance() {
    return this.reportingService.getPromotionPerformance();
  }

  @Get('inventory-kpis')
  getInventoryKpis() {
    return this.reportingService.getInventoryKpis();
  }

  @Get('exports')
  listExports(@Query() query: ListReportExportsQueryDto) {
    return this.reportingService.listExports(query);
  }

  @Get('exports/:exportId/download')
  createExportDownloadUrl(@Param('exportId') exportId: string) {
    return this.reportingService.createExportDownloadUrl(exportId);
  }

  @Post('exports')
  @RequirePermissions(['reports.write'])
  createExport(@CurrentUser() currentUser: AccessTokenPayload, @Body() dto: CreateReportExportDto) {
    return this.reportingService.createExport(currentUser.sub, dto);
  }
}
