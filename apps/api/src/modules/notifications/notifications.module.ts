import { Module } from '@nestjs/common';

import { IdentityModule } from '../identity/identity.module';
import { PersistenceModule } from '../persistence/persistence.module';
import { AdminNotificationsController } from './controllers/admin-notifications.controller';
import { CustomerNotificationsController } from './controllers/customer-notifications.controller';
import { NotificationDeliveryService } from './services/notification-delivery.service';
import { NotificationsService } from './services/notifications.service';

@Module({
  imports: [IdentityModule, PersistenceModule],
  controllers: [CustomerNotificationsController, AdminNotificationsController],
  providers: [NotificationDeliveryService, NotificationsService],
  exports: [NotificationsService, NotificationDeliveryService],
})
export class NotificationsModule {}
