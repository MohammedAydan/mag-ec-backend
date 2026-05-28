-- CreateTable
CREATE TABLE `Promotion` (
    `id` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `status` ENUM('DRAFT', 'ACTIVE', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `trigger` ENUM('AUTOMATIC', 'COUPON') NOT NULL DEFAULT 'AUTOMATIC',
    `rewardType` ENUM('FIXED_AMOUNT', 'PERCENTAGE', 'FREE_SHIPPING') NOT NULL,
    `currencyCode` VARCHAR(191) NULL,
    `fixedAmount` INTEGER NULL,
    `percentageBps` INTEGER NULL,
    `maxDiscountAmount` INTEGER NULL,
    `minSubtotalAmount` INTEGER NULL,
    `isCombinable` BOOLEAN NOT NULL DEFAULT false,
    `priority` INTEGER NOT NULL DEFAULT 0,
    `startsAt` DATETIME(3) NULL,
    `endsAt` DATETIME(3) NULL,
    `totalUsageLimit` INTEGER NULL,
    `perCustomerUsageLimit` INTEGER NULL,
    `maxApplicationsPerOrder` INTEGER NOT NULL DEFAULT 1,
    `reservedCount` INTEGER NOT NULL DEFAULT 0,
    `redeemedCount` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Promotion_key_key`(`key`),
    INDEX `Promotion_status_trigger_priority_idx`(`status`, `trigger`, `priority`),
    INDEX `Promotion_startsAt_endsAt_idx`(`startsAt`, `endsAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PromotionExclusion` (
    `sourcePromotionId` VARCHAR(191) NOT NULL,
    `targetPromotionId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `PromotionExclusion_targetPromotionId_idx`(`targetPromotionId`),
    PRIMARY KEY (`sourcePromotionId`, `targetPromotionId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Coupon` (
    `id` VARCHAR(191) NOT NULL,
    `promotionId` VARCHAR(191) NOT NULL,
    `code` VARCHAR(191) NOT NULL,
    `normalizedCode` VARCHAR(191) NOT NULL,
    `status` ENUM('ACTIVE', 'DISABLED', 'ARCHIVED') NOT NULL DEFAULT 'ACTIVE',
    `startsAt` DATETIME(3) NULL,
    `endsAt` DATETIME(3) NULL,
    `totalUsageLimit` INTEGER NULL,
    `perCustomerUsageLimit` INTEGER NULL,
    `reservedCount` INTEGER NOT NULL DEFAULT 0,
    `redeemedCount` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Coupon_normalizedCode_key`(`normalizedCode`),
    INDEX `Coupon_promotionId_status_idx`(`promotionId`, `status`),
    INDEX `Coupon_startsAt_endsAt_idx`(`startsAt`, `endsAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PromotionRedemption` (
    `id` VARCHAR(191) NOT NULL,
    `promotionId` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NULL,
    `orderReference` VARCHAR(191) NULL,
    `reservationKey` VARCHAR(191) NULL,
    `status` ENUM('RESERVED', 'REDEEMED', 'RELEASED', 'EXPIRED') NOT NULL,
    `quantity` INTEGER NOT NULL DEFAULT 1,
    `expiresAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `PromotionRedemption_reservationKey_key`(`reservationKey`),
    INDEX `PromotionRedemption_promotionId_status_idx`(`promotionId`, `status`),
    INDEX `PromotionRedemption_userId_promotionId_status_idx`(`userId`, `promotionId`, `status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CouponRedemption` (
    `id` VARCHAR(191) NOT NULL,
    `couponId` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NULL,
    `orderReference` VARCHAR(191) NULL,
    `reservationKey` VARCHAR(191) NULL,
    `status` ENUM('RESERVED', 'REDEEMED', 'RELEASED', 'EXPIRED') NOT NULL,
    `quantity` INTEGER NOT NULL DEFAULT 1,
    `expiresAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CouponRedemption_reservationKey_key`(`reservationKey`),
    INDEX `CouponRedemption_couponId_status_idx`(`couponId`, `status`),
    INDEX `CouponRedemption_userId_couponId_status_idx`(`userId`, `couponId`, `status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `PromotionExclusion` ADD CONSTRAINT `PromotionExclusion_sourcePromotionId_fkey` FOREIGN KEY (`sourcePromotionId`) REFERENCES `Promotion`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PromotionExclusion` ADD CONSTRAINT `PromotionExclusion_targetPromotionId_fkey` FOREIGN KEY (`targetPromotionId`) REFERENCES `Promotion`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Coupon` ADD CONSTRAINT `Coupon_promotionId_fkey` FOREIGN KEY (`promotionId`) REFERENCES `Promotion`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PromotionRedemption` ADD CONSTRAINT `PromotionRedemption_promotionId_fkey` FOREIGN KEY (`promotionId`) REFERENCES `Promotion`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PromotionRedemption` ADD CONSTRAINT `PromotionRedemption_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CouponRedemption` ADD CONSTRAINT `CouponRedemption_couponId_fkey` FOREIGN KEY (`couponId`) REFERENCES `Coupon`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CouponRedemption` ADD CONSTRAINT `CouponRedemption_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
