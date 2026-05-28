import { access, constants, mkdir, mkdtemp, rm } from 'node:fs/promises';
import { spawn } from 'node:child_process';
import path from 'node:path';

const generatorImage = 'openapitools/openapi-generator-cli:v7.15.0';

async function main(): Promise<void> {
  const verifyOnly = process.argv.includes('--verify');
  const workspaceRoot = process.cwd();
  const inputPath = path.resolve(workspaceRoot, 'packages/contracts/openapi/openapi.json');
  const configPath = path.resolve(workspaceRoot, 'packages/contracts/openapi/dart-dio-config.yaml');
  const generatedRoot = path.resolve(workspaceRoot, 'packages/contracts/generated');
  await mkdir(generatedRoot, { recursive: true });
  const outputPath = verifyOnly
    ? await mkdtemp(path.join(generatedRoot, '.verify-'))
    : path.resolve(generatedRoot, 'flutter');

  try {
    await access(inputPath, constants.R_OK);
    await access(configPath, constants.R_OK);

    await runGenerator({
      workspaceRoot,
      inputPath,
      configPath,
      outputPath,
    });

    process.stdout.write(
      verifyOnly
        ? `Flutter client generation succeeded in temporary output: ${outputPath}\n`
        : `Flutter client generated at: ${outputPath}\n`,
    );
  } finally {
    if (verifyOnly) {
      // Use maxRetries to avoid EBUSY errors on Windows when cleaning up
      await rm(outputPath, { recursive: true, force: true, maxRetries: 5, retryDelay: 500 });
    }
  }
}

async function runGenerator(options: {
  workspaceRoot: string;
  inputPath: string;
  configPath: string;
  outputPath: string;
}): Promise<void> {
  const { workspaceRoot, inputPath, configPath, outputPath } = options;

  const args = [
    '--yes',
    '@openapitools/openapi-generator-cli',
    'generate',
    '-g',
    'dart-dio',
    '-i',
    inputPath,
    '-c',
    configPath,
    '-o',
    outputPath,
    '--skip-validate-spec',
  ];

  await runCommand('npx', args, workspaceRoot);
}

async function runCommand(command: string, args: string[], cwd: string): Promise<void> {
  await new Promise<void>((resolve, reject) => {
    const child = spawn(command, args, {
      cwd,
      stdio: 'inherit',
      shell: process.platform === 'win32',
      env: { ...process.env, OPENAPI_GENERATOR_VERSION: '7.15.0' },
    });

    child.on('exit', (code) => {
      if (code === 0) {
        resolve();
        return;
      }

      reject(new Error(`Command failed: ${command} ${args.join(' ')} (exit ${code ?? 'unknown'})`));
    });

    child.on('error', (error) => {
      reject(
        new Error(
          `Unable to run OpenAPI generator. Make sure you have Java installed on your machine. Original error: ${error.message}`,
        ),
      );
    });
  });
}

void main();
