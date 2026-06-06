import { Body, Controller, Get, Inject, Param, Post, Query, UseGuards } from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { CreateReportExportDto, ListReportExportsQueryDto } from '../dto/reporting.dto';
import {
  SalesSummaryResponseDto,
  InventoryKpisResponseDto,
  PaginatedReportExportsDto,
  ReportExportDownloadResponseDto,
  ReportExportResponseDto,
  TopProductDto,
  PromotionPerformanceDto,
} from '../dto/reporting-response.dto';
import { ReportingService } from '../services/reporting.service';

@ApiTags('Reporting Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@Controller('reports/admin')
export class AdminReportingController {
  constructor(@Inject(ReportingService) private readonly reportingService: ReportingService) {}

  @Get('sales-summary')
  @RequirePermissions(['reports.read'])
  @ApiOperation({ summary: 'Retrieve aggregate sales summary metrics' })
  @ApiOkResponse({ type: SalesSummaryResponseDto, description: 'Sales summary aggregate data' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  async getSalesSummary(): Promise<SalesSummaryResponseDto> {
    return this.reportingService.getSalesSummary();
  }

  @Get('top-products')
  @RequirePermissions(['reports.read'])
  @ApiOperation({ summary: 'List top-selling products by quantity' })
  @ApiOkResponse({ type: [TopProductDto], description: 'Top products performance data' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  async getTopProducts(): Promise<TopProductDto[]> {
    return this.reportingService.getTopProducts();
  }

  @Get('promotion-performance')
  @RequirePermissions(['reports.read'])
  @ApiOperation({ summary: 'Retrieve promotion usage and performance analytics' })
  @ApiOkResponse({ type: [PromotionPerformanceDto], description: 'Promotion performance analytics data' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  getPromotionPerformance() {
    return this.reportingService.getPromotionPerformance() as unknown as PromotionPerformanceDto[];
  }

  @Get('inventory-kpis')
  @RequirePermissions(['reports.read'])
  @ApiOperation({ summary: 'Retrieve inventory KPI metrics' })
  @ApiOkResponse({ type: InventoryKpisResponseDto, description: 'Inventory KPI aggregate data' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  async getInventoryKpis(): Promise<InventoryKpisResponseDto> {
    return this.reportingService.getInventoryKpis();
  }

  @Get('exports')
  @RequirePermissions(['reports.read'])
  @ApiOperation({ summary: 'List report exports with cursor pagination' })
  @ApiOkResponse({ type: PaginatedReportExportsDto, description: 'Cursor-paginated list of report exports' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  listExports(@Query() query: ListReportExportsQueryDto) {
    return this.reportingService.listExports(query) as unknown as PaginatedReportExportsDto;
  }

  @Get('exports/:exportId/download')
  @RequirePermissions(['reports.read'])
  @ApiOperation({ summary: 'Generate a short-lived download URL for an export result' })
  @ApiParam({ name: 'exportId', description: 'Unique identifier of the report export' })
  @ApiOkResponse({ type: ReportExportDownloadResponseDto, description: 'Pre-signed download URL for the export' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiNotFoundResponse({ description: 'Requested export not found' })
  async createExportDownloadUrl(@Param('exportId') exportId: string): Promise<ReportExportDownloadResponseDto> {
    return this.reportingService.createExportDownloadUrl(exportId);
  }

  @Post('exports')
  @RequirePermissions(['reports.write'])
  @ApiOperation({ summary: 'Request a new asynchronous report export' })
  @ApiCreatedResponse({ type: ReportExportResponseDto, description: 'Report export created and enqueued' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  createExport(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Body() dto: CreateReportExportDto,
  ) {
    return this.reportingService.createExport(currentUser.sub, dto) as unknown as ReportExportResponseDto;
  }
}

