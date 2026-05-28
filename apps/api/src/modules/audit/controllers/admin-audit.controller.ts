import { Controller, Get, Inject, Query, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import { ListAuditLogsQueryDto } from '../dto/audit.dto';
import { AuditService } from '../services/audit.service';

@ApiTags('Audit Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['audit.read'])
@Controller('audit/admin')
export class AdminAuditController {
  constructor(@Inject(AuditService) private readonly auditService: AuditService) {}

  @Get()
  listAuditLogs(@Query() query: ListAuditLogsQueryDto) {
    return this.auditService.listAuditLogs(query);
  }
}
