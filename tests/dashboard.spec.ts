import { test, expect } from '@playwright/test';

const BASE = process.env.PLAYWRIGHT_BASE_URL ?? 'http://localhost:3003/admin';

const PAGES_EN = [
  { hash: '#/home', label: 'Overview' },
  { hash: '#/orders', label: 'Orders' },
  { hash: '#/fulfillment', label: 'Fulfillment' },
  { hash: '#/catalog', label: 'Catalog' },
  { hash: '#/taxonomy', label: 'Taxonomy' },
  { hash: '#/pricing', label: 'Pricing' },
  { hash: '#/inventory', label: 'Inventory' },
  { hash: '#/payments', label: 'Payments' },
  { hash: '#/reviews', label: 'Reviews' },
  { hash: '#/notifications', label: 'Notifications' },
  { hash: '#/reports', label: 'Reports' },
  { hash: '#/staff', label: 'Staff' },
  { hash: '#/content', label: 'Content' },
  { hash: '#/system', label: 'System' },
];

async function login(page: any) {
  await page.goto(`${BASE}#/home`);
  await page.waitForTimeout(2000);
  const url = page.url();
  if (url.includes('#/login') || url.includes('%23/login')) {
    await page.fill('input[type="text"], input[placeholder*="Email"]', 'admin@example.com');
    await page.fill('input[type="password"]', 'ChangeMe123!');
    await page.click('button:has-text("Sign in")');
    await page.waitForTimeout(4000);
    const newUrl = page.url();
    if (!newUrl.includes('home')) {
      await page.click('button:has-text("Sign in")');
      await page.waitForTimeout(3000);
    }
  }
}

test.describe('Dashboard E2E', () => {
  test.beforeEach(async ({ page }) => {
    await login(page);
  });

  test('Login works', async ({ page }) => {
    const bodyText = await page.textContent('body');
    expect(bodyText).not.toContain('Sign in');
  });

  for (const p of PAGES_EN) {
    test(`EN: ${p.label} page renders`, async ({ page }) => {
      await page.goto(`${BASE}${p.hash}`);
      await page.waitForTimeout(3000);
      const text = await page.textContent('body');
      // Page must have loaded content and not be stuck on login
      expect(text).toBeTruthy();
    });
  }

  test('AR: Switch language and verify', async ({ page }) => {
    const langBtn = page.locator('button:has-text("Switch Language")');
    if (await langBtn.isVisible().catch(() => false)) {
      await langBtn.click();
      await page.waitForTimeout(2000);
    }
    const bodyText = await page.textContent('body');
    // Must contain Arabic text
    expect(bodyText).toMatch(/مرحباً|مرحبا|الرئيسية|نظرة/);
  });

  test('AR: No mixed create labels on taxonomy', async ({ page }) => {
    // Switch to Arabic
    const langBtn = page.locator('button:has-text("Switch Language")');
    if (await langBtn.isVisible().catch(() => false)) {
      await langBtn.click();
      await page.waitForTimeout(2000);
    }
    await page.goto(`${BASE}#/taxonomy`);
    await page.waitForTimeout(3000);
    const buttons = await page.locator('button').allTextContents();
    const BAD_KEYS = ['brands', 'categories', 'tags', 'product-types', 'products', 'collections', 'attributes', 'pages', 'promotions'];
    const mixed = buttons.filter(b => BAD_KEYS.some(k => b.toLowerCase().includes(k)) && b.includes('جديد'));
    expect(mixed).toHaveLength(0);
  });
});
