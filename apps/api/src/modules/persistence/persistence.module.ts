import { Global, Module } from '@nestjs/common';

import { CoreIdentityRepository } from './repositories/core-identity.repository';
import { PrismaSchemaGuardService } from './services/prisma-schema-guard.service';
import { PrismaService } from './services/prisma.service';
import { PrismaTransactionService } from './services/prisma-transaction.service';

@Global()
@Module({
  providers: [
    PrismaService,
    PrismaTransactionService,
    PrismaSchemaGuardService,
    CoreIdentityRepository,
  ],
  exports: [PrismaService, PrismaTransactionService, PrismaSchemaGuardService, CoreIdentityRepository],
})
export class PersistenceModule {}
