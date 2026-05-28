import { readFile } from 'node:fs/promises';
import path from 'node:path';
import { spawn } from 'node:child_process';

async function main(): Promise<void> {
  const workspaceRoot = process.cwd();
  const openapiPath = path.resolve(workspaceRoot, 'packages/contracts/openapi/openapi.json');
  const before = await readFile(openapiPath, 'utf8');

  await runCommand('pnpm.cmd', ['--filter', '@ecommerce/api', 'openapi:generate'], workspaceRoot);

  const after = await readFile(openapiPath, 'utf8');

  if (before !== after) {
    throw new Error(
      'OpenAPI contract is not stable against regeneration. Run `pnpm.cmd openapi:generate` and review the resulting contract changes.',
    );
  }

  process.stdout.write('OpenAPI contract is stable against regeneration.\n');
}

async function runCommand(command: string, args: string[], cwd: string): Promise<void> {
  await new Promise<void>((resolve, reject) => {
    const normalized = normalizeCommand(command, args);
    const child = spawn(normalized.command, normalized.args, {
      cwd,
      stdio: 'inherit',
    });

    child.on('exit', (code) => {
      if (code === 0) {
        resolve();
        return;
      }

      reject(new Error(`Command failed: ${command} ${args.join(' ')} (exit ${code ?? 'unknown'})`));
    });

    child.on('error', reject);
  });
}

function normalizeCommand(command: string, args: string[]): { command: string; args: string[] } {
  if (process.platform !== 'win32' || !command.endsWith('.cmd')) {
    return { command, args };
  }

  return {
    command: process.env.ComSpec ?? 'cmd.exe',
    args: ['/d', '/s', '/c', command, ...args],
  };
}

void main();
