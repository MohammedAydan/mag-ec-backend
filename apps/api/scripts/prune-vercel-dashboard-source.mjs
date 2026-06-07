import { rm } from 'node:fs/promises';
import path from 'node:path';

if (process.env.VERCEL !== '1') {
  console.log('Skipping Vercel dashboard source prune outside Vercel.');
  process.exit(0);
}

const root = process.cwd();
const target = path.resolve(root, 'public/dashboard');
const relativeTarget = path.relative(root, target);

if (relativeTarget.startsWith('..') || path.isAbsolute(relativeTarget)) {
  throw new Error(`Refusing to prune path outside app root: ${target}`);
}

await rm(target, { force: true, recursive: true });
console.log(`Pruned dashboard source package from Vercel build output: ${target}`);
