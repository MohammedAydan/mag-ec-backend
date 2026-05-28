import path from 'node:path';

import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { APP_GUARD } from '@nestjs/core';
import { TerminusModule } from '@nestjs/terminus';
import { ThrottlerGuard, ThrottlerModule } from '@nestjs/throttler';
import { LoggerModule } from 'nestjs-pino';

import { buildAppConfig, envValidationSchema, type AppConfig } from './config/app.config';
import { HealthController } from './health/health.controller';
import { AppHealthService } from './health/health.service';
import { CatalogModule } from './modules/catalog/catalog.module';
import { CartsModule } from './modules/carts/carts.module';
import { CheckoutModule } from './modules/checkout/checkout.module';
import { FulfillmentModule } from './modules/fulfillment/fulfillment.module';
import { IdentityModule } from './modules/identity/identity.module';
import { InventoryModule } from './modules/inventory/inventory.module';
import { OrdersModule } from './modules/orders/orders.module';
import { PaymentsModule } from './modules/payments/payments.module';
import { PersistenceModule } from './modules/persistence/persistence.module';
import { PricingModule } from './modules/pricing/pricing.module';
import { PromotionsModule } from './modules/promotions/promotions.module';
import { QueueModule } from './modules/queue/queue.module';
import { ReturnsModule } from './modules/returns/returns.module';
import { WishlistModule } from './modules/wishlist/wishlist.module';
import { ReviewsModule } from './modules/reviews/reviews.module';
import { NotificationsModule } from './modules/notifications/notifications.module';
import { ReportingModule } from './modules/reporting/reporting.module';
import { AuditModule } from './modules/audit/audit.module';
import { ContentModule } from './modules/content/content.module';
import { RuntimeModule } from './modules/runtime/runtime.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      cache: true,
      envFilePath: [
        path.resolve(process.cwd(), '.env'),
        path.resolve(process.cwd(), '../../.env'),
        path.resolve(__dirname, '../../../.env'),
      ],
      validate: (env) => {
        const result = envValidationSchema.validate(env, {
          abortEarly: false,
          allowUnknown: true,
        });

        if (result.error) {
          throw result.error;
        }

        return result.value as Record<string, unknown>;
      },
      load: [buildAppConfig],
    }),
    LoggerModule.forRootAsync({
      inject: [ConfigService],
      useFactory: (configService: ConfigService): { pinoHttp: Record<string, unknown> } => {
        const appConfig = configService.getOrThrow<AppConfig>('app');

        return {
          pinoHttp: {
            level: appConfig.logLevel,
            redact: {
              paths: [
                'req.headers.authorization',
                'req.headers.cookie',
                'req.headers["x-guest-cart-token"]',
                'req.headers["idempotency-key"]',
                'req.headers["stripe-signature"]',
                'req.body.password',
                'req.body.newPassword',
                'req.body.refreshToken',
                'req.body.guestToken',
                'req.body.uploadToken',
                'req.body.token',
                'res.headers["set-cookie"]',
              ],
              censor: '[Redacted]',
            },
            customProps: (req: { id: string }) => ({
              requestId: req.id,
            }),
          },
        };
      },
    }),
    TerminusModule,
    ThrottlerModule.forRootAsync({
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => {
        const appConfig = configService.getOrThrow<AppConfig>('app');

        return [
          {
            ttl: appConfig.throttleTtlMs,
            limit: appConfig.throttleLimit,
          },
        ];
      },
    }),
    PersistenceModule,
    QueueModule,
    IdentityModule,
    PromotionsModule,
    CatalogModule,
    PricingModule,
    InventoryModule,
    CartsModule,
    WishlistModule,
    PaymentsModule,
    CheckoutModule,
    OrdersModule,
    FulfillmentModule,
    ReturnsModule,
    ReviewsModule,
    NotificationsModule,
    ReportingModule,
    AuditModule,
    ContentModule,
    RuntimeModule,
  ],
  controllers: [HealthController],
  providers: [
    AppHealthService,
    {
      provide: APP_GUARD,
      useClass: ThrottlerGuard,
    },
  ],
})
export class AppModule {}
