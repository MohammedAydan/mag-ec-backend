import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { PersistenceModule } from '../persistence/persistence.module';
import { AdminAuditController } from './controllers/admin-audit.controller';
import { AuditService } from './services/audit.service';

@Module({
  imports: [IdentityModule, PersistenceModule],
  controllers: [AdminAuditController],
  providers: [AuditService],
  exports: [AuditService],
})
export class AuditModule {}
