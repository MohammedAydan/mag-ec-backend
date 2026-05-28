import { cp, mkdir } from 'node:fs/promises';
import { resolve } from 'node:path';

const source = resolve('public/admin');
const destination = resolve('../../dist/apps/api/public/admin');

await mkdir(destination, { recursive: true });
await cp(source, destination, { recursive: true, force: true });
console.log(`Dashboard assets copied to ${destination}`);
