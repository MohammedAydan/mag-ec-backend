import { spawn } from 'node:child_process';
import {
  access,
  constants,
  mkdir,
  readFile,
  rm,
  stat,
  writeFile,
} from 'node:fs/promises';
import path from 'node:path';

const EXPECTED_OPENAPI_GENERATOR_VERSION = '7.22.0';

type PackageKind = 'typescript' | 'flutter';
type PackageManager = 'npm' | 'pnpm' | 'yarn' | 'skip';

type CliOptions = {
  selectedPackages: Set<PackageKind>;
  skipDrift: boolean;
  skipInstall: boolean;
  skipBuild: boolean;
  skipPack: boolean;
  packageManager: PackageManager;
  baseUrl: string;
};

type GeneratedPackage = {
  kind: PackageKind;
  label: string;
  generatorScript: string;
  outputPath: string;
  requiredFiles: string[];
  alternateRequiredFileGroups?: string[][];
};

type PackageTestResult = {
  package: PackageKind;
  label: string;
  outputPath: string;
  passed: boolean;
  checks: Array<{ name: string; passed: boolean; details?: string }>;
};

const GENERATED_PACKAGES: GeneratedPackage[] = [
  {
    kind: 'typescript',
    label: 'TypeScript fetch SDK',
    generatorScript: 'packages/contracts/openapi/generate-typescript-client.ts',
    outputPath: 'packages/contracts/generated/typescript',
    requiredFiles: ['package.json', 'src/index.ts', 'src/runtime.ts', 'src/apis/index.ts', 'src/models/index.ts', '.openapi-generator/VERSION', '.openapi-generator/FILES'],
    alternateRequiredFileGroups: [['generation-manifest.json', '.openapi-generation-manifest.json']],
  },
  {
    kind: 'flutter',
    label: 'Flutter Dio SDK',
    generatorScript: 'packages/contracts/openapi/generate-flutter-client.ts',
    outputPath: 'packages/contracts/generated/flutter',
    requiredFiles: ['pubspec.yaml', 'lib/src/api.dart', '.openapi-generator/VERSION', '.openapi-generator/FILES', '.openapi-generation-manifest.json'],
  },
];

async function main(): Promise<void> {
  const options = parseArguments(process.argv.slice(2));
  const workspaceRoot = process.cwd();
  const results: PackageTestResult[] = [];

  for (const pkg of GENERATED_PACKAGES.filter((item) => options.selectedPackages.has(item.kind))) {
    results.push(await testGeneratedPackage(pkg, workspaceRoot, options));
  }

  const reportPath = path.resolve(workspaceRoot, 'packages/contracts/generated/generated-packages-test-report.json');
  await mkdir(path.dirname(reportPath), { recursive: true });
  await writeFile(reportPath, `${JSON.stringify({ generatedAt: new Date().toISOString(), results }, null, 2)}\n`, 'utf8');

  printSummary(results, reportPath);

  if (results.some((result) => !result.passed)) {
    process.exitCode = 1;
  }
}

function parseArguments(args: string[]): CliOptions {
  const selectedPackages = new Set<PackageKind>(['typescript', 'flutter']);
  const options: CliOptions = {
    selectedPackages,
    skipDrift: false,
    skipInstall: false,
    skipBuild: false,
    skipPack: false,
    packageManager: 'npm',
    baseUrl: process.env.API_BASE_URL ?? 'http://localhost:3000/api/v1',
  };

  for (let index = 0; index < args.length; index += 1) {
    const argument = args[index];
    switch (argument) {
      case '--help':
        printHelpAndExit();
        break;
      case '--package=typescript':
        selectedPackages.clear();
        selectedPackages.add('typescript');
        break;
      case '--package=flutter':
        selectedPackages.clear();
        selectedPackages.add('flutter');
        break;
      case '--all':
        selectedPackages.clear();
        selectedPackages.add('typescript');
        selectedPackages.add('flutter');
        break;
      case '--skip-drift':
        options.skipDrift = true;
        break;
      case '--skip-install':
        options.skipInstall = true;
        break;
      case '--skip-build':
        options.skipBuild = true;
        break;
      case '--skip-pack':
        options.skipPack = true;
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
        options.skipInstall = true;
        options.skipBuild = true;
        options.skipPack = true;
        break;
      case '--base-url':
        options.baseUrl = readRequiredValue(args, ++index, '--base-url');
        break;
      default:
        throw new Error(`Unknown option "${argument}". Run with --help.`);
    }
  }

  return options;
}

function readRequiredValue(args: string[], index: number, flag: string): string {
  const value = args[index];
  if (!value || value.startsWith('--')) {
    throw new Error(`${flag} requires a value.`);
  }
  return value;
}

function printHelpAndExit(): never {
  process.stdout.write(
    [
      'Test each generated OpenAPI package independently.',
      '',
      'Usage:',
      '  tsx packages/contracts/openapi/test-generated-packages.ts [options]',
      '',
      'Options:',
      '  --all                       Test all generated packages. Default.',
      '  --package=typescript        Test only packages/contracts/generated/typescript.',
      '  --package=flutter           Test only packages/contracts/generated/flutter.',
      '  --skip-drift                Do not run each generator with --verify.',
      '  --skip-install              Skip dependency install/pub get.',
      '  --skip-build                Skip build/analyze checks.',
      '  --skip-pack                 Skip npm pack --dry-run for TypeScript.',
      '  --package-manager=npm       Use npm for TypeScript package checks. Default.',
      '  --package-manager=pnpm      Use pnpm for TypeScript package checks.',
      '  --package-manager=yarn      Use yarn for TypeScript package checks.',
      '  --package-manager=skip      Only verify generated files and generator metadata.',
      '  --base-url <url>            Base URL embedded in TypeScript smoke compile. Default: API_BASE_URL or localhost.',
      '',
    ].join('\n'),
  );
  process.exit(0);
}

async function testGeneratedPackage(
  pkg: GeneratedPackage,
  workspaceRoot: string,
  options: CliOptions,
): Promise<PackageTestResult> {
  const result: PackageTestResult = {
    package: pkg.kind,
    label: pkg.label,
    outputPath: pkg.outputPath,
    passed: true,
    checks: [],
  };

  process.stdout.write(`\n━━ Testing ${pkg.label} ━━\n`);

  await runCheck(result, 'output directory exists', async () => {
    const absolute = path.resolve(workspaceRoot, pkg.outputPath);
    const info = await stat(absolute);
    if (!info.isDirectory()) throw new Error(`${absolute} is not a directory.`);
  });

  await runCheck(result, 'required generated files exist', async () => {
    for (const requiredFile of pkg.requiredFiles) {
      await assertReadable(path.resolve(workspaceRoot, pkg.outputPath, requiredFile));
    }

    for (const alternateGroup of pkg.alternateRequiredFileGroups ?? []) {
      let found = false;
      for (const alternateFile of alternateGroup) {
        try {
          await access(path.resolve(workspaceRoot, pkg.outputPath, alternateFile), constants.R_OK);
          found = true;
          break;
        } catch {
          // Try the next accepted filename.
        }
      }

      if (!found) {
        throw new Error(
          `Missing required generated file. Expected one of: ${alternateGroup.join(', ')}`,
        );
      }
    }
  });

  await runCheck(result, 'OpenAPI Generator version matches pinned version', async () => {
    const versionPath = path.resolve(workspaceRoot, pkg.outputPath, '.openapi-generator/VERSION');
    const generatedVersion = (await readFile(versionPath, 'utf8')).trim();
    if (generatedVersion !== EXPECTED_OPENAPI_GENERATOR_VERSION) {
      throw new Error(`Expected ${EXPECTED_OPENAPI_GENERATOR_VERSION}, got ${generatedVersion}.`);
    }
  });

  await runCheck(result, 'OpenAPI Generator FILES manifest is not empty', async () => {
    const filesPath = path.resolve(workspaceRoot, pkg.outputPath, '.openapi-generator/FILES');
    const lines = (await readFile(filesPath, 'utf8')).split(/\r?\n/).filter((line) => line.trim().length > 0);
    if (lines.length < 5) throw new Error(`FILES manifest contains only ${lines.length} entries.`);
  });

  if (!options.skipDrift) {
    await runCheck(result, 'regeneration drift check', async () => {
      const verifyArgs = pkg.kind === 'typescript'
        ? [pkg.generatorScript, '--verify', '--package-manager=skip']
        : [pkg.generatorScript, '--verify'];
      await runCommand(tsxCommand(), verifyArgs, workspaceRoot);
    });
  }

  if (pkg.kind === 'typescript') {
    await testTypeScriptPackage(result, path.resolve(workspaceRoot, pkg.outputPath), options);
  } else {
    await testFlutterPackage(result, path.resolve(workspaceRoot, pkg.outputPath), options);
  }

  result.passed = result.checks.every((check) => check.passed);
  return result;
}

async function testTypeScriptPackage(result: PackageTestResult, packagePath: string, options: CliOptions): Promise<void> {
  const manager = options.packageManager;

  await runCheck(result, 'package.json is valid', async () => {
    const packageJson = JSON.parse(await readFile(path.join(packagePath, 'package.json'), 'utf8')) as Record<string, unknown>;
    if (typeof packageJson.name !== 'string' || !packageJson.name) throw new Error('package.json has no name.');
    if (typeof packageJson.version !== 'string' || !packageJson.version) throw new Error('package.json has no version.');
  });

  if (manager !== 'skip' && !options.skipInstall) {
    await runCheck(result, `${manager} install`, async () => {
      await installTypeScriptPackage(packagePath, manager);
    });
  }

  if (!options.skipBuild && manager !== 'skip') {
    await runCheck(result, 'TypeScript build/compile', async () => {
      const packageJson = JSON.parse(await readFile(path.join(packagePath, 'package.json'), 'utf8')) as Record<string, unknown>;
      const scripts = isObject(packageJson.scripts) ? packageJson.scripts : {};
      if (typeof scripts.build === 'string') {
        await runCommand(packageManagerCommand(manager), ['run', 'build'], packagePath);
      } else {
        await execPackageBinary(manager, 'tsc', ['--noEmit'], packagePath);
      }
    });

    await runCheck(result, 'generated SDK root import smoke compile', async () => {
      await writeAndRunTypeScriptSmokeCompile(packagePath, manager, options.baseUrl);
    });
  }

  if (!options.skipPack && manager !== 'skip') {
    await runCheck(result, 'package can be packed', async () => {
      await runCommand(packageManagerCommand(manager), ['pack', '--dry-run'], packagePath);
    });
  }

  await rm(path.join(packagePath, '.sdk-smoke'), { recursive: true, force: true });
}

async function installTypeScriptPackage(packagePath: string, manager: Exclude<PackageManager, 'skip'>): Promise<void> {
  const command = packageManagerCommand(manager);
  if (manager === 'npm') {
    await runCommand(command, ['install', '--ignore-scripts'], packagePath);
  } else if (manager === 'pnpm') {
    await runCommand(
      command,
      ['--ignore-workspace', 'install', '--ignore-scripts', '--no-frozen-lockfile', '--config.confirmModulesPurge=false'],
      packagePath,
    );
  } else {
    await runCommand(command, ['install', '--ignore-scripts'], packagePath);
  }
}

async function writeAndRunTypeScriptSmokeCompile(
  packagePath: string,
  manager: Exclude<PackageManager, 'skip'>,
  baseUrl: string,
): Promise<void> {
  const smokeDir = path.join(packagePath, '.sdk-smoke');
  await mkdir(smokeDir, { recursive: true });

  await writeFile(
    path.join(smokeDir, 'index.ts'),
    [
      "import * as sdk from '../src/index';",
      "import { Configuration } from '../src/runtime';",
      '',
      `const config = new Configuration({ basePath: ${JSON.stringify(baseUrl)} });`,
      'const keys = Object.keys(sdk);',
      "if (keys.length === 0) throw new Error('Generated SDK root exports nothing.');",
      'void config;',
      'void keys;',
      '',
    ].join('\n'),
    'utf8',
  );

  await writeFile(
    path.join(smokeDir, 'tsconfig.json'),
    `${JSON.stringify(
      {
        compilerOptions: {
          target: 'ES2020',
          module: 'CommonJS',
          moduleResolution: 'Node',
          strict: true,
          noEmit: true,
          esModuleInterop: true,
          skipLibCheck: true,
          lib: ['ES2020', 'DOM'],
          types: [],
        },
        include: ['index.ts', '../**/*.ts'],
        exclude: ['../node_modules', '../dist', '../coverage'],
      },
      null,
      2,
    )}\n`,
    'utf8',
  );

  await execPackageBinary(manager, 'tsc', ['-p', path.join(smokeDir, 'tsconfig.json')], packagePath);
}

async function testFlutterPackage(result: PackageTestResult, packagePath: string, options: CliOptions): Promise<void> {
  if (!options.skipInstall) {
    await runCheck(result, 'dart pub get', async () => {
      await runCommand(dartCommand(), ['pub', 'get'], packagePath);
    });
  }

  if (!options.skipBuild) {
    await runCheck(result, 'dart build_runner build', async () => {
      await runCommand(dartCommand(), ['run', 'build_runner', 'build', '--delete-conflicting-outputs'], packagePath);
    });

    await runCheck(result, 'dart format check', async () => {
      await runCommand(dartCommand(), ['format', '--output=none', '--set-exit-if-changed', 'lib'], packagePath);
    });

    await runCheck(result, 'dart analyze', async () => {
      await runCommand(dartCommand(), ['analyze', '--fatal-infos'], packagePath);
    });
  }
}

async function runCheck(result: PackageTestResult, name: string, check: () => Promise<void>): Promise<void> {
  const startedAt = Date.now();
  try {
    await check();
    result.checks.push({ name, passed: true, details: `${Date.now() - startedAt}ms` });
    process.stdout.write(`  ✓ ${name}\n`);
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    result.checks.push({ name, passed: false, details: message });
    result.passed = false;
    process.stderr.write(`  ✗ ${name}: ${message}\n`);
  }
}

function printSummary(results: PackageTestResult[], reportPath: string): void {
  process.stdout.write('\nGenerated package test summary:\n');
  for (const result of results) {
    const passed = result.checks.filter((check) => check.passed).length;
    const total = result.checks.length;
    process.stdout.write(`  ${result.passed ? '✓' : '✗'} ${result.label}: ${passed}/${total} checks passed\n`);
  }
  process.stdout.write(`  report: ${reportPath}\n`);
}

async function assertReadable(filePath: string): Promise<void> {
  try {
    await access(filePath, constants.R_OK);
  } catch {
    throw new Error(`Missing or unreadable file: ${filePath}`);
  }
}

function packageManagerCommand(manager: Exclude<PackageManager, 'skip'>): string {
  if (process.platform !== 'win32') return manager;
  return `${manager}.cmd`;
}

function dartCommand(): string {
  return process.platform === 'win32' ? 'dart.bat' : 'dart';
}

function tsxCommand(): string {
  return process.platform === 'win32' ? 'tsx.cmd' : 'tsx';
}

async function execPackageBinary(
  manager: Exclude<PackageManager, 'skip'>,
  binary: string,
  args: string[],
  cwd: string,
): Promise<void> {
  const command = packageManagerCommand(manager);
  if (manager === 'npm') {
    await runCommand(command, ['exec', '--', binary, ...args], cwd);
  } else if (manager === 'pnpm') {
    await runCommand(command, ['--ignore-workspace', 'exec', binary, ...args], cwd);
  } else {
    await runCommand(command, [binary, ...args], cwd);
  }
}

async function runCommand(command: string, args: string[], cwd: string): Promise<void> {
  process.stdout.write(`    > ${command} ${args.join(' ')}\n`);

  await new Promise<void>((resolve, reject) => {
    const [resolvedCommand, resolvedArgs] = normalizeCommand(command, args);
    const child = spawn(resolvedCommand, resolvedArgs, {
      cwd,
      stdio: 'inherit',
      shell: false,
      env: process.env,
    });

    child.once('exit', (code) => {
      if (code === 0) {
        resolve();
      } else {
        reject(new Error(`Command failed (${code ?? 'unknown'}): ${command} ${args.join(' ')}`));
      }
    });
    child.once('error', reject);
  });
}

function normalizeCommand(command: string, args: string[]): readonly [string, string[]] {
  if (process.platform === 'win32' && command.endsWith('.cmd')) {
    return [process.env.ComSpec ?? 'cmd.exe', ['/d', '/s', '/c', command, ...args]] as const;
  }

  if (process.platform === 'win32') {
    return ['cmd', ['/c', command, ...args]] as const;
  }

  return [command, args] as const;
}

function isObject(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value);
}

void main().catch((error: unknown) => {
  const message = error instanceof Error ? error.message : String(error);
  process.stderr.write(`Generated package tests failed: ${message}\n`);
  process.exitCode = 1;
});
