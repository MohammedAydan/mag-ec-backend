import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { InventoryModule } from '../inventory/inventory.module';
import { OrdersModule } from '../orders/orders.module';
import { PersistenceModule } from '../persistence/persistence.module';
import { AdminOrderCancellationController } from './controllers/admin-order-cancellation.controller';
import { AdminPaymentsController } from './controllers/admin-payments.controller';
import { CustomerOrderCancellationController } from './controllers/customer-order-cancellation.controller';
import { PaymentsWebhookController } from './controllers/payments-webhook.controller';
import { PAYMENT_GATEWAY } from './payments.constants';
import { CodPaymentService } from './services/cod-payment.service';
import { OrderCancellationService } from './services/order-cancellation.service';
import { OrderPaymentTransitionService } from './services/order-payment-transition.service';
import { PaymentAdminService } from './services/payment-admin.service';
import { PaymentAttemptService } from './services/payment-attempt.service';
import { PaymentGatewayService } from './services/payment-gateway.service';
import { PaymentWebhookService } from './services/payment-webhook.service';
import { RefundService } from './services/refund.service';
import { StripePaymentGatewayService } from './services/stripe-payment-gateway.service';

@Module({
  imports: [IdentityModule, PersistenceModule, OrdersModule, InventoryModule],
  controllers: [
    PaymentsWebhookController,
    CustomerOrderCancellationController,
    AdminOrderCancellationController,
    AdminPaymentsController,
  ],
  providers: [
    CodPaymentService,
    PaymentGatewayService,
    PaymentAttemptService,
    PaymentAdminService,
    PaymentWebhookService,
    OrderCancellationService,
    OrderPaymentTransitionService,
    RefundService,
    StripePaymentGatewayService,
    {
      provide: PAYMENT_GATEWAY,
      useExisting: StripePaymentGatewayService,
    },
  ],
  exports: [
    CodPaymentService,
    PaymentAttemptService,
    PaymentGatewayService,
    OrderPaymentTransitionService,
    RefundService,
  ],
})
export class PaymentsModule {}
