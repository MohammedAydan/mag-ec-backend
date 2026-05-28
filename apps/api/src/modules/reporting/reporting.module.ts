import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { StorageModule } from '../storage/storage.module';
import { AdminReportingController } from './controllers/admin-reporting.controller';
import { ReportExportExecutionService } from './services/report-export-execution.service';
import { ReportingService } from './services/reporting.service';

@Module({
  imports: [IdentityModule, StorageModule],
  controllers: [AdminReportingController],
  providers: [ReportingService, ReportExportExecutionService],
  exports: [ReportingService, ReportExportExecutionService],
})
export class ReportingModule {}
