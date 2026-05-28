import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { OrdersModule } from '../orders/orders.module';
import { PersistenceModule } from '../persistence/persistence.module';
import { AdminFulfillmentController } from './controllers/admin-fulfillment.controller';
import { CustomerFulfillmentController } from './controllers/customer-fulfillment.controller';
import { FulfillmentService } from './services/fulfillment.service';

@Module({
  imports: [IdentityModule, PersistenceModule, OrdersModule],
  controllers: [AdminFulfillmentController, CustomerFulfillmentController],
  providers: [FulfillmentService],
  exports: [FulfillmentService],
})
export class FulfillmentModule {}
