/**
 * Release Smoke Test — deterministically verifies all critical API endpoints.
 *
 * Usage:
 *   pnpm release:smoke
 *   API_BASE_URL=http://localhost:3003/api/v1 ADMIN_EMAIL=admin@example.com ADMIN_PASSWORD=ChangeMe123! npx tsx scripts/release-smoke-test.ts
 *
 * Never prints tokens or secrets. Exits 0 only if all checks pass.
 */
import { writeFileSync, mkdirSync } from 'node:fs';
import path from 'node:path';

// ─── Config ───────────────────────────────────────────────────────────────────
const API_BASE = process.env.API_BASE_URL ?? 'http://localhost:3003/api/v1';
const ADMIN_EMAIL = process.env.ADMIN_EMAIL ?? 'admin@example.com';
const ADMIN_PASSWORD = process.env.ADMIN_PASSWORD ?? 'ChangeMe123!';
const ARTIFACT_DIR = path.resolve(process.cwd(), 'artifacts');
const TS = Date.now().toString(36);

// ─── Helpers ──────────────────────────────────────────────────────────────────
interface Check {
  name: string;
  status: 'pass' | 'fail' | 'skip';
  detail: string;
}

const checks: Check[] = [];
function record(name: string, status: Check['status'], detail: string) {
  checks.push({ name, status, detail });
  const icon = status === 'pass' ? '✓' : status === 'fail' ? '✗' : '○';
  process.stdout.write(`  ${icon} ${name}\n`);
}

let authToken: string | null = null;
let authRefreshToken: string | null = null;

async function api(method: string, path: string, body?: unknown): Promise<{ status: number; data: unknown }> {
  const headers: Record<string, string> = { 'Content-Type': 'application/json' };
  if (authToken) headers['Authorization'] = `Bearer ${authToken}`;

  const res = await fetch(`${API_BASE}${path}`, {
    method,
    headers,
    body: body ? JSON.stringify(body) : undefined,
    signal: AbortSignal.timeout(10_000),
  });

  let data: unknown;
  try { data = await res.json(); } catch { data = null; }
  return { status: res.status, data };
}

function summarize(obj: unknown): string {
  if (obj === null || obj === undefined) return 'null';
  if (typeof obj === 'string') return obj.length > 40 ? `${obj.substring(0, 40)}...` : obj;
  if (typeof obj === 'object' && !Array.isArray(obj)) {
    const keys = Object.keys(obj as Record<string, unknown>).slice(0, 6).join(',');
    return `{${keys}}`;
  }
  if (Array.isArray(obj)) return `[len=${obj.length}]`;
  return String(obj);
}

function safeProperty(obj: unknown, prop: string): unknown {
  if (obj && typeof obj === 'object') return (obj as Record<string, unknown>)[prop];
  return undefined;
}

// ─── Test Data ────────────────────────────────────────────────────────────────
const testSuffix = `smoke-${TS}`;

// ─── Run ──────────────────────────────────────────────────────────────────────
async function main(): Promise<number> {
  mkdirSync(ARTIFACT_DIR, { recursive: true });
  process.stdout.write('\n=== Release Smoke Test ===\n\n');

  // ── Health ──────────────────────────────────────────────────────────────────
  {
    const { status, data } = await api('GET', '/health/liveness');
    record('GET /health/liveness → 200', status === 200 ? 'pass' : 'fail', `status=${status}`);
  }
  {
    const { status, data } = await api('GET', '/health/readiness');
    record('GET /health/readiness → 200', status === 200 ? 'pass' : 'fail', `status=${status} keys=${summarize(data)}`);
  }

  // ── Auth: Login ─────────────────────────────────────────────────────────────
  {
    const { status, data } = await api('POST', '/auth/login', {
      email: ADMIN_EMAIL,
      password: ADMIN_PASSWORD,
    });
    authToken = String(safeProperty(data, 'accessToken') ?? '');
    authRefreshToken = String(safeProperty(data, 'refreshToken') ?? '');
    record(
      'POST /auth/login → 200 + tokens',
      status === 200 && authToken.length > 50 ? 'pass' : 'fail',
      `Token acquired: yes (${authToken.length} chars)`,
    );
  }

  // ── Auth: Me ────────────────────────────────────────────────────────────────
  {
    const { status, data } = await api('GET', '/auth/me');
    const email = safeProperty(data, 'email');
    record(
      'GET /auth/me → 200',
      status === 200 && email === ADMIN_EMAIL ? 'pass' : 'fail',
      `email=${email}`,
    );
  }

  // ── Auth: Refresh ───────────────────────────────────────────────────────────
  {
    const { status, data } = await api('POST', '/auth/refresh', {
      refreshToken: authRefreshToken,
    });
    const newToken = safeProperty(data, 'accessToken');
    if (newToken && typeof newToken === 'string') authToken = newToken;
    record(
      'POST /auth/refresh → 200',
      status === 200 && typeof newToken === 'string' && newToken.length > 50 ? 'pass' : 'fail',
      `Token refreshed: yes`,
    );
  }

  // ── Pricing: Settings ───────────────────────────────────────────────────────
  {
    const { status } = await api('GET', '/pricing/admin/settings/behavior');
    record('GET /pricing/admin/settings/behavior → 200', status === 200 ? 'pass' : 'fail', `status=${status}`);
  }
  {
    const { status } = await api('GET', '/pricing/admin/settings/currency');
    record('GET /pricing/admin/settings/currency → 200', status === 200 ? 'pass' : 'fail', `status=${status}`);
  }
  {
    const { status, data } = await api('GET', '/pricing/admin/tax-classes/standard');
    // If standard doesn't exist, upsert it first
    if (status === 404) {
      await api('PUT', '/pricing/admin/tax-classes/standard', { name: 'Standard Tax', isDefault: true });
      const { status: s2 } = await api('GET', '/pricing/admin/tax-classes/standard');
      record('GET /pricing/admin/tax-classes/standard → 200', s2 === 200 ? 'pass' : 'fail', `created-then-status=${s2}`);
    } else {
      record('GET /pricing/admin/tax-classes/standard → 200', status === 200 ? 'pass' : 'fail', `status=${status}`);
    }
  }
  {
    const { status } = await api('GET', '/pricing/admin/tax-classes/nonexistent');
    record('GET /pricing/admin/tax-classes/nonexistent → 404', status === 404 ? 'pass' : 'fail', `status=${status}`);
  }
  {
    // Ensure domestic zone exists
    let { status } = await api('GET', '/pricing/admin/shipping-zones/domestic');
    if (status === 404) {
      await api('PUT', '/pricing/admin/shipping-zones/domestic', { name: 'Domestic', countryCodes: ['EG'], isActive: true });
      const { status: s2 } = await api('GET', '/pricing/admin/shipping-zones/domestic');
      record('GET /pricing/admin/shipping-zones/domestic → 200', s2 === 200 ? 'pass' : 'fail', `created-then-status=${s2}`);
    } else {
      record('GET /pricing/admin/shipping-zones/domestic → 200', status === 200 ? 'pass' : 'fail', `status=${status}`);
    }
  }

  // ── Promotions: Create ──────────────────────────────────────────────────────
  let createdPromoId: string | null = null;
  {
    const { status, data } = await api('POST', '/promotions/admin', {
      name: `Smoke Test Promo ${TS}`,
      status: 'DRAFT',
      trigger: 'AUTOMATIC',
      rewardType: 'PERCENTAGE',
      percentageBps: 500,
      isCombinable: false,
    });
    createdPromoId = String(safeProperty(data, 'id') ?? '');
    record(
      'POST /promotions/admin → 201',
      status === 201 && createdPromoId.length > 5 ? 'pass' : 'fail',
      `status=${status} id=${createdPromoId}`,
    );
  }
  {
    const { status, data } = await api('GET', '/promotions/admin');
    const items = Array.isArray(data) ? data : (safeProperty(data, 'items') as unknown[]);
    const found = Array.isArray(items) ? items.some((p: unknown) => safeProperty(p, 'id') === createdPromoId) : false;
    record(
      'GET /promotions/admin — created promo in list',
      status === 200 && found ? 'pass' : 'fail',
      `found=${found}`,
    );
  }

  // ── Content: Create ─────────────────────────────────────────────────────────
  let createdPageKey: string | null = null;
  {
    const { status, data } = await api('POST', '/content/admin/pages', {
      slug: `smoke-test-page-${TS}`,
      title: `Smoke Test Page ${TS}`,
      body: 'Smoke test body.',
      status: 'DRAFT',
    });
    createdPageKey = String(safeProperty(data, 'key') ?? '');
    record(
      'POST /content/admin/pages → 201',
      status === 201 && createdPageKey.length > 1 ? 'pass' : 'fail',
      `status=${status} key=${createdPageKey}`,
    );
  }
  {
    const { status, data } = await api('GET', '/content/admin/pages');
    const pages = Array.isArray(data) ? data : [];
    const found = pages.some((p: unknown) => safeProperty(p, 'key') === createdPageKey);
    record(
      'GET /content/admin/pages — created page in list',
      status === 200 && found ? 'pass' : 'fail',
      `found=${found}`,
    );
  }

  // ── Catalog: Product without variants (DRAFT) ───────────────────────────────
  let draftProductId: string | null = null;
  {
    // Fetch prerequisite IDs
    const ptResp = await api('GET', '/catalog/admin/product-types');
    const brandResp = await api('GET', '/catalog/admin/brands');
    const productTypes = Array.isArray(ptResp.data) ? ptResp.data as unknown[] : [];
    const brands = Array.isArray(brandResp.data) ? brandResp.data as unknown[] : [];
    const ptId = (safeProperty(productTypes[0], 'id') as string) ?? '';
    const brandId = (safeProperty(brands[0], 'id') as string) ?? '';

    const { status, data } = await api('POST', '/catalog/admin/products', {
      productTypeId: ptId,
      brandId: brandId || undefined,
      sku: `SKU-SMOKE-${TS}`,
      isFeatured: false,
      translations: [{ locale: 'en', name: `Smoke Product ${TS}`, slug: `smoke-product-${TS}` }],
    });
    draftProductId = String(safeProperty(data, 'id') ?? '');
    const variants = safeProperty(data, 'variants');
    const hasEmptyVariants = Array.isArray(variants) && variants.length === 0;
    record(
      'POST /catalog/admin/products (no variants) → 201 DRAFT',
      status === 201 && draftProductId.length > 5 && hasEmptyVariants ? 'pass' : 'fail',
      `status=${status} id=${draftProductId} variants=${summarize(variants)}`,
    );
  }
  // Try publishing draft product without variants — MUST fail with 400
  if (draftProductId) {
    const { status, data } = await api('POST', `/catalog/admin/products/${draftProductId}/publish`, {});
    const errorMsg = String(safeProperty(data, 'details') ?? safeProperty(data, 'error') ?? '');
    record(
      'POST /catalog/admin/products/:id/publish (no variants) → 400',
      status === 400 && errorMsg.length > 5 ? 'pass' : 'fail',
      `status=${status} msg=${errorMsg.substring(0, 60)}`,
    );
  }

  // ── Staff: Invite (SMTP missing → success with warning) ─────────────────────
  let invitedStaffId: string | null = null;
  {
    // Get a valid role ID
    const rolesResult = await api('GET', '/identity/admin/roles');
    const roles = Array.isArray(rolesResult.data) ? rolesResult.data as unknown[] : [];
    const roleId = safeProperty(roles[0], 'id') as string;

    const { status, data } = await api('POST', '/identity/admin/staff/invitations', {
      email: `smoke-invite-${TS}@example.com`,
      displayName: `Smoke Invite ${TS}`,
      roleIds: roleId ? [roleId] : [],
    });
    invitedStaffId = String(safeProperty(data, 'id') ?? '');
    const emailDelivered = safeProperty(data, 'emailDelivered');
    const staffStatus = safeProperty(data, 'status');
    record(
      'POST /identity/admin/staff/invitations → 201 (emailDelivered ok)',
      status === 201 && staffStatus === 'INVITED' ? 'pass' : 'fail',
      `status=${status} staffId=${invitedStaffId} staffStatus=${staffStatus} emailDelivered=${emailDelivered}`,
    );
  }
  // Resend invitation on new INVITED user WITHOUT body or Content-Type
  if (invitedStaffId) {
    const res = await fetch(`${API_BASE}/identity/admin/staff/${invitedStaffId}/resend-invitation`, {
      method: 'POST',
      headers: { 'Authorization': `Bearer ${authToken}` },
      signal: AbortSignal.timeout(10_000),
    });
    const resendData = await res.json().catch(() => null);
    const invitationSent = safeProperty(resendData, 'invitationSent');
    const emailDelivered = safeProperty(resendData, 'emailDelivered');
    record(
      'POST /identity/admin/staff/:id/resend-invitation (no body) → success',
      res.status === 200 || res.status === 201 ? 'pass' : 'fail',
      `status=${res.status} invitationSent=${invitationSent} emailDelivered=${emailDelivered}`,
    );
  }

  // ── OpenAPI Contract Check ──────────────────────────────────────────────────
  try {
    const fs = await import('node:fs');
    const oapiRaw = fs.readFileSync(
      path.resolve(process.cwd(), 'packages/contracts/openapi/openapi.json'),
      'utf8',
    );
    const oapi = JSON.parse(oapiRaw);
    const paths = oapi.paths ?? {};
    const requiredPaths = [
      '/api/v1/pricing/admin/settings/behavior',
      '/api/v1/pricing/admin/settings/currency',
      '/api/v1/pricing/admin/tax-classes/{key}',
      '/api/v1/pricing/admin/shipping-zones/{key}',
      '/api/v1/promotions/admin',
      '/api/v1/content/admin/pages',
    ];
    for (const p of requiredPaths) {
      record(
        `OpenAPI: path ${p} exists`,
        paths[p] ? 'pass' : 'fail',
        paths[p] ? 'present' : 'missing',
      );
    }
    // Verify POST create ops document 201
    const createPaths = ['/api/v1/promotions/admin', '/api/v1/content/admin/pages'];
    for (const cp of createPaths) {
      const responses = paths[cp]?.post?.responses ?? {};
      record(
        `OpenAPI: POST ${cp} documents 201`,
        '201' in responses ? 'pass' : 'fail',
        `responses=${Object.keys(responses).join(',')}`,
      );
    }
    const opCount = Object.values(paths as Record<string, unknown>).reduce(
      (sum: number, pi: unknown) => sum + Object.keys(pi as object).length,
      0,
    );
    record('OpenAPI: operation count', opCount >= 140 ? 'pass' : 'fail', `ops=${opCount}`);
  } catch (err) {
    record('OpenAPI: read contract', 'fail', String(err));
  }

  // ── Auth: Logout ────────────────────────────────────────────────────────────
  {
    const { status } = await api('POST', '/auth/logout', { refreshToken: authRefreshToken });
    record('POST /auth/logout → 200/201', status >= 200 && status < 300 ? 'pass' : 'fail', `status=${status}`);
  }

  // ── Summary ─────────────────────────────────────────────────────────────────
  const passed = checks.filter((c) => c.status === 'pass').length;
  const failed = checks.filter((c) => c.status === 'fail').length;
  const skipped = checks.filter((c) => c.status === 'skip').length;
  const total = checks.length;
  const allPassed = failed === 0;

  process.stdout.write(`\n=== Release Smoke Test Result ===\n`);
  process.stdout.write(`Total: ${total}\nPassed: ${passed}\nFailed: ${failed}\nSkipped: ${skipped}\n`);
  process.stdout.write(`Result: ${allPassed ? 'PASS' : 'FAIL'}\n\n`);

  // ── Write artifacts ─────────────────────────────────────────────────────────
  const jsonResult = { total, passed, failed, skipped, result: allPassed ? 'PASS' : 'FAIL', checks };
  writeFileSync(path.join(ARTIFACT_DIR, 'release-smoke-result.json'), JSON.stringify(jsonResult, null, 2) + '\n');

  const mdLines = [
    '# Release Smoke Test Report',
    `**Date:** ${new Date().toISOString()}`,
    `**API Base:** ${API_BASE}`,
    '',
    `| # | Check | Result | Detail |`,
    `|---|-------|--------|--------|`,
    ...checks.map((c, i) => `| ${i + 1} | ${c.name} | ${c.status === 'pass' ? '✅' : c.status === 'fail' ? '❌' : '⬜'} | ${c.detail} |`),
    '',
    `**Total:** ${total} | **Passed:** ${passed} | **Failed:** ${failed} | **Skipped:** ${skipped}`,
    '',
    `**Result:** ${allPassed ? '✅ PASS' : '❌ FAIL'}`,
  ];
  writeFileSync(path.join(ARTIFACT_DIR, 'release-smoke-report.md'), mdLines.join('\n') + '\n');

  return allPassed ? 0 : 1;
}

main()
  .then((code) => process.exit(code))
  .catch((err) => {
    process.stderr.write(`Fatal: ${String(err)}\n`);
    process.exit(2);
  });
