import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { InventoryAdminController } from './controllers/inventory-admin.controller';
import { InventoryCoreService } from './services/inventory-core.service';

@Module({
  imports: [IdentityModule],
  controllers: [InventoryAdminController],
  providers: [InventoryCoreService],
  exports: [InventoryCoreService],
})
export class InventoryModule {}
