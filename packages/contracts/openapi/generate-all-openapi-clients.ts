import { spawn } from 'node:child_process';
import { access, constants } from 'node:fs/promises';
import path from 'node:path';

type CliOptions = {
  verify: boolean;
  skipPackageTests: boolean;
  packageManager: 'npm' | 'pnpm' | 'yarn' | 'skip';
  engine: 'npx' | 'docker';
};

type GeneratorDefinition = {
  kind: 'typescript' | 'flutter';
  script: string;
};

const GENERATORS: GeneratorDefinition[] = [
  { kind: 'flutter', script: 'packages/contracts/openapi/generate-flutter-client.ts' },
  { kind: 'typescript', script: 'packages/contracts/openapi/generate-typescript-client.ts' },
];

async function main(): Promise<void> {
  const options = parseArguments(process.argv.slice(2));
  const workspaceRoot = process.cwd();

  for (const generator of GENERATORS) {
    await assertReadable(path.resolve(workspaceRoot, generator.script));
  }

  for (const generator of GENERATORS) {
    const args = [generator.script, `--engine=${options.engine}`];
    if (options.verify) args.push('--verify');

    if (generator.kind === 'typescript') {
      args.push(`--package-manager=${options.packageManager}`);
    } else if (options.packageManager === 'skip') {
      args.push('--skip-dart-quality');
    }

    await runCommand(tsxCommand(), args, workspaceRoot);
  }

  if (!options.skipPackageTests) {
    const testArgs = ['packages/contracts/openapi/test-generated-packages.ts', '--all', `--package-manager=${options.packageManager}`];
    if (options.verify) testArgs.push('--skip-drift');
    await runCommand(tsxCommand(), testArgs, workspaceRoot);
  }
}

function parseArguments(args: string[]): CliOptions {
  const options: CliOptions = {
    verify: false,
    skipPackageTests: false,
    packageManager: 'npm',
    engine: 'npx',
  };

  for (const argument of args) {
    switch (argument) {
      case '--help':
        printHelpAndExit();
        break;
      case '--verify':
        options.verify = true;
        break;
      case '--skip-package-tests':
        options.skipPackageTests = true;
        break;
      case '--package-manager=npm':
        options.packageManager = 'npm';
        break;
      case '--package-manager=pnpm':
        options.packageManager = 'pnpm';
        break;
      case '--package-manager=yarn':
        options.packageManager = 'yarn';
        break;
      case '--package-manager=skip':
        options.packageManager = 'skip';
        break;
      case '--engine=npx':
        options.engine = 'npx';
        break;
      case '--engine=docker':
        options.engine = 'docker';
        break;
      default:
        throw new Error(`Unknown option "${argument}". Run with --help.`);
    }
  }
  return options;
}

function printHelpAndExit(): never {
  process.stdout.write(
    [
      'Generate and test every OpenAPI-generated client package.',
      '',
      'Usage:',
      '  tsx packages/contracts/openapi/generate-all-openapi-clients.ts [options]',
      '',
      'Options:',
      '  --verify                 Regenerate into staging and fail on drift instead of replacing output.',
      '  --skip-package-tests     Only run generators; do not run test-generated-packages.ts.',
      '  --package-manager=npm    Use npm for TypeScript package checks. Default.',
      '  --package-manager=pnpm   Use pnpm for TypeScript package checks.',
      '  --package-manager=yarn   Use yarn for TypeScript package checks.',
      '  --package-manager=skip   Skip TypeScript install/build/pack and Flutter quality checks.',
      '  --engine=npx             Use pinned npx OpenAPI Generator CLI. Default.',
      '  --engine=docker          Use pinned Docker OpenAPI Generator image.',
      '',
    ].join('\n'),
  );
  process.exit(0);
}

async function assertReadable(filePath: string): Promise<void> {
  try {
    await access(filePath, constants.R_OK);
  } catch {
    throw new Error(`Missing required generator script: ${filePath}`);
  }
}

async function runCommand(command: string, args: string[], cwd: string): Promise<void> {
  process.stdout.write(`> ${command} ${args.join(' ')}\n`);
  await new Promise<void>((resolve, reject) => {
    const [resolvedCommand, resolvedArgs] = normalizeCommand(command, args);
    const child = spawn(resolvedCommand, resolvedArgs, { cwd, stdio: 'inherit', shell: false, env: process.env });
    child.once('exit', (code) => {
      if (code === 0) resolve();
      else reject(new Error(`Command failed (${code ?? 'unknown'}): ${command} ${args.join(' ')}`));
    });
    child.once('error', reject);
  });
}

function normalizeCommand(command: string, args: string[]): readonly [string, string[]] {
  if (process.platform === 'win32' && command.endsWith('.cmd')) return [process.env.ComSpec ?? 'cmd.exe', ['/d', '/s', '/c', command, ...args]] as const;
  if (process.platform === 'win32') return ['cmd', ['/c', command, ...args]] as const;
  return [command, args] as const;
}

function tsxCommand(): string {
  return process.platform === 'win32' ? 'tsx.cmd' : 'tsx';
}

void main().catch((error: unknown) => {
  const message = error instanceof Error ? error.message : String(error);
  process.stderr.write(`OpenAPI client generation failed: ${message}\n`);
  process.exitCode = 1;
});
