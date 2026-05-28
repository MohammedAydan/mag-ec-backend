-- Harden bearer secrets that were stored by earlier development migrations.
-- Guest cart tokens are compared using SHA-256 digests by the application.
UPDATE `Cart`
SET `guestToken` = SHA2(`guestToken`, 256)
WHERE `guestToken` IS NOT NULL
  AND CHAR_LENGTH(`guestToken`) <> 64;


-- Model in-progress delivery explicitly so concurrent workers cannot send one notification twice.
ALTER TABLE `Notification` MODIFY COLUMN `status` ENUM('PENDING', 'PROCESSING', 'SENT', 'FAILED') NOT NULL DEFAULT 'PENDING';


-- Allow transactional notifications to be delivered for guest checkouts.
ALTER TABLE `Notification` MODIFY COLUMN `userId` VARCHAR(191) NULL;
ALTER TABLE `Notification` ADD COLUMN `recipientEmail` VARCHAR(320) NULL;


-- Claim return refunds atomically to prevent duplicate provider refunds.
ALTER TABLE `ReturnRequest` MODIFY COLUMN `status` ENUM('REQUESTED', 'APPROVED', 'REJECTED', 'RECEIVED', 'REFUND_PROCESSING', 'CLOSED', 'CANCELLED') NOT NULL DEFAULT 'REQUESTED';


-- Register device tokens for actual FCM push delivery.
CREATE TABLE `PushDevice` (
  `id` VARCHAR(191) NOT NULL,
  `userId` VARCHAR(191) NOT NULL,
  `token` VARCHAR(512) NOT NULL,
  `platform` VARCHAR(32) NOT NULL,
  `isActive` BOOLEAN NOT NULL DEFAULT true,
  `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` DATETIME(3) NOT NULL,
  UNIQUE INDEX `PushDevice_token_key`(`token`),
  INDEX `PushDevice_userId_isActive_idx`(`userId`, `isActive`),
  PRIMARY KEY (`id`),
  CONSTRAINT `PushDevice_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
