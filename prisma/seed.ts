import 'dotenv/config';

import argon2 from 'argon2';
import { PrismaMariaDb } from '@prisma/adapter-mariadb';
import {
  PrismaClient,
  UserStatus,
  UserType,
  type Permission,
  type Prisma,
  type Role,
} from '@prisma/client';

interface SeedPermission {
  key: string;
  name: string;
  module: string;
  description: string;
}

interface SeedRole {
  key: string;
  name: string;
  description: string;
  permissionKeys: string[];
}

function getRequiredEnv(name: string, fallback?: string): string {
  const value = process.env[name] ?? fallback;

  if (!value || value.trim().length === 0) {
    throw new Error(`Missing required environment variable: ${name}`);
  }

  return value;
}

function createAdapter(connectionString: string): PrismaMariaDb {
  const url = new URL(connectionString);

  return new PrismaMariaDb({
    host: url.hostname,
    port: Number.parseInt(url.port || '3306', 10),
    user: decodeURIComponent(url.username),
    password: decodeURIComponent(url.password),
    database: url.pathname.replace(/^\//, ''),
    connectionLimit: Number.parseInt(url.searchParams.get('connection_limit') ?? '10', 10),
  });
}

const permissions: SeedPermission[] = [
  {
    key: 'identity.read',
    name: 'Read identity records',
    module: 'identity',
    description: 'Allows reading user and access-control records.',
  },
  {
    key: 'identity.write',
    name: 'Manage identity records',
    module: 'identity',
    description: 'Allows creating and updating user and access-control records.',
  },
  {
    key: 'audit.read',
    name: 'Read audit records',
    module: 'audit',
    description: 'Allows reading sensitive audit trails.',
  },
  {
    key: 'reviews.read',
    name: 'Read product reviews',
    module: 'reviews',
    description: 'Allows reading administrative review records.',
  },
  {
    key: 'reviews.moderate',
    name: 'Moderate product reviews',
    module: 'reviews',
    description: 'Allows approving, rejecting, flagging, and hiding reviews.',
  },
  {
    key: 'notifications.read',
    name: 'Read notification records',
    module: 'notifications',
    description: 'Allows reading user notification delivery records.',
  },
  {
    key: 'notifications.write',
    name: 'Manage notification delivery',
    module: 'notifications',
    description:
      'Allows retrying failed notification deliveries and managing notification operations.',
  },
  {
    key: 'reports.read',
    name: 'Read operational reports',
    module: 'reporting',
    description: 'Allows reading administrative reporting endpoints.',
  },
  {
    key: 'reports.write',
    name: 'Generate operational report exports',
    module: 'reporting',
    description: 'Allows creating asynchronous report exports.',
  },
  {
    key: 'content.read',
    name: 'Read content records',
    module: 'content',
    description: 'Allows reading administrative content and legal-reference configuration.',
  },
  {
    key: 'content.write',
    name: 'Manage content records',
    module: 'content',
    description: 'Allows creating and updating content pages and legal-reference configuration.',
  },
  {
    key: 'settings.read',
    name: 'Read store settings',
    module: 'settings',
    description: 'Allows reading store settings.',
  },
  {
    key: 'settings.write',
    name: 'Manage store settings',
    module: 'settings',
    description: 'Allows creating and updating store settings.',
  },
  {
    key: 'catalog.read',
    name: 'Read catalog records',
    module: 'catalog',
    description: 'Allows reading draft and administrative catalog records.',
  },
  {
    key: 'catalog.write',
    name: 'Manage catalog records',
    module: 'catalog',
    description: 'Allows creating, updating, publishing, archiving, and attaching catalog media.',
  },
  {
    key: 'pricing.read',
    name: 'Read pricing records',
    module: 'pricing',
    description: 'Allows reading administrative pricing, shipping, and tax configuration.',
  },
  {
    key: 'pricing.write',
    name: 'Manage pricing records',
    module: 'pricing',
    description:
      'Allows managing catalog pricing, store pricing settings, shipping methods, and tax rules.',
  },
  {
    key: 'promotions.read',
    name: 'Read promotion records',
    module: 'promotions',
    description: 'Allows reading promotions, coupons, and usage-rule configuration.',
  },
  {
    key: 'promotions.write',
    name: 'Manage promotion records',
    module: 'promotions',
    description: 'Allows managing promotions, coupons, stacking rules, and usage constraints.',
  },
  {
    key: 'inventory.read',
    name: 'Read inventory records',
    module: 'inventory',
    description: 'Allows reading stock levels, warehouses, and movements.',
  },
  {
    key: 'inventory.write',
    name: 'Manage inventory records',
    module: 'inventory',
    description: 'Allows manual stock adjustments.',
  },
  {
    key: 'orders.read',
    name: 'Read order records',
    module: 'orders',
    description: 'Allows reading customer and administrative order records.',
  },
  {
    key: 'payments.read',
    name: 'Read payment records',
    module: 'payments',
    description:
      'Allows reading payment attempts, webhook processing state, and refund records without provider secrets.',
  },
  {
    key: 'orders.write',
    name: 'Manage order fulfillment records',
    module: 'orders',
    description: 'Allows creating and updating shipment and post-purchase order records.',
  },
  {
    key: 'returns.read',
    name: 'Read return records',
    module: 'returns',
    description: 'Allows reading customer return requests and refund-linked return state.',
  },
  {
    key: 'returns.write',
    name: 'Manage return records',
    module: 'returns',
    description: 'Allows reviewing, receiving, and refunding return requests.',
  },
];

const roles: SeedRole[] = [
  {
    key: 'super_admin',
    name: 'Super Admin',
    description: 'Initial all-access administrative role for development bootstrap.',
    permissionKeys: permissions.map((permission) => permission.key),
  },
];

async function main(): Promise<void> {
  const databaseUrl = getRequiredEnv('DATABASE_URL', 'mysql://root:root@localhost:3306/ecommerce');
  const adapter = createAdapter(databaseUrl);
  const prisma = new PrismaClient({ adapter });

  const adminEmail = getRequiredEnv('DEV_SEED_ADMIN_EMAIL', 'admin@example.com');
  const adminPassword = getRequiredEnv('DEV_SEED_ADMIN_PASSWORD', 'ChangeMe123!');
  const normalizedEmail = adminEmail.trim().toLowerCase();
  const passwordHash = await argon2.hash(adminPassword);

  try {
    await prisma.$transaction(async (tx) => {
      const permissionRecords: Permission[] = await Promise.all(
        permissions.map((permission) =>
          tx.permission.upsert({
            where: { key: permission.key },
            update: {
              name: permission.name,
              module: permission.module,
              description: permission.description,
              isSystem: true,
            },
            create: {
              key: permission.key,
              name: permission.name,
              module: permission.module,
              description: permission.description,
              isSystem: true,
            },
          }),
        ),
      );

      const permissionIdByKey = new Map(
        permissionRecords.map((permission) => [permission.key, permission.id]),
      );

      for (const role of roles) {
        const roleRecord: Role = await tx.role.upsert({
          where: { key: role.key },
          update: {
            name: role.name,
            description: role.description,
            isSystem: true,
          },
          create: {
            key: role.key,
            name: role.name,
            description: role.description,
            isSystem: true,
          },
        });

        for (const permissionKey of role.permissionKeys) {
          const permissionId = permissionIdByKey.get(permissionKey);

          if (!permissionId) {
            throw new Error(`Missing permission for role seeding: ${permissionKey}`);
          }

          await tx.rolePermission.upsert({
            where: {
              roleId_permissionId: {
                roleId: roleRecord.id,
                permissionId,
              },
            },
            update: {},
            create: {
              roleId: roleRecord.id,
              permissionId,
            },
          });
        }
      }

      const adminUser = await tx.user.upsert({
        where: { normalizedEmail },
        update: {
          email: adminEmail,
          displayName: 'Development Admin',
          passwordHash,
          userType: UserType.ADMIN,
          status: UserStatus.ACTIVE,
        },
        create: {
          email: adminEmail,
          normalizedEmail,
          displayName: 'Development Admin',
          passwordHash,
          userType: UserType.ADMIN,
          status: UserStatus.ACTIVE,
        },
      });

      const adminRole = await tx.role.findUniqueOrThrow({
        where: { key: 'super_admin' },
      });

      await tx.userRole.upsert({
        where: {
          userId_roleId: {
            userId: adminUser.id,
            roleId: adminRole.id,
          },
        },
        update: {},
        create: {
          userId: adminUser.id,
          roleId: adminRole.id,
        },
      });

      const defaultSettings: Array<{
        key: string;
        value: Prisma.InputJsonValue;
        description: string;
      }> = [
        {
          key: 'store.currency',
          value: { code: 'USD', symbol: '$', minorUnit: 2 },
          description: 'Default store currency configuration.',
        },
        {
          key: 'store.locales',
          value: ['en', 'ar'],
          description: 'Enabled content locales.',
        },
        {
          key: 'store.pricing',
          value: {
            pricesIncludeTax: false,
            defaultTaxCountryCode: 'US',
            shippingCurrencyCode: 'USD',
          },
          description: 'Pricing behavior defaults for tax and shipping policy.',
        },
      ];

      for (const setting of defaultSettings) {
        await tx.storeSetting.upsert({
          where: { key: setting.key },
          update: {
            value: setting.value,
            description: setting.description,
          },
          create: {
            key: setting.key,
            value: setting.value,
            description: setting.description,
          },
        });
      }

      const fashionType = await tx.catalogProductType.upsert({
        where: { key: 'fashion' },
        update: {
          status: 'PUBLISHED',
          sortOrder: 1,
        },
        create: {
          key: 'fashion',
          status: 'PUBLISHED',
          sortOrder: 1,
        },
      });

      const perfumeType = await tx.catalogProductType.upsert({
        where: { key: 'perfume' },
        update: {
          status: 'PUBLISHED',
          sortOrder: 2,
        },
        create: {
          key: 'perfume',
          status: 'PUBLISHED',
          sortOrder: 2,
        },
      });

      const productTypes = [
        {
          id: fashionType.id,
          translations: [
            {
              locale: 'en',
              name: 'Fashion',
              slug: 'fashion',
              description: 'Apparel and style products.',
            },
            { locale: 'ar', name: 'أزياء', slug: 'azya', description: 'منتجات الملابس والأناقة.' },
          ],
        },
        {
          id: perfumeType.id,
          translations: [
            {
              locale: 'en',
              name: 'Perfume',
              slug: 'perfume',
              description: 'Fragrance and perfume products.',
            },
            { locale: 'ar', name: 'عطور', slug: 'otor', description: 'منتجات العطور والروائح.' },
          ],
        },
      ];

      for (const productType of productTypes) {
        for (const translation of productType.translations) {
          await tx.catalogProductTypeTranslation.upsert({
            where: {
              productTypeId_locale: {
                productTypeId: productType.id,
                locale: translation.locale,
              },
            },
            update: translation,
            create: {
              productTypeId: productType.id,
              ...translation,
            },
          });
        }
      }

      const sizeAttribute = await tx.catalogAttribute.upsert({
        where: { key: 'size' },
        update: {
          inputType: 'SELECT',
          isFilterable: true,
          isVariantDefining: true,
          sortOrder: 1,
        },
        create: {
          key: 'size',
          inputType: 'SELECT',
          isFilterable: true,
          isVariantDefining: true,
          sortOrder: 1,
        },
      });

      const colorAttribute = await tx.catalogAttribute.upsert({
        where: { key: 'color' },
        update: {
          inputType: 'COLOR',
          isFilterable: true,
          isVariantDefining: true,
          sortOrder: 2,
        },
        create: {
          key: 'color',
          inputType: 'COLOR',
          isFilterable: true,
          isVariantDefining: true,
          sortOrder: 2,
        },
      });

      const volumeAttribute = await tx.catalogAttribute.upsert({
        where: { key: 'volume' },
        update: {
          inputType: 'SELECT',
          isFilterable: true,
          isVariantDefining: true,
          sortOrder: 1,
        },
        create: {
          key: 'volume',
          inputType: 'SELECT',
          isFilterable: true,
          isVariantDefining: true,
          sortOrder: 1,
        },
      });

      const concentrationAttribute = await tx.catalogAttribute.upsert({
        where: { key: 'concentration' },
        update: {
          inputType: 'SELECT',
          isFilterable: true,
          isVariantDefining: true,
          sortOrder: 2,
        },
        create: {
          key: 'concentration',
          inputType: 'SELECT',
          isFilterable: true,
          isVariantDefining: true,
          sortOrder: 2,
        },
      });

      const scentFamilyAttribute = await tx.catalogAttribute.upsert({
        where: { key: 'scent-family' },
        update: {
          inputType: 'SELECT',
          isFilterable: true,
          isVariantDefining: false,
          sortOrder: 3,
        },
        create: {
          key: 'scent-family',
          inputType: 'SELECT',
          isFilterable: true,
          isVariantDefining: false,
          sortOrder: 3,
        },
      });

      const attributeTranslations = [
        {
          attributeId: sizeAttribute.id,
          locale: 'en',
          name: 'Size',
          description: 'Apparel size options.',
        },
        {
          attributeId: sizeAttribute.id,
          locale: 'ar',
          name: 'المقاس',
          description: 'خيارات مقاسات الملابس.',
        },
        {
          attributeId: colorAttribute.id,
          locale: 'en',
          name: 'Color',
          description: 'Visual color variants.',
        },
        {
          attributeId: colorAttribute.id,
          locale: 'ar',
          name: 'اللون',
          description: 'خيارات الألوان.',
        },
        {
          attributeId: volumeAttribute.id,
          locale: 'en',
          name: 'Volume',
          description: 'Bottle size or volume.',
        },
        {
          attributeId: volumeAttribute.id,
          locale: 'ar',
          name: 'الحجم',
          description: 'حجم الزجاجة.',
        },
        {
          attributeId: concentrationAttribute.id,
          locale: 'en',
          name: 'Concentration',
          description: 'Fragrance concentration.',
        },
        {
          attributeId: concentrationAttribute.id,
          locale: 'ar',
          name: 'التركيز',
          description: 'تركيز العطر.',
        },
        {
          attributeId: scentFamilyAttribute.id,
          locale: 'en',
          name: 'Scent Family',
          description: 'Dominant scent family.',
        },
        {
          attributeId: scentFamilyAttribute.id,
          locale: 'ar',
          name: 'العائلة العطرية',
          description: 'العائلة العطرية الأساسية.',
        },
      ];

      for (const translation of attributeTranslations) {
        await tx.catalogAttributeTranslation.upsert({
          where: {
            attributeId_locale: {
              attributeId: translation.attributeId,
              locale: translation.locale,
            },
          },
          update: {
            name: translation.name,
            description: translation.description,
          },
          create: translation,
        });
      }

      const attributeOptionSeeds = [
        {
          attributeId: sizeAttribute.id,
          key: 'm',
          translations: [
            { locale: 'en', label: 'Medium' },
            { locale: 'ar', label: 'متوسط' },
          ],
        },
        {
          attributeId: sizeAttribute.id,
          key: 'l',
          translations: [
            { locale: 'en', label: 'Large' },
            { locale: 'ar', label: 'كبير' },
          ],
        },
        {
          attributeId: colorAttribute.id,
          key: 'gold',
          colorHex: '#D4AF37',
          translations: [
            { locale: 'en', label: 'Gold' },
            { locale: 'ar', label: 'ذهبي' },
          ],
        },
        {
          attributeId: colorAttribute.id,
          key: 'black',
          colorHex: '#111111',
          translations: [
            { locale: 'en', label: 'Black' },
            { locale: 'ar', label: 'أسود' },
          ],
        },
        {
          attributeId: volumeAttribute.id,
          key: '50ml',
          translations: [
            { locale: 'en', label: '50 ml' },
            { locale: 'ar', label: '50 مل' },
          ],
        },
        {
          attributeId: volumeAttribute.id,
          key: '100ml',
          translations: [
            { locale: 'en', label: '100 ml' },
            { locale: 'ar', label: '100 مل' },
          ],
        },
        {
          attributeId: concentrationAttribute.id,
          key: 'edp',
          translations: [
            { locale: 'en', label: 'Eau de Parfum' },
            { locale: 'ar', label: 'أو دو بارفان' },
          ],
        },
        {
          attributeId: concentrationAttribute.id,
          key: 'edt',
          translations: [
            { locale: 'en', label: 'Eau de Toilette' },
            { locale: 'ar', label: 'أو دو تواليت' },
          ],
        },
        {
          attributeId: scentFamilyAttribute.id,
          key: 'woody',
          translations: [
            { locale: 'en', label: 'Woody' },
            { locale: 'ar', label: 'خشبي' },
          ],
        },
      ];

      const optionIdByCompositeKey = new Map<string, string>();
      for (const optionSeed of attributeOptionSeeds) {
        const option = await tx.catalogAttributeOption.upsert({
          where: {
            attributeId_key: {
              attributeId: optionSeed.attributeId,
              key: optionSeed.key,
            },
          },
          update: {
            colorHex: optionSeed.colorHex,
          },
          create: {
            attributeId: optionSeed.attributeId,
            key: optionSeed.key,
            colorHex: optionSeed.colorHex,
          },
        });
        optionIdByCompositeKey.set(`${optionSeed.attributeId}:${optionSeed.key}`, option.id);

        for (const translation of optionSeed.translations) {
          await tx.catalogAttributeOptionTranslation.upsert({
            where: {
              optionId_locale: {
                optionId: option.id,
                locale: translation.locale,
              },
            },
            update: {
              label: translation.label,
            },
            create: {
              optionId: option.id,
              locale: translation.locale,
              label: translation.label,
            },
          });
        }
      }

      const productTypeAttributes = [
        { productTypeId: fashionType.id, attributeId: sizeAttribute.id, sortOrder: 1 },
        { productTypeId: fashionType.id, attributeId: colorAttribute.id, sortOrder: 2 },
        { productTypeId: perfumeType.id, attributeId: volumeAttribute.id, sortOrder: 1 },
        { productTypeId: perfumeType.id, attributeId: concentrationAttribute.id, sortOrder: 2 },
        { productTypeId: perfumeType.id, attributeId: scentFamilyAttribute.id, sortOrder: 3 },
      ];

      for (const link of productTypeAttributes) {
        await tx.catalogProductTypeAttribute.upsert({
          where: {
            productTypeId_attributeId: {
              productTypeId: link.productTypeId,
              attributeId: link.attributeId,
            },
          },
          update: {
            sortOrder: link.sortOrder,
          },
          create: link,
        });
      }

      const perfumeBrand = await tx.catalogBrand.upsert({
        where: { key: 'noir-house' },
        update: { status: 'PUBLISHED' },
        create: { key: 'noir-house', status: 'PUBLISHED' },
      });
      const fashionBrand = await tx.catalogBrand.upsert({
        where: { key: 'atelier-line' },
        update: { status: 'PUBLISHED' },
        create: { key: 'atelier-line', status: 'PUBLISHED' },
      });

      const brandTranslations = [
        {
          brandId: perfumeBrand.id,
          locale: 'en',
          name: 'Noir House',
          slug: 'noir-house',
          description: 'Perfume atelier brand.',
        },
        {
          brandId: perfumeBrand.id,
          locale: 'ar',
          name: 'نوار هاوس',
          slug: 'noir-house-ar',
          description: 'علامة متخصصة في العطور.',
        },
        {
          brandId: fashionBrand.id,
          locale: 'en',
          name: 'Atelier Line',
          slug: 'atelier-line',
          description: 'Modern fashion basics.',
        },
        {
          brandId: fashionBrand.id,
          locale: 'ar',
          name: 'أتولييه لاين',
          slug: 'atelier-line-ar',
          description: 'أساسيات أزياء حديثة.',
        },
      ];

      for (const translation of brandTranslations) {
        await tx.catalogBrandTranslation.upsert({
          where: {
            brandId_locale: {
              brandId: translation.brandId,
              locale: translation.locale,
            },
          },
          update: {
            name: translation.name,
            slug: translation.slug,
            description: translation.description,
          },
          create: translation,
        });
      }

      const fragranceCategory = await tx.catalogCategory.upsert({
        where: { key: 'fragrance' },
        update: { status: 'PUBLISHED', sortOrder: 1 },
        create: { key: 'fragrance', status: 'PUBLISHED', sortOrder: 1 },
      });
      const apparelCategory = await tx.catalogCategory.upsert({
        where: { key: 'apparel' },
        update: { status: 'PUBLISHED', sortOrder: 2 },
        create: { key: 'apparel', status: 'PUBLISHED', sortOrder: 2 },
      });

      const categoryTranslations = [
        {
          categoryId: fragranceCategory.id,
          locale: 'en',
          name: 'Fragrance',
          slug: 'fragrance',
          description: 'Fragrance collections.',
        },
        {
          categoryId: fragranceCategory.id,
          locale: 'ar',
          name: 'العطور',
          slug: 'fragrance-ar',
          description: 'فئة العطور.',
        },
        {
          categoryId: apparelCategory.id,
          locale: 'en',
          name: 'Apparel',
          slug: 'apparel',
          description: 'Apparel collections.',
        },
        {
          categoryId: apparelCategory.id,
          locale: 'ar',
          name: 'الملابس',
          slug: 'apparel-ar',
          description: 'فئة الملابس.',
        },
      ];

      for (const translation of categoryTranslations) {
        await tx.catalogCategoryTranslation.upsert({
          where: {
            categoryId_locale: {
              categoryId: translation.categoryId,
              locale: translation.locale,
            },
          },
          update: {
            name: translation.name,
            slug: translation.slug,
            description: translation.description,
          },
          create: translation,
        });
      }

      const launchCollection = await tx.catalogCollection.upsert({
        where: { key: 'launch-edit' },
        update: { status: 'PUBLISHED', sortOrder: 1 },
        create: { key: 'launch-edit', status: 'PUBLISHED', sortOrder: 1 },
      });
      for (const translation of [
        {
          locale: 'en',
          name: 'Launch Edit',
          slug: 'launch-edit',
          description: 'Featured launch assortment.',
        },
        {
          locale: 'ar',
          name: 'تشكيلة الإطلاق',
          slug: 'launch-edit-ar',
          description: 'تشكيلة الإطلاق المميزة.',
        },
      ]) {
        await tx.catalogCollectionTranslation.upsert({
          where: {
            collectionId_locale: {
              collectionId: launchCollection.id,
              locale: translation.locale,
            },
          },
          update: translation,
          create: {
            collectionId: launchCollection.id,
            ...translation,
          },
        });
      }

      const featuredTag = await tx.catalogTag.upsert({
        where: { key: 'featured' },
        update: { status: 'PUBLISHED' },
        create: { key: 'featured', status: 'PUBLISHED' },
      });
      for (const translation of [
        { locale: 'en', name: 'Featured', slug: 'featured' },
        { locale: 'ar', name: 'مميز', slug: 'featured-ar' },
      ]) {
        await tx.catalogTagTranslation.upsert({
          where: {
            tagId_locale: {
              tagId: featuredTag.id,
              locale: translation.locale,
            },
          },
          update: translation,
          create: {
            tagId: featuredTag.id,
            ...translation,
          },
        });
      }

      const apparelTaxClass = await tx.taxClass.upsert({
        where: { key: 'apparel-standard' },
        update: {
          name: 'Apparel Standard',
          isDefault: false,
        },
        create: {
          key: 'apparel-standard',
          name: 'Apparel Standard',
          isDefault: false,
        },
      });

      const fragranceTaxClass = await tx.taxClass.upsert({
        where: { key: 'fragrance-standard' },
        update: {
          name: 'Fragrance Standard',
          isDefault: true,
        },
        create: {
          key: 'fragrance-standard',
          name: 'Fragrance Standard',
          isDefault: true,
        },
      });

      await tx.taxClass.updateMany({
        where: {
          id: {
            not: fragranceTaxClass.id,
          },
          isDefault: true,
        },
        data: {
          isDefault: false,
        },
      });

      for (const rate of [
        {
          taxClassId: apparelTaxClass.id,
          countryCode: 'US',
          rateBps: 800,
          isIncludedInPrice: false,
        },
        {
          taxClassId: fragranceTaxClass.id,
          countryCode: 'US',
          rateBps: 1000,
          isIncludedInPrice: false,
        },
        {
          taxClassId: apparelTaxClass.id,
          countryCode: 'AE',
          rateBps: 500,
          isIncludedInPrice: true,
        },
        {
          taxClassId: fragranceTaxClass.id,
          countryCode: 'AE',
          rateBps: 500,
          isIncludedInPrice: true,
        },
      ]) {
        await tx.manualTaxRate.upsert({
          where: {
            taxClassId_countryCode: {
              taxClassId: rate.taxClassId,
              countryCode: rate.countryCode,
            },
          },
          update: {
            rateBps: rate.rateBps,
            isIncludedInPrice: rate.isIncludedInPrice,
          },
          create: rate,
        });
      }

      const usShippingZone = await tx.shippingZone.upsert({
        where: { key: 'united-states' },
        update: {
          name: 'United States',
          isActive: true,
        },
        create: {
          key: 'united-states',
          name: 'United States',
          isActive: true,
        },
      });

      const gccShippingZone = await tx.shippingZone.upsert({
        where: { key: 'gcc' },
        update: {
          name: 'GCC',
          isActive: true,
        },
        create: {
          key: 'gcc',
          name: 'GCC',
          isActive: true,
        },
      });

      await tx.shippingZoneCountry.deleteMany({
        where: {
          zoneId: {
            in: [usShippingZone.id, gccShippingZone.id],
          },
        },
      });

      await tx.shippingZoneCountry.createMany({
        data: [
          { zoneId: usShippingZone.id, countryCode: 'US' },
          { zoneId: gccShippingZone.id, countryCode: 'AE' },
          { zoneId: gccShippingZone.id, countryCode: 'SA' },
          { zoneId: gccShippingZone.id, countryCode: 'KW' },
        ],
      });

      const shippingMethodSeeds = [
        {
          zoneId: usShippingZone.id,
          key: 'standard',
          name: 'Standard Shipping',
          rateType: 'FLAT' as const,
          currencyCode: 'USD',
          flatAmount: 700,
          percentageBps: null,
          estimatedMinDays: 3,
          estimatedMaxDays: 5,
          sortOrder: 0,
        },
        {
          zoneId: usShippingZone.id,
          key: 'express',
          name: 'Express Shipping',
          rateType: 'PERCENTAGE_OF_SUBTOTAL' as const,
          currencyCode: 'USD',
          flatAmount: null,
          percentageBps: 600,
          minSubtotalAmount: 2000,
          estimatedMinDays: 1,
          estimatedMaxDays: 2,
          sortOrder: 1,
        },
        {
          zoneId: gccShippingZone.id,
          key: 'regional-standard',
          name: 'Regional Standard',
          rateType: 'FLAT' as const,
          currencyCode: 'USD',
          flatAmount: 900,
          percentageBps: null,
          estimatedMinDays: 2,
          estimatedMaxDays: 4,
          sortOrder: 0,
        },
      ];

      for (const method of shippingMethodSeeds) {
        await tx.shippingMethod.upsert({
          where: {
            zoneId_key: {
              zoneId: method.zoneId,
              key: method.key,
            },
          },
          update: method,
          create: method,
        });
      }

      const springSalePromotion = await tx.promotion.upsert({
        where: { key: 'spring-sale' },
        update: {
          name: 'Spring Sale',
          status: 'ACTIVE',
          trigger: 'AUTOMATIC',
          rewardType: 'PERCENTAGE',
          percentageBps: 1000,
          maxDiscountAmount: 2500,
          minSubtotalAmount: 5000,
          isCombinable: true,
          priority: 10,
        },
        create: {
          key: 'spring-sale',
          name: 'Spring Sale',
          status: 'ACTIVE',
          trigger: 'AUTOMATIC',
          rewardType: 'PERCENTAGE',
          percentageBps: 1000,
          maxDiscountAmount: 2500,
          minSubtotalAmount: 5000,
          isCombinable: true,
          priority: 10,
        },
      });

      await tx.promotion.upsert({
        where: { key: 'free-shipping-over-100' },
        update: {
          name: 'Free Shipping Over 100',
          status: 'ACTIVE',
          trigger: 'AUTOMATIC',
          rewardType: 'FREE_SHIPPING',
          minSubtotalAmount: 10000,
          isCombinable: true,
          priority: 20,
        },
        create: {
          key: 'free-shipping-over-100',
          name: 'Free Shipping Over 100',
          status: 'ACTIVE',
          trigger: 'AUTOMATIC',
          rewardType: 'FREE_SHIPPING',
          minSubtotalAmount: 10000,
          isCombinable: true,
          priority: 20,
        },
      });

      const vipCouponPromotion = await tx.promotion.upsert({
        where: { key: 'vip-coupon' },
        update: {
          name: 'VIP Coupon',
          status: 'ACTIVE',
          trigger: 'COUPON',
          rewardType: 'FIXED_AMOUNT',
          currencyCode: 'USD',
          fixedAmount: 1500,
          minSubtotalAmount: 7000,
          isCombinable: false,
          priority: 5,
          totalUsageLimit: 500,
          perCustomerUsageLimit: 1,
        },
        create: {
          key: 'vip-coupon',
          name: 'VIP Coupon',
          status: 'ACTIVE',
          trigger: 'COUPON',
          rewardType: 'FIXED_AMOUNT',
          currencyCode: 'USD',
          fixedAmount: 1500,
          minSubtotalAmount: 7000,
          isCombinable: false,
          priority: 5,
          totalUsageLimit: 500,
          perCustomerUsageLimit: 1,
        },
      });

      await tx.promotionExclusion.deleteMany({
        where: {
          sourcePromotionId: vipCouponPromotion.id,
        },
      });
      await tx.promotionExclusion.create({
        data: {
          sourcePromotionId: vipCouponPromotion.id,
          targetPromotionId: springSalePromotion.id,
        },
      });

      await tx.coupon.upsert({
        where: {
          normalizedCode: 'VIP15',
        },
        update: {
          promotionId: vipCouponPromotion.id,
          code: 'VIP15',
          status: 'ACTIVE',
          totalUsageLimit: 500,
          perCustomerUsageLimit: 1,
        },
        create: {
          promotionId: vipCouponPromotion.id,
          code: 'VIP15',
          normalizedCode: 'VIP15',
          status: 'ACTIVE',
          totalUsageLimit: 500,
          perCustomerUsageLimit: 1,
        },
      });

      const perfumeProduct = await tx.catalogProduct.upsert({
        where: { sku: 'PERFUME-GOLD-OUD' },
        update: {
          productTypeId: perfumeType.id,
          brandId: perfumeBrand.id,
          status: 'PUBLISHED',
          isFeatured: true,
          publishedAt: new Date(),
        },
        create: {
          sku: 'PERFUME-GOLD-OUD',
          productTypeId: perfumeType.id,
          brandId: perfumeBrand.id,
          status: 'PUBLISHED',
          isFeatured: true,
          publishedAt: new Date(),
        },
      });

      const fashionProduct = await tx.catalogProduct.upsert({
        where: { sku: 'FASHION-LINEN-SHIRT' },
        update: {
          productTypeId: fashionType.id,
          brandId: fashionBrand.id,
          status: 'PUBLISHED',
          isFeatured: true,
          publishedAt: new Date(),
        },
        create: {
          sku: 'FASHION-LINEN-SHIRT',
          productTypeId: fashionType.id,
          brandId: fashionBrand.id,
          status: 'PUBLISHED',
          isFeatured: true,
          publishedAt: new Date(),
        },
      });

      await tx.catalogProductTranslation.deleteMany({
        where: {
          productId: {
            in: [perfumeProduct.id, fashionProduct.id],
          },
        },
      });

      for (const translation of [
        {
          productId: perfumeProduct.id,
          locale: 'en',
          name: 'Gold Oud Reserve',
          slug: 'gold-oud-reserve',
          shortDescription: 'A woody amber perfume with saffron and oud.',
          description: 'A luxury perfume example with volume and concentration variants.',
        },
        {
          productId: perfumeProduct.id,
          locale: 'ar',
          name: 'جولد عود ريزيرف',
          slug: 'gold-oud-reserve-ar',
          shortDescription: 'عطر خشبي عنبري مع الزعفران والعود.',
          description: 'مثال لعطر فاخر مع متغيرات الحجم والتركيز.',
        },
        {
          productId: fashionProduct.id,
          locale: 'en',
          name: 'Linen Overshirt',
          slug: 'linen-overshirt',
          shortDescription: 'Relaxed-fit linen overshirt in seasonal colors.',
          description: 'A fashion example with size and color variant modeling.',
        },
        {
          productId: fashionProduct.id,
          locale: 'ar',
          name: 'قميص كتان خارجي',
          slug: 'linen-overshirt-ar',
          shortDescription: 'قميص كتان بقصة مريحة وألوان موسمية.',
          description: 'مثال للأزياء مع متغيرات المقاس واللون.',
        },
      ]) {
        await tx.catalogProductTranslation.create({
          data: translation,
        });
      }

      const productLinks = [
        {
          productId: perfumeProduct.id,
          categoryId: fragranceCategory.id,
          collectionId: launchCollection.id,
          tagId: featuredTag.id,
        },
        {
          productId: fashionProduct.id,
          categoryId: apparelCategory.id,
          collectionId: launchCollection.id,
          tagId: featuredTag.id,
        },
      ];

      for (const link of productLinks) {
        await tx.catalogProductCategory.upsert({
          where: {
            productId_categoryId: {
              productId: link.productId,
              categoryId: link.categoryId,
            },
          },
          update: {},
          create: {
            productId: link.productId,
            categoryId: link.categoryId,
          },
        });
        await tx.catalogProductCollection.upsert({
          where: {
            productId_collectionId: {
              productId: link.productId,
              collectionId: link.collectionId,
            },
          },
          update: {},
          create: {
            productId: link.productId,
            collectionId: link.collectionId,
          },
        });
        await tx.catalogProductTag.upsert({
          where: {
            productId_tagId: {
              productId: link.productId,
              tagId: link.tagId,
            },
          },
          update: {},
          create: {
            productId: link.productId,
            tagId: link.tagId,
          },
        });
      }

      await tx.stockReservation.deleteMany();
      await tx.stockMovement.deleteMany();
      await tx.stockLevel.deleteMany();

      await tx.catalogProductVariant.deleteMany({
        where: {
          productId: {
            in: [perfumeProduct.id, fashionProduct.id],
          },
        },
      });

      const defaultWarehouse = await tx.warehouse.upsert({
        where: { key: 'default' },
        update: {
          name: 'Default Warehouse',
          isDefault: true,
        },
        create: {
          key: 'default',
          name: 'Default Warehouse',
          isDefault: true,
        },
      });

      const variantSeeds = [
        {
          productId: perfumeProduct.id,
          sku: 'PERFUME-GOLD-OUD-50-EDP',
          position: 0,
          isDefault: true,
          translations: [
            { locale: 'en', name: '50 ml Eau de Parfum' },
            { locale: 'ar', name: '50 مل أو دو بارفان' },
          ],
          optionKeys: [
            `${volumeAttribute.id}:50ml`,
            `${concentrationAttribute.id}:edp`,
            `${scentFamilyAttribute.id}:woody`,
          ],
        },
        {
          productId: perfumeProduct.id,
          sku: 'PERFUME-GOLD-OUD-100-EDT',
          position: 1,
          isDefault: false,
          translations: [
            { locale: 'en', name: '100 ml Eau de Toilette' },
            { locale: 'ar', name: '100 مل أو دو تواليت' },
          ],
          optionKeys: [
            `${volumeAttribute.id}:100ml`,
            `${concentrationAttribute.id}:edt`,
            `${scentFamilyAttribute.id}:woody`,
          ],
        },
        {
          productId: fashionProduct.id,
          sku: 'FASHION-LINEN-SHIRT-M-GOLD',
          position: 0,
          isDefault: true,
          translations: [
            { locale: 'en', name: 'Medium / Gold' },
            { locale: 'ar', name: 'متوسط / ذهبي' },
          ],
          optionKeys: [`${sizeAttribute.id}:m`, `${colorAttribute.id}:gold`],
        },
        {
          productId: fashionProduct.id,
          sku: 'FASHION-LINEN-SHIRT-L-BLACK',
          position: 1,
          isDefault: false,
          translations: [
            { locale: 'en', name: 'Large / Black' },
            { locale: 'ar', name: 'كبير / أسود' },
          ],
          optionKeys: [`${sizeAttribute.id}:l`, `${colorAttribute.id}:black`],
        },
      ];

      for (const variantSeed of variantSeeds) {
        const variant = await tx.catalogProductVariant.create({
          data: {
            productId: variantSeed.productId,
            sku: variantSeed.sku,
            status: 'PUBLISHED',
            position: variantSeed.position,
            isDefault: variantSeed.isDefault,
          },
        });

        for (const translation of variantSeed.translations) {
          await tx.catalogProductVariantTranslation.create({
            data: {
              variantId: variant.id,
              locale: translation.locale,
              name: translation.name,
            },
          });
        }

        for (const optionCompositeKey of variantSeed.optionKeys) {
          const [attributeId] = optionCompositeKey.split(':');
          if (!attributeId) {
            throw new Error(`Missing catalog attribute seed mapping for ${optionCompositeKey}`);
          }

          const optionId = optionIdByCompositeKey.get(optionCompositeKey);
          if (!optionId) {
            throw new Error(`Missing catalog option seed mapping for ${optionCompositeKey}`);
          }

          await tx.catalogProductVariantOptionValue.create({
            data: {
              variantId: variant.id,
              attributeId,
              optionId,
            },
          });
        }

        const variantPricing = variantSeed.sku.startsWith('PERFUME')
          ? {
              currencyCode: 'USD',
              baseAmount: variantSeed.sku.includes('50') ? 12900 : 16900,
              saleAmount: variantSeed.sku.includes('50') ? 10900 : 14900,
              taxClassId: fragranceTaxClass.id,
            }
          : {
              currencyCode: 'USD',
              baseAmount: variantSeed.sku.includes('-M-') ? 8900 : 9400,
              saleAmount: variantSeed.sku.includes('-M-') ? 7900 : null,
              taxClassId: apparelTaxClass.id,
            };

        await tx.catalogVariantPrice.upsert({
          where: {
            variantId: variant.id,
          },
          update: variantPricing,
          create: {
            variantId: variant.id,
            ...variantPricing,
          },
        });

        await tx.stockLevel.create({
          data: {
            warehouseId: defaultWarehouse.id,
            variantId: variant.id,
            quantityOnHand: 100,
            quantityReserved: 0,
          },
        });

        await tx.stockMovement.create({
          data: {
            warehouseId: defaultWarehouse.id,
            variantId: variant.id,
            quantityChanged: 100,
            type: 'RECEIPT',
          },
        });
      }
    });
  } finally {
    await prisma.$disconnect();
  }
}

void main();
