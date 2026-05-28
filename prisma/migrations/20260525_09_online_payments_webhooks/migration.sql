-- AlterTable
ALTER TABLE `Order` ADD COLUMN `paidAt` DATETIME(3) NULL,
    MODIFY `paymentMethod` ENUM('CASH_ON_DELIVERY', 'STRIPE_CARD') NOT NULL;

-- CreateTable
CREATE TABLE `PaymentAttempt` (
    `id` VARCHAR(191) NOT NULL,
    `orderId` VARCHAR(191) NOT NULL,
    `provider` ENUM('COD', 'STRIPE') NOT NULL,
    `method` ENUM('CASH_ON_DELIVERY', 'STRIPE_CARD') NOT NULL,
    `status` ENUM('AWAITING_CUSTOMER_ACTION', 'PROCESSING', 'SUCCEEDED', 'FAILED', 'CANCELLED') NOT NULL,
    `currencyCode` VARCHAR(191) NOT NULL,
    `amount` INTEGER NOT NULL,
    `providerPaymentId` VARCHAR(191) NULL,
    `providerClientSecret` TEXT NULL,
    `providerCheckoutUrl` TEXT NULL,
    `providerIntentStatus` VARCHAR(191) NULL,
    `providerReference` VARCHAR(191) NULL,
    `lastErrorCode` VARCHAR(191) NULL,
    `lastErrorMessage` TEXT NULL,
    `metadata` JSON NULL,
    `succeededAt` DATETIME(3) NULL,
    `failedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `PaymentAttempt_providerPaymentId_key`(`providerPaymentId`),
    INDEX `PaymentAttempt_orderId_createdAt_idx`(`orderId`, `createdAt`),
    INDEX `PaymentAttempt_provider_status_createdAt_idx`(`provider`, `status`, `createdAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PaymentWebhookEvent` (
    `id` VARCHAR(191) NOT NULL,
    `provider` ENUM('COD', 'STRIPE') NOT NULL,
    `externalEventId` VARCHAR(191) NOT NULL,
    `eventType` VARCHAR(191) NOT NULL,
    `signature` TEXT NULL,
    `payload` JSON NOT NULL,
    `status` ENUM('RECEIVED', 'PROCESSED', 'DUPLICATE', 'FAILED') NOT NULL DEFAULT 'RECEIVED',
    `paymentAttemptId` VARCHAR(191) NULL,
    `orderId` VARCHAR(191) NULL,
    `processingError` TEXT NULL,
    `receivedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `processedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `PaymentWebhookEvent_provider_status_receivedAt_idx`(`provider`, `status`, `receivedAt`),
    INDEX `PaymentWebhookEvent_paymentAttemptId_idx`(`paymentAttemptId`),
    INDEX `PaymentWebhookEvent_orderId_idx`(`orderId`),
    UNIQUE INDEX `PaymentWebhookEvent_provider_externalEventId_key`(`provider`, `externalEventId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Refund` (
    `id` VARCHAR(191) NOT NULL,
    `orderId` VARCHAR(191) NOT NULL,
    `paymentAttemptId` VARCHAR(191) NULL,
    `requestedByUserId` VARCHAR(191) NULL,
    `provider` ENUM('COD', 'STRIPE') NOT NULL,
    `status` ENUM('PENDING', 'SUCCEEDED', 'FAILED') NOT NULL DEFAULT 'PENDING',
    `amount` INTEGER NOT NULL,
    `currencyCode` VARCHAR(191) NOT NULL,
    `reason` VARCHAR(191) NULL,
    `providerRefundId` VARCHAR(191) NULL,
    `providerReference` VARCHAR(191) NULL,
    `failureReason` TEXT NULL,
    `metadata` JSON NULL,
    `requestedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `processedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Refund_providerRefundId_key`(`providerRefundId`),
    INDEX `Refund_orderId_createdAt_idx`(`orderId`, `createdAt`),
    INDEX `Refund_paymentAttemptId_idx`(`paymentAttemptId`),
    INDEX `Refund_requestedByUserId_idx`(`requestedByUserId`),
    INDEX `Refund_provider_status_createdAt_idx`(`provider`, `status`, `createdAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `PaymentAttempt` ADD CONSTRAINT `PaymentAttempt_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PaymentWebhookEvent` ADD CONSTRAINT `PaymentWebhookEvent_paymentAttemptId_fkey` FOREIGN KEY (`paymentAttemptId`) REFERENCES `PaymentAttempt`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PaymentWebhookEvent` ADD CONSTRAINT `PaymentWebhookEvent_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Refund` ADD CONSTRAINT `Refund_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Refund` ADD CONSTRAINT `Refund_paymentAttemptId_fkey` FOREIGN KEY (`paymentAttemptId`) REFERENCES `PaymentAttempt`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Refund` ADD CONSTRAINT `Refund_requestedByUserId_fkey` FOREIGN KEY (`requestedByUserId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
