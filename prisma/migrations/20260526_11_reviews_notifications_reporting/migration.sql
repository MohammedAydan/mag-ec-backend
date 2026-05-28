-- Migration: Add Phase 11 models (reviews, notifications, content pages, report exports)
-- NOTE: This file is a scaffolded migration artifact. To generate a fully-specified SQL migration
-- that matches your local connector and Prisma version, run the following locally where a
-- MySQL/MariaDB instance is available:
--
--   pnpm exec prisma migrate dev --name add-phase-11 --create-only
--
-- The command above will create a migration with exact DDL for your datasource. If you
-- cannot run `prisma migrate dev` in this environment, apply the SQL below manually
-- after reviewing and adapting types to your MySQL variant.

START TRANSACTION;

-- Review
CREATE TABLE IF NOT EXISTS `Review` (
  `id` varchar(25) PRIMARY KEY,
  `productId` varchar(25) NOT NULL,
  `userId` varchar(25) NOT NULL,
  `orderLineId` varchar(25) DEFAULT NULL,
  `rating` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` TEXT NOT NULL,
  `isVerifiedPurchase` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(20) NOT NULL,
  `rejectionReason` varchar(255) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
);

-- ReviewModerationAction
CREATE TABLE IF NOT EXISTS `ReviewModerationAction` (
  `id` varchar(25) PRIMARY KEY,
  `reviewId` varchar(25) NOT NULL,
  `actionType` varchar(20) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `moderatorUserId` varchar(25) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
);

-- Notification
CREATE TABLE IF NOT EXISTS `Notification` (
  `id` varchar(25) PRIMARY KEY,
  `userId` varchar(25) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `eventType` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` TEXT,
  `relatedEntityType` varchar(255),
  `relatedEntityId` varchar(255),
  `deduplicationKey` varchar(191) NOT NULL,
  `status` varchar(20) NOT NULL,
  `attempts` int NOT NULL DEFAULT 0,
  `lastError` TEXT,
  `sentAt` datetime(3),
  `processedAt` datetime(3),
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  UNIQUE KEY `notification_deduplicationKey_unique` (`deduplicationKey`)
);

-- NotificationPreference
CREATE TABLE IF NOT EXISTS `NotificationPreference` (
  `id` varchar(25) PRIMARY KEY,
  `userId` varchar(25) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `orderConfirmations` tinyint(1) NOT NULL DEFAULT 1,
  `orderShipments` tinyint(1) NOT NULL DEFAULT 1,
  `orderDeliveries` tinyint(1) NOT NULL DEFAULT 1,
  `returnStatusUpdates` tinyint(1) NOT NULL DEFAULT 1,
  `reviewReplies` tinyint(1) NOT NULL DEFAULT 1,
  `backInStock` tinyint(1) NOT NULL DEFAULT 0,
  `lowStockAlerts` tinyint(1) NOT NULL DEFAULT 1,
  `promotionalMessages` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
);

-- ContentPage and translations
CREATE TABLE IF NOT EXISTS `ContentPage` (
  `id` varchar(25) PRIMARY KEY,
  `key` varchar(191) NOT NULL,
  `status` varchar(20) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `sortOrder` int NOT NULL DEFAULT 0,
  `isLegal` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  UNIQUE KEY `contentpage_key_unique` (`key`),
  UNIQUE KEY `contentpage_slug_unique` (`slug`)
);

CREATE TABLE IF NOT EXISTS `ContentPageTranslation` (
  `contentPageId` varchar(25) NOT NULL,
  `locale` varchar(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `body` TEXT NOT NULL,
  PRIMARY KEY (`contentPageId`,`locale`),
  UNIQUE KEY `contentpage_translation_locale_slug_unique` (`locale`,`slug`)
);

-- ReportExport
CREATE TABLE IF NOT EXISTS `ReportExport` (
  `id` varchar(25) PRIMARY KEY,
  `reportType` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `parametersJson` JSON NOT NULL,
  `resultObjectKey` varchar(255) DEFAULT NULL,
  `failureReason` TEXT,
  `requestedByUserId` varchar(25) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `completedAt` datetime(3),
  UNIQUE KEY `reportexport_resultObjectKey_unique` (`resultObjectKey`)
);

COMMIT;

-- End of scaffolded migration. Review and adjust types/indices for your environment before applying.
