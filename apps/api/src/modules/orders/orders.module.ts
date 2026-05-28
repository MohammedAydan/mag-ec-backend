import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { PersistenceModule } from '../persistence/persistence.module';
import { AdminOrdersController } from './controllers/admin-orders.controller';
import { CustomerOrdersController } from './controllers/customer-orders.controller';
import { OrderOutboxService } from './services/order-outbox.service';
import { OrderPostPurchaseService } from './services/order-post-purchase.service';
import { OrderService } from './services/order.service';

@Module({
  imports: [IdentityModule, PersistenceModule],
  controllers: [CustomerOrdersController, AdminOrdersController],
  providers: [OrderService, OrderOutboxService, OrderPostPurchaseService],
  exports: [OrderService, OrderOutboxService, OrderPostPurchaseService],
})
export class OrdersModule {}
