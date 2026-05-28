import 'dotenv/config';

import { CatalogStatus } from '@prisma/client/index';

import {
  assertMysqlDatabaseAvailable,
  createMysqlTestPrismaClient,
} from './support/mysql-test-client';

const runMysqlIntegration = process.env.RUN_MYSQL_INTEGRATION === 'true';

const describeMysqlIntegration = runMysqlIntegration ? describe : describe.skip;

describeMysqlIntegration('pricing integration', () => {
  const prisma = createMysqlTestPrismaClient();

  beforeAll(async () => {
    await assertMysqlDatabaseAvailable(prisma, 'pricing integration');
  });

  afterAll(async () => {
    await prisma.$disconnect();
  });

  it('persists variant pricing and shipping configuration with relational links', async () => {
    const suffix = `${Date.now()}`;
    const productType = await prisma.catalogProductType.create({
      data: {
        key: `pricing-type-${suffix}`,
        status: CatalogStatus.PUBLISHED,
      },
    });

    const product = await prisma.catalogProduct.create({
      data: {
        sku: `PRICING-PRODUCT-${suffix}`,
        productTypeId: productType.id,
        status: CatalogStatus.PUBLISHED,
      },
    });

    const variant = await prisma.catalogProductVariant.create({
      data: {
        productId: product.id,
        sku: `PRICING-VARIANT-${suffix}`,
        status: CatalogStatus.PUBLISHED,
      },
    });

    const taxClass = await prisma.taxClass.create({
      data: {
        key: `pricing-tax-${suffix}`,
        name: 'Pricing Tax',
      },
    });

    await prisma.catalogVariantPrice.create({
      data: {
        variantId: variant.id,
        currencyCode: 'USD',
        baseAmount: 1999,
        saleAmount: 1499,
        taxClassId: taxClass.id,
      },
    });

    const zone = await prisma.shippingZone.create({
      data: {
        key: `pricing-zone-${suffix}`,
        name: 'Pricing Zone',
        countries: {
          create: [{ countryCode: 'US' }],
        },
      },
    });

    await prisma.shippingMethod.create({
      data: {
        zoneId: zone.id,
        key: `standard-${suffix}`,
        name: 'Standard',
        rateType: 'FLAT',
        currencyCode: 'USD',
        flatAmount: 500,
      },
    });

    const storedVariant = await prisma.catalogProductVariant.findUnique({
      where: { id: variant.id },
      include: {
        price: true,
      },
    });
    const storedZone = await prisma.shippingZone.findUnique({
      where: { id: zone.id },
      include: {
        countries: true,
        methods: true,
      },
    });

    expect(storedVariant?.price?.saleAmount).toBe(1499);
    expect(storedZone?.countries[0]?.countryCode).toBe('US');
    expect(storedZone?.methods[0]?.flatAmount).toBe(500);

    await prisma.shippingMethod.deleteMany({ where: { zoneId: zone.id } });
    await prisma.shippingZoneCountry.deleteMany({ where: { zoneId: zone.id } });
    await prisma.shippingZone.delete({ where: { id: zone.id } });
    await prisma.catalogVariantPrice.deleteMany({ where: { variantId: variant.id } });
    await prisma.taxClass.delete({ where: { id: taxClass.id } });
    await prisma.catalogProductVariant.delete({ where: { id: variant.id } });
    await prisma.catalogProduct.delete({ where: { id: product.id } });
    await prisma.catalogProductType.delete({ where: { id: productType.id } });
  });
});
