#!/usr/bin/env node
// Script to batch-add useT imports and hook calls to remaining page files
const fs = require('fs');
const path = require('path');

const pagesDir = path.resolve(__dirname, '../../../apps/api/public/dashboard/src/pages');
const files = fs.readdirSync(pagesDir).filter(f => f.endsWith('.tsx') && f !== 'LoginPage.tsx');

// Already migrated
const migrated = ['HomePage.tsx', 'OrdersPage.tsx', 'OrderDetailPage.tsx', 'CatalogPage.tsx', 'ProductDetailPage.tsx'];
const remaining = files.filter(f => !migrated.includes(f));

for (const file of remaining) {
  const filePath = path.join(pagesDir, file);
  let content = fs.readFileSync(filePath, 'utf8');
  let modified = false;

  // 1. Add useT import after @/lib/auth or @/lib/format import
  if (!content.includes("import { useT } from '@/lib/i18n'")) {
    // Add after the last @/lib/ import
    content = content.replace(
      /(import\s+\{[^}]*\}\s+from\s+'@\/lib\/(?:auth|format|admin-actions)'[;\n])/g,
      (match) => {
        // Only add once
        if (modified) return match;
        modified = true;
        return match + `import { useT } from '@/lib/i18n';\n`;
      }
    );
  }

  // 2. Add const { t } = useT(); after the request destructuring
  if (!content.includes('const { t } = useT()')) {
    content = content.replace(
      /const\s+\{\s*request\s*\}\s*=\s*useAuth\(\);/,
      `const { request } = useAuth();
  const { t } = useT();`
    );
    modified = true;
  }

  if (modified) {
    fs.writeFileSync(filePath, content, 'utf8');
    console.log(`Updated: ${file}`);
  } else {
    console.log(`Skipped: ${file} (already has useT)`);
  }
}

console.log('\nDone. Remaining pages updated with useT imports.');
