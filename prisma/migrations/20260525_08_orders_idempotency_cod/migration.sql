-- DropIndex
DROP INDEX `PromotionRedemption_reservationKey_key` ON `PromotionRedemption`;

-- DropIndex
DROP INDEX `CouponRedemption_reservationKey_key` ON `CouponRedemption`;

-- CreateTable
CREATE TABLE `Order` (
    `id` VARCHAR(191) NOT NULL,
    `orderNumber` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NULL,
    `cartId` VARCHAR(191) NULL,
    `idempotencyKeyId` VARCHAR(191) NULL,
    `reservationKey` VARCHAR(191) NULL,
    `customerEmail` VARCHAR(191) NOT NULL,
    `customerName` VARCHAR(191) NOT NULL,
    `customerPhone` VARCHAR(191) NOT NULL,
    `currencyCode` VARCHAR(191) NOT NULL,
    `countryCode` VARCHAR(191) NOT NULL,
    `status` ENUM('PLACED', 'FULFILLED', 'CANCELLED') NOT NULL DEFAULT 'PLACED',
    `paymentMethod` ENUM('CASH_ON_DELIVERY') NOT NULL,
    `paymentStatus` ENUM('PENDING', 'PAID', 'FAILED', 'REFUNDED', 'VOIDED') NOT NULL DEFAULT 'PENDING',
    `fulfillmentStatus` ENUM('UNFULFILLED', 'FULFILLED', 'RETURNED', 'CANCELLED') NOT NULL DEFAULT 'UNFULFILLED',
    `shippingMethodKey` VARCHAR(191) NOT NULL,
    `shippingMethodName` VARCHAR(191) NOT NULL,
    `shippingRateType` ENUM('FLAT', 'PERCENTAGE_OF_SUBTOTAL') NOT NULL,
    `shippingEstimatedMinDays` INTEGER NULL,
    `shippingEstimatedMaxDays` INTEGER NULL,
    `couponCode` VARCHAR(191) NULL,
    `subtotalAmount` INTEGER NOT NULL,
    `subtotalDiscountAmount` INTEGER NOT NULL,
    `discountedSubtotalAmount` INTEGER NOT NULL,
    `shippingAmount` INTEGER NOT NULL,
    `taxAmount` INTEGER NOT NULL,
    `grandTotalAmount` INTEGER NOT NULL,
    `placedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Order_orderNumber_key`(`orderNumber`),
    UNIQUE INDEX `Order_idempotencyKeyId_key`(`idempotencyKeyId`),
    UNIQUE INDEX `Order_reservationKey_key`(`reservationKey`),
    INDEX `Order_userId_createdAt_idx`(`userId`, `createdAt`),
    INDEX `Order_status_createdAt_idx`(`status`, `createdAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderAddress` (
    `id` VARCHAR(191) NOT NULL,
    `orderId` VARCHAR(191) NOT NULL,
    `type` ENUM('SHIPPING', 'BILLING') NOT NULL,
    `recipientName` VARCHAR(191) NOT NULL,
    `phoneNumber` VARCHAR(191) NOT NULL,
    `countryCode` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `state` VARCHAR(191) NULL,
    `postalCode` VARCHAR(191) NULL,
    `addressLine1` VARCHAR(191) NOT NULL,
    `addressLine2` VARCHAR(191) NULL,
    `company` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `OrderAddress_orderId_type_key`(`orderId`, `type`),
    INDEX `OrderAddress_type_idx`(`type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderLine` (
    `id` VARCHAR(191) NOT NULL,
    `orderId` VARCHAR(191) NOT NULL,
    `variantId` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `sku` VARCHAR(191) NOT NULL,
    `productName` VARCHAR(191) NOT NULL,
    `variantName` VARCHAR(191) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `currencyCode` VARCHAR(191) NOT NULL,
    `unitBaseAmount` INTEGER NOT NULL,
    `unitSaleAmount` INTEGER NULL,
    `effectiveUnitAmount` INTEGER NOT NULL,
    `lineSubtotalAmount` INTEGER NOT NULL,
    `taxAmount` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `OrderLine_orderId_idx`(`orderId`),
    INDEX `OrderLine_variantId_idx`(`variantId`),
    INDEX `OrderLine_productId_idx`(`productId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderAppliedPromotion` (
    `id` VARCHAR(191) NOT NULL,
    `orderId` VARCHAR(191) NOT NULL,
    `promotionId` VARCHAR(191) NULL,
    `key` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `rewardType` ENUM('FIXED_AMOUNT', 'PERCENTAGE', 'FREE_SHIPPING') NOT NULL,
    `discountAmount` INTEGER NOT NULL,
    `freeShipping` BOOLEAN NOT NULL DEFAULT false,
    `source` ENUM('AUTOMATIC', 'COUPON') NOT NULL,
    `couponCode` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `OrderAppliedPromotion_orderId_idx`(`orderId`),
    INDEX `OrderAppliedPromotion_promotionId_idx`(`promotionId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `PromotionRedemption_promotionId_reservationKey_key` ON `PromotionRedemption`(`promotionId`, `reservationKey`);

-- CreateIndex
CREATE UNIQUE INDEX `CouponRedemption_couponId_reservationKey_key` ON `CouponRedemption`(`couponId`, `reservationKey`);

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_cartId_fkey` FOREIGN KEY (`cartId`) REFERENCES `Cart`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_idempotencyKeyId_fkey` FOREIGN KEY (`idempotencyKeyId`) REFERENCES `IdempotencyKey`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderAddress` ADD CONSTRAINT `OrderAddress_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderLine` ADD CONSTRAINT `OrderLine_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderLine` ADD CONSTRAINT `OrderLine_variantId_fkey` FOREIGN KEY (`variantId`) REFERENCES `CatalogProductVariant`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderLine` ADD CONSTRAINT `OrderLine_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `CatalogProduct`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderAppliedPromotion` ADD CONSTRAINT `OrderAppliedPromotion_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
