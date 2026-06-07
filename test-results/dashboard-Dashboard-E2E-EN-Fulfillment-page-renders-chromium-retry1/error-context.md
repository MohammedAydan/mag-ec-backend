# Instructions

- Following Playwright test failed.
- Explain why, be concise, respect Playwright best practices.
- Provide a snippet of code with the fix, if possible.

# Test info

- Name: dashboard.spec.ts >> Dashboard E2E >> EN: Fulfillment page renders
- Location: tests\dashboard.spec.ts:50:9

# Error details

```
Test timeout of 30000ms exceeded while running "beforeEach" hook.
```

```
Error: page.fill: Test timeout of 30000ms exceeded.
Call log:
  - waiting for locator('input[type="text"], input[placeholder*="Email"]')

```

# Page snapshot

```yaml
- generic [ref=e5]:
  - generic [ref=e6]:
    - generic [ref=e7]:
      - paragraph [ref=e8]: Commerce Command Studio
      - heading "Run the store from one calm, accountable workspace." [level=1] [ref=e9]
      - paragraph [ref=e10]: Review demand, publish catalog updates, correct pricing, and keep operational risk visible without leaving the dashboard.
    - generic [ref=e11]:
      - generic [ref=e12]:
        - paragraph [ref=e13]: Order discipline
        - paragraph [ref=e14]: Track payments, shipments, and returns with less context switching.
      - generic [ref=e15]:
        - paragraph [ref=e16]: Catalog confidence
        - paragraph [ref=e17]: Publish structured product changes with explicit validation.
      - generic [ref=e18]:
        - paragraph [ref=e19]: Access control
        - paragraph [ref=e20]: Keep staff permissions and system operations tightly scoped.
      - generic [ref=e21]:
        - paragraph [ref=e22]: Atelier dark
        - paragraph [ref=e23]: A refined dark-only design language built for precision and focus.
  - generic [ref=e24]:
    - generic [ref=e25]:
      - img [ref=e27]
      - generic [ref=e31]:
        - paragraph [ref=e32]: Admin Dashboard
        - heading "Sign in" [level=1] [ref=e33]
    - generic [ref=e34]:
      - generic [ref=e35]:
        - generic [ref=e36]: Email address
        - textbox "Email address" [ref=e37]
      - generic [ref=e38]:
        - generic [ref=e39]: Password
        - generic [ref=e40]:
          - textbox "Password" [ref=e41]
          - button "Show password" [ref=e42] [cursor=pointer]:
            - img [ref=e43]
      - button "Sign in" [ref=e46] [cursor=pointer]
    - generic [ref=e47]: Administrator access only. Uses the existing /api/v1/auth/* backend flow and inherits the Atelier dark design language.
```

# Test source

```ts
  1  | import { test, expect } from '@playwright/test';
  2  | 
  3  | const BASE = process.env.PLAYWRIGHT_BASE_URL ?? 'http://localhost:3003/admin';
  4  | 
  5  | const PAGES_EN = [
  6  |   { hash: '#/home', label: 'Overview' },
  7  |   { hash: '#/orders', label: 'Orders' },
  8  |   { hash: '#/fulfillment', label: 'Fulfillment' },
  9  |   { hash: '#/catalog', label: 'Catalog' },
  10 |   { hash: '#/taxonomy', label: 'Taxonomy' },
  11 |   { hash: '#/pricing', label: 'Pricing' },
  12 |   { hash: '#/inventory', label: 'Inventory' },
  13 |   { hash: '#/payments', label: 'Payments' },
  14 |   { hash: '#/reviews', label: 'Reviews' },
  15 |   { hash: '#/notifications', label: 'Notifications' },
  16 |   { hash: '#/reports', label: 'Reports' },
  17 |   { hash: '#/staff', label: 'Staff' },
  18 |   { hash: '#/content', label: 'Content' },
  19 |   { hash: '#/system', label: 'System' },
  20 | ];
  21 | 
  22 | async function login(page: any) {
  23 |   await page.goto(`${BASE}#/home`);
  24 |   await page.waitForTimeout(2000);
  25 |   const url = page.url();
  26 |   if (url.includes('#/login') || url.includes('%23/login')) {
> 27 |     await page.fill('input[type="text"], input[placeholder*="Email"]', 'admin@example.com');
     |                ^ Error: page.fill: Test timeout of 30000ms exceeded.
  28 |     await page.fill('input[type="password"]', 'ChangeMe123!');
  29 |     await page.click('button:has-text("Sign in")');
  30 |     await page.waitForTimeout(4000);
  31 |     const newUrl = page.url();
  32 |     if (!newUrl.includes('home')) {
  33 |       await page.click('button:has-text("Sign in")');
  34 |       await page.waitForTimeout(3000);
  35 |     }
  36 |   }
  37 | }
  38 | 
  39 | test.describe('Dashboard E2E', () => {
  40 |   test.beforeEach(async ({ page }) => {
  41 |     await login(page);
  42 |   });
  43 | 
  44 |   test('Login works', async ({ page }) => {
  45 |     const bodyText = await page.textContent('body');
  46 |     expect(bodyText).not.toContain('Sign in');
  47 |   });
  48 | 
  49 |   for (const p of PAGES_EN) {
  50 |     test(`EN: ${p.label} page renders`, async ({ page }) => {
  51 |       await page.goto(`${BASE}${p.hash}`);
  52 |       await page.waitForTimeout(3000);
  53 |       const text = await page.textContent('body');
  54 |       // Page must have loaded content and not be stuck on login
  55 |       expect(text).toBeTruthy();
  56 |     });
  57 |   }
  58 | 
  59 |   test('AR: Switch language and verify', async ({ page }) => {
  60 |     const langBtn = page.locator('button:has-text("Switch Language")');
  61 |     if (await langBtn.isVisible().catch(() => false)) {
  62 |       await langBtn.click();
  63 |       await page.waitForTimeout(2000);
  64 |     }
  65 |     const bodyText = await page.textContent('body');
  66 |     // Must contain Arabic text
  67 |     expect(bodyText).toMatch(/مرحباً|مرحبا|الرئيسية|نظرة/);
  68 |   });
  69 | 
  70 |   test('AR: No mixed create labels on taxonomy', async ({ page }) => {
  71 |     // Switch to Arabic
  72 |     const langBtn = page.locator('button:has-text("Switch Language")');
  73 |     if (await langBtn.isVisible().catch(() => false)) {
  74 |       await langBtn.click();
  75 |       await page.waitForTimeout(2000);
  76 |     }
  77 |     await page.goto(`${BASE}#/taxonomy`);
  78 |     await page.waitForTimeout(3000);
  79 |     const buttons = await page.locator('button').allTextContents();
  80 |     const BAD_KEYS = ['brands', 'categories', 'tags', 'product-types', 'products', 'collections', 'attributes', 'pages', 'promotions'];
  81 |     const mixed = buttons.filter(b => BAD_KEYS.some(k => b.toLowerCase().includes(k)) && b.includes('جديد'));
  82 |     expect(mixed).toHaveLength(0);
  83 |   });
  84 | });
  85 | 
```