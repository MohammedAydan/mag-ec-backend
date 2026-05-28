continue the next phase

• I’m resuming from the repo planning state first so the next phase stays aligned with the project brain. I’ll read
plans/context.md, plans/SESSION_LOG.md, and the active phase folder, then I’ll summarize the resume state before
touching code.

• Running Get-Content plans/context.md

• Running Get-Content plans/SESSION_LOG.md

• Ran Get-Content plans/context.md
└ # Project: Universal E-Commerce REST API

    … +43 lines (ctrl + t to view transcript)
    - Architecture and backend implementation: Codex session planning baseline
    - Product brief source: root `plan.md`

• Ran Get-Content plans/SESSION_LOG.md
└ # Session Log

    … +349 lines (ctrl + t to view transcript)
    pre-existing unless explicitly asked to normalize it.
    ---

• Ran Get-ChildItem plans | Select-Object Name,Mode
└
Name Mode
… +23 lines (ctrl + t to view transcript)

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The repo brain is clear: phase 07 is closed, the active slice is phase-08-orders-idempotency-cod, and the known carry-
forward constraints are the pre-existing repo-wide formatting drift and environment-dependent MySQL verification. I’m
reading the phase-08 plan files next so I can resume implementation at the correct boundary before changing anything.

• Running Get-Content plans/phase-08-orders-idempotency-cod/plan.md

• Running Get-Content plans/phase-08-orders-idempotency-cod/context.md

• Running Get-Content plans/phase-08-orders-idempotency-cod/tasks.md

• Ran Get-Content plans/phase-08-orders-idempotency-cod/tasks.md
└ # Phase 08 Tasks

    … +5 lines (ctrl + t to view transcript)
    - [ ] Emit outbox events for order placement and status changes.
    - [ ] Write E2E and integration tests covering duplicate submit and transactional invariants.

• Ran Get-Content plans/phase-08-orders-idempotency-cod/context.md
└ # Phase 08 Context

    … +15 lines (ctrl + t to view transcript)
    - Exact order state machine granularity before online payments are introduced
    - Whether idempotency keys are enforced per route, actor, or broader request scope

• Ran if (Test-Path plans/phase-08-orders-idempotency-cod/review.md) { Get-Content plans/
│ phase-08-orders-idempotency-cod/review.md }
└ (no output)

• Ran Get-Content plans/phase-08-orders-idempotency-cod/plan.md
└ # Phase 08: Orders, Idempotency, and Cash on Delivery

    … +31 lines (ctrl + t to view transcript)
    ## Estimated Complexity
    XL

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• Session resume: the active phase is phase-08-orders-idempotency-cod, its plan files already exist, and the scope is
tightly bounded to order placement, snapshots, idempotency, COD, order APIs, and outbox emission. I’m moving into
codebase inspection now to map the existing checkout, inventory, promotions, persistence, and any outbox/idempotency
primitives before I update the phase task state and implement the first slice.

◦ Running rg -n "Idempotency|outbox|OrderStatus|Order|payment provider|COD|cash on delivery|reservation|coupon usage|
│ redeemStockReservation|releaseStockReservation" apps/api/src prisma/schema.prisma docs plans -g '!packages/
│ contracts/openapi/openapi.json'

◦ Running rg --files apps/api/src | rg "(checkout|cart|inventory|promotions|pricing|identity|persistence|payments|
│ orders|outbox)"

• Ran git status --short
└ M apps/api/src/app.module.ts
M apps/api/src/modules/queue/queue.constants.ts
… +36 lines (ctrl + t to view transcript)
?? prisma/migrations/20260525_07_carts_wishlist_checkout_preview/
?? session-ses_19fd.md

• Ran rg -n "Idempotency|outbox|OrderStatus|Order|payment provider|COD|cash on delivery|reservation|coupon usage|
│ redeemStockReservation|releaseStockReservation" apps/api/src prisma/schema.prisma docs plans -g '!packages/
│ contracts/openapi/openapi.json'
└ prisma/schema.prisma:42:enum IdempotencyStatus {
prisma/schema.prisma:145: idempotencyKeys IdempotencyKey[]
… +244 lines (ctrl + t to view transcript)
apps/api/src\modules\pricing\services\shipping.service.ts:33: orderBy: [{ sortOrder: 'asc' }, { createdAt:
'asc' }],

• Ran rg --files apps/api/src | rg "(checkout|cart|inventory|promotions|pricing|identity|persistence|payments|orders|
│ outbox)"
└ apps/api/src\modules\persistence\services\prisma.service.ts
apps/api/src\modules\persistence\services\prisma-transaction.service.ts
… +62 lines (ctrl + t to view transcript)
apps/api/src\modules\promotions\controllers\promotions-admin.controller.ts
apps/api/src\modules\promotions\services\promotion-evaluator.service.spec.ts

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The worktree is still dirty from prior phase work, including the phase-07 modules and docs, so I’ll avoid touching
unrelated pending files and keep phase-08 edits narrowly scoped. Next I’m reading the existing schema and core
services that phase 08 has to compose with: IdempotencyKey, OutboxEvent, pricing preview, cart access, and inventory
redemption/release.

• Running Get-Content apps/api/src/modules/checkout/services/checkout-preview.service.ts

• Running Get-Content apps/api/src/modules/inventory/services/inventory-core.service.ts

• Running Get-Content apps/api/src/modules/carts/services/cart.service.ts

• Running Get-Content apps/api/src/modules/pricing/services/pricing-preview.service.ts

• Ran Get-Content apps/api/src/modules/checkout/services/checkout-preview.service.ts
└ import {
BadRequestException,
… +129 lines (ctrl + t to view transcript)
}
}

• Ran $lines = Get-Content prisma/schema.prisma; $lines[0..340]
└ generator client {
provider = "prisma-client-js"
… +337 lines (ctrl + t to view transcript)
}

• Ran Get-Content apps/api/src/modules/pricing/services/pricing-preview.service.ts
└ import { BadRequestException, Inject, Injectable, NotFoundException } from '@nestjs/common';

    … +163 lines (ctrl + t to view transcript)
      }
    }

• Ran Get-Content apps/api/src/modules/carts/services/cart.service.ts
└ import { randomUUID } from 'node:crypto';

    … +384 lines (ctrl + t to view transcript)
      } satisfies Prisma.CartInclude;
    }

• Ran Get-Content apps/api/src/modules/inventory/services/inventory-core.service.ts
└ import { Inject, Injectable, BadRequestException, Logger, Optional } from '@nestjs/common';
import { InjectQueue } from '@nestjs/bullmq';
… +314 lines (ctrl + t to view transcript)
}
}

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• I’ve confirmed the main leverage points: the base IdempotencyKey and OutboxEvent tables already exist, checkout
preview already recalculates and can reserve stock, and inventory already supports reservation redemption and release.
The missing phase-08 work is the order domain itself plus the transactional orchestration layer that binds those
existing pieces together safely.

• Running $lines = Get-Content prisma/schema.prisma; $lines[900..1040]

• Running Get-Content apps/api/src/modules/queue/queue.constants.ts

• Running Get-Content apps/api/src/app.module.ts

• Running Get-Content apps/api/src/modules/queue/queue.module.ts

• Ran Get-Content apps/api/src/modules/checkout/controllers/checkout.controller.ts
└ import { Body, Controller, Post, Req, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
… +78 lines (ctrl + t to view transcript)
}
}

• Ran Get-Content apps/api/src/app.module.ts
└ import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
… +89 lines (ctrl + t to view transcript)
})
export class AppModule {}

• Ran Get-Content apps/api/src/modules/queue/queue.constants.ts
└ export const MAINTENANCE_QUEUE = 'maintenance';
export const INVENTORY_EXPIRY_QUEUE = 'inventory-expiry';

• Ran Get-Content apps/api/src/modules/queue/queue.module.ts
└ import { Module } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
… +40 lines (ctrl + t to view transcript)
})
export class QueueModule {}

• Ran $lines = Get-Content prisma/schema.prisma; $lines[900..1040]
└ createdAt DateTime @default(now())
warehouse Warehouse @relation(fields: [warehouseId], references: [id], onDelete: Restrict)
… +85 lines (ctrl + t to view transcript)
@@index([userId])
}

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The structure is consistent enough to proceed without replanning the repo: phase 08 needs a new OrdersModule, a small
PaymentsModule for COD capability, and a placement path inside CheckoutModule that re-evaluates the cart under
transaction instead of trusting preview state. I’m checking the supporting conventions now so the new module matches
the existing DTO, controller, and transaction patterns before I edit phase task state and start the first
implementation pass.

◦ Running Get-Content apps/api/src/modules/pricing/dto/pricing-public.dto.ts

◦ Running Get-Content apps/api/src/modules/promotions/services/promotion-evaluator.service.ts

◦ Running Get-Content apps/api/src/modules/identity/guards/auth.guard.ts

◦ Running Get-Content apps/api/src/modules/persistence/services/prisma-transaction.service.ts

• Ran Get-Content apps/api/src/modules/promotions/promotions.types.ts
└ export interface PromotionEvaluationInput {
subtotalAmount: number;
… +27 lines (ctrl + t to view transcript)
freeShipping: boolean;
}

• Ran Get-Content apps/api/src/modules/pricing/dto/pricing-public.dto.ts
└ import { Type } from 'class-transformer';
import {
… +51 lines (ctrl + t to view transcript)
items!: CheckoutPreviewItemDto[];
}

• Ran Get-Content apps/api/src/modules/persistence/services/prisma-transaction.service.ts
└ import { Injectable } from '@nestjs/common';
import type { Prisma } from '@prisma/client';
… +15 lines (ctrl + t to view transcript)
}
}

• Ran Get-Content apps/api/src/modules/identity/guards/auth.guard.ts
└ import { type CanActivate, type ExecutionContext, Injectable, UnauthorizedException } from '@nestjs/common';
import type { FastifyRequest } from 'fastify';
… +28 lines (ctrl + t to view transcript)
}
}

• Ran Get-Content apps/api/src/modules/promotions/services/promotion-evaluator.service.ts
└ import { Inject, Injectable } from '@nestjs/common';

    … +398 lines (ctrl + t to view transcript)
      }
    }

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• Plan for phase 08:

1. Extend the Prisma domain with order snapshots and placement-linked relations, plus a migration artifact.
2. Add runtime services for idempotency, COD payment handling, order persistence, and outbox emission.
3. Wire POST /checkout/place plus customer/admin order read APIs with transactional orchestration.
4. Add focused unit/E2E coverage, then update phase docs and closeout artifacts.

I’m starting with the schema and planning state so the rest of the implementation has stable domain shapes to build
against.

• Updated Plan
└ □ Extend Prisma schema and phase-08 planning/task state for orders, snapshots, idempotency, and COD domain models
□ Implement runtime modules/services for transactional order placement, idempotency, COD handling, and outbox writes
□ Expose checkout placement and order read APIs with validation/auth boundaries
□ Add tests, run verification, and update docs/plans for phase-08 closeout

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• I’m reading the existing promotion-ledger and store-setting parts of the schema before I add orders, because phase 08
has to claim coupon usage and payment defaults without introducing duplicate concepts. After that I’ll edit the phase-
08 task file to put the first task in progress and patch the schema in one pass.

• Running Get-Content prisma/seed.ts

• Running $lines = Get-Content prisma/schema.prisma; $lines[340..620]

• Ran Get-Content plans/phase-08-orders-idempotency-cod/tasks.md
└ # Phase 08 Tasks

    … +5 lines (ctrl + t to view transcript)
    - [ ] Emit outbox events for order placement and status changes.
    - [ ] Write E2E and integration tests covering duplicate submit and transactional invariants.

• Ran $lines = Get-Content prisma/schema.prisma; $lines[340..620]
└
model ShippingZone {
… +277 lines (ctrl + t to view transcript)
inputType CatalogAttributeInputType
isFilterable Boolean @default(false)

• Ran Get-Content prisma/seed.ts
└ import 'dotenv/config';

    … +1285 lines (ctrl + t to view transcript)

    void main();

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• I found one important phase-08 design correction before coding the order flow: the promotion-usage tables currently
make reservationKey globally unique, which blocks valid multi-promotion orders. I’m going to fix that in the schema as
part of the order slice, then build placement against the corrected ledger shape instead of encoding around a bad
constraint.

◦ Running Get-Content apps/api/src/modules/checkout/checkout.module.ts

◦ Running Get-Content apps/api/src/modules/persistence/persistence.module.ts

◦ Running Get-Content apps/api/src/modules/carts/carts.module.ts

◦ Running Get-Content apps/api/src/modules/promotions/promotions.module.ts

• Ran Get-Content apps/api/src/modules/promotions/promotions.module.ts
└ import { Module } from '@nestjs/common';

    … +12 lines (ctrl + t to view transcript)
    })
    export class PromotionsModule {}

• Ran Get-Content apps/api/src/modules/carts/carts.module.ts
└ import { Module } from '@nestjs/common';

    … +10 lines (ctrl + t to view transcript)
    })
    export class CartsModule {}

• Ran Get-Content apps/api/src/modules/pricing/pricing.module.ts
└ import { Module } from '@nestjs/common';

    … +26 lines (ctrl + t to view transcript)
    })
    export class PricingModule {}

• Ran Get-Content apps/api/src/modules/persistence/persistence.module.ts
└ import { Global, Module } from '@nestjs/common';

    … +8 lines (ctrl + t to view transcript)
    })
    export class PersistenceModule {}

• Ran Get-Content apps/api/src/modules/checkout/checkout.module.ts
└ import { Module } from '@nestjs/common';

    … +13 lines (ctrl + t to view transcript)
    })
    export class CheckoutModule {}

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• I’m switching the first phase-08 task to in-progress and then patching the Prisma domain. The schema pass will include
orders, snapshot tables, COD/payment enums, and the promotion-ledger uniqueness fix so the runtime layer has the right
invariants.

• Edited plans\phase-08-orders-idempotency-cod\tasks.md (+1 -1)
2
3 -- [ ] Implement order, order-line, address, and totals snapshot models.
3 +- [~] Implement order, order-line, address, and totals snapshot models.
4 - [ ] Build idempotency-key handling and request replay-safe placement flows.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The schema patch hit context drift, so I’m reopening the exact sections and applying a tighter patch instead of
forcing it. I’m keeping the change localized to the enum block, User/IdempotencyKey, promotion ledgers, new order
models, and the Cart relation.

◦ Running rg -n "enum UsageLedgerStatus|model User \{|model IdempotencyKey \{|model PromotionRedemption \{|model
│ CouponRedemption \{|model Cart \{" prisma/schema.prisma

◦ Running $lines = Get-Content prisma/schema.prisma; $lines[90..170]

◦ Running $lines = Get-Content prisma/schema.prisma; $lines[220..320]

◦ Running $lines = Get-Content prisma/schema.prisma; $lines[430..520]

• Ran $lines = Get-Content prisma/schema.prisma; $lines[430..520]
└ }

    … +87 lines (ctrl + t to view transcript)
      createdAt    DateTime                  @default(now())
      updatedAt    DateTime                  @updatedAt

• Ran rg -n "enum UsageLedgerStatus|model User \{|model IdempotencyKey \{|model PromotionRedemption \{|model
│ CouponRedemption \{|model Cart \{" prisma/schema.prisma
└ 118:enum UsageLedgerStatus {
125:model User {
… +2 lines (ctrl + t to view transcript)
472:model CouponRedemption {
916:model Cart {

• Ran $lines = Get-Content prisma/schema.prisma; $lines[220..320]
└ updatedAt DateTime @updatedAt
user User @relation(fields: [userId], references: [id], onDelete: Cascade)
… +97 lines (ctrl + t to view transcript)
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt

• Ran $lines = Get-Content prisma/schema.prisma; $lines[900..980]
└ createdAt DateTime @default(now())
warehouse Warehouse @relation(fields: [warehouseId], references: [id], onDelete: Restrict)
… +77 lines (ctrl + t to view transcript)
updatedAt DateTime @updatedAt
warehouse Warehouse @relation(fields: [warehouseId], references: [id], onDelete: Restrict)

• Ran $lines = Get-Content prisma/schema.prisma; $lines[90..170]
└ FLAT
PERCENTAGE_OF_SUBTOTAL
… +77 lines (ctrl + t to view transcript)
model Permission {
id String @id @default(cuid())

• Edited prisma\schema.prisma (+32 -0)
124
125 +enum PaymentMethodType {
126 + CASH_ON_DELIVERY
127 +}
128 +
129 +enum PaymentStatus {
130 + PENDING
131 + PAID
132 + FAILED
133 + REFUNDED
134 + VOIDED
135 +}
136 +
137 +enum FulfillmentStatus {
138 + UNFULFILLED
139 + FULFILLED
140 + RETURNED
141 + CANCELLED
142 +}
143 +
144 +enum OrderStatus {
145 + PLACED
146 + FULFILLED
147 + CANCELLED
148 +}
149 +
150 +enum OrderAddressType {
151 + SHIPPING
152 + BILLING
153 +}
154 +
155 model User {
⋮
179 wishlist Wishlist?
180 + orders Order[]
181
⋮
310 actorUser User? @relation(fields: [actorUserId], references: [id], onDelete: SetNull)
311 + order Order?
312

• Edited prisma\schema.prisma (+4 -2)
490 orderReference String?
491 - reservationKey String? @unique
491 + reservationKey String?
492 status UsageLedgerStatus
⋮
501 @@index([userId, promotionId, status])
502 + @@unique([promotionId, reservationKey])
503 }
⋮
509 orderReference String?
509 - reservationKey String? @unique
510 + reservationKey String?
511 status UsageLedgerStatus
⋮
520 @@index([userId, couponId, status])
521 + @@unique([couponId, reservationKey])
522 }

• Edited prisma\schema.prisma (+108 -0)
960 items CartItem[]
961 + orders Order[]
962
⋮
1004
1005 +model Order {
1006 + id String @id @default(cuid())
1007 + orderNumber String @unique
1008 + userId String?
1009 + cartId String?
1010 + idempotencyKeyId String? @unique
1011 + reservationKey String? @unique
1012 + customerEmail String
1013 + customerName String
1014 + customerPhone String
1015 + currencyCode String
1016 + countryCode String
1017 + status OrderStatus @default(PLACED)
1018 + paymentMethod PaymentMethodType
1019 + paymentStatus PaymentStatus @default(PENDING)
1020 + fulfillmentStatus FulfillmentStatus @default(UNFULFILLED)
1021 + shippingMethodKey String
1022 + shippingMethodName String
1023 + shippingRateType ShippingRateType
1024 + shippingEstimatedMinDays Int?
1025 + shippingEstimatedMaxDays Int?
1026 + couponCode String?
1027 + subtotalAmount Int
1028 + subtotalDiscountAmount Int
1029 + discountedSubtotalAmount Int
1030 + shippingAmount Int
1031 + taxAmount Int
1032 + grandTotalAmount Int
1033 + placedAt DateTime @default(now())
1034 + createdAt DateTime @default(now())
1035 + updatedAt DateTime @updatedAt
1036 + user User? @relation(fields: [userId], references: [id], onDelete: SetNull
)
1037 + cart Cart? @relation(fields: [cartId], references: [id], onDelete: SetNull
)
1038 + idempotencyKey IdempotencyKey? @relation(fields: [idempotencyKeyId], references: [id], onDelet
e: SetNull)
1039 + addresses OrderAddress[]
1040 + lines OrderLine[]
1041 + appliedPromotions OrderAppliedPromotion[]
1042 +
1043 + @@index([userId, createdAt])
1044 + @@index([status, createdAt])
1045 +}
1046 +
1047 +model OrderAddress {
1048 + id String @id @default(cuid())
1049 + orderId String
1050 + type OrderAddressType
1051 + recipientName String
1052 + phoneNumber String
1053 + countryCode String
1054 + city String
1055 + state String?
1056 + postalCode String?
1057 + addressLine1 String
1058 + addressLine2 String?
1059 + company String?
1060 + createdAt DateTime @default(now())
1061 + updatedAt DateTime @updatedAt
1062 + order Order @relation(fields: [orderId], references: [id], onDelete: Cascade)
1063 +
1064 + @@unique([orderId, type])
1065 + @@index([type])
1066 +}
1067 +
1068 +model OrderLine {
1069 + id String @id @default(cuid())
1070 + orderId String
1071 + variantId String
1072 + productId String
1073 + sku String
1074 + productName String
1075 + variantName String
1076 + quantity Int
1077 + currencyCode String
1078 + unitBaseAmount Int
1079 + unitSaleAmount Int?
1080 + effectiveUnitAmount Int
1081 + lineSubtotalAmount Int
1082 + taxAmount Int
1083 + createdAt DateTime @default(now())
1084 + updatedAt DateTime @updatedAt
1085 + order Order @relation(fields: [orderId], references: [id], onDelete: Cascade)
1086 + variant CatalogProductVariant @relation(fields: [variantId], references: [id], onDelete: Restric
t)
1087 + product CatalogProduct @relation(fields: [productId], references: [id], onDelete: Restric
t)
1088 +
1089 + @@index([orderId])
1090 + @@index([variantId])
1091 + @@index([productId])
1092 +}
1093 +
1094 +model OrderAppliedPromotion {
1095 + id String @id @default(cuid())
1096 + orderId String
1097 + promotionId String?
1098 + key String
1099 + name String
1100 + rewardType PromotionRewardType
1101 + discountAmount Int
1102 + freeShipping Boolean @default(false)
1103 + source PromotionTrigger
1104 + couponCode String?
1105 + createdAt DateTime @default(now())
1106 + order Order @relation(fields: [orderId], references: [id], onDelete: Cascade)
1107 +
1108 + @@index([orderId])
1109 + @@index([promotionId])
1110 +}
1111 +
1112 model StockReservation {

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The order domain is in the schema now, including the ledger-uniqueness correction. I’m validating the Prisma shape
next so I can catch relation issues before building services on top of it.

• Ran pnpm.cmd prisma:generate
└ > e-commerce-api-workspace@0.1.0 prisma:generate D:\Projects\NodeJS-Projects\e-commerce-api
… +25 lines (ctrl + t to view transcript)

    Prisma CLI Version : 7.8.0

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• Prisma caught the expected missing reverse relations, which is exactly why I validated the schema before moving on.
I’m patching CatalogProduct and CatalogProductVariant with the order-line backrefs, then I’ll rerun generation.

◦ Running rg -n "model CatalogProduct \{|model CatalogProductVariant \{" prisma/schema.prisma

◦ Running $lines = Get-Content prisma/schema.prisma; $lines[820..900]

• Ran rg -n "model CatalogProduct \{|model CatalogProductVariant \{" prisma/schema.prisma
└ 715:model CatalogProduct {
756:model CatalogProductVariant {

• Ran $lines = Get-Content prisma/schema.prisma; $lines[820..900]
└ sortOrder Int @default(0)
product CatalogProduct @relation(fields: [productId], references: [id], onDelete: Cascade)
… +77 lines (ctrl + t to view transcript)
isDefault Boolean @default(false)
createdAt DateTime @default(now())

• Ran $lines = Get-Content prisma/schema.prisma; $lines[660..760]
└ options CatalogAttributeOption[]
productTypeLinks CatalogProductTypeAttribute[]
… +97 lines (ctrl + t to view transcript)
status CatalogStatus @default(DRAFT)
position Int @default(0)

• Ran $lines = Get-Content prisma/schema.prisma; $lines[756..820]
└ id String @id @default(cuid())
productId String
… +61 lines (ctrl + t to view transcript)
categoryId String
sortOrder Int @default(0)

• Edited prisma\schema.prisma (+2 -0)
734 tagLinks CatalogProductTag[]
735 + orderLines OrderLine[]
736
⋮
775 wishlistItems WishlistItem[]
776 + orderLines OrderLine[]
777

• Ran pnpm.cmd prisma:generate
└ > e-commerce-api-workspace@0.1.0 prisma:generate D:\Projects\NodeJS-Projects\e-commerce-api
… +9 lines (ctrl + t to view transcript)

    Prisma schema loaded from prisma\schema.prisma.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The schema now validates. I’m moving into the runtime layer: service boundaries, DTO shape, and auth/permission
wiring. I also need to extend seed permissions for orders so the admin API is reachable under the existing RBAC model
rather than introducing a side channel.

• Running Get-Content apps/api/src/modules/identity/guards/permissions.guard.ts

• Running Get-Content apps/api/src/modules/catalog/controllers/catalog-admin.controller.ts

• Running Get-Content apps/api/src/modules/pricing/controllers/pricing-admin.controller.ts

• Running Get-Content apps/api/src/modules/identity/decorators/permissions.decorator.ts

• Ran Get-Content apps/api/src/modules/identity/guards/permissions.guard.ts
└ import { type CanActivate, type ExecutionContext, Injectable } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
… +26 lines (ctrl + t to view transcript)
}
}

• Ran Get-Content apps/api/src/modules/identity/decorators/permissions.decorator.ts
└ import { Reflector } from '@nestjs/core';

    export const RequirePermissions = Reflector.createDecorator<string[]>();

• Ran Get-Content apps/api/src/modules/identity/decorators/current-user.decorator.ts
└ import { createParamDecorator, type ExecutionContext } from '@nestjs/common';
import type { FastifyRequest } from 'fastify';
… +6 lines (ctrl + t to view transcript)
return request.user ?? null;
});

• Ran Get-Content apps/api/src/modules/pricing/controllers/pricing-admin.controller.ts
└ import { Body, Controller, Param, Put, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
… +67 lines (ctrl + t to view transcript)
}
}

• Ran Get-Content apps/api/src/modules/catalog/controllers/catalog-admin.controller.ts
└ import {
Body,
… +108 lines (ctrl + t to view transcript)
}
}

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The next dependency is configuration: phase 08 needs a payment-provider selector, even if only COD is supported right
now. I’m reading the app config before I add the new runtime files so the module wiring and validation stay consistent
with the existing boot path.

◦ Running Get-Content apps/api/src/config/app.config.ts

◦ Running rg -n "QUEUE_ENABLED|OPENAPI|REDIS_URL|DATABASE_URL|PAYMENT" apps/api/src/config apps/worker/src/config .env\*
│ package.json

• Ran Get-Content apps/api/src/config/app.config.ts
└ import Joi from 'joi';

    … +101 lines (ctrl + t to view transcript)
      };
    }

• Ran rg -n "QUEUE_ENABLED|OPENAPI|REDIS_URL|DATABASE_URL|PAYMENT" apps/api/src/config apps/worker/src/config .env*
│ package.json
└ apps/worker/src/config\worker.config.ts:11: databaseUrl: process.env.DATABASE_URL ??
'mysql://root:root@localhost:3306/ecommerce',
… +12 lines (ctrl + t to view transcript)
apps/api/src/config\app.config.ts:98: openapiEnabled: process.env.OPENAPI_ENABLED !== 'false',
rg: .env*: The filename, directory name, or volume label syntax is incorrect. (os error 123)

• Ran Get-Content apps/worker/src/config/worker.config.ts
└ export interface WorkerConfig {
databaseUrl: string;
… +13 lines (ctrl + t to view transcript)
};
}

• Ran Get-Content apps/api/src/modules/checkout/dto/checkout.dto.ts
└ import { IsBoolean, IsNotEmpty, IsOptional, IsString, MaxLength } from 'class-validator';

    … +22 lines (ctrl + t to view transcript)
      reserveStockOnPreview?: boolean;
    }

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• I’m defining the placement contract next. The DTO needs to be explicit now because order placement is the first
irreversible write path in the repo: addresses, shipping method, payment method, optional reservation reuse, and a
required idempotency header on the controller side.

• Edited apps\api\src\modules\checkout\dto\checkout.dto.ts (+103 -1)
1 -import { IsBoolean, IsNotEmpty, IsOptional, IsString, MaxLength } from 'class-validator';
1 +import { Type } from 'class-transformer';
2 +import {
3 + IsBoolean,
4 + IsEmail,
5 + IsEnum,
6 + IsNotEmpty,
7 + IsOptional,
8 + IsString,
9 + MaxLength,
10 + ValidateNested,
11 +} from 'class-validator';
12
⋮
36 }
37 +
38 +export enum CheckoutPaymentMethod {
39 + CASH_ON_DELIVERY = 'cash_on_delivery',
40 +}
41 +
42 +export class CheckoutAddressDto {
43 + @IsString()
44 + @IsNotEmpty()
45 + recipientName!: string;
46 +
47 + @IsString()
48 + @IsNotEmpty()
49 + phoneNumber!: string;
50 +
51 + @IsString()
52 + @IsNotEmpty()
53 + @MaxLength(2)
54 + countryCode!: string;
55 +
56 + @IsString()
57 + @IsNotEmpty()
58 + city!: string;
59 +
60 + @IsOptional()
61 + @IsString()
62 + @IsNotEmpty()
63 + state?: string;
64 +
65 + @IsOptional()
66 + @IsString()
67 + @IsNotEmpty()
68 + postalCode?: string;
69 +
70 + @IsString()
71 + @IsNotEmpty()
72 + addressLine1!: string;
73 +
74 + @IsOptional()
75 + @IsString()
76 + @IsNotEmpty()
77 + addressLine2?: string;
78 +
79 + @IsOptional()
80 + @IsString()
81 + @IsNotEmpty()
82 + company?: string;
83 +}
84 +
85 +export class CheckoutPlaceOrderDto {
86 + @IsString()
87 + @IsNotEmpty()
88 + cartId!: string;
89 +
90 + @IsString()
91 + @IsNotEmpty()
92 + @MaxLength(3)
93 + currencyCode!: string;
94 +
95 + @IsString()
96 + @IsNotEmpty()
97 + @MaxLength(2)
98 + countryCode!: string;
99 +
100 + @IsEmail()
101 + customerEmail!: string;
102 +
103 + @IsString()
104 + @IsNotEmpty()
105 + shippingMethodKey!: string;
106 +
107 + @IsEnum(CheckoutPaymentMethod)
108 + paymentMethod!: CheckoutPaymentMethod;
109 +
110 + @IsOptional()
111 + @IsString()
112 + @IsNotEmpty()
113 + customerLocale?: string;
114 +
115 + @IsOptional()
116 + @IsString()
117 + @IsNotEmpty()
118 + reservationKey?: string;
119 +
120 + @ValidateNested()
121 + @Type(() => CheckoutAddressDto)
122 + shippingAddress!: CheckoutAddressDto;
123 +
124 + @IsOptional()
125 + @ValidateNested()
126 + @Type(() => CheckoutAddressDto)
127 + billingAddress?: CheckoutAddressDto;
128 +}

• Added apps\api\src\modules\payments\services\cod-payment.service.ts (+29 -0)
1 +import { BadRequestException, Inject, Injectable } from '@nestjs/common';
2 +import { ConfigService } from '@nestjs/config';
3 +
4 +import type { AppConfig } from '../../../config/app.config';
5 +import { CheckoutPaymentMethod } from '../../checkout/dto/checkout.dto';
6 +
7 +@Injectable()
8 +export class CodPaymentService {
9 + constructor(
10 + @Inject(ConfigService)
11 + private readonly configService: ConfigService,
12 + ) {}
13 +
14 + assertPlacementAllowed(paymentMethod: CheckoutPaymentMethod) {
15 + if (paymentMethod !== CheckoutPaymentMethod.CASH_ON_DELIVERY) {
16 + throw new BadRequestException('Only cash on delivery is available at this time');
17 + }
18 +
19 + const appConfig = this.configService.getOrThrow<AppConfig>('app');
20 + if (appConfig.paymentProvider !== 'cod') {
21 + throw new BadRequestException('Cash on delivery is not enabled for this environment');
22 + }
23 +
24 + return {
25 + paymentMethod: 'CASH_ON_DELIVERY' as const,
26 + paymentStatus: 'PENDING' as const,
27 + };
28 + }
29 +}

• Added apps\api\src\modules\payments\payments.module.ts (+9 -0)
1 +import { Module } from '@nestjs/common';
2 +
3 +import { CodPaymentService } from './services/cod-payment.service';
4 +
5 +@Module({
6 + providers: [CodPaymentService],
7 + exports: [CodPaymentService],
8 +})
9 +export class PaymentsModule {}

• Edited apps\api\src\config\app.config.ts (+3 -1)
19 jwtRefreshExpiresIn: string;
20 + paymentProvider: string;
21 }
⋮
102 jwtRefreshSecret: process.env.JWT_REFRESH_SECRET ?? 'development_refresh_secret_key_32_bytes_long',
102 - jwtRefreshExpiresIn: process.env.JWT_REFRESH_EXPIRES_IN ?? '30d'
103 + jwtRefreshExpiresIn: process.env.JWT_REFRESH_EXPIRES_IN ?? '30d',
104 + paymentProvider: (process.env.PAYMENT_PROVIDER ?? 'cod').trim().toLowerCase(),
105 }

• Added apps\api\src\modules\checkout\services\checkout-idempotency.service.ts (+174 -0)
1 +import { createHash } from 'node:crypto';
2 +
3 +import {
4 + ConflictException,
5 + Inject,
6 + Injectable,
7 + InternalServerErrorException,
8 +} from '@nestjs/common';
9 +import { IdempotencyStatus, Prisma } from '@prisma/client';
10 +
11 +import { PrismaService } from '../../persistence/services/prisma.service';
12 +
13 +type IdempotentExecutionParams<T> = {
14 + scope: string;
15 + key: string;
16 + actorUserId?: string;
17 + requestBody: unknown;
18 + execute: () => Promise<{ responseCode: number; responseBody: T }>;
19 +};
20 +
21 +type IdempotentExecutionResult<T> = {
22 + replayed: boolean;
23 + responseCode: number;
24 + responseBody: T;
25 +};
26 +
27 +@Injectable()
28 +export class CheckoutIdempotencyService {
29 + constructor(
30 + @Inject(PrismaService)
31 + private readonly prisma: PrismaService,
32 + ) {}
33 +
34 + async execute<T extends Record<string, unknown>>(
35 + params: IdempotentExecutionParams<T>,
36 + ): Promise<IdempotentExecutionResult<T>> {
37 + const requestHash = this.hashRequestBody(params.requestBody);
38 + const idempotencyKey = await this.acquireKey({
39 + scope: params.scope,
40 + key: params.key,
41 + actorUserId: params.actorUserId,
42 + requestHash,
43 + });
44 +
45 + if (
46 + idempotencyKey.status === IdempotencyStatus.COMPLETED &&
47 + idempotencyKey.responseBody !== null &&
48 + idempotencyKey.responseCode !== null
49 + ) {
50 + return {
51 + replayed: true,
52 + responseCode: idempotencyKey.responseCode,
53 + responseBody: idempotencyKey.responseBody as T,
54 + };
55 + }
56 +
57 + try {
58 + const result = await params.execute();
59 +
60 + await this.prisma.idempotencyKey.update({
61 + where: { id: idempotencyKey.id },
62 + data: {
63 + status: IdempotencyStatus.COMPLETED,
64 + responseCode: result.responseCode,
65 + responseBody: result.responseBody as Prisma.InputJsonValue,
66 + completedAt: new Date(),
67 + },
68 + });
69 +
70 + return {
71 + replayed: false,
72 + responseCode: result.responseCode,
73 + responseBody: result.responseBody,
74 + };
75 + } catch (error) {
76 + await this.prisma.idempotencyKey.update({
77 + where: { id: idempotencyKey.id },
78 + data: {
79 + status: IdempotencyStatus.FAILED,
80 + },
81 + });
82 +
83 + throw error;
84 + }
85 + }
86 +
87 + private async acquireKey(input: {
88 + scope: string;
89 + key: string;
90 + actorUserId?: string;
91 + requestHash: string;
92 + }) {
93 + try {
94 + return await this.prisma.idempotencyKey.create({
95 + data: {
96 + scope: input.scope,
97 + key: input.key,
98 + actorUserId: input.actorUserId,
99 + requestHash: input.requestHash,
100 + status: IdempotencyStatus.PENDING,
101 + lockedAt: new Date(),
102 + expiresAt: new Date(Date.now() + 24 _ 60 _ 60 \* 1000),
103 + },
104 + });
105 + } catch (error) {
106 + if (
107 + error instanceof Prisma.PrismaClientKnownRequestError &&
108 + error.code === 'P2002'
109 + ) {
110 + const existing = await this.prisma.idempotencyKey.findUnique({
111 + where: {
112 + scope_key: {
113 + scope: input.scope,
114 + key: input.key,
115 + },
116 + },
117 + });
118 +
119 + if (!existing) {
120 + throw new InternalServerErrorException('Idempotency key lookup failed unexpectedly');
121 + }
122 +
123 + if (existing.requestHash !== input.requestHash) {
124 + throw new ConflictException('Idempotency key was already used with a different request payload');
125 + }
126 +
127 + if (existing.actorUserId !== (input.actorUserId ?? null)) {
128 + throw new ConflictException('Idempotency key scope does not match the current actor');
129 + }
130 +
131 + if (existing.status === IdempotencyStatus.PENDING) {
132 + throw new ConflictException('An identical checkout placement request is already in progress');
133 + }
134 +
135 + if (existing.status === IdempotencyStatus.COMPLETED) {
136 + return existing;
137 + }
138 +
139 + return this.prisma.idempotencyKey.update({
140 + where: { id: existing.id },
141 + data: {
142 + status: IdempotencyStatus.PENDING,
143 + lockedAt: new Date(),
144 + completedAt: null,
145 + },
146 + });
147 + }
148 +
149 + throw error;
150 + }
151 + }
152 +
153 + private hashRequestBody(value: unknown) {
154 + return createHash('sha256')
155 + .update(JSON.stringify(this.sortValue(value)))
156 + .digest('hex');
157 + }
158 +
159 + private sortValue(value: unknown): unknown {
160 + if (Array.isArray(value)) {
161 + return value.map((item) => this.sortValue(item));
162 + }
163 +
164 + if (value !== null && typeof value === 'object') {
165 + return Object.fromEntries(
166 + Object.entries(value as Record<string, unknown>)
167 + .sort(([left], [right]) => left.localeCompare(right))
168 + .map(([key, entry]) => [key, this.sortValue(entry)]),
169 + );
170 + }
171 +
172 + return value;
173 + }
174 +}

• Added apps\api\src\modules\promotions\services\promotion-usage.service.ts (+76 -0)
1 +import { Inject, Injectable } from '@nestjs/common';
2 +import type { Prisma } from '@prisma/client';
3 +
4 +import type { PromotionApplication } from '../promotions.types';
5 +import { CouponNormalizerService } from './coupon-normalizer.service';
6 +import { PrismaService } from '../../persistence/services/prisma.service';
7 +
8 +@Injectable()
9 +export class PromotionUsageService {
10 + constructor(
11 + @Inject(PrismaService)
12 + private readonly prisma: PrismaService,
13 + @Inject(CouponNormalizerService)
14 + private readonly couponNormalizerService: CouponNormalizerService,
15 + ) {}
16 +
17 + async redeemAppliedPromotions(
18 + appliedPromotions: PromotionApplication[],
19 + orderReference: string,
20 + userId?: string,
21 + tx: Prisma.TransactionClient = this.prisma,
22 + ) {
23 + for (const promotion of appliedPromotions) {
24 + await tx.promotionRedemption.create({
25 + data: {
26 + promotionId: promotion.promotionId,
27 + userId,
28 + orderReference,
29 + reservationKey: `order:${orderReference}:promotion:${promotion.promotionId}`,
30 + status: 'REDEEMED',
31 + quantity: 1,
32 + },
33 + });
34 +
35 + await tx.promotion.update({
36 + where: { id: promotion.promotionId },
37 + data: {
38 + redeemedCount: {
39 + increment: 1,
40 + },
41 + },
42 + });
43 +
44 + if (promotion.source !== 'COUPON' || !promotion.couponCode) {
45 + continue;
46 + }
47 +
48 + const normalizedCode = this.couponNormalizerService.normalize(promotion.couponCode);
49 + const coupon = await tx.coupon.findUniqueOrThrow({
50 + where: {
51 + normalizedCode,
52 + },
53 + });
54 +
55 + await tx.couponRedemption.create({
56 + data: {
57 + couponId: coupon.id,
58 + userId,
59 + orderReference,
60 + reservationKey: `order:${orderReference}:coupon:${coupon.id}`,
61 + status: 'REDEEMED',
62 + quantity: 1,
63 + },
64 + });
65 +
66 + await tx.coupon.update({
67 + where: { id: coupon.id },
68 + data: {
69 + redeemedCount: {
70 + increment: 1,
71 + },
72 + },
73 + });
74 + }
75 + }
76 +}

• Edited apps\api\src\modules\promotions\promotions.module.ts (+14 -2)
8 import { PromotionEvaluatorService } from './services/promotion-evaluator.service';
9 +import { PromotionUsageService } from './services/promotion-usage.service';
10
⋮
13 controllers: [PromotionsAdminController],
13 - providers: [MoneyService, CouponNormalizerService, PromotionAdminService, PromotionEvaluatorService],
14 - exports: [CouponNormalizerService, PromotionAdminService, PromotionEvaluatorService],
14 + providers: [
15 + MoneyService,
16 + CouponNormalizerService,
17 + PromotionAdminService,
18 + PromotionEvaluatorService,
19 + PromotionUsageService,
20 + ],
21 + exports: [
22 + CouponNormalizerService,
23 + PromotionAdminService,
24 + PromotionEvaluatorService,
25 + PromotionUsageService,
26 + ],
27 })

• Added apps\api\src\modules\orders\services\order.service.ts (+151 -0)
1 +import { ForbiddenException, Inject, Injectable, NotFoundException } from '@nestjs/common';
2 +import type { Prisma } from '@prisma/client';
3 +
4 +import { PrismaService } from '../../persistence/services/prisma.service';
5 +
6 +@Injectable()
7 +export class OrderService {
8 + constructor(
9 + @Inject(PrismaService)
10 + private readonly prisma: PrismaService,
11 + ) {}
12 +
13 + async listCustomerOrders(userId: string) {
14 + const orders = await this.prisma.order.findMany({
15 + where: { userId },
16 + include: this.orderInclude,
17 + orderBy: [{ createdAt: 'desc' }],
18 + });
19 +
20 + return orders.map((order) => this.serializeOrder(order));
21 + }
22 +
23 + async getCustomerOrder(orderId: string, userId: string) {
24 + const order = await this.prisma.order.findUnique({
25 + where: { id: orderId },
26 + include: this.orderInclude,
27 + });
28 +
29 + if (!order) {
30 + throw new NotFoundException(`Order "${orderId}" was not found`);
31 + }
32 +
33 + if (order.userId !== userId) {
34 + throw new ForbiddenException('You do not have access to this order');
35 + }
36 +
37 + return this.serializeOrder(order);
38 + }
39 +
40 + async listAdminOrders() {
41 + const orders = await this.prisma.order.findMany({
42 + include: this.orderInclude,
43 + orderBy: [{ createdAt: 'desc' }],
44 + });
45 +
46 + return orders.map((order) => this.serializeOrder(order));
47 + }
48 +
49 + async getAdminOrder(orderId: string) {
50 + const order = await this.prisma.order.findUnique({
51 + where: { id: orderId },
52 + include: this.orderInclude,
53 + });
54 +
55 + if (!order) {
56 + throw new NotFoundException(`Order "${orderId}" was not found`);
57 + }
58 +
59 + return this.serializeOrder(order);
60 + }
61 +
62 + serializeOrder(
63 + order: Prisma.OrderGetPayload<{
64 + include: typeof this.orderInclude;
65 + }>,
66 + ) {
67 + return {
68 + id: order.id,
69 + orderNumber: order.orderNumber,
70 + userId: order.userId,
71 + cartId: order.cartId,
72 + status: order.status,
73 + paymentMethod: order.paymentMethod,
74 + paymentStatus: order.paymentStatus,
75 + fulfillmentStatus: order.fulfillmentStatus,
76 + customerEmail: order.customerEmail,
77 + customerName: order.customerName,
78 + customerPhone: order.customerPhone,
79 + currencyCode: order.currencyCode,
80 + countryCode: order.countryCode,
81 + shippingMethod: {
82 + key: order.shippingMethodKey,
83 + name: order.shippingMethodName,
84 + rateType: order.shippingRateType,
85 + estimatedMinDays: order.shippingEstimatedMinDays,
86 + estimatedMaxDays: order.shippingEstimatedMaxDays,
87 + },
88 + couponCode: order.couponCode,
89 + subtotalAmount: order.subtotalAmount,
90 + subtotalDiscountAmount: order.subtotalDiscountAmount,
91 + discountedSubtotalAmount: order.discountedSubtotalAmount,
92 + shippingAmount: order.shippingAmount,
93 + taxAmount: order.taxAmount,
94 + grandTotalAmount: order.grandTotalAmount,
95 + placedAt: order.placedAt.toISOString(),
96 + createdAt: order.createdAt.toISOString(),
97 + updatedAt: order.updatedAt.toISOString(),
98 + addresses: order.addresses.map((address) => ({
99 + id: address.id,
100 + type: address.type,
101 + recipientName: address.recipientName,
102 + phoneNumber: address.phoneNumber,
103 + countryCode: address.countryCode,
104 + city: address.city,
105 + state: address.state,
106 + postalCode: address.postalCode,
107 + addressLine1: address.addressLine1,
108 + addressLine2: address.addressLine2,
109 + company: address.company,
110 + })),
111 + items: order.lines.map((line) => ({
112 + id: line.id,
113 + productId: line.productId,
114 + variantId: line.variantId,
115 + sku: line.sku,
116 + productName: line.productName,
117 + variantName: line.variantName,
118 + quantity: line.quantity,
119 + currencyCode: line.currencyCode,
120 + unitBaseAmount: line.unitBaseAmount,
121 + unitSaleAmount: line.unitSaleAmount,
122 + effectiveUnitAmount: line.effectiveUnitAmount,
123 + lineSubtotalAmount: line.lineSubtotalAmount,
124 + taxAmount: line.taxAmount,
125 + })),
126 + appliedPromotions: order.appliedPromotions.map((promotion) => ({
127 + id: promotion.id,
128 + promotionId: promotion.promotionId,
129 + key: promotion.key,
130 + name: promotion.name,
131 + rewardType: promotion.rewardType,
132 + discountAmount: promotion.discountAmount,
133 + freeShipping: promotion.freeShipping,
134 + source: promotion.source,
135 + couponCode: promotion.couponCode,
136 + })),
137 + };
138 + }
139 +
140 + private readonly orderInclude = {
141 + addresses: {
142 + orderBy: [{ createdAt: 'asc' as const }],
143 + },
144 + lines: {
145 + orderBy: [{ createdAt: 'asc' as const }],
146 + },
147 + appliedPromotions: {
148 + orderBy: [{ createdAt: 'asc' as const }],
149 + },
150 + } satisfies Prisma.OrderInclude;
151 +}

• Added apps\api\src\modules\orders\services\order-outbox.service.ts (+53 -0)
1 +import { Inject, Injectable } from '@nestjs/common';
2 +import type { Prisma } from '@prisma/client';
3 +
4 +import { PrismaService } from '../../persistence/services/prisma.service';
5 +
6 +@Injectable()
7 +export class OrderOutboxService {
8 + constructor(
9 + @Inject(PrismaService)
10 + private readonly prisma: PrismaService,
11 + ) {}
12 +
13 + async emitPlaced(order: {
14 + id: string;
15 + orderNumber: string;
16 + userId: string | null;
17 + status: string;
18 + paymentStatus: string;
19 + fulfillmentStatus: string;
20 + grandTotalAmount: number;
21 + currencyCode: string;
22 + }, tx: Prisma.TransactionClient = this.prisma) {
23 + await tx.outboxEvent.createMany({
24 + data: [
25 + {
26 + aggregateType: 'ORDER',
27 + aggregateId: order.id,
28 + eventType: 'order.placed',
29 + deduplicationKey: `order.placed:${order.id}`,
30 + payload: {
31 + orderId: order.id,
32 + orderNumber: order.orderNumber,
33 + userId: order.userId,
34 + grandTotalAmount: order.grandTotalAmount,
35 + currencyCode: order.currencyCode,
36 + },
37 + },
38 + {
39 + aggregateType: 'ORDER',
40 + aggregateId: order.id,
41 + eventType: 'order.status.changed',
42 + deduplicationKey: `order.status.changed:${order.id}:${order.status}:${order.paymentStatus}:${order.ful
fillmentStatus}`,
43 + payload: {
44 + orderId: order.id,
45 + status: order.status,
46 + paymentStatus: order.paymentStatus,
47 + fulfillmentStatus: order.fulfillmentStatus,
48 + },
49 + },
50 + ],
51 + });
52 + }
53 +}

• Added apps\api\src\modules\orders\controllers\customer-orders.controller.ts (+28 -0)
1 +import { Controller, Get, Param, UseGuards } from '@nestjs/common';
2 +import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
3 +
4 +import { CurrentUser } from '../../identity/decorators/current-user.decorator';
5 +import { AuthGuard } from '../../identity/guards/auth.guard';
6 +import type { AccessTokenPayload } from '../../identity/services/token.service';
7 +import { OrderService } from '../services/order.service';
8 +
9 +@ApiTags('Orders')
10 +@ApiBearerAuth()
11 +@UseGuards(AuthGuard)
12 +@Controller('orders')
13 +export class CustomerOrdersController {
14 + constructor(private readonly orderService: OrderService) {}
15 +
16 + @Get('me')
17 + listMyOrders(@CurrentUser() currentUser: AccessTokenPayload) {
18 + return this.orderService.listCustomerOrders(currentUser.sub);
19 + }
20 +
21 + @Get('me/:orderId')
22 + getMyOrder(
23 + @Param('orderId') orderId: string,
24 + @CurrentUser() currentUser: AccessTokenPayload,
25 + ) {
26 + return this.orderService.getCustomerOrder(orderId, currentUser.sub);
27 + }
28 +}

• Added apps\api\src\modules\orders\controllers\admin-orders.controller.ts (+29 -0)
1 +import { Controller, Get, Param, UseGuards } from '@nestjs/common';
2 +import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
3 +
4 +import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
5 +import { Roles } from '../../identity/decorators/roles.decorator';
6 +import { AuthGuard } from '../../identity/guards/auth.guard';
7 +import { PermissionsGuard } from '../../identity/guards/permissions.guard';
8 +import { RolesGuard } from '../../identity/guards/roles.guard';
9 +import { OrderService } from '../services/order.service';
10 +
11 +@ApiTags('Orders Admin')
12 +@ApiBearerAuth()
13 +@UseGuards(AuthGuard, RolesGuard, PermissionsGuard)
14 +@Roles(['super_admin'])
15 +@RequirePermissions(['orders.read'])
16 +@Controller('orders/admin')
17 +export class AdminOrdersController {
18 + constructor(private readonly orderService: OrderService) {}
19 +
20 + @Get()
21 + listOrders() {
22 + return this.orderService.listAdminOrders();
23 + }
24 +
25 + @Get(':orderId')
26 + getOrder(@Param('orderId') orderId: string) {
27 + return this.orderService.getAdminOrder(orderId);
28 + }
29 +}

• Added apps\api\src\modules\orders\orders.module.ts (+16 -0)
1 +import { Module } from '@nestjs/common';
2 +
3 +import { IdentityModule } from '../identity/identity.module';
4 +import { PersistenceModule } from '../persistence/persistence.module';
5 +import { AdminOrdersController } from './controllers/admin-orders.controller';
6 +import { CustomerOrdersController } from './controllers/customer-orders.controller';
7 +import { OrderOutboxService } from './services/order-outbox.service';
8 +import { OrderService } from './services/order.service';
9 +
10 +@Module({
11 + imports: [IdentityModule, PersistenceModule],
12 + controllers: [CustomerOrdersController, AdminOrdersController],
13 + providers: [OrderService, OrderOutboxService],
14 + exports: [OrderService, OrderOutboxService],
15 +})
16 +export class OrdersModule {}

• Edited apps\api\src\modules\orders\services\order.service.ts (+16 -0)
61
62 + async getSerializedOrderById(
63 + orderId: string,
64 + tx: Prisma.TransactionClient | PrismaService = this.prisma,
65 + ) {
66 + const order = await tx.order.findUnique({
67 + where: { id: orderId },
68 + include: this.orderInclude,
69 + });
70 +
71 + if (!order) {
72 + throw new NotFoundException(`Order "${orderId}" was not found`);
73 + }
74 +
75 + return this.serializeOrder(order);
76 + }
77 +
78 serializeOrder(

• Added apps\api\src\modules\checkout\services\checkout-placement.service.ts (+463 -0)
1 +import { randomUUID } from 'node:crypto';
2 +
3 +import {
4 + BadRequestException,
5 + ForbiddenException,
6 + Inject,
7 + Injectable,
8 + NotFoundException,
9 +} from '@nestjs/common';
10 +import type { Prisma } from '@prisma/client';
11 +
12 +import { CartService } from '../../carts/services/cart.service';
13 +import { InventoryCoreService } from '../../inventory/services/inventory-core.service';
14 +import { OrderOutboxService } from '../../orders/services/order-outbox.service';
15 +import { OrderService } from '../../orders/services/order.service';
16 +import { PrismaTransactionService } from '../../persistence/services/prisma-transaction.service';
17 +import { PrismaService } from '../../persistence/services/prisma.service';
18 +import type { CheckoutPreviewDto } from '../../pricing/dto/pricing-public.dto';
19 +import { PricingPreviewService } from '../../pricing/services/pricing-preview.service';
20 +import { PromotionUsageService } from '../../promotions/services/promotion-usage.service';
21 +import {
22 + CheckoutPaymentMethod,
23 + type CheckoutAddressDto,
24 + type CheckoutPlaceOrderDto,
25 +} from '../dto/checkout.dto';
26 +import { CheckoutIdempotencyService } from './checkout-idempotency.service';
27 +import { CodPaymentService } from '../../payments/services/cod-payment.service';
28 +
29 +@Injectable()
30 +export class CheckoutPlacementService {
31 + constructor(
32 + @Inject(PrismaService)
33 + private readonly prisma: PrismaService,
34 + @Inject(CartService)
35 + private readonly cartService: CartService,
36 + @Inject(PricingPreviewService)
37 + private readonly pricingPreviewService: PricingPreviewService,
38 + @Inject(InventoryCoreService)
39 + private readonly inventoryCoreService: InventoryCoreService,
40 + @Inject(PrismaTransactionService)
41 + private readonly prismaTransactionService: PrismaTransactionService,
42 + @Inject(CheckoutIdempotencyService)
43 + private readonly checkoutIdempotencyService: CheckoutIdempotencyService,
44 + @Inject(CodPaymentService)
45 + private readonly codPaymentService: CodPaymentService,
46 + @Inject(PromotionUsageService)
47 + private readonly promotionUsageService: PromotionUsageService,
48 + @Inject(OrderOutboxService)
49 + private readonly orderOutboxService: OrderOutboxService,
50 + @Inject(OrderService)
51 + private readonly orderService: OrderService,
52 + ) {}
53 +
54 + async placeOrder(
55 + dto: CheckoutPlaceOrderDto,
56 + options: {
57 + actorUserId?: string;
58 + guestToken?: string;
59 + idempotencyKey: string;
60 + },
61 + ) {
62 + const cart = await this.cartService.getCartOrThrow(dto.cartId);
63 + this.cartService.assertCartAccess(cart, {
64 + userId: options.actorUserId,
65 + guestToken: options.guestToken,
66 + });
67 +
68 + const normalizedIdempotencyKey = options.idempotencyKey.trim();
69 + if (!normalizedIdempotencyKey) {
70 + throw new BadRequestException('Idempotency-Key header is required');
71 + }
72 +
73 + const scope = this.resolveIdempotencyScope(options.actorUserId, options.guestToken);
74 +
75 + const executionResult = await this.checkoutIdempotencyService.execute({
76 + scope,
77 + key: normalizedIdempotencyKey,
78 + actorUserId: options.actorUserId,
79 + requestBody: {
80 + actorUserId: options.actorUserId ?? null,
81 + guestToken: options.guestToken ?? null,
82 + ...dto,
83 + },
84 + execute: async () => {
85 + const responseBody = await this.prismaTransactionService.runInTransaction(
86 + async (tx) => {
87 + const transactionalCart = await this.cartService.getCartOrThrow(dto.cartId, tx);
88 + this.cartService.assertCartAccess(transactionalCart, {
89 + userId: options.actorUserId,
90 + guestToken: options.guestToken,
91 + });
92 +
93 + if (transactionalCart.items.length === 0) {
94 + throw new BadRequestException('Cart must contain at least one item before checkout placement');
95 + }
96 +
97 + const paymentDecision = this.codPaymentService.assertPlacementAllowed(
98 + dto.paymentMethod,
99 + );
100 + const pricingPreview = await this.pricingPreviewService.previewCheckout(
101 + this.buildPricingPreviewInput(dto, transactionalCart, options.actorUserId),
102 + );
103 +
104 + const shippingMethod = pricingPreview.shippingMethods.find(
105 + (method) => method.key === dto.shippingMethodKey,
106 + );
107 + if (!shippingMethod) {
108 + throw new BadRequestException(
109 + `Shipping method "${dto.shippingMethodKey}" is not available for this checkout`,
110 + );
111 + }
112 +
113 + const reservationKey = dto.reservationKey?.trim() || `order:${transactionalCart.id}:${randomUUID()}
         `;
114 + if (dto.reservationKey) {
115 + await this.assertReusableReservation(
116 + reservationKey,
117 + transactionalCart.items.map((item) => ({
118 + variantId: item.variantId,
119 + quantity: item.quantity,
120 + })),
121 + options.actorUserId,
122 + tx,
123 + );
124 + } else {
125 + await this.reserveStockForOrder(
126 + reservationKey,
127 + transactionalCart.items.map((item) => ({
128 + variantId: item.variantId,
129 + quantity: item.quantity,
130 + })),
131 + options.actorUserId,
132 + tx,
133 + );
134 + }
135 +
136 + const variantSnapshots = await this.loadVariantSnapshots(
137 + transactionalCart.items.map((item) => item.variantId),
138 + dto.customerLocale,
139 + tx,
140 + );
141 +
142 + const order = await tx.order.create({
143 + data: {
144 + orderNumber: this.generateOrderNumber(),
145 + userId: options.actorUserId ?? transactionalCart.userId ?? null,
146 + cartId: transactionalCart.id,
147 + reservationKey,
148 + customerEmail: dto.customerEmail.trim(),
149 + customerName: dto.shippingAddress.recipientName.trim(),
150 + customerPhone: dto.shippingAddress.phoneNumber.trim(),
151 + currencyCode: pricingPreview.currencyCode,
152 + countryCode: pricingPreview.countryCode,
153 + status: 'PLACED',
154 + paymentMethod: paymentDecision.paymentMethod,
155 + paymentStatus: paymentDecision.paymentStatus,
156 + fulfillmentStatus: 'UNFULFILLED',
157 + shippingMethodKey: shippingMethod.key,
158 + shippingMethodName: shippingMethod.name,
159 + shippingRateType: shippingMethod.rateType,
160 + shippingEstimatedMinDays: shippingMethod.estimatedMinDays,
161 + shippingEstimatedMaxDays: shippingMethod.estimatedMaxDays,
162 + couponCode: transactionalCart.couponCode,
163 + subtotalAmount: pricingPreview.subtotalAmount,
164 + subtotalDiscountAmount: pricingPreview.subtotalDiscountAmount,
165 + discountedSubtotalAmount: pricingPreview.discountedSubtotalAmount,
166 + shippingAmount: shippingMethod.amount,
167 + taxAmount: pricingPreview.taxAmount,
168 + grandTotalAmount: shippingMethod.totalAmount,
169 + },
170 + });
171 +
172 + await tx.orderAddress.createMany({
173 + data: this.buildAddressRows(order.id, dto.shippingAddress, dto.billingAddress),
174 + });
175 +
176 + await tx.orderLine.createMany({
177 + data: pricingPreview.items.map((item) => {
178 + const variantSnapshot = variantSnapshots.get(item.variantId);
179 + if (!variantSnapshot) {
180 + throw new NotFoundException(
181 + `Catalog snapshot for variant "${item.variantId}" was not found`,
182 + );
183 + }
184 +
185 + return {
186 + orderId: order.id,
187 + variantId: item.variantId,
188 + productId: variantSnapshot.productId,
189 + sku: item.sku,
190 + productName: variantSnapshot.productName,
191 + variantName: variantSnapshot.variantName,
192 + quantity: item.quantity,
193 + currencyCode: item.currencyCode,
194 + unitBaseAmount: item.unitBaseAmount,
195 + unitSaleAmount: item.unitSaleAmount,
196 + effectiveUnitAmount: item.effectiveUnitAmount,
197 + lineSubtotalAmount: item.lineSubtotalAmount,
198 + taxAmount: item.taxAmount,
199 + };
200 + }),
201 + });
202 +
203 + if (pricingPreview.appliedPromotions.length > 0) {
204 + await tx.orderAppliedPromotion.createMany({
205 + data: pricingPreview.appliedPromotions.map((promotion) => ({
206 + orderId: order.id,
207 + promotionId: promotion.promotionId,
208 + key: promotion.key,
209 + name: promotion.name,
210 + rewardType: promotion.rewardType,
211 + discountAmount: promotion.discountAmount,
212 + freeShipping: promotion.freeShipping,
213 + source: promotion.source,
214 + couponCode: promotion.couponCode,
215 + })),
216 + });
217 + }
218 +
219 + await this.promotionUsageService.redeemAppliedPromotions(
220 + pricingPreview.appliedPromotions,
221 + order.id,
222 + options.actorUserId ?? transactionalCart.userId ?? undefined,
223 + tx,
224 + );
225 +
226 + await this.inventoryCoreService.redeemStockReservation(
227 + reservationKey,
228 + order.id,
229 + tx,
230 + );
231 +
232 + await tx.cart.update({
233 + where: { id: transactionalCart.id },
234 + data: { status: 'ABANDONED' },
235 + });
236 +
237 + await this.orderOutboxService.emitPlaced(order, tx);
238 +
239 + return this.orderService.getSerializedOrderById(order.id, tx);
240 + },
241 + );
242 +
243 + return {
244 + responseCode: 201,
245 + responseBody,
246 + };
247 + },
248 + });
249 +
250 + return executionResult.responseBody;
251 + }
252 +
253 + private buildPricingPreviewInput(
254 + dto: CheckoutPlaceOrderDto,
255 + cart: {
256 + couponCode: string | null;
257 + userId: string | null;
258 + items: Array<{ variantId: string; quantity: number }>;
259 + },
260 + actorUserId?: string,
261 + ): CheckoutPreviewDto {
262 + return {
263 + currencyCode: dto.currencyCode,
264 + countryCode: dto.countryCode,
265 + customerLocale: dto.customerLocale,
266 + customerId: actorUserId ?? cart.userId ?? undefined,
267 + couponCodes: cart.couponCode ? [cart.couponCode] : undefined,
268 + items: cart.items.map((item) => ({
269 + variantId: item.variantId,
270 + quantity: item.quantity,
271 + })),
272 + };
273 + }
274 +
275 + private async reserveStockForOrder(
276 + reservationKey: string,
277 + items: Array<{ variantId: string; quantity: number }>,
278 + actorUserId: string | undefined,
279 + tx: Prisma.TransactionClient,
280 + ) {
281 + const defaultWarehouse = await tx.warehouse.findFirst({
282 + where: { isDefault: true },
283 + orderBy: [{ createdAt: 'asc' }],
284 + });
285 +
286 + if (!defaultWarehouse) {
287 + throw new NotFoundException('Default warehouse is not configured');
288 + }
289 +
290 + const expiresAt = new Date(Date.now() + 15 _ 60 _ 1000);
291 + for (const item of items) {
292 + await this.inventoryCoreService.reserveStock(
293 + defaultWarehouse.id,
294 + item.variantId,
295 + item.quantity,
296 + reservationKey,
297 + expiresAt,
298 + actorUserId,
299 + tx,
300 + );
301 + }
302 + }
303 +
304 + private async assertReusableReservation(
305 + reservationKey: string,
306 + items: Array<{ variantId: string; quantity: number }>,
307 + actorUserId: string | undefined,
308 + tx: Prisma.TransactionClient,
309 + ) {
310 + const reservations = await tx.stockReservation.findMany({
311 + where: {
312 + reservationKey,
313 + status: 'RESERVED',
314 + },
315 + });
316 +
317 + if (reservations.length === 0) {
318 + throw new BadRequestException('The supplied reservation key is not active');
319 + }
320 +
321 + if (
322 + actorUserId &&
323 + reservations.some(
324 + (reservation) =>
325 + reservation.userId !== null && reservation.userId !== actorUserId,
326 + )
327 + ) {
328 + throw new ForbiddenException('The supplied reservation key does not belong to the current user');
329 + }
330 +
331 + if (!actorUserId && reservations.some((reservation) => reservation.userId !== null)) {
332 + throw new ForbiddenException('Guest checkout cannot reuse an authenticated reservation key');
333 + }
334 +
335 + const expected = new Map(items.map((item) => [item.variantId, item.quantity]));
336 + const actual = new Map(reservations.map((reservation) => [reservation.variantId, reservation.quantity]));
337 +
338 + if (expected.size !== actual.size) {
339 + throw new BadRequestException('The supplied reservation key does not match the current cart contents');
340 + }
341 +
342 + for (const [variantId, quantity] of expected.entries()) {
343 + if (actual.get(variantId) !== quantity) {
344 + throw new BadRequestException('The supplied reservation key does not match the current cart contents');
345 + }
346 + }
347 + }
348 +
349 + private async loadVariantSnapshots(
350 + variantIds: string[],
351 + customerLocale: string | undefined,
352 + tx: Prisma.TransactionClient,
353 + ) {
354 + const variants = await tx.catalogProductVariant.findMany({
355 + where: {
356 + id: {
357 + in: variantIds,
358 + },
359 + },
360 + include: {
361 + translations: true,
362 + product: {
363 + include: {
364 + translations: true,
365 + },
366 + },
367 + },
368 + });
369 +
370 + const locale = customerLocale?.trim().toLowerCase();
371 + return new Map(
372 + variants.map((variant) => [
373 + variant.id,
374 + {
375 + productId: variant.productId,
376 + productName:
377 + this.resolveLocalizedName(
378 + variant.product.translations.map((translation) => ({
379 + locale: translation.locale,
380 + value: translation.name,
381 + })),
382 + locale,
383 + ) ?? variant.product.sku,
384 + variantName:
385 + this.resolveLocalizedName(
386 + variant.translations.map((translation) => ({
387 + locale: translation.locale,
388 + value: translation.name,
389 + })),
390 + locale,
391 + ) ?? variant.sku,
392 + },
393 + ]),
394 + );
395 + }
396 +
397 + private resolveLocalizedName(
398 + values: Array<{ locale: string; value: string }>,
399 + requestedLocale?: string,
400 + ) {
401 + if (requestedLocale) {
402 + const exact = values.find((value) => value.locale.toLowerCase() === requestedLocale);
403 + if (exact) {
404 + return exact.value;
405 + }
406 + }
407 +
408 + const english = values.find((value) => value.locale.toLowerCase() === 'en');
409 + return english?.value ?? values[0]?.value;
410 + }
411 +
412 + private buildAddressRows(
413 + orderId: string,
414 + shippingAddress: CheckoutAddressDto,
415 + billingAddress?: CheckoutAddressDto,
416 + ) {
417 + const billing = billingAddress ?? shippingAddress;
418 +
419 + return [
420 + this.mapAddressRow(orderId, 'SHIPPING', shippingAddress),
421 + this.mapAddressRow(orderId, 'BILLING', billing),
422 + ];
423 + }
424 +
425 + private mapAddressRow(
426 + orderId: string,
427 + type: 'SHIPPING' | 'BILLING',
428 + address: CheckoutAddressDto,
429 + ) {
430 + return {
431 + orderId,
432 + type,
433 + recipientName: address.recipientName.trim(),
434 + phoneNumber: address.phoneNumber.trim(),
435 + countryCode: address.countryCode.trim().toUpperCase(),
436 + city: address.city.trim(),
437 + state: address.state?.trim() || null,
438 + postalCode: address.postalCode?.trim() || null,
439 + addressLine1: address.addressLine1.trim(),
440 + addressLine2: address.addressLine2?.trim() || null,
441 + company: address.company?.trim() || null,
442 + };
443 + }
444 +
445 + private resolveIdempotencyScope(actorUserId?: string, guestToken?: string) {
446 + if (actorUserId) {
447 + return `checkout.place:user:${actorUserId}`;
448 + }
449 +
450 + const normalizedGuestToken = guestToken?.trim();
451 + if (!normalizedGuestToken) {
452 + throw new BadRequestException('Guest checkout requires an x-guest-cart-token header');
453 + }
454 +
455 + return `checkout.place:guest:${normalizedGuestToken}`;
456 + }
457 +
458 + private generateOrderNumber() {
459 + const datePart = new Date().toISOString().slice(0, 10).replace(/-/g, '');
460 + const randomPart = randomUUID().slice(0, 8).toUpperCase();
461 + return `ORD-${datePart}-${randomPart}`;
462 + }
463 +}

• Edited apps\api\src\modules\checkout\checkout.module.ts (+21 -3)
5 import { InventoryModule } from '../inventory/inventory.module';
6 +import { OrdersModule } from '../orders/orders.module';
7 +import { PaymentsModule } from '../payments/payments.module';
8 import { PersistenceModule } from '../persistence/persistence.module';
9 import { PricingModule } from '../pricing/pricing.module';
10 +import { PromotionsModule } from '../promotions/promotions.module';
11 import { CheckoutController } from './controllers/checkout.controller';
12 +import { CheckoutIdempotencyService } from './services/checkout-idempotency.service';
13 +import { CheckoutPlacementService } from './services/checkout-placement.service';
14 import { CheckoutPreviewService } from './services/checkout-preview.service';
⋮
16 @Module({
12 - imports: [IdentityModule, PricingModule, InventoryModule, CartsModule, PersistenceModule],
17 + imports: [
18 + IdentityModule,
19 + PricingModule,
20 + InventoryModule,
21 + CartsModule,
22 + PersistenceModule,
23 + OrdersModule,
24 + PaymentsModule,
25 + PromotionsModule,
26 + ],
27 controllers: [CheckoutController],
14 - providers: [CheckoutPreviewService],
15 - exports: [CheckoutPreviewService],
28 + providers: [
29 + CheckoutPreviewService,
30 + CheckoutIdempotencyService,
31 + CheckoutPlacementService,
32 + ],
33 + exports: [CheckoutPreviewService, CheckoutPlacementService],
34 })

• Edited apps\api\src\modules\checkout\controllers\checkout.controller.ts (+29 -2)
1 -import { Body, Controller, Post, Req, UseGuards } from '@nestjs/common';
1 +import { Body, Controller, Headers, Post, Req, UseGuards } from '@nestjs/common';
2 import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
⋮
9 import { CartService } from '../../carts/services/cart.service';
10 -import { CheckoutCartPreviewDto } from '../dto/checkout.dto';
10 +import {
11 + CheckoutCartPreviewDto,
12 + CheckoutPlaceOrderDto,
13 +} from '../dto/checkout.dto';
14 +import { CheckoutPlacementService } from '../services/checkout-placement.service';
15 import { CheckoutPreviewService } from '../services/checkout-preview.service';
⋮
21 private readonly checkoutPreviewService: CheckoutPreviewService,
22 + private readonly checkoutPlacementService: CheckoutPlacementService,
23 private readonly cartService: CartService,
⋮
67
68 + @Post('place')
69 + async placeOrder(
70 + @Body() body: CheckoutPlaceOrderDto,
71 + @Headers('idempotency-key') idempotencyKey: string | undefined,
72 + @Req() request: FastifyRequest,
73 + ) {
74 + const cart = await this.cartService.getCartOrThrow(body.cartId);
75 + const currentUser = await this.resolveOptionalUser(request);
76 + const guestToken = this.readGuestTokenHeader(request);
77 +
78 + this.cartService.assertCartAccess(cart, {
79 + userId: currentUser?.sub,
80 + guestToken,
81 + });
82 +
83 + return this.checkoutPlacementService.placeOrder(body, {
84 + actorUserId: currentUser?.sub,
85 + guestToken,
86 + idempotencyKey: idempotencyKey ?? '',
87 + });
88 + }
89 +
90 private readGuestTokenHeader(request: FastifyRequest) {

• Edited apps\api\src\app.module.ts (+4 -0)
15 import { InventoryModule } from './modules/inventory/inventory.module';
16 +import { OrdersModule } from './modules/orders/orders.module';
17 +import { PaymentsModule } from './modules/payments/payments.module';
83 WishlistModule,
84 + PaymentsModule,
85 CheckoutModule,
86 + OrdersModule,
87 ],

• Edited prisma\seed.ts (+6 -0)
128 description: 'Allows manual stock adjustments.'
129 + },
130 + {
131 + key: 'orders.read',
134 + description: 'Allows reading customer and administrative order records.'
135 }

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The placement path, order read module, payment gate, and promotion-usage service are wired in. I’m running typecheck
now before adding migration/docs/tests, because this stage usually exposes DTO, Prisma-type, and module-cycle mistakes
faster than test execution does.

• Ran pnpm.cmd --filter @ecommerce/api typecheck
└ > @ecommerce/api@0.1.0 typecheck D:\Projects\NodeJS-Projects\e-commerce-api\apps\api
… +96 lines (ctrl + t to view transcript)
 ERR_PNPM_RECURSIVE_RUN_FIRST_FAIL  @ecommerce/api@0.1.0 typecheck: `tsc -p tsconfig.json --noEmit`

• Running Get-Content apps/api/src/modules/pricing/services/shipping.service.ts

• Ran Get-Content apps/api/src/modules/orders/services/order.service.ts
└ import { ForbiddenException, Inject, Injectable, NotFoundException } from '@nestjs/common';
import type { Prisma } from '@prisma/client';
… +163 lines (ctrl + t to view transcript)
} satisfies Prisma.OrderInclude;
}

• Ran Get-Content apps/api/src/modules/pricing/services/shipping.service.ts
└ import { BadRequestException, Inject, Injectable } from '@nestjs/common';

    … +84 lines (ctrl + t to view transcript)
      }
    }

• Edited apps\api\src\modules\orders\services\order.service.ts (+22 -21)
5
6 +const orderInclude = {
7 + addresses: {
8 + orderBy: [{ createdAt: 'asc' as const }],
9 + },
10 + lines: {
11 + orderBy: [{ createdAt: 'asc' as const }],
12 + },
13 + appliedPromotions: {
14 + orderBy: [{ createdAt: 'asc' as const }],
15 + },
16 +} satisfies Prisma.OrderInclude;
17 +
18 +type OrderRecord = Prisma.OrderGetPayload<{
19 + include: typeof orderInclude;
20 +}>;
21 +
22 @Injectable()
⋮
31 where: { userId },
16 - include: this.orderInclude,
32 + include: orderInclude,
33 orderBy: [{ createdAt: 'desc' }],
⋮
41 where: { id: orderId },
26 - include: this.orderInclude,
42 + include: orderInclude,
43 });
⋮
57 const orders = await this.prisma.order.findMany({
42 - include: this.orderInclude,
58 + include: orderInclude,
59 orderBy: [{ createdAt: 'desc' }],
⋮
67 where: { id: orderId },
52 - include: this.orderInclude,
68 + include: orderInclude,
69 });
⋮
83 where: { id: orderId },
68 - include: this.orderInclude,
84 + include: orderInclude,
85 });
94 + serializeOrder(order: OrderRecord) {
95 return {
⋮
167
156 - private readonly orderInclude = {
157 - addresses: {
158 - orderBy: [{ createdAt: 'asc' as const }],
159 - },
160 - lines: {
161 - orderBy: [{ createdAt: 'asc' as const }],
162 - },
163 - appliedPromotions: {
164 - orderBy: [{ createdAt: 'asc' as const }],
165 - },
166 - } satisfies Prisma.OrderInclude;
168 }
21 import {
22 - CheckoutPaymentMethod,
22 type CheckoutAddressDto,
⋮
110 }
111 + const shippingMethodRecord = await tx.shippingMethod.findUnique({
112 + where: {
113 + id: shippingMethod.methodId,
114 + },
115 + });
118 + `Shipping method "${dto.shippingMethodKey}" could not be resolved`,
119 + );
120 + }
121
⋮
167 shippingMethodName: shippingMethod.name,
159 - shippingRateType: shippingMethod.rateType,
168 + shippingRateType: shippingMethodRecord.rateType,
169 shippingEstimatedMinDays: shippingMethod.estimatedMinDays,

• Ran pnpm.cmd --filter @ecommerce/api typecheck
└ > @ecommerce/api@0.1.0 typecheck D:\Projects\NodeJS-Projects\e-commerce-api\apps\api > tsc -p tsconfig.json --noEmit

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The core runtime now typechecks. I’m switching to database and verification artifacts next: first the incremental SQL
migration for the new order tables and the promotion-ledger uniqueness fix, then tests so the phase isn’t just
structurally complete but actually guarded against duplicate-submit regressions.

• Running Get-Content prisma/migrations/20260525_07_carts_wishlist_checkout_preview/migration.sql

• Running Get-Content apps/api/test/e2e/checkout-preview.e2e-spec.ts

• Ran Get-Content prisma/migrations/20260525_07_carts_wishlist_checkout_preview/migration.sql
└ -- CreateTable
CREATE TABLE `Cart` (
… +71 lines (ctrl + t to view transcript)
ALTER TABLE `WishlistItem` ADD CONSTRAINT `WishlistItem_variantId_fkey` FOREIGN KEY (`variantId`) REFERENCES
`CatalogProductVariant`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

• Ran Get-Content apps/api/test/e2e/checkout-preview.e2e-spec.ts
└ import request from 'supertest';
import { ValidationPipe } from '@nestjs/common';
… +125 lines (ctrl + t to view transcript)
});
});

• Ran Get-Content apps/api/src/modules/checkout/services/checkout-preview.service.spec.ts
└ import { BadRequestException, NotFoundException } from '@nestjs/common';

    … +179 lines (ctrl + t to view transcript)
      });
    });

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• I’m adding the SQL artifact by hand rather than trying to regenerate from a synthetic pre-phase schema. This phase
only adds a few new tables and one constraint correction, so a direct incremental migration is faster and easier to
review.

• Added prisma\migrations\20260525_08_orders_idempotency_cod\migration.sql (+142 -0)
1 +-- DropIndex
2 +DROP INDEX `PromotionRedemption_reservationKey_key` ON `PromotionRedemption`;
3 +
4 +-- DropIndex
5 +DROP INDEX `CouponRedemption_reservationKey_key` ON `CouponRedemption`;
6 +
7 +-- CreateTable
8 +CREATE TABLE `Order` (
9 + `id` VARCHAR(191) NOT NULL,
10 + `orderNumber` VARCHAR(191) NOT NULL,
11 + `userId` VARCHAR(191) NULL,
12 + `cartId` VARCHAR(191) NULL,
13 + `idempotencyKeyId` VARCHAR(191) NULL,
14 + `reservationKey` VARCHAR(191) NULL,
15 + `customerEmail` VARCHAR(191) NOT NULL,
16 + `customerName` VARCHAR(191) NOT NULL,
17 + `customerPhone` VARCHAR(191) NOT NULL,
18 + `currencyCode` VARCHAR(191) NOT NULL,
19 + `countryCode` VARCHAR(191) NOT NULL,
20 + `status` ENUM('PLACED', 'FULFILLED', 'CANCELLED') NOT NULL DEFAULT 'PLACED',
21 + `paymentMethod` ENUM('CASH_ON_DELIVERY') NOT NULL,
22 + `paymentStatus` ENUM('PENDING', 'PAID', 'FAILED', 'REFUNDED', 'VOIDED') NOT NULL DEFAULT 'PENDING',
23 + `fulfillmentStatus` ENUM('UNFULFILLED', 'FULFILLED', 'RETURNED', 'CANCELLED') NOT NULL DEFAULT 'UNFULFILLED
',
24 + `shippingMethodKey` VARCHAR(191) NOT NULL,
25 + `shippingMethodName` VARCHAR(191) NOT NULL,
26 + `shippingRateType` ENUM('FLAT', 'PERCENTAGE_OF_SUBTOTAL') NOT NULL,
27 + `shippingEstimatedMinDays` INTEGER NULL,
28 + `shippingEstimatedMaxDays` INTEGER NULL,
29 + `couponCode` VARCHAR(191) NULL,
30 + `subtotalAmount` INTEGER NOT NULL,
31 + `subtotalDiscountAmount` INTEGER NOT NULL,
32 + `discountedSubtotalAmount` INTEGER NOT NULL,
33 + `shippingAmount` INTEGER NOT NULL,
34 + `taxAmount` INTEGER NOT NULL,
35 + `grandTotalAmount` INTEGER NOT NULL,
36 + `placedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
37 + `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
38 + `updatedAt` DATETIME(3) NOT NULL,
39 +
40 + UNIQUE INDEX `Order_orderNumber_key`(`orderNumber`),
41 + UNIQUE INDEX `Order_idempotencyKeyId_key`(`idempotencyKeyId`),
42 + UNIQUE INDEX `Order_reservationKey_key`(`reservationKey`),
43 + INDEX `Order_userId_createdAt_idx`(`userId`, `createdAt`),
44 + INDEX `Order_status_createdAt_idx`(`status`, `createdAt`),
45 + PRIMARY KEY (`id`)
46 +) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
47 +
48 +-- CreateTable
49 +CREATE TABLE `OrderAddress` (
50 + `id` VARCHAR(191) NOT NULL,
51 + `orderId` VARCHAR(191) NOT NULL,
52 + `type` ENUM('SHIPPING', 'BILLING') NOT NULL,
53 + `recipientName` VARCHAR(191) NOT NULL,
54 + `phoneNumber` VARCHAR(191) NOT NULL,
55 + `countryCode` VARCHAR(191) NOT NULL,
56 + `city` VARCHAR(191) NOT NULL,
57 + `state` VARCHAR(191) NULL,
58 + `postalCode` VARCHAR(191) NULL,
59 + `addressLine1` VARCHAR(191) NOT NULL,
60 + `addressLine2` VARCHAR(191) NULL,
61 + `company` VARCHAR(191) NULL,
62 + `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
63 + `updatedAt` DATETIME(3) NOT NULL,
64 +
65 + UNIQUE INDEX `OrderAddress_orderId_type_key`(`orderId`, `type`),
66 + INDEX `OrderAddress_type_idx`(`type`),
67 + PRIMARY KEY (`id`)
68 +) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
69 +
70 +-- CreateTable
71 +CREATE TABLE `OrderLine` (
72 + `id` VARCHAR(191) NOT NULL,
73 + `orderId` VARCHAR(191) NOT NULL,
74 + `variantId` VARCHAR(191) NOT NULL,
75 + `productId` VARCHAR(191) NOT NULL,
76 + `sku` VARCHAR(191) NOT NULL,
77 + `productName` VARCHAR(191) NOT NULL,
78 + `variantName` VARCHAR(191) NOT NULL,
79 + `quantity` INTEGER NOT NULL,
80 + `currencyCode` VARCHAR(191) NOT NULL,
81 + `unitBaseAmount` INTEGER NOT NULL,
82 + `unitSaleAmount` INTEGER NULL,
83 + `effectiveUnitAmount` INTEGER NOT NULL,
84 + `lineSubtotalAmount` INTEGER NOT NULL,
85 + `taxAmount` INTEGER NOT NULL,
86 + `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
87 + `updatedAt` DATETIME(3) NOT NULL,
88 +
89 + INDEX `OrderLine_orderId_idx`(`orderId`),
90 + INDEX `OrderLine_variantId_idx`(`variantId`),
91 + INDEX `OrderLine_productId_idx`(`productId`),
92 + PRIMARY KEY (`id`)
93 +) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
94 +
95 +-- CreateTable
96 +CREATE TABLE `OrderAppliedPromotion` (
97 + `id` VARCHAR(191) NOT NULL,
98 + `orderId` VARCHAR(191) NOT NULL,
99 + `promotionId` VARCHAR(191) NULL,
100 + `key` VARCHAR(191) NOT NULL,
101 + `name` VARCHAR(191) NOT NULL,
102 + `rewardType` ENUM('FIXED_AMOUNT', 'PERCENTAGE', 'FREE_SHIPPING') NOT NULL,
103 + `discountAmount` INTEGER NOT NULL,
104 + `freeShipping` BOOLEAN NOT NULL DEFAULT false,
105 + `source` ENUM('AUTOMATIC', 'COUPON') NOT NULL,
106 + `couponCode` VARCHAR(191) NULL,
107 + `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
108 +
109 + INDEX `OrderAppliedPromotion_orderId_idx`(`orderId`),
110 + INDEX `OrderAppliedPromotion_promotionId_idx`(`promotionId`),
111 + PRIMARY KEY (`id`)
112 +) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
113 +
114 +-- CreateIndex
115 +CREATE UNIQUE INDEX `PromotionRedemption_promotionId_reservationKey_key` ON `PromotionRedemption`(`promotionId`
, `reservationKey`);
116 +
117 +-- CreateIndex
118 +CREATE UNIQUE INDEX `CouponRedemption_couponId_reservationKey_key` ON `CouponRedemption`(`couponId`, `reservati
         onKey`);
119 +
120 +-- AddForeignKey
121 +ALTER TABLE `Order` ADD CONSTRAINT `Order_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE
SET NULL ON UPDATE CASCADE;
122 +
123 +-- AddForeignKey
124 +ALTER TABLE `Order` ADD CONSTRAINT `Order_cartId_fkey` FOREIGN KEY (`cartId`) REFERENCES `Cart`(`id`) ON DELETE
SET NULL ON UPDATE CASCADE;
125 +
126 +-- AddForeignKey
127 +ALTER TABLE `Order` ADD CONSTRAINT `Order_idempotencyKeyId_fkey` FOREIGN KEY (`idempotencyKeyId`) REFERENCES `I
         dempotencyKey`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
128 +
129 +-- AddForeignKey
130 +ALTER TABLE `OrderAddress` ADD CONSTRAINT `OrderAddress_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order
         `(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
131 +
132 +-- AddForeignKey
133 +ALTER TABLE `OrderLine` ADD CONSTRAINT `OrderLine_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`id`
) ON DELETE CASCADE ON UPDATE CASCADE;
134 +
135 +-- AddForeignKey
136 +ALTER TABLE `OrderLine` ADD CONSTRAINT `OrderLine_variantId_fkey` FOREIGN KEY (`variantId`) REFERENCES `Catalog
         ProductVariant`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
137 +
138 +-- AddForeignKey
139 +ALTER TABLE `OrderLine` ADD CONSTRAINT `OrderLine_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Catalog
         Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
140 +
141 +-- AddForeignKey
142 +ALTER TABLE `OrderAppliedPromotion` ADD CONSTRAINT `OrderAppliedPromotion_orderId_fkey` FOREIGN KEY (`orderId`)
REFERENCES `Order`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• I’m adding two focused unit specs rather than a broad fragile suite: one around idempotency state transitions, one
around placement orchestration. That gives direct coverage for the highest-risk behavior in this phase: duplicate-
submit replay safety and transactional reservation redemption.

• Added apps\api\src\modules\checkout\services\checkout-idempotency.service.spec.ts (+119 -0)
1 +import { ConflictException } from '@nestjs/common';
2 +import { IdempotencyStatus, Prisma } from '@prisma/client';
3 +
4 +import { CheckoutIdempotencyService } from './checkout-idempotency.service';
5 +
6 +describe('CheckoutIdempotencyService', () => {
7 + const prisma = {
8 + idempotencyKey: {
9 + create: jest.fn(),
10 + findUnique: jest.fn(),
11 + update: jest.fn(),
12 + },
13 + };
14 +
15 + let service: CheckoutIdempotencyService;
16 +
17 + beforeEach(() => {
18 + jest.clearAllMocks();
19 + service = new CheckoutIdempotencyService(prisma as never);
20 + });
21 +
22 + it('persists a completed response for a new idempotent request', async () => {
23 + prisma.idempotencyKey.create.mockResolvedValue({
24 + id: 'idem_1',
25 + status: IdempotencyStatus.PENDING,
26 + });
27 + prisma.idempotencyKey.update.mockResolvedValue({});
28 +
29 + const result = await service.execute({
30 + scope: 'checkout.place:user:user_1',
31 + key: 'idem-key',
32 + actorUserId: 'user_1',
33 + requestBody: { cartId: 'cart_1' },
34 + execute: async () => ({
35 + responseCode: 201,
36 + responseBody: { orderId: 'order_1' },
37 + }),
38 + });
39 +
40 + expect(result).toEqual({
41 + replayed: false,
42 + responseCode: 201,
43 + responseBody: { orderId: 'order_1' },
44 + });
45 + expect(prisma.idempotencyKey.update).toHaveBeenCalledWith(
46 + expect.objectContaining({
47 + where: { id: 'idem_1' },
48 + data: expect.objectContaining({
49 + status: IdempotencyStatus.COMPLETED,
50 + responseCode: 201,
51 + responseBody: { orderId: 'order_1' },
52 + }),
53 + }),
54 + );
55 + });
56 +
57 + it('replays a completed response when the same key and payload are retried', async () => {
58 + prisma.idempotencyKey.create.mockRejectedValue(
59 + new Prisma.PrismaClientKnownRequestError('duplicate', {
60 + code: 'P2002',
61 + clientVersion: 'test',
62 + }),
63 + );
64 + prisma.idempotencyKey.findUnique.mockResolvedValue({
65 + id: 'idem_1',
66 + actorUserId: 'user_1',
67 + requestHash: service['hashRequestBody']({ cartId: 'cart_1' }),
68 + status: IdempotencyStatus.COMPLETED,
69 + responseCode: 201,
70 + responseBody: { orderId: 'order_1' },
71 + });
72 +
73 + const execute = jest.fn();
74 + const result = await service.execute({
75 + scope: 'checkout.place:user:user_1',
76 + key: 'idem-key',
77 + actorUserId: 'user_1',
78 + requestBody: { cartId: 'cart_1' },
79 + execute,
80 + });
81 +
82 + expect(result).toEqual({
83 + replayed: true,
84 + responseCode: 201,
85 + responseBody: { orderId: 'order_1' },
86 + });
87 + expect(execute).not.toHaveBeenCalled();
88 + });
89 +
90 + it('rejects reuse of an idempotency key with a different request payload', async () => {
91 + prisma.idempotencyKey.create.mockRejectedValue(
92 + new Prisma.PrismaClientKnownRequestError('duplicate', {
93 + code: 'P2002',
94 + clientVersion: 'test',
95 + }),
96 + );
97 + prisma.idempotencyKey.findUnique.mockResolvedValue({
98 + id: 'idem_1',
99 + actorUserId: 'user_1',
100 + requestHash: 'different-hash',
101 + status: IdempotencyStatus.COMPLETED,
102 + responseCode: 201,
103 + responseBody: { orderId: 'order_1' },
104 + });
105 +
106 + await expect(
107 + service.execute({
108 + scope: 'checkout.place:user:user_1',
109 + key: 'idem-key',
110 + actorUserId: 'user_1',
111 + requestBody: { cartId: 'cart_1' },
112 + execute: async () => ({
113 + responseCode: 201,
114 + responseBody: { orderId: 'order_1' },
115 + }),
116 + }),
117 + ).rejects.toThrow(ConflictException);
118 + });
119 +});

• Added apps\api\src\modules\checkout\services\checkout-placement.service.spec.ts (+287 -0)
1 +import { BadRequestException } from '@nestjs/common';
2 +
3 +import { CheckoutPaymentMethod } from '../dto/checkout.dto';
4 +import { CheckoutPlacementService } from './checkout-placement.service';
5 +
6 +describe('CheckoutPlacementService', () => {
7 + const prisma = {};
8 +
9 + const cart = {
10 + id: 'cart_1',
11 + guestToken: 'guest-token',
12 + userId: null,
13 + couponCode: 'VIP15',
14 + items: [
15 + {
16 + variantId: 'variant_1',
17 + quantity: 2,
18 + },
19 + ],
20 + };
21 +
22 + const cartService = {
23 + getCartOrThrow: jest.fn(),
24 + assertCartAccess: jest.fn(),
25 + };
26 +
27 + const pricingPreviewService = {
28 + previewCheckout: jest.fn(),
29 + };
30 +
31 + const inventoryCoreService = {
32 + reserveStock: jest.fn(),
33 + redeemStockReservation: jest.fn(),
34 + };
35 +
36 + const tx = {
37 + warehouse: {
38 + findFirst: jest.fn(),
39 + },
40 + stockReservation: {
41 + findMany: jest.fn(),
42 + },
43 + shippingMethod: {
44 + findUnique: jest.fn(),
45 + },
46 + catalogProductVariant: {
47 + findMany: jest.fn(),
48 + },
49 + order: {
50 + create: jest.fn(),
51 + },
52 + orderAddress: {
53 + createMany: jest.fn(),
54 + },
55 + orderLine: {
56 + createMany: jest.fn(),
57 + },
58 + orderAppliedPromotion: {
59 + createMany: jest.fn(),
60 + },
61 + cart: {
62 + update: jest.fn(),
63 + },
64 + };
65 +
66 + const prismaTransactionService = {
67 + runInTransaction: jest.fn(async (callback: (input: typeof tx) => Promise<unknown>) =>
68 + callback(tx),
69 + ),
70 + };
71 +
72 + const checkoutIdempotencyService = {
73 + execute: jest.fn(
74 + async (params: {
75 + execute: () => Promise<{ responseCode: number; responseBody: Record<string, unknown> }>;
76 + }) => {
77 + const result = await params.execute();
78 + return { replayed: false, ...result };
79 + },
80 + ),
81 + };
82 +
83 + const codPaymentService = {
84 + assertPlacementAllowed: jest.fn().mockReturnValue({
85 + paymentMethod: 'CASH_ON_DELIVERY',
86 + paymentStatus: 'PENDING',
87 + }),
88 + };
89 +
90 + const promotionUsageService = {
91 + redeemAppliedPromotions: jest.fn(),
92 + };
93 +
94 + const orderOutboxService = {
95 + emitPlaced: jest.fn(),
96 + };
97 +
98 + const orderService = {
99 + getSerializedOrderById: jest.fn(),
100 + };
101 +
102 + let service: CheckoutPlacementService;
103 +
104 + beforeEach(() => {
105 + jest.clearAllMocks();
106 + cartService.getCartOrThrow.mockResolvedValue(cart);
107 + pricingPreviewService.previewCheckout.mockResolvedValue({
108 + currencyCode: 'USD',
109 + countryCode: 'US',
110 + subtotalAmount: 2000,
111 + subtotalDiscountAmount: 500,
112 + discountedSubtotalAmount: 1500,
113 + taxAmount: 100,
114 + appliedPromotions: [
115 + {
116 + promotionId: 'promo_1',
117 + key: 'vip-coupon',
118 + name: 'VIP Coupon',
119 + rewardType: 'FIXED_AMOUNT',
120 + discountAmount: 500,
121 + freeShipping: false,
122 + source: 'COUPON',
123 + couponCode: 'VIP15',
124 + },
125 + ],
126 + rejectedPromotions: [],
127 + grandTotalExcludingShippingAmount: 1600,
128 + shippingMethods: [
129 + {
130 + methodId: 'ship_1',
131 + key: 'standard',
132 + name: 'Standard Shipping',
133 + zone: { id: 'zone_1', key: 'us', name: 'US' },
134 + amount: 700,
135 + totalAmount: 2300,
136 + currencyCode: 'USD',
137 + estimatedMinDays: 3,
138 + estimatedMaxDays: 5,
139 + },
140 + ],
141 + items: [
142 + {
143 + variantId: 'variant_1',
144 + sku: 'SKU-1',
145 + quantity: 2,
146 + currencyCode: 'USD',
147 + unitBaseAmount: 1000,
148 + unitSaleAmount: 750,
149 + effectiveUnitAmount: 750,
150 + lineSubtotalAmount: 1500,
151 + taxAmount: 100,
152 + },
153 + ],
154 + });
155 + tx.warehouse.findFirst.mockResolvedValue({ id: 'warehouse_1' });
156 + tx.shippingMethod.findUnique.mockResolvedValue({ id: 'ship_1', rateType: 'FLAT' });
157 + tx.catalogProductVariant.findMany.mockResolvedValue([
158 + {
159 + id: 'variant_1',
160 + productId: 'product_1',
161 + sku: 'SKU-1',
162 + translations: [{ locale: 'en', name: 'Variant Name' }],
163 + product: {
164 + sku: 'PRODUCT-SKU',
165 + translations: [{ locale: 'en', name: 'Product Name' }],
166 + },
167 + },
168 + ]);
169 + tx.order.create.mockResolvedValue({
170 + id: 'order_1',
171 + orderNumber: 'ORD-20260525-ABCD1234',
172 + userId: null,
173 + status: 'PLACED',
174 + paymentStatus: 'PENDING',
175 + fulfillmentStatus: 'UNFULFILLED',
176 + grandTotalAmount: 2300,
177 + currencyCode: 'USD',
178 + });
179 + orderService.getSerializedOrderById.mockResolvedValue({
180 + id: 'order_1',
181 + orderNumber: 'ORD-20260525-ABCD1234',
182 + });
183 +
184 + service = new CheckoutPlacementService(
185 + prisma as never,
186 + cartService as never,
187 + pricingPreviewService as never,
188 + inventoryCoreService as never,
189 + prismaTransactionService as never,
190 + checkoutIdempotencyService as never,
191 + codPaymentService as never,
192 + promotionUsageService as never,
193 + orderOutboxService as never,
194 + orderService as never,
195 + );
196 + });
197 +
198 + it('places an order by reserving, redeeming, snapshotting, and emitting outbox events', async () => {
199 + const result = await service.placeOrder(
200 + {
201 + cartId: 'cart_1',
202 + currencyCode: 'USD',
203 + countryCode: 'US',
204 + customerEmail: 'guest@example.com',
205 + shippingMethodKey: 'standard',
206 + paymentMethod: CheckoutPaymentMethod.CASH_ON_DELIVERY,
207 + shippingAddress: {
208 + recipientName: 'Guest User',
209 + phoneNumber: '+15551230000',
210 + countryCode: 'US',
211 + city: 'New York',
212 + addressLine1: '1 Example St',
213 + },
214 + },
215 + {
216 + guestToken: 'guest-token',
217 + idempotencyKey: 'idem-key',
218 + },
219 + );
220 +
221 + expect(codPaymentService.assertPlacementAllowed).toHaveBeenCalledWith(
222 + CheckoutPaymentMethod.CASH_ON_DELIVERY,
223 + );
224 + expect(inventoryCoreService.reserveStock).toHaveBeenCalledWith(
225 + 'warehouse_1',
226 + 'variant_1',
227 + 2,
228 + expect.stringContaining('order:cart_1:'),
229 + expect.any(Date),
230 + undefined,
231 + tx,
232 + );
233 + expect(inventoryCoreService.redeemStockReservation).toHaveBeenCalledWith(
234 + expect.stringContaining('order:cart_1:'),
235 + 'order_1',
236 + tx,
237 + );
238 + expect(promotionUsageService.redeemAppliedPromotions).toHaveBeenCalledWith(
239 + expect.any(Array),
240 + 'order_1',
241 + undefined,
242 + tx,
243 + );
244 + expect(orderOutboxService.emitPlaced).toHaveBeenCalled();
245 + expect(result).toEqual({
246 + id: 'order_1',
247 + orderNumber: 'ORD-20260525-ABCD1234',
248 + });
249 + });
250 +
251 + it('rejects placement when a supplied reservation key no longer matches the cart', async () => {
252 + tx.stockReservation.findMany.mockResolvedValue([
253 + {
254 + variantId: 'variant_1',
255 + quantity: 1,
256 + userId: null,
257 + },
258 + ]);
259 +
260 + await expect(
261 + service.placeOrder(
262 + {
263 + cartId: 'cart_1',
264 + currencyCode: 'USD',
267 + shippingMethodKey: 'standard',
268 + paymentMethod: CheckoutPaymentMethod.CASH_ON_DELIVERY,
269 + reservationKey: 'preview-key',
270 + shippingAddress: {
271 + recipientName: 'Guest User',
272 + phoneNumber: '+15551230000',
273 + countryCode: 'US',
274 + city: 'New York',
275 + addressLine1: '1 Example St',
276 + },
277 + },
278 + {
279 + guestToken: 'guest-token',
280 + idempotencyKey: 'idem-key',
281 + },
282 + ),
283 + ).rejects.toThrow(BadRequestException);
284 +
285 + expect(inventoryCoreService.redeemStockReservation).not.toHaveBeenCalled();
286 + });
287 +});

• Running Get-Content apps/api/src/modules/identity/decorators/roles.decorator.ts

• Ran Get-Content apps/api/src/modules/identity/guards/roles.guard.ts
└ import { type CanActivate, type ExecutionContext, Injectable } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
… +26 lines (ctrl + t to view transcript)
}
}

• Ran Get-Content apps/api/src/modules/identity/decorators/roles.decorator.ts
└ import { Reflector } from '@nestjs/core';

    export const Roles = Reflector.createDecorator<string[]>();

• Added apps\api\test\e2e\orders.e2e-spec.ts (+174 -0)
1 +import request from 'supertest';
2 +import { ValidationPipe } from '@nestjs/common';
3 +import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';
4 +import { Test } from '@nestjs/testing';
5 +
6 +import { CartService } from '../../src/modules/carts/services/cart.service';
7 +import { CheckoutController } from '../../src/modules/checkout/controllers/checkout.controller';
8 +import { CheckoutPlacementService } from '../../src/modules/checkout/services/checkout-placement.service';
9 +import { CheckoutPreviewService } from '../../src/modules/checkout/services/checkout-preview.service';
10 +import { CustomerOrdersController } from '../../src/modules/orders/controllers/customer-orders.controller';
11 +import { AdminOrdersController } from '../../src/modules/orders/controllers/admin-orders.controller';
12 +import { OrderService } from '../../src/modules/orders/services/order.service';
13 +import { AuthGuard } from '../../src/modules/identity/guards/auth.guard';
14 +import { PermissionsGuard } from '../../src/modules/identity/guards/permissions.guard';
15 +import { RolesGuard } from '../../src/modules/identity/guards/roles.guard';
16 +import { TokenService } from '../../src/modules/identity/services/token.service';
17 +
18 +describe('Orders and checkout placement (e2e)', () => {
19 + let app: NestFastifyApplication;
20 +
21 + const mockCartService = {
22 + getCartOrThrow: jest.fn().mockResolvedValue({
23 + id: 'cart_1',
24 + guestToken: 'guest-token',
25 + userId: null,
26 + items: [{ variantId: 'variant_1', quantity: 2 }],
27 + }),
28 + assertCartAccess: jest.fn(),
29 + };
30 +
31 + const mockCheckoutPreviewService = {
32 + previewFromCart: jest.fn(),
33 + };
34 +
35 + const mockCheckoutPlacementService = {
36 + placeOrder: jest.fn().mockResolvedValue({
37 + id: 'order_1',
38 + orderNumber: 'ORD-20260525-ABCD1234',
39 + }),
40 + };
41 +
42 + const mockOrderService = {
43 + listCustomerOrders: jest.fn().mockResolvedValue([{ id: 'order_1' }]),
44 + getCustomerOrder: jest.fn().mockResolvedValue({ id: 'order_1' }),
45 + listAdminOrders: jest.fn().mockResolvedValue([{ id: 'order_1' }]),
46 + getAdminOrder: jest.fn().mockResolvedValue({ id: 'order_1' }),
47 + };
48 +
49 + const mockTokenService = {
50 + verifyAccessToken: jest.fn((token: string) => {
51 + if (token === 'customer-token') {
52 + return {
53 + sub: 'user_1',
54 + email: 'customer@example.com',
55 + userType: 'CUSTOMER' as const,
56 + roles: ['customer'],
57 + permissions: [],
58 + };
59 + }
60 +
61 + if (token === 'admin-token') {
62 + return {
63 + sub: 'admin_1',
64 + email: 'admin@example.com',
65 + userType: 'ADMIN' as const,
66 + roles: ['super_admin'],
67 + permissions: ['orders.read'],
68 + };
69 + }
70 +
71 + throw new Error('invalid token');
72 + }),
73 + };
74 +
75 + beforeAll(async () => {
76 + const moduleRef = await Test.createTestingModule({
77 + controllers: [
78 + CheckoutController,
79 + CustomerOrdersController,
80 + AdminOrdersController,
81 + ],
82 + providers: [
83 + AuthGuard,
84 + RolesGuard,
85 + PermissionsGuard,
86 + { provide: CartService, useValue: mockCartService },
87 + { provide: CheckoutPreviewService, useValue: mockCheckoutPreviewService },
88 + { provide: CheckoutPlacementService, useValue: mockCheckoutPlacementService },
89 + { provide: OrderService, useValue: mockOrderService },
90 + { provide: TokenService, useValue: mockTokenService },
91 + ],
92 + }).compile();
93 +
94 + app = moduleRef.createNestApplication<NestFastifyApplication>(new FastifyAdapter());
95 + app.setGlobalPrefix('api/v1');
96 + app.useGlobalPipes(
97 + new ValidationPipe({
98 + whitelist: true,
99 + transform: true,
100 + forbidNonWhitelisted: true,
101 + }),
102 + );
103 +
104 + await app.init();
105 + await app.getHttpAdapter().getInstance().ready();
106 + });
107 +
108 + afterAll(async () => {
109 + await app.close();
110 + });
111 +
112 + it('places a guest order when an idempotency key and guest token are supplied', async () => {
113 + await request(app.getHttpServer())
114 + .post('/api/v1/checkout/place')
115 + .set('Idempotency-Key', 'idem-key')
116 + .set('x-guest-cart-token', 'guest-token')
117 + .send({
118 + cartId: 'cart_1',
119 + currencyCode: 'USD',
120 + countryCode: 'US',
121 + customerEmail: 'guest@example.com',
122 + shippingMethodKey: 'standard',
123 + paymentMethod: 'cash_on_delivery',
124 + shippingAddress: {
125 + recipientName: 'Guest User',
126 + phoneNumber: '+15551230000',
127 + countryCode: 'US',
128 + city: 'New York',
129 + addressLine1: '1 Example St',
130 + },
131 + })
132 + .expect(201)
133 + .expect(({ body }: { body: { id: string } }) => {
134 + expect(body.id).toBe('order_1');
135 + });
136 +
137 + expect(mockCheckoutPlacementService.placeOrder).toHaveBeenCalledWith(
138 + expect.objectContaining({
139 + cartId: 'cart_1',
140 + }),
141 + expect.objectContaining({
142 + guestToken: 'guest-token',
143 + idempotencyKey: 'idem-key',
144 + }),
145 + );
146 + });
147 +
148 + it('returns authenticated customer orders', async () => {
149 + await request(app.getHttpServer())
150 + .get('/api/v1/orders/me')
151 + .set('Authorization', 'Bearer customer-token')
152 + .expect(200)
153 + .expect(({ body }: { body: Array<{ id: string }> }) => {
154 + expect(body[0]?.id).toBe('order_1');
155 + });
156 + });
159 + await request(app.getHttpServer())
160 + .get('/api/v1/orders/admin')
161 + .set('Authorization', 'Bearer admin-token')
162 + .expect(200)
163 + .expect(({ body }: { body: Array<{ id: string }> }) => {
166 + });
167 +
168 + it('forbids customer tokens from the admin order listing route', async () => {
169 + await request(app.getHttpServer())
170 + .get('/api/v1/orders/admin')
173 + });
174 +});

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The first focused tests are in. I’m running the new unit and E2E targets now so I can fix any orchestration mismatches
before I touch docs or phase-closeout files.

• Ran pnpm.cmd --filter @ecommerce/api test -- --runInBand checkout-idempotency.service checkout-placement.service
└ > @ecommerce/api@0.1.0 test D:\Projects\NodeJS-Projects\e-commerce-api\apps\api
… +7 lines (ctrl + t to view transcript)
Time: 2.991 s
Ran all test suites matching --runInBand|checkout-idempotency.service|checkout-placement.service.

• Ran pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand orders
└ > @ecommerce/api@0.1.0 test:e2e D:\Projects\NodeJS-Projects\e-commerce-api\apps\api
… +5 lines (ctrl + t to view transcript)
Time: 3.197 s
Ran all test suites matching --runInBand|orders.
└ > @ecommerce/api@0.1.0 lint D:\Projects\NodeJS-Projects\e-commerce-api\apps\api
… +10 lines (ctrl + t to view transcript)
 ERR_PNPM_RECURSIVE_RUN_FIRST_FAIL  @ecommerce/api@0.1.0 lint: `eslint "src/**/*.ts" "test/**/*.ts"`
Exit status 1

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The new code itself passed lint; the failure is just the test stub shape in the idempotency spec. I’m tightening those
mock callbacks, then I’ll rerun lint and the broader verification set.
34 - execute: async () => ({
34 + execute: () => Promise.resolve({
35 responseCode: 201,
⋮
111 requestBody: { cartId: 'cart_1' },
112 - execute: async () => ({
112 + execute: () => Promise.resolve({
113 responseCode: 201,

• Ran pnpm.cmd --filter @ecommerce/api lint
└ > @ecommerce/api@0.1.0 lint D:\Projects\NodeJS-Projects\e-commerce-api\apps\api > eslint "src/**/\*.ts" "test/**/\*.ts"

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The new unit/E2E slices and lint are green. I’m running the remaining phase-appropriate verification now: combined
checkout/order tests, build, Prisma validate, and OpenAPI generation so the new modules are exercised at boot time as
well as in isolation.

• Running pnpm.cmd openapi:generate

• Running pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand orders checkout-preview

• Running pnpm.cmd prisma:validate

• Running pnpm.cmd --filter @ecommerce/api build

• Ran pnpm.cmd prisma:validate
└ > e-commerce-api-workspace@0.1.0 prisma:validate D:\Projects\NodeJS-Projects\e-commerce-api
… +4 lines (ctrl + t to view transcript)

    Prisma schema loaded from prisma\schema.prisma.

• Ran pnpm.cmd --filter @ecommerce/api test -- --runInBand checkout-idempotency.service checkout-placement.service
│ checkout-preview.service
└ > @ecommerce/api@0.1.0 test D:\Projects\NodeJS-Projects\e-commerce-api\apps\api
… +8 lines (ctrl + t to view transcript)
Ran all test suites matching --runInBand|checkout-idempotency.service|checkout-placement.service|
checkout-preview.service.

• Ran pnpm.cmd openapi:generate
└ > e-commerce-api-workspace@0.1.0 openapi:generate D:\Projects\NodeJS-Projects\e-commerce-api
… +4 lines (ctrl + t to view transcript) > tsx src/scripts/generate-openapi.ts

• Ran pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand orders checkout-preview
└ > @ecommerce/api@0.1.0 test:e2e D:\Projects\NodeJS-Projects\e-commerce-api\apps\api
… +148 lines (ctrl + t to view transcript)
Time: 5.717 s
Ran all test suites matching --runInBand|orders|checkout-preview.

• Ran pnpm.cmd --filter @ecommerce/api build
└ > @ecommerce/api@0.1.0 build D:\Projects\NodeJS-Projects\e-commerce-api\apps\api > tsc -p tsconfig.build.json

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The runtime is fine; the only red bar came from an existing checkout-preview controller spec that now needs the new
CheckoutPlacementService dependency wired into its test module. I’m updating that test harness and rerunning the
combined E2E slice.
7 import { CheckoutController } from '../../src/modules/checkout/controllers/checkout.controller';
8 +import { CheckoutPlacementService } from '../../src/modules/checkout/services/checkout-placement.service';
9 import { CheckoutPreviewService } from '../../src/modules/checkout/services/checkout-preview.service';
⋮
39
40 + const mockCheckoutPlacementService = {
41 + placeOrder: jest.fn(),
42 + };
43 +
44 const mockTokenService = {
⋮
66 { provide: CartService, useValue: mockCartService },
⋮
85 afterAll(async () => {
80 - await app.close();
86 + if (app) {
87 + await app.close();
88 + }
89 });

• Ran pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand orders checkout-preview
└ > @ecommerce/api@0.1.0 test:e2e D:\Projects\NodeJS-Projects\e-commerce-api\apps\api
… +6 lines (ctrl + t to view transcript)
Time: 3.341 s, estimated 5 s
Ran all test suites matching --runInBand|orders|checkout-preview.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The code path is now verified. I’m in closeout mode for phase 08: updating the domain/API docs, the planning
artifacts, ADR/pattern notes, and the project brain so the next session resumes at phase 09 instead of rediscovering
this order slice.

• Running Get-Content plans/phase-08-orders-idempotency-cod/context.md

• Running Get-Content plans/phase-08-orders-idempotency-cod/tasks.md

• Running Get-Content docs/implementation-status.md

• Running Get-Content plans/DECISIONS.md

• Ran Get-Content plans/phase-08-orders-idempotency-cod/context.md
└ # Phase 08 Context

    … +15 lines (ctrl + t to view transcript)
    - Exact order state machine granularity before online payments are introduced
    - Whether idempotency keys are enforced per route, actor, or broader request scope

• Ran Get-Content plans/phase-08-orders-idempotency-cod/tasks.md
└ # Phase 08 Tasks

    … +5 lines (ctrl + t to view transcript)
    - [ ] Emit outbox events for order placement and status changes.
    - [ ] Write E2E and integration tests covering duplicate submit and transactional invariants.

• Ran Get-Content plans/DECISIONS.md
└ # Architecture Decisions

    ---

• Ran Get-Content plans/PATTERNS.md
└ # Engineering Patterns

    … +100 lines (ctrl + t to view transcript)
    must always re-evaluate pricing/promotions after merge rather than reusing stale client snapshots.
    ---

• Ran Get-Content docs/implementation-status.md
└ # Implementation Status

    … +377 lines (ctrl + t to view transcript)
    ### Recommended Next Phase
    - Begin `phase-08-orders-idempotency-cod` from its planning files.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• I’m deciding whether to close the test task as-is or add a MySQL-gated integration spec. The phase brief explicitly
names integration coverage, so I’m checking the existing integration-test harness now; if it’s lightweight enough,
I’ll add one order-placement integration spec rather than stretching the wording.

• Running Get-Content apps/api/test/integration/promotions.integration.spec.ts

• Running rg -n "RUN_MYSQL_INTEGRATION|describeMySql|mysql-test-client|assertMysqlAvailable" apps/api/test/integration

• Ran Get-Content apps/api/test/integration/promotions.integration.spec.ts
└ import 'dotenv/config';

    … +129 lines (ctrl + t to view transcript)
      });
    });

• Ran rg -n "RUN_MYSQL_INTEGRATION|describeMySql|mysql-test-client|assertMysqlAvailable" apps/api/test/integration
└ apps/api/test/integration\inventory.integration.spec.ts:3:import { assertMysqlDatabaseAvailable,
createMysqlTestPrismaClient } from './support/mysql-test-client';
… +18 lines (ctrl + t to view transcript)
apps/api/test/integration\seed.integration.spec.ts:7:const runMysqlIntegration = process.env.RUN_MYSQL_INTEGRATION
=== 'true';

• Ran Get-Content apps/api/test/integration/inventory.integration.spec.ts
└ import 'dotenv/config';

    … +185 lines (ctrl + t to view transcript)
      });
    });

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• The integration harness is lightweight enough, so I’m adding one MySQL-gated order spec instead of hand-waving the
task. It won’t run locally without MySQL, but it gives the phase an actual DB-backed contract for order snapshots plus
idempotency uniqueness.

• Added apps\api\test\integration\orders.integration.spec.ts (+281 -0)
1 +import 'dotenv/config';
2 +
3 +import { assertMysqlDatabaseAvailable, createMysqlTestPrismaClient } from './support/mysql-test-client';
4 +
5 +const runMysqlIntegration = process.env.RUN_MYSQL_INTEGRATION === 'true';
6 +const describeMysqlIntegration = runMysqlIntegration ? describe : describe.skip;
7 +
8 +describeMysqlIntegration('orders integration', () => {
9 + const prisma = createMysqlTestPrismaClient();
10 + const suffix = Date.now().toString();
11 +
12 + let userId: string;
13 + let promotionId: string;
14 + let secondPromotionId: string;
15 + let productId: string;
16 + let variantId: string;
17 + let idempotencyKeyId: string;
18 + let orderId: string;
19 +
20 + beforeAll(async () => {
21 + await assertMysqlDatabaseAvailable(prisma, 'orders integration');
22 +
23 + const user = await prisma.user.create({
24 + data: {
25 + email: `orders-${suffix}@example.com`,
26 + normalizedEmail: `orders-${suffix}@example.com`,
27 + displayName: 'Orders Integration',
28 + passwordHash: 'hashed-password',
29 + userType: 'CUSTOMER',
30 + status: 'ACTIVE',
31 + },
32 + });
33 + userId = user.id;
34 +
35 + const productType = await prisma.catalogProductType.create({
36 + data: {
37 + key: `orders-type-${suffix}`,
38 + status: 'PUBLISHED',
39 + sortOrder: 99,
40 + },
41 + });
42 + await prisma.catalogProductTypeTranslation.create({
43 + data: {
44 + productTypeId: productType.id,
45 + locale: 'en',
46 + name: 'Orders Type',
47 + slug: `orders-type-${suffix}`,
48 + },
49 + });
50 +
51 + const product = await prisma.catalogProduct.create({
52 + data: {
53 + productTypeId: productType.id,
54 + sku: `ORDER-PRODUCT-${suffix}`,
55 + status: 'PUBLISHED',
56 + },
57 + });
58 + productId = product.id;
59 + await prisma.catalogProductTranslation.create({
60 + data: {
61 + productId,
62 + locale: 'en',
63 + name: 'Order Product',
64 + slug: `order-product-${suffix}`,
65 + },
66 + });
67 +
68 + const variant = await prisma.catalogProductVariant.create({
69 + data: {
70 + productId,
71 + sku: `ORDER-VARIANT-${suffix}`,
72 + status: 'PUBLISHED',
73 + },
74 + });
75 + variantId = variant.id;
76 + await prisma.catalogProductVariantTranslation.create({
77 + data: {
78 + variantId,
79 + locale: 'en',
80 + name: 'Order Variant',
81 + },
82 + });
83 +
84 + const idempotencyKey = await prisma.idempotencyKey.create({
85 + data: {
86 + scope: `checkout.place:user:${userId}`,
87 + key: `idem-${suffix}`,
88 + actorUserId: userId,
89 + requestHash: 'hash',
90 + status: 'COMPLETED',
91 + responseCode: 201,
92 + responseBody: { orderId: 'pending' },
93 + expiresAt: new Date(Date.now() + 24 _ 60 _ 60 _ 1000),
94 + },
95 + });
96 + idempotencyKeyId = idempotencyKey.id;
97 +
98 + const firstPromotion = await prisma.promotion.create({
99 + data: {
100 + key: `orders-promo-${suffix}`,
101 + name: 'Orders Promotion',
102 + status: 'ACTIVE',
103 + trigger: 'AUTOMATIC',
104 + rewardType: 'PERCENTAGE',
105 + percentageBps: 1000,
106 + },
107 + });
108 + promotionId = firstPromotion.id;
109 +
110 + const secondPromotion = await prisma.promotion.create({
111 + data: {
112 + key: `orders-promo-2-${suffix}`,
113 + name: 'Orders Promotion Two',
114 + status: 'ACTIVE',
115 + trigger: 'AUTOMATIC',
116 + rewardType: 'FIXED_AMOUNT',
117 + currencyCode: 'USD',
118 + fixedAmount: 250,
119 + },
120 + });
121 + secondPromotionId = secondPromotion.id;
122 + });
123 +
124 + afterAll(async () => {
125 + if (orderId) {
126 + await prisma.orderAppliedPromotion.deleteMany({ where: { orderId } });
127 + await prisma.orderLine.deleteMany({ where: { orderId } });
128 + await prisma.orderAddress.deleteMany({ where: { orderId } });
129 + await prisma.order.deleteMany({ where: { id: orderId } });
130 + await prisma.promotionRedemption.deleteMany({ where: { orderReference: orderId } });
131 + }
132 +
133 + await prisma.promotion.deleteMany({
134 + where: {
135 + id: {
136 + in: [promotionId, secondPromotionId].filter(Boolean),
137 + },
138 + },
139 + });
140 +
141 + if (idempotencyKeyId) {
142 + await prisma.idempotencyKey.deleteMany({ where: { id: idempotencyKeyId } });
143 + }
144 +
145 + if (variantId) {
146 + await prisma.catalogProductVariantTranslation.deleteMany({ where: { variantId } });
147 + await prisma.catalogProductVariant.deleteMany({ where: { id: variantId } });
148 + }
149 +
150 + if (productId) {
151 + await prisma.catalogProductTranslation.deleteMany({ where: { productId } });
152 + await prisma.catalogProduct.deleteMany({ where: { id: productId } });
153 + }
154 +
155 + await prisma.catalogProductTypeTranslation.deleteMany({
156 + where: { slug: `orders-type-${suffix}` },
157 + });
158 + await prisma.catalogProductType.deleteMany({
159 + where: { key: `orders-type-${suffix}` },
160 + });
161 +
162 + if (userId) {
163 + await prisma.user.deleteMany({ where: { id: userId } });
164 + }
165 +
166 + await prisma.$disconnect();
    167 +  });
    168 +
    169 +  it('persists order snapshots and enforces idempotency uniqueness', async () => {
    170 +    const order = await prisma.order.create({
    171 +      data: {
    172 +        orderNumber: `ORD-${suffix}`,
    173 +        userId,
    174 +        idempotencyKeyId,
    175 +        customerEmail: `orders-${suffix}@example.com`,
    176 +        customerName: 'Orders Integration',
    177 +        customerPhone: '+15550000000',
    178 +        currencyCode: 'USD',
    179 +        countryCode: 'US',
    180 +        paymentMethod: 'CASH_ON_DELIVERY',
    181 +        shippingMethodKey: 'standard',
    182 +        shippingMethodName: 'Standard Shipping',
    183 +        shippingRateType: 'FLAT',
    184 +        subtotalAmount: 2000,
    185 +        subtotalDiscountAmount: 250,
    186 +        discountedSubtotalAmount: 1750,
    187 +        shippingAmount: 700,
    188 +        taxAmount: 100,
    189 +        grandTotalAmount: 2550,
    190 +      },
    191 +    });
    192 +    orderId = order.id;
    193 +
    194 +    await prisma.orderAddress.create({
    195 +      data: {
    196 +        orderId,
    197 +        type: 'SHIPPING',
    198 +        recipientName: 'Orders Integration',
    199 +        phoneNumber: '+15550000000',
    200 +        countryCode: 'US',
    201 +        city: 'New York',
    202 +        addressLine1: '1 Example St',
    203 +      },
    204 +    });
    205 +
    206 +    await prisma.orderLine.create({
    207 +      data: {
    208 +        orderId,
    209 +        variantId,
    210 +        productId,
    211 +        sku: `ORDER-VARIANT-${suffix}`,
    212 +        productName: 'Order Product',
    213 +        variantName: 'Order Variant',
    214 +        quantity: 2,
    215 +        currencyCode: 'USD',
    216 +        unitBaseAmount: 1000,
    217 +        unitSaleAmount: 875,
    218 +        effectiveUnitAmount: 875,
    219 +        lineSubtotalAmount: 1750,
    220 +        taxAmount: 100,
    221 +      },
    222 +    });
    223 +
    224 +    await prisma.orderAppliedPromotion.create({
    225 +      data: {
    226 +        orderId,
    227 +        promotionId,
    228 +        key: `orders-promo-${suffix}`,
    229 +        name: 'Orders Promotion',
    230 +        rewardType: 'PERCENTAGE',
    231 +        discountAmount: 250,
    232 +        freeShipping: false,
    233 +        source: 'AUTOMATIC',
    234 +      },
    235 +    });
    236 +
    237 +    await prisma.promotionRedemption.createMany({
    238 +      data: [
    239 +        {
    240 +          promotionId,
    241 +          userId,
    242 +          orderReference: orderId,
    243 +          reservationKey: `order:${orderId}:promotion:${promotionId}`,
    244 +          status: 'REDEEMED',
    245 +        },
    246 +        {
    247 +          promotionId: secondPromotionId,
    248 +          userId,
    249 +          orderReference: orderId,
    250 +          reservationKey: `order:${orderId}:promotion:${secondPromotionId}`,
    251 +          status: 'REDEEMED',
    252 +        },
    253 +      ],
    254 +    });
    255 +
    256 +    const storedOrder = await prisma.order.findUnique({
    257 +      where: { id: orderId },
    258 +      include: {
    259 +        addresses: true,
    260 +        lines: true,
    261 +        appliedPromotions: true,
    262 +      },
    263 +    });
    264 +
    265 +    expect(storedOrder?.addresses).toHaveLength(1);
    266 +    expect(storedOrder?.lines).toHaveLength(1);
    267 +    expect(storedOrder?.appliedPromotions).toHaveLength(1);
    268 +
    269 +    await expect(
    270 +      prisma.idempotencyKey.create({
    271 +        data: {
    272 +          scope: `checkout.place:user:${userId}`,
    273 +          key: `idem-${suffix}`,
274 + actorUserId: userId,
275 + requestHash: 'hash-2',
276 + expiresAt: new Date(Date.now() + 24 _ 60 _ 60 _ 1000),
277 + },
278 + }),
279 + ).rejects.toThrow();
280 + });
281 +});

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

• I added the MySQL-gated order integration spec, so I’m re-running the checks that see test files as first-class code:
lint plus the gated integration command. That closes the loop on the phase brief’s explicit integration requirement
even though the actual DB-backed execution will still skip locally without MySQL.
