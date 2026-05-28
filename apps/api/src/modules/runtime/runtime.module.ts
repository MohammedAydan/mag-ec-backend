import { Module } from '@nestjs/common';
import { APP_INTERCEPTOR } from '@nestjs/core';

import { NotificationsModule } from '../notifications/notifications.module';
import { MaintenanceController } from './controllers/maintenance.controller';
import { DirectRuntimeInterceptor } from './interceptors/direct-runtime.interceptor';
import { DirectRuntimeService } from './services/direct-runtime.service';

@Module({
  imports: [NotificationsModule],
  controllers: [MaintenanceController],
  providers: [
    DirectRuntimeService,
    { provide: APP_INTERCEPTOR, useClass: DirectRuntimeInterceptor },
  ],
  exports: [DirectRuntimeService],
})
export class RuntimeModule {}
