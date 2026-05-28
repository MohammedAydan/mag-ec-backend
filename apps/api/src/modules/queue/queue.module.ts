import { Global, Module } from '@nestjs/common';

import { QueueHealthService } from './queue-health.service';
import { TaskDispatcherService } from './task-dispatcher.service';

@Global()
@Module({
  providers: [QueueHealthService, TaskDispatcherService],
  exports: [QueueHealthService, TaskDispatcherService],
})
export class QueueModule {}
