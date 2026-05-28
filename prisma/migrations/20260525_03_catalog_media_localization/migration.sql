-- CreateTable
CREATE TABLE `CatalogProductType` (
    `id` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `sortOrder` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CatalogProductType_key_key`(`key`),
    INDEX `CatalogProductType_status_sortOrder_idx`(`status`, `sortOrder`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogProductTypeTranslation` (
    `productTypeId` VARCHAR(191) NOT NULL,
    `locale` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,

    UNIQUE INDEX `CatalogProductTypeTranslation_locale_slug_key`(`locale`, `slug`),
    PRIMARY KEY (`productTypeId`, `locale`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogBrand` (
    `id` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CatalogBrand_key_key`(`key`),
    INDEX `CatalogBrand_status_idx`(`status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogBrandTranslation` (
    `brandId` VARCHAR(191) NOT NULL,
    `locale` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,

    UNIQUE INDEX `CatalogBrandTranslation_locale_slug_key`(`locale`, `slug`),
    PRIMARY KEY (`brandId`, `locale`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogCategory` (
    `id` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `parentId` VARCHAR(191) NULL,
    `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `sortOrder` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CatalogCategory_key_key`(`key`),
    INDEX `CatalogCategory_parentId_idx`(`parentId`),
    INDEX `CatalogCategory_status_sortOrder_idx`(`status`, `sortOrder`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogCategoryTranslation` (
    `categoryId` VARCHAR(191) NOT NULL,
    `locale` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,

    UNIQUE INDEX `CatalogCategoryTranslation_locale_slug_key`(`locale`, `slug`),
    PRIMARY KEY (`categoryId`, `locale`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogCollection` (
    `id` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `sortOrder` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CatalogCollection_key_key`(`key`),
    INDEX `CatalogCollection_status_sortOrder_idx`(`status`, `sortOrder`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogCollectionTranslation` (
    `collectionId` VARCHAR(191) NOT NULL,
    `locale` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,

    UNIQUE INDEX `CatalogCollectionTranslation_locale_slug_key`(`locale`, `slug`),
    PRIMARY KEY (`collectionId`, `locale`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogTag` (
    `id` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CatalogTag_key_key`(`key`),
    INDEX `CatalogTag_status_idx`(`status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogTagTranslation` (
    `tagId` VARCHAR(191) NOT NULL,
    `locale` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `CatalogTagTranslation_locale_slug_key`(`locale`, `slug`),
    PRIMARY KEY (`tagId`, `locale`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogAttribute` (
    `id` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `inputType` ENUM('TEXT', 'SELECT', 'MULTI_SELECT', 'COLOR', 'SIZE', 'BOOLEAN', 'NUMBER') NOT NULL,
    `isFilterable` BOOLEAN NOT NULL DEFAULT false,
    `isVariantDefining` BOOLEAN NOT NULL DEFAULT false,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CatalogAttribute_key_key`(`key`),
    INDEX `CatalogAttribute_inputType_sortOrder_idx`(`inputType`, `sortOrder`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogAttributeTranslation` (
    `attributeId` VARCHAR(191) NOT NULL,
    `locale` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,

    PRIMARY KEY (`attributeId`, `locale`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogAttributeOption` (
    `id` VARCHAR(191) NOT NULL,
    `attributeId` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,
    `colorHex` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `CatalogAttributeOption_attributeId_sortOrder_idx`(`attributeId`, `sortOrder`),
    UNIQUE INDEX `CatalogAttributeOption_attributeId_key_key`(`attributeId`, `key`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogAttributeOptionTranslation` (
    `optionId` VARCHAR(191) NOT NULL,
    `locale` VARCHAR(191) NOT NULL,
    `label` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`optionId`, `locale`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogProductTypeAttribute` (
    `productTypeId` VARCHAR(191) NOT NULL,
    `attributeId` VARCHAR(191) NOT NULL,
    `isRequired` BOOLEAN NOT NULL DEFAULT false,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,

    INDEX `CatalogProductTypeAttribute_attributeId_idx`(`attributeId`),
    PRIMARY KEY (`productTypeId`, `attributeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogProduct` (
    `id` VARCHAR(191) NOT NULL,
    `productTypeId` VARCHAR(191) NOT NULL,
    `brandId` VARCHAR(191) NULL,
    `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `sku` VARCHAR(191) NOT NULL,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,
    `isFeatured` BOOLEAN NOT NULL DEFAULT false,
    `publishedAt` DATETIME(3) NULL,
    `archivedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CatalogProduct_sku_key`(`sku`),
    INDEX `CatalogProduct_productTypeId_status_sortOrder_idx`(`productTypeId`, `status`, `sortOrder`),
    INDEX `CatalogProduct_brandId_idx`(`brandId`),
    INDEX `CatalogProduct_publishedAt_idx`(`publishedAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogProductTranslation` (
    `productId` VARCHAR(191) NOT NULL,
    `locale` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `shortDescription` VARCHAR(191) NULL,
    `description` VARCHAR(191) NULL,
    `metaTitle` VARCHAR(191) NULL,
    `metaDescription` VARCHAR(191) NULL,

    UNIQUE INDEX `CatalogProductTranslation_locale_slug_key`(`locale`, `slug`),
    PRIMARY KEY (`productId`, `locale`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogProductVariant` (
    `id` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `sku` VARCHAR(191) NOT NULL,
    `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `position` INTEGER NOT NULL DEFAULT 0,
    `isDefault` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CatalogProductVariant_sku_key`(`sku`),
    INDEX `CatalogProductVariant_productId_status_position_idx`(`productId`, `status`, `position`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogProductVariantTranslation` (
    `variantId` VARCHAR(191) NOT NULL,
    `locale` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`variantId`, `locale`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogProductVariantOptionValue` (
    `variantId` VARCHAR(191) NOT NULL,
    `attributeId` VARCHAR(191) NOT NULL,
    `optionId` VARCHAR(191) NOT NULL,

    INDEX `CatalogProductVariantOptionValue_optionId_idx`(`optionId`),
    PRIMARY KEY (`variantId`, `attributeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogProductCategory` (
    `productId` VARCHAR(191) NOT NULL,
    `categoryId` VARCHAR(191) NOT NULL,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,

    INDEX `CatalogProductCategory_categoryId_sortOrder_idx`(`categoryId`, `sortOrder`),
    PRIMARY KEY (`productId`, `categoryId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogProductCollection` (
    `productId` VARCHAR(191) NOT NULL,
    `collectionId` VARCHAR(191) NOT NULL,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,

    INDEX `CatalogProductCollection_collectionId_sortOrder_idx`(`collectionId`, `sortOrder`),
    PRIMARY KEY (`productId`, `collectionId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogProductTag` (
    `productId` VARCHAR(191) NOT NULL,
    `tagId` VARCHAR(191) NOT NULL,

    INDEX `CatalogProductTag_tagId_idx`(`tagId`),
    PRIMARY KEY (`productId`, `tagId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogMedia` (
    `id` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `variantId` VARCHAR(191) NULL,
    `uploadedByUserId` VARCHAR(191) NOT NULL,
    `objectKey` VARCHAR(191) NOT NULL,
    `status` ENUM('PENDING_UPLOAD', 'ATTACHED', 'ARCHIVED') NOT NULL DEFAULT 'PENDING_UPLOAD',
    `mediaType` ENUM('IMAGE', 'VIDEO', 'FILE') NOT NULL,
    `role` ENUM('PRIMARY', 'GALLERY', 'SWATCH', 'DETAIL') NOT NULL DEFAULT 'GALLERY',
    `mimeType` VARCHAR(191) NOT NULL,
    `sizeBytes` INTEGER NOT NULL,
    `uploadTokenHash` VARCHAR(191) NOT NULL,
    `uploadExpiresAt` DATETIME(3) NOT NULL,
    `attachedAt` DATETIME(3) NULL,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,
    `checksum` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CatalogMedia_objectKey_key`(`objectKey`),
    UNIQUE INDEX `CatalogMedia_uploadTokenHash_key`(`uploadTokenHash`),
    INDEX `CatalogMedia_productId_status_sortOrder_idx`(`productId`, `status`, `sortOrder`),
    INDEX `CatalogMedia_variantId_idx`(`variantId`),
    INDEX `CatalogMedia_uploadedByUserId_uploadExpiresAt_idx`(`uploadedByUserId`, `uploadExpiresAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CatalogMediaTranslation` (
    `mediaId` VARCHAR(191) NOT NULL,
    `locale` VARCHAR(191) NOT NULL,
    `altText` VARCHAR(191) NULL,
    `title` VARCHAR(191) NULL,

    PRIMARY KEY (`mediaId`, `locale`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `CatalogProductTypeTranslation` ADD CONSTRAINT `CatalogProductTypeTranslation_productTypeId_fkey` FOREIGN KEY (`productTypeId`) REFERENCES `CatalogProductType`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogBrandTranslation` ADD CONSTRAINT `CatalogBrandTranslation_brandId_fkey` FOREIGN KEY (`brandId`) REFERENCES `CatalogBrand`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogCategory` ADD CONSTRAINT `CatalogCategory_parentId_fkey` FOREIGN KEY (`parentId`) REFERENCES `CatalogCategory`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogCategoryTranslation` ADD CONSTRAINT `CatalogCategoryTranslation_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `CatalogCategory`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogCollectionTranslation` ADD CONSTRAINT `CatalogCollectionTranslation_collectionId_fkey` FOREIGN KEY (`collectionId`) REFERENCES `CatalogCollection`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogTagTranslation` ADD CONSTRAINT `CatalogTagTranslation_tagId_fkey` FOREIGN KEY (`tagId`) REFERENCES `CatalogTag`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogAttributeTranslation` ADD CONSTRAINT `CatalogAttributeTranslation_attributeId_fkey` FOREIGN KEY (`attributeId`) REFERENCES `CatalogAttribute`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogAttributeOption` ADD CONSTRAINT `CatalogAttributeOption_attributeId_fkey` FOREIGN KEY (`attributeId`) REFERENCES `CatalogAttribute`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogAttributeOptionTranslation` ADD CONSTRAINT `CatalogAttributeOptionTranslation_optionId_fkey` FOREIGN KEY (`optionId`) REFERENCES `CatalogAttributeOption`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductTypeAttribute` ADD CONSTRAINT `CatalogProductTypeAttribute_productTypeId_fkey` FOREIGN KEY (`productTypeId`) REFERENCES `CatalogProductType`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductTypeAttribute` ADD CONSTRAINT `CatalogProductTypeAttribute_attributeId_fkey` FOREIGN KEY (`attributeId`) REFERENCES `CatalogAttribute`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProduct` ADD CONSTRAINT `CatalogProduct_productTypeId_fkey` FOREIGN KEY (`productTypeId`) REFERENCES `CatalogProductType`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProduct` ADD CONSTRAINT `CatalogProduct_brandId_fkey` FOREIGN KEY (`brandId`) REFERENCES `CatalogBrand`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductTranslation` ADD CONSTRAINT `CatalogProductTranslation_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `CatalogProduct`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductVariant` ADD CONSTRAINT `CatalogProductVariant_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `CatalogProduct`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductVariantTranslation` ADD CONSTRAINT `CatalogProductVariantTranslation_variantId_fkey` FOREIGN KEY (`variantId`) REFERENCES `CatalogProductVariant`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductVariantOptionValue` ADD CONSTRAINT `CatalogProductVariantOptionValue_variantId_fkey` FOREIGN KEY (`variantId`) REFERENCES `CatalogProductVariant`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductVariantOptionValue` ADD CONSTRAINT `CatalogProductVariantOptionValue_attributeId_fkey` FOREIGN KEY (`attributeId`) REFERENCES `CatalogAttribute`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductVariantOptionValue` ADD CONSTRAINT `CatalogProductVariantOptionValue_optionId_fkey` FOREIGN KEY (`optionId`) REFERENCES `CatalogAttributeOption`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductCategory` ADD CONSTRAINT `CatalogProductCategory_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `CatalogProduct`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductCategory` ADD CONSTRAINT `CatalogProductCategory_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `CatalogCategory`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductCollection` ADD CONSTRAINT `CatalogProductCollection_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `CatalogProduct`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductCollection` ADD CONSTRAINT `CatalogProductCollection_collectionId_fkey` FOREIGN KEY (`collectionId`) REFERENCES `CatalogCollection`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductTag` ADD CONSTRAINT `CatalogProductTag_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `CatalogProduct`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogProductTag` ADD CONSTRAINT `CatalogProductTag_tagId_fkey` FOREIGN KEY (`tagId`) REFERENCES `CatalogTag`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogMedia` ADD CONSTRAINT `CatalogMedia_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `CatalogProduct`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogMedia` ADD CONSTRAINT `CatalogMedia_variantId_fkey` FOREIGN KEY (`variantId`) REFERENCES `CatalogProductVariant`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogMedia` ADD CONSTRAINT `CatalogMedia_uploadedByUserId_fkey` FOREIGN KEY (`uploadedByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CatalogMediaTranslation` ADD CONSTRAINT `CatalogMediaTranslation_mediaId_fkey` FOREIGN KEY (`mediaId`) REFERENCES `CatalogMedia`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
