/*
  Warnings:

  - The primary key for the `contentpage` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `status` on the `contentpage` table. The data in that column could be lost. The data in that column will be cast from `VarChar(20)` to `Enum(EnumId(51))`.
  - The primary key for the `contentpagetranslation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `title` on the `contentpagetranslation` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - The primary key for the `notification` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `channel` on the `notification` table. The data in that column could be lost. The data in that column will be cast from `VarChar(20)` to `Enum(EnumId(50))`.
  - You are about to alter the column `eventType` on the `notification` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `relatedEntityType` on the `notification` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `relatedEntityId` on the `notification` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `status` on the `notification` table. The data in that column could be lost. The data in that column will be cast from `VarChar(20)` to `Enum(EnumId(49))`.
  - The primary key for the `notificationpreference` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `channel` on the `notificationpreference` table. The data in that column could be lost. The data in that column will be cast from `VarChar(20)` to `Enum(EnumId(50))`.
  - The primary key for the `reportexport` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `reportType` on the `reportexport` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `status` on the `reportexport` table. The data in that column could be lost. The data in that column will be cast from `VarChar(20)` to `Enum(EnumId(52))`.
  - You are about to alter the column `resultObjectKey` on the `reportexport` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - The primary key for the `review` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `status` on the `review` table. The data in that column could be lost. The data in that column will be cast from `VarChar(20)` to `Enum(EnumId(46))`.
  - You are about to alter the column `rejectionReason` on the `review` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - The primary key for the `reviewmoderationaction` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `actionType` on the `reviewmoderationaction` table. The data in that column could be lost. The data in that column will be cast from `VarChar(20)` to `Enum(EnumId(47))`.
  - You are about to alter the column `reason` on the `reviewmoderationaction` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - A unique constraint covering the columns `[slug]` on the table `ContentPageTranslation` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[userId]` on the table `NotificationPreference` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[orderLineId]` on the table `Review` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[productId,userId]` on the table `Review` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `contentpage` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    ALTER COLUMN `updatedAt` DROP DEFAULT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `contentpagetranslation` DROP PRIMARY KEY,
    MODIFY `contentPageId` VARCHAR(191) NOT NULL,
    MODIFY `locale` VARCHAR(191) NOT NULL,
    MODIFY `title` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`contentPageId`, `locale`);

-- AlterTable
ALTER TABLE `notification` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `userId` VARCHAR(191) NOT NULL,
    MODIFY `channel` ENUM('EMAIL', 'PUSH', 'IN_APP') NOT NULL,
    MODIFY `eventType` VARCHAR(191) NOT NULL,
    MODIFY `body` VARCHAR(191) NULL,
    MODIFY `relatedEntityType` VARCHAR(191) NULL,
    MODIFY `relatedEntityId` VARCHAR(191) NULL,
    MODIFY `status` ENUM('PENDING', 'SENT', 'FAILED') NOT NULL DEFAULT 'PENDING',
    ALTER COLUMN `updatedAt` DROP DEFAULT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `notificationpreference` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `userId` VARCHAR(191) NOT NULL,
    MODIFY `channel` ENUM('EMAIL', 'PUSH', 'IN_APP') NOT NULL,
    ALTER COLUMN `updatedAt` DROP DEFAULT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `reportexport` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `reportType` VARCHAR(191) NOT NULL,
    MODIFY `status` ENUM('PENDING', 'PROCESSING', 'COMPLETED', 'FAILED') NOT NULL DEFAULT 'PENDING',
    MODIFY `resultObjectKey` VARCHAR(191) NULL,
    MODIFY `requestedByUserId` VARCHAR(191) NULL,
    ALTER COLUMN `updatedAt` DROP DEFAULT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `review` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `productId` VARCHAR(191) NOT NULL,
    MODIFY `userId` VARCHAR(191) NOT NULL,
    MODIFY `orderLineId` VARCHAR(191) NULL,
    MODIFY `status` ENUM('PENDING', 'APPROVED', 'REJECTED', 'FLAGGED', 'HIDDEN') NOT NULL DEFAULT 'PENDING',
    MODIFY `rejectionReason` VARCHAR(191) NULL,
    ALTER COLUMN `updatedAt` DROP DEFAULT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `reviewmoderationaction` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `reviewId` VARCHAR(191) NOT NULL,
    MODIFY `actionType` ENUM('APPROVED', 'REJECTED', 'FLAGGED', 'HIDDEN') NOT NULL,
    MODIFY `reason` VARCHAR(191) NULL,
    MODIFY `moderatorUserId` VARCHAR(191) NULL,
    ADD PRIMARY KEY (`id`);

-- CreateIndex
CREATE UNIQUE INDEX `ContentPageTranslation_slug_key` ON `ContentPageTranslation`(`slug`);

-- CreateIndex
CREATE INDEX `Notification_userId_status_createdAt_idx` ON `Notification`(`userId`, `status`, `createdAt`);

-- CreateIndex
CREATE INDEX `Notification_eventType_status_idx` ON `Notification`(`eventType`, `status`);

-- CreateIndex
CREATE UNIQUE INDEX `NotificationPreference_userId_key` ON `NotificationPreference`(`userId`);

-- CreateIndex
CREATE INDEX `ReportExport_status_createdAt_idx` ON `ReportExport`(`status`, `createdAt`);

-- CreateIndex
CREATE INDEX `ReportExport_reportType_idx` ON `ReportExport`(`reportType`);

-- CreateIndex
CREATE INDEX `ReportExport_requestedByUserId_idx` ON `ReportExport`(`requestedByUserId`);

-- CreateIndex
CREATE UNIQUE INDEX `Review_orderLineId_key` ON `Review`(`orderLineId`);

-- CreateIndex
CREATE INDEX `Review_productId_status_createdAt_idx` ON `Review`(`productId`, `status`, `createdAt`);

-- CreateIndex
CREATE INDEX `Review_userId_createdAt_idx` ON `Review`(`userId`, `createdAt`);

-- CreateIndex
CREATE INDEX `Review_status_createdAt_idx` ON `Review`(`status`, `createdAt`);

-- CreateIndex
CREATE UNIQUE INDEX `Review_productId_userId_key` ON `Review`(`productId`, `userId`);

-- CreateIndex
CREATE INDEX `ReviewModerationAction_reviewId_createdAt_idx` ON `ReviewModerationAction`(`reviewId`, `createdAt`);

-- CreateIndex
CREATE INDEX `ReviewModerationAction_moderatorUserId_idx` ON `ReviewModerationAction`(`moderatorUserId`);

-- AddForeignKey
ALTER TABLE `Review` ADD CONSTRAINT `Review_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `CatalogProduct`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Review` ADD CONSTRAINT `Review_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Review` ADD CONSTRAINT `Review_orderLineId_fkey` FOREIGN KEY (`orderLineId`) REFERENCES `OrderLine`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReviewModerationAction` ADD CONSTRAINT `ReviewModerationAction_reviewId_fkey` FOREIGN KEY (`reviewId`) REFERENCES `Review`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReviewModerationAction` ADD CONSTRAINT `ReviewModerationAction_moderatorUserId_fkey` FOREIGN KEY (`moderatorUserId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NotificationPreference` ADD CONSTRAINT `NotificationPreference_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ContentPageTranslation` ADD CONSTRAINT `ContentPageTranslation_contentPageId_fkey` FOREIGN KEY (`contentPageId`) REFERENCES `ContentPage`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReportExport` ADD CONSTRAINT `ReportExport_requestedByUserId_fkey` FOREIGN KEY (`requestedByUserId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- RedefineIndex
CREATE UNIQUE INDEX `ContentPage_key_key` ON `ContentPage`(`key`);
DROP INDEX `contentpage_key_unique` ON `contentpage`;

-- RedefineIndex
CREATE UNIQUE INDEX `ContentPage_slug_key` ON `ContentPage`(`slug`);
DROP INDEX `contentpage_slug_unique` ON `contentpage`;

-- RedefineIndex
CREATE UNIQUE INDEX `ContentPageTranslation_locale_slug_key` ON `ContentPageTranslation`(`locale`, `slug`);
DROP INDEX `contentpage_translation_locale_slug_unique` ON `contentpagetranslation`;

-- RedefineIndex
CREATE UNIQUE INDEX `Notification_deduplicationKey_key` ON `Notification`(`deduplicationKey`);
DROP INDEX `notification_deduplicationKey_unique` ON `notification`;

-- RedefineIndex
CREATE UNIQUE INDEX `ReportExport_resultObjectKey_key` ON `ReportExport`(`resultObjectKey`);
DROP INDEX `reportexport_resultObjectKey_unique` ON `reportexport`;
