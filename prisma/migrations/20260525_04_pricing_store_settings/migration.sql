-- CreateTable
CREATE TABLE `TaxClass` (
    `id` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `isDefault` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `TaxClass_key_key`(`key`),
    INDEX `TaxClass_isDefault_idx`(`isDefault`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ManualTaxRate` (
    `id` VARCHAR(191) NOT NULL,
    `taxClassId` VARCHAR(191) NOT NULL,
    `countryCode` VARCHAR(191) NOT NULL,
    `rateBps` INTEGER NOT NULL,
    `isIncludedInPrice` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `ManualTaxRate_countryCode_idx`(`countryCode`),
    UNIQUE INDEX `ManualTaxRate_taxClassId_countryCode_key`(`taxClassId`, `countryCode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ShippingZone` (
    `id` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `ShippingZone_key_key`(`key`),
    INDEX `ShippingZone_isActive_idx`(`isActive`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ShippingZoneCountry` (
    `zoneId` VARCHAR(191) NOT NULL,
    `countryCode` VARCHAR(191) NOT NULL,

    INDEX `ShippingZoneCountry_countryCode_idx`(`countryCode`),
    PRIMARY KEY (`zoneId`, `countryCode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ShippingMethod` (
    `id` VARCHAR(191) NOT NULL,
    `zoneId` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `rateType` ENUM('FLAT', 'PERCENTAGE_OF_SUBTOTAL') NOT NULL,
    `currencyCode` VARCHAR(191) NOT NULL,
    `flatAmount` INTEGER NULL,
    `percentageBps` INTEGER NULL,
    `minSubtotalAmount` INTEGER NULL,
    `maxSubtotalAmount` INTEGER NULL,
    `minItemQuantity` INTEGER NULL,
    `maxItemQuantity` INTEGER NULL,
    `estimatedMinDays` INTEGER NULL,
    `estimatedMaxDays` INTEGER NULL,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `ShippingMethod_zoneId_isActive_sortOrder_idx`(`zoneId`, `isActive`, `sortOrder`),
    UNIQUE INDEX `ShippingMethod_zoneId_key_key`(`zoneId`, `key`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogVariantPrice` (
    `id` VARCHAR(191) NOT NULL,
    `variantId` VARCHAR(191) NOT NULL,
    `currencyCode` VARCHAR(191) NOT NULL,
    `baseAmount` INTEGER NOT NULL,
    `saleAmount` INTEGER NULL,
    `saleStartsAt` DATETIME(3) NULL,
    `saleEndsAt` DATETIME(3) NULL,
    `taxClassId` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CatalogVariantPrice_variantId_key`(`variantId`),
    INDEX `CatalogVariantPrice_currencyCode_idx`(`currencyCode`),
    INDEX `CatalogVariantPrice_taxClassId_idx`(`taxClassId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ManualTaxRate` ADD CONSTRAINT `ManualTaxRate_taxClassId_fkey` FOREIGN KEY (`taxClassId`) REFERENCES `TaxClass`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ShippingZoneCountry` ADD CONSTRAINT `ShippingZoneCountry_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `ShippingZone`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ShippingMethod` ADD CONSTRAINT `ShippingMethod_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `ShippingZone`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogVariantPrice` ADD CONSTRAINT `CatalogVariantPrice_variantId_fkey` FOREIGN KEY (`variantId`) REFERENCES `CatalogProductVariant`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogVariantPrice` ADD CONSTRAINT `CatalogVariantPrice_taxClassId_fkey` FOREIGN KEY (`taxClassId`) REFERENCES `TaxClass`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
