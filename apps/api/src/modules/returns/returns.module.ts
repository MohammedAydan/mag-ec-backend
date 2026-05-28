import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { InventoryModule } from '../inventory/inventory.module';
import { OrdersModule } from '../orders/orders.module';
import { PaymentsModule } from '../payments/payments.module';
import { PersistenceModule } from '../persistence/persistence.module';
import { AdminReturnsController } from './controllers/admin-returns.controller';
import { CustomerReturnsController } from './controllers/customer-returns.controller';
import { ReturnsService } from './services/returns.service';

@Module({
  imports: [IdentityModule, PersistenceModule, OrdersModule, PaymentsModule, InventoryModule],
  controllers: [CustomerReturnsController, AdminReturnsController],
  providers: [ReturnsService],
  exports: [ReturnsService],
})
export class ReturnsModule {}
