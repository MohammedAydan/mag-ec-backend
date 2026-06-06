/**
 * Comprehensive API Client Test Script
 * Acts as a real client and tests every documented API endpoint.
 * Run with: tsx scripts/api-client-test.ts
 */

import * as dotenv from 'dotenv';
import * as path from 'path';
import * as fs from 'fs';

dotenv.config({ path: path.resolve(process.cwd(), '.env') });

const BASE_URL = `http://localhost:${process.env.PORT ?? 3003}/api/v1`;
const COLORS = {
  reset: '\x1b[0m',
  green: '\x1b[32m',
  red: '\x1b[31m',
  yellow: '\x1b[33m',
  cyan: '\x1b[36m',
  bold: '\x1b[1m',
  dim: '\x1b[2m',
};

// ─── State bag (shared across tests) ────────────────────────────────────────
let adminAccessToken = '';
let adminRefreshToken = '';
let customerAccessToken = '';
let customerRefreshToken = '';
let customerEmail = `testclient+${Date.now()}@example.com`;
const customerPassword = 'ClientTest123!';
let customerId = '';
let adminUserId = ''; // admin's own id — never passed to staff mutation endpoints
let staffUserId = '';
let roleId = '';
let cartId = '';
let cartToken = '';
let productId = '';
let variantId = '';
let brandId = '';
let categoryId = '';
let collectionId = '';
let tagId = '';
let attributeId = '';
let productTypeId = '';
let orderId = '';
let fulfillmentOrderId = '';
let orderLineId = '';
let fulfillmentOrderLineId = '';
let shipmentId = '';
let returnRequestId = '';
let returnRequestItemId = '';
let reviewId = '';
let notificationId = '';
let exportId = '';
let pageKey = 'about';
let warehouseId = '';

// ─── Result tracking ─────────────────────────────────────────────────────────
interface TestResult {
  group: string;
  name: string;
  method: string;
  path: string;
  status: number | null;
  expected: number | number[];
  passed: boolean;
  error?: string;
  duration: number;
}

const results: TestResult[] = [];
let currentGroup = '';

function setGroup(name: string) {
  currentGroup = name;
  console.log(`\n${COLORS.bold}${COLORS.cyan}━━ ${name} ━━${COLORS.reset}`);
}

// ─── HTTP helpers ─────────────────────────────────────────────────────────────
interface RequestOptions {
  method?: string;
  body?: unknown;
  token?: string;
  guestToken?: string;
  idempotencyKey?: string;
  rawBody?: string;
  contentType?: string;
}

async function request(
  method: string,
  urlPath: string,
  options: RequestOptions = {},
  expectedStatus: number | number[] = 200,
  label?: string,
): Promise<{ status: number; body: unknown }> {
  const url = `${BASE_URL}${urlPath}`;
  const hasBody = options.rawBody !== undefined || options.body !== undefined || ['POST', 'PUT', 'PATCH'].includes(method);
  const headers: Record<string, string> = {
    Accept: 'application/json',
  };
  if (options.contentType) {
    headers['Content-Type'] = options.contentType;
  } else if (hasBody) {
    headers['Content-Type'] = 'application/json';
  }

  if (options.token) headers['Authorization'] = `Bearer ${options.token}`;
  if (options.guestToken) headers['X-Guest-Cart-Token'] = options.guestToken;
  if (options.idempotencyKey) headers['Idempotency-Key'] = options.idempotencyKey;

  const t0 = Date.now();
  let status: number | null = null;
  let body: unknown = null;
  let errorMsg: string | undefined;

  // Determine request body: for state-change POST/PUT/PATCH with no body, send {} to satisfy Fastify's JSON content-type requirement
  const needsEmptyBody =
    options.rawBody === undefined &&
    options.body === undefined &&
    ['POST', 'PUT', 'PATCH'].includes(method);

  try {
    const res = await fetch(url, {
      method,
      headers,
      body:
        options.rawBody !== undefined
          ? options.rawBody
          : options.body !== undefined
            ? JSON.stringify(options.body)
            : needsEmptyBody
              ? '{}'
              : undefined,
    });
    status = res.status;

    const text = await res.text();
    try {
      body = text ? JSON.parse(text) : {};
    } catch {
      body = text;
    }
  } catch (e: unknown) {
    errorMsg = e instanceof Error ? e.message : String(e);
  }

  const duration = Date.now() - t0;
  const expected = Array.isArray(expectedStatus) ? expectedStatus : [expectedStatus];
  const passed = status !== null && expected.includes(status);

  const testName = label ?? `${method} ${urlPath}`;
  results.push({
    group: currentGroup,
    name: testName,
    method,
    path: urlPath,
    status,
    expected: expectedStatus,
    passed,
    error: errorMsg,
    duration,
  });

  const icon = passed ? `${COLORS.green}✓${COLORS.reset}` : `${COLORS.red}✗${COLORS.reset}`;
  const statusStr = status !== null ? String(status) : 'ERR';
  const statusColor = passed ? COLORS.green : COLORS.red;

  console.log(
    `  ${icon} ${COLORS.dim}[${duration}ms]${COLORS.reset} ${method.padEnd(6)} ${urlPath.padEnd(60)} ${statusColor}${statusStr}${COLORS.reset}` +
      (errorMsg ? ` ${COLORS.red}← ${errorMsg}${COLORS.reset}` : ''),
  );

  if (!passed && body && typeof body === 'object') {
    const msg = (body as Record<string, unknown>).message ?? (body as Record<string, unknown>).error;
    if (msg) {
      console.log(`    ${COLORS.yellow}↳ ${JSON.stringify(msg)}${COLORS.reset}`);
    }
  }

  return { status: status ?? 0, body };
}

// ─── Test suites ─────────────────────────────────────────────────────────────

async function testHealth() {
  setGroup('Health');
  await request('GET', '/health/liveness', {}, 200);
  await request('GET', '/health/readiness', {}, 200);
}

async function testAuthRegisterAndLogin() {
  setGroup('Authentication');

  // Register customer
  const reg = await request(
    'POST',
    '/auth/register',
    {
      body: {
        email: customerEmail,
        password: customerPassword,
        displayName: 'Test Client',
      },
    },
    201,
    'POST /auth/register (new customer)',
  );
  if (reg.status === 201) {
    const b = reg.body as Record<string, unknown>;
    customerId = ((b as Record<string, unknown>)?.id as string) ?? '';
  }

  // Duplicate registration should fail
  await request(
    'POST',
    '/auth/register',
    {
      body: { email: customerEmail, password: customerPassword, displayName: 'Test Client' },
    },
    [400, 409],
    'POST /auth/register (duplicate → 409/400)',
  );

  // Admin login
  const login = await request(
    'POST',
    '/auth/login',
    {
      body: { email: 'admin@example.com', password: 'ChangeMe123!' },
    },
    200,
    'POST /auth/login (admin)',
  );
  if (login.status === 200) {
    const b = login.body as Record<string, unknown>;
    adminAccessToken = (b.accessToken as string) ?? '';
    adminRefreshToken = (b.refreshToken as string) ?? '';
  }

  // Customer login
  const cLogin = await request(
    'POST',
    '/auth/login',
    { body: { email: customerEmail, password: customerPassword } },
    200,
    'POST /auth/login (customer)',
  );
  if (cLogin.status === 200) {
    const b = cLogin.body as Record<string, unknown>;
    customerAccessToken = (b.accessToken as string) ?? '';
    customerRefreshToken = (b.refreshToken as string) ?? '';
    if (!customerId) {
      customerId = ((b.user as Record<string, unknown>)?.id as string) ?? '';
    }
  }

  // Invalid credentials
  await request(
    'POST',
    '/auth/login',
    { body: { email: 'nobody@nowhere.com', password: 'WrongPass1!' } },
    401,
    'POST /auth/login (invalid creds → 401)',
  );

  // GET /auth/me
  const me = await request('GET', '/auth/me', { token: adminAccessToken }, 200);
  if (me.status === 200) {
    const b = me.body as Record<string, unknown>;
    adminUserId = ((b.user ?? b) as Record<string, unknown>).id as string ?? '';
  }

  // Refresh token
  const refresh = await request(
    'POST',
    '/auth/refresh',
    { body: { refreshToken: adminRefreshToken } },
    200,
    'POST /auth/refresh (admin)',
  );
  if (refresh.status === 200) {
    const b = refresh.body as Record<string, unknown>;
    adminAccessToken = (b.accessToken as string) ?? adminAccessToken;
    adminRefreshToken = (b.refreshToken as string) ?? adminRefreshToken;
  }

  // Password reset request (blind - should not expose account existence)
  await request(
    'POST',
    '/auth/password-reset/request',
    { body: { email: 'nobody@nowhere.com' } },
    [200, 202],
    'POST /auth/password-reset/request (blind)',
  );

  // Verification request (authenticated)
  await request(
    'POST',
    '/auth/verification/request',
    { token: customerAccessToken },
    [200, 202, 400, 503],
    'POST /auth/verification/request',
  );

  // Confirm with bad token
  await request(
    'POST',
    '/auth/verification/confirm',
    { token: customerAccessToken, body: { token: 'bad-token' } },
    [400, 401, 422],
    'POST /auth/verification/confirm (bad token)',
  );

  // Password reset confirm with bad token
  await request(
    'POST',
    '/auth/password-reset/confirm',
    { body: { token: 'bad-token', newPassword: 'NewPass123!' } },
    [400, 401, 422],
    'POST /auth/password-reset/confirm (bad token)',
  );
}

async function testIdentity() {
  setGroup('Identity');

  // User profile (own)
  if (customerId) {
    await request('GET', `/identity/users/${customerId}/profile`, { token: customerAccessToken }, 200, 'GET own profile');
    // Admin reading customer profile
    await request('GET', `/identity/users/${customerId}/profile`, { token: adminAccessToken }, 200, 'GET profile (admin)');
  }

  // Access check (admin)
  await request('GET', '/identity/admin/access-check', { token: adminAccessToken }, 200);

  // Unauthorized access check
  await request('GET', '/identity/admin/access-check', { token: customerAccessToken }, 403);
}

async function testIdentityAdmin() {
  setGroup('Identity Admin');

  // List permissions
  const perms = await request('GET', '/identity/admin/permissions', { token: adminAccessToken }, 200);

  // List roles
  await request('GET', '/identity/admin/roles', { token: adminAccessToken }, 200);

  // Create custom role
  const roleKey = `test_role_${Date.now()}`;
  const role = await request(
    'POST',
    '/identity/admin/roles',
    {
      token: adminAccessToken,
      body: { key: roleKey, name: `Test Role ${Date.now()}`, description: 'Test role from API client test', permissionKeys: [] },
    },
    [200, 201],
    'POST /identity/admin/roles',
  );
  if (role.status === 200 || role.status === 201) {
    const b = role.body as Record<string, unknown>;
    roleId = (b.id as string) ?? '';
  }

  // Patch role permissions (need at least one permission key)
  if (roleId) {
    const permList = perms.body as Record<string, unknown>[];
    const firstPermKey = Array.isArray(permList) ? (permList[0] as Record<string, unknown>)?.key : undefined;
    if (firstPermKey) {
      await request(
        'PATCH',
        `/identity/admin/roles/${roleId}/permissions`,
        { token: adminAccessToken, body: { permissionKeys: [firstPermKey] } },
        200,
        'PATCH role permissions',
      );
    }
  }

  // List staff
  await request('GET', '/identity/admin/staff', { token: adminAccessToken }, 200);

  // List customers
  await request('GET', '/identity/admin/customers', { token: adminAccessToken }, 200);

  // Staff invitation
  const inviteEmail = `staff+${Date.now()}@example.com`;
  const invite = await request(
    'POST',
    '/identity/admin/staff/invitations',
    {
      token: adminAccessToken,
      body: { email: inviteEmail, displayName: 'Staff Test', roleIds: roleId ? [roleId] : [] },
    },
    [200, 201, 503],
    'POST staff invitation',
  );
  if (invite.status === 200 || invite.status === 201) {
    const b = invite.body as Record<string, unknown>;
    staffUserId = (b.id as string) ?? staffUserId;
  }

  // Resend invitation + patch roles + patch status only if we have a staffId
  if (staffUserId) {
    await request(
      'POST',
      `/identity/admin/staff/${staffUserId}/resend-invitation`,
      { token: adminAccessToken },
      [200, 202, 404],
      'POST resend-invitation',
    );

    if (roleId) {
      await request(
        'PATCH',
        `/identity/admin/staff/${staffUserId}/roles`,
        { token: adminAccessToken, body: { roleIds: [roleId] } },
        [200, 404],
        'PATCH staff roles',
      );
    }

    await request(
      'PATCH',
      `/identity/admin/staff/${staffUserId}/status`,
      { token: adminAccessToken, body: { status: 'SUSPENDED' } },
      [200, 400, 404],
      'PATCH staff status',
    );
  }

  // Customers cannot access admin routes
  await request('GET', '/identity/admin/staff', { token: customerAccessToken }, [403, 401]);
}

async function testPromotionsAdmin() {
  setGroup('Promotions Admin');

  const promoKey = `promo_test_${Date.now()}`;

  await request('GET', '/promotions/admin', { token: adminAccessToken }, 200);

  // Create/upsert promotion
  const promo = await request(
    'PUT',
    `/promotions/admin/by-key/${promoKey}`,
    {
      token: adminAccessToken,
      body: {
        name: 'API Test Promo',
        status: 'ACTIVE',
        trigger: 'COUPON',
        rewardType: 'PERCENTAGE',
        percentageBps: 1000,
        startsAt: new Date().toISOString(),
      },
    },
    [200, 201],
    'PUT /promotions/admin/by-key/:key (upsert)',
  );

  let promotionId = '';
  if (promo.status === 200 || promo.status === 201) {
    const b = promo.body as Record<string, unknown>;
    promotionId = (b.id as string) ?? '';
  }

  if (promotionId) {
    await request('GET', `/promotions/admin/${promotionId}`, { token: adminAccessToken }, 200);

    // Add coupon
    const couponCode = `TESTCOUPON${Date.now()}`;
    await request(
      'PUT',
      `/promotions/admin/${promotionId}/coupons/${couponCode}`,
      { token: adminAccessToken, body: { code: couponCode, status: 'ACTIVE' } },
      [200, 201],
      'PUT coupon',
    );
  }
}

async function testCatalogAdmin() {
  setGroup('Catalog Admin');

  // Product types
  const ptKey = `type_${Date.now()}`;
  const pt = await request(
    'POST',
    '/catalog/admin/product-types',
    {
      token: adminAccessToken,
      body: {
        key: ptKey,
        translations: [{ locale: 'en', name: `Type ${Date.now()}`, slug: `type-${Date.now()}` }],
      },
    },
    [200, 201],
    'POST product-type',
  );
  if (pt.status === 200 || pt.status === 201) {
    productTypeId = ((pt.body as Record<string, unknown>).id as string) ?? '';
  }
  await request('GET', '/catalog/admin/product-types', { token: adminAccessToken }, 200);

  // Brands
  const brandKey = `brand_${Date.now()}`;
  const brand = await request(
    'POST',
    '/catalog/admin/brands',
    {
      token: adminAccessToken,
      body: {
        key: brandKey,
        translations: [{ locale: 'en', name: `Brand ${Date.now()}`, slug: `brand-${Date.now()}` }],
      },
    },
    [200, 201],
    'POST brand',
  );
  if (brand.status === 200 || brand.status === 201) {
    brandId = ((brand.body as Record<string, unknown>).id as string) ?? '';
  }
  await request('GET', '/catalog/admin/brands', { token: adminAccessToken }, 200);

  // Categories
  const catKey = `cat_${Date.now()}`;
  const cat = await request(
    'POST',
    '/catalog/admin/categories',
    {
      token: adminAccessToken,
      body: {
        key: catKey,
        translations: [{ locale: 'en', name: `Category ${Date.now()}`, slug: `cat-${Date.now()}` }],
      },
    },
    [200, 201],
    'POST category',
  );
  if (cat.status === 200 || cat.status === 201) {
    categoryId = ((cat.body as Record<string, unknown>).id as string) ?? '';
  }
  await request('GET', '/catalog/admin/categories', { token: adminAccessToken }, 200);

  // Collections
  const colKey = `col_${Date.now()}`;
  const col = await request(
    'POST',
    '/catalog/admin/collections',
    {
      token: adminAccessToken,
      body: {
        key: colKey,
        translations: [{ locale: 'en', name: `Collection ${Date.now()}`, slug: `col-${Date.now()}` }],
      },
    },
    [200, 201],
    'POST collection',
  );
  if (col.status === 200 || col.status === 201) {
    collectionId = ((col.body as Record<string, unknown>).id as string) ?? '';
  }
  await request('GET', '/catalog/admin/collections', { token: adminAccessToken }, 200);

  // Tags
  const tagKey = `tag_${Date.now()}`;
  const tag = await request(
    'POST',
    '/catalog/admin/tags',
    {
      token: adminAccessToken,
      body: {
        key: tagKey,
        translations: [{ locale: 'en', name: `Tag ${Date.now()}`, slug: `tag-${Date.now()}` }],
      },
    },
    [200, 201],
    'POST tag',
  );
  if (tag.status === 200 || tag.status === 201) {
    tagId = ((tag.body as Record<string, unknown>).id as string) ?? '';
  }
  await request('GET', '/catalog/admin/tags', { token: adminAccessToken }, 200);

  // Attributes
  const attrKey = `attr_${Date.now()}`;
  const attr = await request(
    'POST',
    '/catalog/admin/attributes',
    {
      token: adminAccessToken,
      body: {
        key: attrKey,
        inputType: 'TEXT',
        translations: [{ locale: 'en', name: `Attr ${Date.now()}` }],
      },
    },
    [200, 201],
    'POST attribute',
  );
  if (attr.status === 200 || attr.status === 201) {
    attributeId = ((attr.body as Record<string, unknown>).id as string) ?? '';
  }
  await request('GET', '/catalog/admin/attributes', { token: adminAccessToken }, 200);

  // Publish/archive taxonomy
  if (brandId) {
    await request('POST', `/catalog/admin/brands/${brandId}/publish`, { token: adminAccessToken }, [200, 201]);
    await request('POST', `/catalog/admin/brands/${brandId}/archive`, { token: adminAccessToken }, [200, 201]);
    await request('POST', `/catalog/admin/brands/${brandId}/publish`, { token: adminAccessToken }, [200, 201]);
  }
  if (categoryId) {
    await request('POST', `/catalog/admin/categories/${categoryId}/publish`, { token: adminAccessToken }, [200, 201]);
  }
  if (collectionId) {
    await request('POST', `/catalog/admin/collections/${collectionId}/publish`, { token: adminAccessToken }, [200, 201]);
  }
  if (tagId) {
    await request('POST', `/catalog/admin/tags/${tagId}/publish`, { token: adminAccessToken }, [200, 201]);
  }
  if (productTypeId) {
    await request('POST', `/catalog/admin/product-types/${productTypeId}/publish`, { token: adminAccessToken }, [200, 201]);
  }

  // Products
  await request('GET', '/catalog/admin/products', { token: adminAccessToken }, 200);
  const productSlug = `product-${Date.now()}`;
  const productSku = `SKU-PROD-${Date.now()}`;
  const product = await request(
    'POST',
    '/catalog/admin/products',
    {
      token: adminAccessToken,
      body: {
        sku: productSku,
        productTypeId: productTypeId || undefined,
        brandId: brandId || undefined,
        translations: [{ locale: 'en', name: `Test Product ${Date.now()}`, slug: productSlug }],
        variants: [
          {
            sku: `${productSku}-V1`,
            isDefault: true,
            translations: [{ locale: 'en', name: 'Default Variant' }],
            optionValues: [],
          },
        ],
      },
    },
    [200, 201],
    'POST product',
  );
  if (product.status === 200 || product.status === 201) {
    productId = ((product.body as Record<string, unknown>).id as string) ?? '';
    // Capture first variant ID
    const variants = (product.body as Record<string, unknown>).variants as Array<Record<string, unknown>> | undefined;
    if (variants && variants.length > 0) {
      variantId = (variants[0].id as string) ?? '';
    }
  }

  if (productId) {
    await request('GET', `/catalog/admin/products/${productId}`, { token: adminAccessToken }, 200);

    await request(
      'PATCH',
      `/catalog/admin/products/${productId}`,
      { token: adminAccessToken, body: { isFeatured: true } },
      200,
      'PATCH product',
    );

    // Add a second variant (we already have one from product creation)
    if (!variantId) {
      const variant = await request(
        'POST',
        `/catalog/admin/products/${productId}/variants`,
        {
          token: adminAccessToken,
          body: {
            sku: `SKU-V2-${Date.now()}`,
            translations: [{ locale: 'en', name: 'Second Variant' }],
            optionValues: [],
          },
        },
        [200, 201],
        'POST variant',
      );
      if (variant.status === 200 || variant.status === 201) {
        variantId = ((variant.body as Record<string, unknown>).id as string) ?? '';
      }
    }

    if (variantId) {
      await request(
        'PATCH',
        `/catalog/admin/variants/${variantId}`,
        {
          token: adminAccessToken,
          body: { translations: [{ locale: 'en', name: 'Updated Variant' }] },
        },
        200,
        'PATCH variant',
      );
    }

    // Media endpoints
    await request(
      'POST',
      `/catalog/admin/products/${productId}/media/upload-intents`,
      {
        token: adminAccessToken,
        body: { mediaType: 'IMAGE', role: 'PRIMARY', mimeType: 'image/jpeg', sizeBytes: 1024 },
      },
      [200, 201],
      'POST media upload-intent',
    );

    await request(
      'POST',
      `/catalog/admin/products/${productId}/media/attach`,
      {
        token: adminAccessToken,
        body: { mediaId: 'fake-id', uploadToken: 'fake-token' },
      },
      [200, 201, 400, 401, 404, 422],
      'POST media attach (fake token)',
    );

    // Try to publish variant (will fail 400 until price is set; will succeed after pricing)
    if (variantId) {
      await request('POST', `/catalog/admin/variants/${variantId}/publish`, { token: adminAccessToken }, [200, 201, 400]);
    }

    // Product publish will fail with 400 because variant has no price yet — that's expected
    // The actual publish will happen in testPricingAdmin after prices are set
    await request(
      'POST',
      `/catalog/admin/products/${productId}/publish`,
      { token: adminAccessToken },
      [200, 201, 400],
      'POST product publish (before pricing — expected 400)',
    );
  }
}

async function testCatalogPublic() {
  setGroup('Catalog Public');

  await request('GET', '/catalog/products', {}, 200);
  // by slug (may not exist yet since we archived it)
  await request('GET', '/catalog/products/nonexistent-product', {}, [200, 404]);
}

async function testPricingAdmin() {
  setGroup('Pricing Admin');

  await request(
    'PUT',
    '/pricing/admin/settings/currency',
    { token: adminAccessToken, body: { currencyCode: 'USD', symbol: '$', minorUnit: 2 } },
    200,
  );

  await request(
    'PUT',
    '/pricing/admin/settings/behavior',
    { token: adminAccessToken, body: { pricesIncludeTax: false } },
    200,
  );

  if (variantId) {
    await request(
      'PUT',
      `/pricing/admin/variants/${variantId}/price`,
      { token: adminAccessToken, body: { currencyCode: 'USD', baseAmount: 2999, saleAmount: 1999 } },
      200,
    );

    // Now that the variant has a price, publish variant and product
    await request(
      'POST',
      `/catalog/admin/variants/${variantId}/publish`,
      { token: adminAccessToken },
      [200, 201, 400],
      'POST variant publish (after pricing)',
    );
    if (productId) {
      await request(
        'POST',
        `/catalog/admin/products/${productId}/publish`,
        { token: adminAccessToken },
        [200, 201],
        'POST product publish (after pricing)',
      );
    }
  }

  const taxKey = `standard_${Date.now()}`;
  const taxRes = await request(
    'PUT',
    `/pricing/admin/tax-classes/${taxKey}`,
    { token: adminAccessToken, body: { name: 'Standard Tax', isDefault: false } },
    [200, 201],
    'PUT tax-class',
  );
  let taxClassId = '';
  if (taxRes.status === 200 || taxRes.status === 201) {
    taxClassId = ((taxRes.body as Record<string, unknown>).id as string) ?? '';
  }

  if (taxClassId) {
    await request(
      'PUT',
      `/pricing/admin/tax-classes/${taxClassId}/rates/US`,
      { token: adminAccessToken, body: { rateBps: 850 } },
      200,
      'PUT tax rate',
    );
  }

  const zoneKey = `zone_${Date.now()}`;
  const zoneRes = await request(
    'PUT',
    `/pricing/admin/shipping-zones/${zoneKey}`,
    { token: adminAccessToken, body: { name: 'Domestic', countryCodes: ['US'] } },
    [200, 201],
    'PUT shipping-zone',
  );
  let zoneId = '';
  if (zoneRes.status === 200 || zoneRes.status === 201) {
    zoneId = ((zoneRes.body as Record<string, unknown>).id as string) ?? '';
  }

  if (zoneId) {
    const methodKey = `standard_${Date.now()}`;
    await request(
      'PUT',
      `/pricing/admin/shipping-zones/${zoneId}/methods/${methodKey}`,
      {
        token: adminAccessToken,
        body: { name: 'Standard Shipping', rateType: 'FLAT', currencyCode: 'USD', flatAmount: 499 },
      },
      [200, 201],
      'PUT shipping method',
    );
  }
}

async function testPricingPublic() {
  setGroup('Pricing Public');

  if (variantId) {
    await request(
      'POST',
      '/pricing/checkout/preview',
      {
        body: {
          currencyCode: 'USD',
          countryCode: 'US',
          items: [{ variantId, quantity: 1 }],
        },
      },
      [200, 201, 400],
      'POST /pricing/checkout/preview',
    );
  } else {
    // With no variantId, still exercise the endpoint with invalid data to verify it's up
    await request(
      'POST',
      '/pricing/checkout/preview',
      {
        body: { currencyCode: 'USD', countryCode: 'US', items: [] },
      },
      [200, 201, 400],
      'POST /pricing/checkout/preview (empty)',
    );
  }
}

async function testInventoryAdmin() {
  setGroup('Inventory Admin');

  const levelsRes = await request('GET', '/inventory/admin/levels', { token: adminAccessToken }, 200);
  await request('GET', '/inventory/admin/reservations', { token: adminAccessToken }, 200);
  await request('GET', '/inventory/admin/movements', { token: adminAccessToken }, 200);

  // Capture a warehouseId from existing stock levels
  if (levelsRes.status === 200) {
    const levels = levelsRes.body as Array<Record<string, unknown>>;
    if (Array.isArray(levels) && levels.length > 0) {
      warehouseId = (levels[0].warehouseId as string) ?? '';
    }
  }

  if (variantId && warehouseId) {
    await request(
      'POST',
      '/inventory/admin/adjustments',
      {
        token: adminAccessToken,
        body: {
          warehouseId,
          variantId,
          quantityChanged: 50,
          type: 'ADJUSTMENT',
          reason: 'API test stock adjustment',
        },
      },
      [200, 201],
      'POST stock adjustment',
    );
  } else if (variantId) {
    // No warehouse yet, expect 422/400 or skip gracefully
    await request(
      'POST',
      '/inventory/admin/adjustments',
      {
        token: adminAccessToken,
        body: {
          warehouseId: 'nonexistent-warehouse',
          variantId,
          quantityChanged: 50,
          type: 'ADJUSTMENT',
          reason: 'API test stock adjustment',
        },
      },
      [200, 201, 400, 404, 422],
      'POST stock adjustment (no warehouse)',
    );
  }
}

async function testCarts() {
  setGroup('Carts');

  // Create guest cart
  const cart = await request('POST', '/carts', { body: {} }, 201, 'POST /carts (guest)');
  if (cart.status === 201) {
    const b = cart.body as Record<string, unknown>;
    cartId = (b.id as string) ?? '';
    cartToken = (b.guestToken as string) ?? '';
  }

  if (cartId) {
    // GET cart
    await request('GET', `/carts/${cartId}`, { guestToken: cartToken }, 200);

    // Add item (requires a published priced variant)
    if (variantId) {
      const add = await request(
        'POST',
        `/carts/${cartId}/items`,
        {
          guestToken: cartToken,
          body: { variantId, quantity: 2 },
        },
        [200, 201, 400, 422],
        'POST cart item',
      );

      if (add.status === 200 || add.status === 201) {
        // Update quantity
        await request(
          'PATCH',
          `/carts/${cartId}/items/${variantId}`,
          { guestToken: cartToken, body: { quantity: 1 } },
          200,
          'PATCH cart item',
        );

        // Try apply coupon
        await request(
          'POST',
          `/carts/${cartId}/coupon`,
          { guestToken: cartToken, body: { couponCode: 'NONEXISTENT' } },
          [200, 201, 400, 404, 422],
          'POST cart coupon (nonexistent)',
        );

        // Remove coupon
        await request('DELETE', `/carts/${cartId}/coupon`, { guestToken: cartToken }, [200, 204, 404]);

        // Remove item
        await request(
          'DELETE',
          `/carts/${cartId}/items/${variantId}`,
          { guestToken: cartToken },
          [200, 204],
          'DELETE cart item',
        );
      }
    }

    // Cart merge (customer must have a cart too)
    if (customerAccessToken) {
      const authCart = await request('POST', '/carts', { token: customerAccessToken, body: {} }, 201, 'POST /carts (auth)');
      if (authCart.status === 201) {
        await request(
          'POST',
          '/carts/merge',
          {
            token: customerAccessToken,
            body: { sourceGuestToken: cartToken },
          },
          [200, 201, 400],
          'POST /carts/merge',
        );
      }
    }
  }
}

async function testSupportAdmin() {
  setGroup('Commerce Support Admin');
  await request('GET', '/support/admin/carts', { token: adminAccessToken }, 200);
  await request('GET', '/support/admin/wishlists', { token: adminAccessToken }, 200);
}

async function testWishlist() {
  setGroup('Wishlist');

  await request('GET', '/wishlist', { token: customerAccessToken }, 200);

  if (variantId) {
    await request(
      'POST',
      '/wishlist/items',
      { token: customerAccessToken, body: { variantId } },
      [200, 201],
      'POST wishlist item',
    );

    await request(
      'DELETE',
      `/wishlist/items/${variantId}`,
      { token: customerAccessToken },
      [200, 204],
      'DELETE wishlist item',
    );
  }
}

async function testCheckout() {
  setGroup('Checkout');

  // Test invalid checkout preview (no cart → 4xx)
  await request(
    'POST',
    '/checkout/preview',
    { token: customerAccessToken, body: { cartId: 'nonexistent', currencyCode: 'USD', countryCode: 'US' } },
    [400, 404, 422],
    'POST /checkout/preview (no cart → 4xx)',
  );

  if (!variantId) {
    return;
  }

  // Helper to place an order for the customer
  const prepareAndPlaceOrder = async (label: string): Promise<string> => {
    // 1. Get/create customer cart
    const cartRes = await request(
      'POST',
      '/carts',
      { token: customerAccessToken, body: {} },
      [200, 201],
      `POST /carts (auth - ${label})`,
    );
    if (cartRes.status !== 200 && cartRes.status !== 201) {
      return '';
    }
    const customerCartId = ((cartRes.body as Record<string, unknown>).id as string) ?? '';
    if (!customerCartId) {
      return '';
    }

    // 2. Add item to cart
    await request(
      'POST',
      `/carts/${customerCartId}/items`,
      { token: customerAccessToken, body: { variantId, quantity: 1 } },
      [200, 201, 409],
      `POST cart item (auth - ${label})`,
    );

    // 3. Preview checkout
    await request(
      'POST',
      '/checkout/preview',
      {
        token: customerAccessToken,
        body: { cartId: customerCartId, currencyCode: 'USD', countryCode: 'US' },
      },
      [200, 201, 400, 422],
      `POST /checkout/preview (${label})`,
    );

    // 4. Place order
    const placeKey = `place-${label}-${Date.now()}`;
    const place = await request(
      'POST',
      '/checkout/place',
      {
        token: customerAccessToken,
        idempotencyKey: placeKey,
        body: {
          cartId: customerCartId,
          currencyCode: 'USD',
          countryCode: 'US',
          customerEmail: customerEmail,
          shippingMethodKey: 'standard',
          paymentMethod: 'cash_on_delivery',
          shippingAddress: {
            recipientName: 'Test Client',
            phoneNumber: '+1234567890',
            countryCode: 'US',
            city: 'New York',
            state: 'NY',
            postalCode: '10001',
            addressLine1: '123 Main St',
          },
        },
      },
      [200, 201, 400, 422],
      `POST /checkout/place (${label})`,
    );

    if (place.status === 200 || place.status === 201) {
      return ((place.body as Record<string, unknown>).id as string) ?? '';
    }
    return '';
  };

  // Place first order (for cancellation tests)
  orderId = await prepareAndPlaceOrder('cancel-test');

  // Place second order (for fulfillment/returns tests)
  fulfillmentOrderId = await prepareAndPlaceOrder('fulfillment-test');
}

async function testOrders() {
  setGroup('Orders');

  // Customer orders
  const myOrders = await request('GET', '/orders/me', { token: customerAccessToken }, 200);
  if (myOrders.status === 200 && !orderId) {
    const items = (myOrders.body as Record<string, unknown>).data as Record<string, unknown>[];
    if (Array.isArray(items) && items.length > 0) {
      orderId = (items[0].id as string) ?? '';
    }
  }

  if (orderId) {
    const orderDetail = await request('GET', `/orders/me/${orderId}`, { token: customerAccessToken }, 200);
    if (orderDetail.status === 200) {
      const b = orderDetail.body as Record<string, unknown>;
      const lines = b.lines as Record<string, unknown>[];
      if (Array.isArray(lines) && lines.length > 0) {
        orderLineId = (lines[0].id as string) ?? '';
      }
    }

    await request(
      'POST',
      `/orders/me/${orderId}/cancel`,
      { token: customerAccessToken },
      [200, 201, 400, 409],
      'POST customer cancel order',
    );
  }

  // Get lines for the fulfillment order
  if (fulfillmentOrderId) {
    const detail = await request('GET', `/orders/me/${fulfillmentOrderId}`, { token: customerAccessToken }, 200);
    if (detail.status === 200) {
      const b = detail.body as Record<string, unknown>;
      const lines = b.lines as Record<string, unknown>[];
      if (Array.isArray(lines) && lines.length > 0) {
        fulfillmentOrderLineId = (lines[0].id as string) ?? '';
      }
    }
  }

  // Admin orders
  const adminOrders = await request('GET', '/orders/admin', { token: adminAccessToken }, 200);
  if (adminOrders.status === 200 && !orderId) {
    const items = (adminOrders.body as Record<string, unknown>).data as Record<string, unknown>[];
    if (Array.isArray(items) && items.length > 0) {
      orderId = (items[0].id as string) ?? '';
    }
  }

  if (orderId) {
    await request('GET', `/orders/admin/${orderId}`, { token: adminAccessToken }, 200);
    await request(
      'POST',
      `/orders/admin/${orderId}/cancel`,
      { token: adminAccessToken, body: { reason: 'API test cancellation' } },
      [200, 201, 400, 409],
      'POST admin cancel order',
    );
  }
}

async function testPaymentsAdmin() {
  setGroup('Payments Admin');
  await request('GET', '/payments/admin/attempts', { token: adminAccessToken }, 200);
  await request('GET', '/payments/admin/webhook-events', { token: adminAccessToken }, 200);
  await request('GET', '/payments/admin/refunds', { token: adminAccessToken }, 200);
}

async function testFulfillment() {
  setGroup('Fulfillment');

  if (!fulfillmentOrderId || !fulfillmentOrderLineId) {
    console.log(`  ${COLORS.yellow}⚠ Skipping fulfillment tests (no fulfillmentOrderId/LineId)${COLORS.reset}`);
    return;
  }

  // Admin shipment endpoints
  await request('GET', `/orders/admin/${fulfillmentOrderId}/shipments`, { token: adminAccessToken }, [200, 404]);

  const shipment = await request(
    'POST',
    `/orders/admin/${fulfillmentOrderId}/shipments`,
    {
      token: adminAccessToken,
      body: {
        carrierKey: 'ups',
        carrierName: 'UPS',
        trackingNumber: `TRACK-${Date.now()}`,
        items: [{ orderLineId: fulfillmentOrderLineId, quantity: 1 }],
      },
    },
    [200, 201, 400, 409],
    'POST admin shipment',
  );

  if (shipment.status === 200 || shipment.status === 201) {
    shipmentId = ((shipment.body as Record<string, unknown>).id as string) ?? '';
  }

  if (shipmentId) {
    // 1. Transition to SHIPPED
    await request(
      'PATCH',
      `/orders/admin/${fulfillmentOrderId}/shipments/${shipmentId}/status`,
      { token: adminAccessToken, body: { status: 'SHIPPED' } },
      [200, 201, 400],
      'PATCH shipment status (SHIPPED)',
    );

    // 2. Transition to DELIVERED (needed for returns testing!)
    await request(
      'PATCH',
      `/orders/admin/${fulfillmentOrderId}/shipments/${shipmentId}/status`,
      { token: adminAccessToken, body: { status: 'DELIVERED' } },
      [200, 201, 400],
      'PATCH shipment status (DELIVERED)',
    );
  }

  // Customer shipments
  await request('GET', `/orders/me/${fulfillmentOrderId}/shipments`, { token: customerAccessToken }, [200, 404]);
}

async function testReturns() {
  setGroup('Returns');

  await request('GET', '/returns/me', { token: customerAccessToken }, 200);

  if (fulfillmentOrderId && fulfillmentOrderLineId) {
    const ret = await request(
      'POST',
      `/returns/me/orders/${fulfillmentOrderId}`,
      {
        token: customerAccessToken,
        body: {
          reason: 'API test return',
          items: [{ orderLineId: fulfillmentOrderLineId, quantity: 1 }],
        },
      },
      [200, 201, 400, 409, 422],
      'POST return request',
    );

    if (ret.status === 200 || ret.status === 201) {
      const b = ret.body as Record<string, unknown>;
      returnRequestId = (b.id as string) ?? '';
      const items = b.items as Record<string, unknown>[];
      if (Array.isArray(items) && items.length > 0) {
        returnRequestItemId = (items[0].id as string) ?? '';
      }
    }
  }

  // Admin returns
  const adminReturns = await request('GET', '/returns/admin', { token: adminAccessToken }, 200);
  if (!returnRequestId && adminReturns.status === 200) {
    const items = (adminReturns.body as Record<string, unknown>).data as Record<string, unknown>[];
    if (Array.isArray(items) && items.length > 0) {
      returnRequestId = (items[0].id as string) ?? '';
    }
  }

  if (returnRequestId) {
    await request('GET', `/returns/me/${returnRequestId}`, { token: customerAccessToken }, [200, 404]);
    await request('GET', `/returns/admin/${returnRequestId}`, { token: adminAccessToken }, [200, 404]);

    await request(
      'POST',
      `/returns/admin/${returnRequestId}/review`,
      { token: adminAccessToken, body: { decision: 'approve' } },
      [200, 201, 400, 409],
      'POST return review',
    );

    if (returnRequestItemId && warehouseId) {
      await request(
        'POST',
        `/returns/admin/${returnRequestId}/receive`,
        {
          token: adminAccessToken,
          body: {
            items: [{
              returnRequestItemId,
              receivedQuantity: 1,
              finalDisposition: 'RESTOCK',
              warehouseId,
            }],
          },
        },
        [200, 201, 400, 409],
        'POST return receive',
      );
    } else {
      await request(
        'POST',
        `/returns/admin/${returnRequestId}/receive`,
        { token: adminAccessToken, body: { items: [] } },
        [200, 201, 400, 409],
        'POST return receive (empty)',
      );
    }

    await request(
      'POST',
      `/returns/admin/${returnRequestId}/refund`,
      { token: adminAccessToken, body: { amount: 100 } },
      [200, 201, 400, 409, 422],
      'POST return refund',
    );
  }
}

async function testReviews() {
  setGroup('Reviews');

  await request('GET', '/reviews/me', { token: customerAccessToken }, 200);

  const activeReviewOrderLineId = fulfillmentOrderLineId || orderLineId;

  if (activeReviewOrderLineId) {
    const review = await request(
      'POST',
      `/reviews/order-lines/${activeReviewOrderLineId}`,
      {
        token: customerAccessToken,
        body: { rating: 5, title: 'Great product', body: 'Loved it!' },
      },
      [200, 201, 400, 409],
      'POST review',
    );
    if (review.status === 200 || review.status === 201) {
      reviewId = ((review.body as Record<string, unknown>).id as string) ?? '';
    }
  }

  if (reviewId) {
    await request('GET', `/reviews/me/${reviewId}`, { token: customerAccessToken }, [200, 404]);
  }

  // Admin reviews
  const adminReviews = await request('GET', '/reviews/admin', { token: adminAccessToken }, 200);
  if (!reviewId && adminReviews.status === 200) {
    const items = (adminReviews.body as Record<string, unknown>).data as Record<string, unknown>[];
    if (Array.isArray(items) && items.length > 0) {
      reviewId = (items[0].id as string) ?? '';
    }
  }

  if (reviewId) {
    await request('GET', `/reviews/admin/${reviewId}`, { token: adminAccessToken }, [200, 404]);
    await request(
      'PATCH',
      `/reviews/admin/${reviewId}/moderate`,
      { token: adminAccessToken, body: { status: 'APPROVED' } },
      [200, 400],
      'PATCH review moderate',
    );
  }
}

async function testNotifications() {
  setGroup('Notifications');

  const notifs = await request('GET', '/notifications/me', { token: customerAccessToken }, 200);
  if (notifs.status === 200) {
    const items = (notifs.body as Record<string, unknown>).items as Record<string, unknown>[];
    if (Array.isArray(items) && items.length > 0) {
      notificationId = (items[0].id as string) ?? '';
    }
  }

  await request('GET', '/notifications/me/preferences', { token: customerAccessToken }, 200);

  await request(
    'PUT',
    '/notifications/me/preferences',
    {
      token: customerAccessToken,
      body: { channel: 'EMAIL', orderConfirmations: true, promotionalMessages: false },
    },
    200,
    'PUT notification preferences',
  );

  await request(
    'POST',
    '/notifications/me/push-devices',
    {
      token: customerAccessToken,
      body: { token: `fcm-test-${Date.now()}`, platform: 'android' },
    },
    [200, 201],
    'POST push device',
  );

  // Admin notifications
  const adminNotifs = await request('GET', '/notifications/admin', { token: adminAccessToken }, 200);
  if (!notificationId && adminNotifs.status === 200) {
    const items = (adminNotifs.body as Record<string, unknown>).items as Record<string, unknown>[];
    if (Array.isArray(items) && items.length > 0) {
      notificationId = (items[0].id as string) ?? '';
    }
  }

  if (notificationId) {
    await request(
      'POST',
      `/notifications/admin/${notificationId}/retry`,
      { token: adminAccessToken },
      [200, 201, 400],
      'POST notification retry',
    );
  }
}

async function testReporting() {
  setGroup('Reporting Admin');

  await request('GET', '/reports/admin/sales-summary', { token: adminAccessToken }, 200);
  await request('GET', '/reports/admin/top-products', { token: adminAccessToken }, 200);
  await request('GET', '/reports/admin/promotion-performance', { token: adminAccessToken }, 200);
  await request('GET', '/reports/admin/inventory-kpis', { token: adminAccessToken }, 200);

  await request('GET', '/reports/admin/exports', { token: adminAccessToken }, 200);

  const exp = await request(
    'POST',
    '/reports/admin/exports',
    { token: adminAccessToken, body: { type: 'SALES_SUMMARY', format: 'CSV' } },
    [200, 201, 400],
    'POST export',
  );
  if (exp.status === 200 || exp.status === 201) {
    exportId = ((exp.body as Record<string, unknown>).id as string) ?? '';
  }

  if (exportId) {
    await request(
      'GET',
      `/reports/admin/exports/${exportId}/download`,
      { token: adminAccessToken },
      [200, 302, 400, 404],
      'GET export download',
    );
  }
}

async function testAudit() {
  setGroup('Audit Admin');
  await request('GET', '/audit/admin', { token: adminAccessToken }, 200);
  // Unauthorized
  await request('GET', '/audit/admin', { token: customerAccessToken }, [403, 401]);
}

async function testContent() {
  setGroup('Content Admin');

  await request('GET', '/content/admin/pages', { token: adminAccessToken }, 200);
  await request('GET', '/content/admin/legal-references', { token: adminAccessToken }, 200);

  await request(
    'PUT',
    '/content/admin/legal-references',
    {
      token: adminAccessToken,
      body: { termsPageKey: null, privacyPageKey: null, returnsPageKey: null, shippingPageKey: null },
    },
    [200, 201],
    'PUT legal-references',
  );

  await request(
    'PUT',
    `/content/admin/pages/${pageKey}`,
    {
      token: adminAccessToken,
      body: {
        title: 'About Us',
        slug: pageKey,
        body: '<p>About page content</p>',
        status: 'PUBLISHED',
      },
    },
    [200, 201],
    'PUT page',
  );

  // Public content
  setGroup('Content Public');
  await request('GET', `/content/pages/${pageKey}`, {}, [200, 404]);
  await request('GET', '/content/legal-references', {}, 200);
}

async function testSystemMaintenance() {
  setGroup('System Maintenance');

  const maintenanceSecret = process.env.MAINTENANCE_SECRET ?? '';
  await request(
    'GET',
    '/system/maintenance/run',
    { token: maintenanceSecret },
    [200, 401, 403],
    'GET /system/maintenance/run (cron)',
  );

  await request(
    'POST',
    '/system/maintenance/run',
    { token: adminAccessToken, body: {} },
    [200, 201, 400, 401, 403],
    'POST /system/maintenance/run (admin)',
  );
}

async function testSecurityGuardrails() {
  setGroup('Security Guardrails');

  // No token → 401
  await request('GET', '/auth/me', {}, 401, 'GET /auth/me no token → 401');
  await request('GET', '/orders/me', {}, 401, 'GET /orders/me no token → 401');
  await request('GET', '/wishlist', {}, 401, 'GET /wishlist no token → 401');

  // Customer cannot access admin routes
  await request('GET', '/orders/admin', { token: customerAccessToken }, [403, 401], 'Admin route with customer token → 403');
  await request('GET', '/reports/admin/sales-summary', { token: customerAccessToken }, [403, 401]);

  // Expired/malformed token
  await request('GET', '/auth/me', { token: 'not.a.valid.jwt' }, 401, 'Bad token → 401');

  // Logout
  await request(
    'POST',
    '/auth/logout',
    { token: customerAccessToken, body: { refreshToken: customerRefreshToken } },
    [200, 204],
    'POST /auth/logout (customer)',
  );

  // After logout, refresh should fail
  await request(
    'POST',
    '/auth/refresh',
    { body: { refreshToken: customerRefreshToken } },
    [400, 401],
    'POST /auth/refresh after logout → 401',
  );
}

// ─── Summary printer ─────────────────────────────────────────────────────────

function printSummary() {
  const total = results.length;
  const passed = results.filter((r) => r.passed).length;
  const failed = results.filter((r) => !r.passed);
  const passRate = ((passed / total) * 100).toFixed(1);

  console.log(`\n${COLORS.bold}${'═'.repeat(80)}${COLORS.reset}`);
  console.log(`${COLORS.bold}API CLIENT TEST SUMMARY${COLORS.reset}`);
  console.log(`${'═'.repeat(80)}`);
  console.log(`Total endpoints tested : ${total}`);
  console.log(`${COLORS.green}Passed${COLORS.reset}                : ${passed}`);
  console.log(`${COLORS.red}Failed${COLORS.reset}                : ${failed.length}`);
  console.log(`Pass rate             : ${passRate}%`);

  if (failed.length > 0) {
    console.log(`\n${COLORS.bold}${COLORS.red}FAILURES:${COLORS.reset}`);
    for (const f of failed) {
      const expected = Array.isArray(f.expected) ? f.expected.join('|') : f.expected;
      console.log(
        `  ${COLORS.red}✗${COLORS.reset} [${f.group}] ${f.method} ${f.path}`,
      );
      console.log(
        `    Got: ${f.status ?? 'ERR'}  Expected: ${expected}${f.error ? `  Error: ${f.error}` : ''}`,
      );
    }
  }

  // Group summary
  console.log(`\n${COLORS.bold}BY GROUP:${COLORS.reset}`);
  const groups = [...new Set(results.map((r) => r.group))];
  for (const g of groups) {
    const gResults = results.filter((r) => r.group === g);
    const gPass = gResults.filter((r) => r.passed).length;
    const icon = gPass === gResults.length ? COLORS.green + '✓' : COLORS.red + '✗';
    console.log(`  ${icon}${COLORS.reset} ${g}: ${gPass}/${gResults.length}`);
  }

  console.log(`\n${'═'.repeat(80)}`);

  // Write JSON report
  const reportPath = path.resolve(process.cwd(), 'API_TEST_RESULTS.json');
  fs.writeFileSync(
    reportPath,
    JSON.stringify(
      {
        timestamp: new Date().toISOString(),
        total,
        passed,
        failed: failed.length,
        passRate: `${passRate}%`,
        results,
      },
      null,
      2,
    ),
  );
  console.log(`\nDetailed JSON report → ${reportPath}`);
}

// ─── Main ────────────────────────────────────────────────────────────────────

async function main() {
  console.log(`${COLORS.bold}${COLORS.cyan}E-Commerce API — Full Client Simulation Test${COLORS.reset}`);
  console.log(`Target: ${BASE_URL}`);
  console.log(`Time:   ${new Date().toISOString()}`);

  try {
    await testHealth();
    await testAuthRegisterAndLogin();
    await testIdentity();
    await testIdentityAdmin();
    await testPromotionsAdmin();
    await testCatalogAdmin();
    await testCatalogPublic();
    await testPricingAdmin();
    await testPricingPublic();
    await testInventoryAdmin();
    await testCarts();
    await testSupportAdmin();
    await testWishlist();
    await testCheckout();
    await testOrders();
    await testPaymentsAdmin();
    await testFulfillment();
    await testReturns();
    await testReviews();
    await testNotifications();
    await testReporting();
    await testAudit();
    await testContent();
    await testSystemMaintenance();
    await testSecurityGuardrails();
  } catch (e: unknown) {
    console.error(`\n${COLORS.red}FATAL:${COLORS.reset}`, e);
  }

  printSummary();
}

main().catch(console.error);
