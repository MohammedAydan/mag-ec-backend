import { Global, Module } from '@nestjs/common';

import { CoreIdentityRepository } from './repositories/core-identity.repository';
import { PrismaService } from './services/prisma.service';
import { PrismaTransactionService } from './services/prisma-transaction.service';

@Global()
@Module({
  providers: [PrismaService, PrismaTransactionService, CoreIdentityRepository],
  exports: [PrismaService, PrismaTransactionService, CoreIdentityRepository],
})
export class PersistenceModule {}
