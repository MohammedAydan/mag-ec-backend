import { createHash } from 'node:crypto';
import { spawn } from 'node:child_process';
import {
  access,
  constants,
  mkdir,
  mkdtemp,
  readFile,
  readdir,
  rename,
  rm,
  writeFile,
} from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';

const GENERATOR_VERSION = '7.22.0';
const CLI_WRAPPER_VERSION = '2.34.0';
const CLI_PACKAGE = `@openapitools/openapi-generator-cli@${CLI_WRAPPER_VERSION}`;
const DOCKER_IMAGE = `openapitools/openapi-generator-cli:v${GENERATOR_VERSION}`;
const GENERATOR_NAME = 'dart-dio';

const HTTP_METHODS = ['get', 'post', 'put', 'patch', 'delete', 'options', 'head', 'trace'] as const;
const DATA_METHODS = new Set(['post', 'put', 'patch']);
const MAX_CONSOLE_FINDINGS = 40;
const TRANSIENT_GENERATED_ENTRIES = new Set(['.dart_tool', '.packages', 'build']);

type JsonObject = Record<string, unknown>;
type Engine = 'npx' | 'docker';

type CliOptions = {
  verify: boolean;
  auditOnly: boolean;
  skipDartQuality: boolean;
  allowIncompleteContract: boolean;
  engine: Engine;
};

type ContractReport = {
  operations: number;
  dataOperations: number;
  requestBodies: number;
  typedSuccessResponses: number;
  pathParameters: number;
  errors: string[];
  warnings: string[];
};

type GeneratorRunner = {
  mapPath: (localPath: string) => string;
  invoke: (args: string[]) => Promise<void>;
  close: () => Promise<void>;
};

async function main(): Promise<void> {
  const options = parseArguments(process.argv.slice(2));
  const workspaceRoot = process.cwd();

  const inputPath = path.resolve(workspaceRoot, 'packages/contracts/openapi/openapi.json');
  const configPath = path.resolve(workspaceRoot, 'packages/contracts/openapi/dart-dio-config.yaml');
  const generatedRoot = path.resolve(workspaceRoot, 'packages/contracts/generated');
  const outputPath = path.resolve(generatedRoot, 'flutter');

  await assertReadable(inputPath);
  await assertReadable(configPath);

  const spec = await readJsonFile(inputPath);
  const report = auditContract(spec);
  await mkdir(generatedRoot, { recursive: true });
  const reportPath = path.join(generatedRoot, 'flutter-contract-audit.json');
  await writeFile(reportPath, `${JSON.stringify(report, null, 2)}\n`, 'utf8');
  printContractReport(report, reportPath);

  if (report.errors.length > 0 && !options.allowIncompleteContract) {
    throw new Error(
      'OpenAPI contract is not SDK-ready. Fix the reported contract errors before generating the Flutter client. ' +
        'Use --allow-incomplete-contract only as a temporary migration escape hatch.',
    );
  }

  if (options.auditOnly) {
    if (report.errors.length > 0) {
      process.exitCode = 1;
    }
    return;
  }

  let stagingPath: string | undefined = await mkdtemp(path.join(generatedRoot, '.flutter-staging-'));
  const runner = await createRunner(options.engine, workspaceRoot);

  try {
    await runner.invoke(['validate', '-i', runner.mapPath(inputPath), '--recommend']);

    await runner.invoke([
      'generate',
      '-g',
      GENERATOR_NAME,
      '-i',
      runner.mapPath(inputPath),
      '-c',
      runner.mapPath(configPath),
      '-o',
      runner.mapPath(stagingPath),
      '--global-property',
      'apiDocs=true,modelDocs=true,apiTests=false,modelTests=false',
    ]);

    await assertExpectedGeneratorVersion(stagingPath);

    if (!options.skipDartQuality) {
      await runDartQualityChecks(stagingPath);
    }

    await removeTransientGeneratedFiles(stagingPath);

    if (options.verify) {
      await assertDirectoriesMatch(outputPath, stagingPath);
      process.stdout.write('Flutter SDK verification passed: generated output is up to date.\n');
      return;
    }

    await replaceDirectory(stagingPath, outputPath);
    stagingPath = undefined;
    process.stdout.write(`Flutter SDK generated successfully at: ${outputPath}\n`);
  } finally {
    await runner.close();
    if (stagingPath) {
      await rm(stagingPath, { recursive: true, force: true, maxRetries: 5, retryDelay: 500 });
    }
  }
}

function parseArguments(args: string[]): CliOptions {
  const supported = new Set([
    '--verify',
    '--audit-only',
    '--skip-dart-quality',
    '--allow-incomplete-contract',
    '--engine=npx',
    '--engine=docker',
    '--help',
  ]);

  for (const argument of args) {
    if (!supported.has(argument)) {
      throw new Error(`Unknown option "${argument}". Run with --help to see the supported options.`);
    }
  }

  if (args.includes('--help')) {
    process.stdout.write(
      [
        'Generate the typed Flutter/Dio SDK from the OpenAPI contract.',
        '',
        'Usage:',
        '  tsx packages/contracts/openapi/generate-flutter-client.ts [options]',
        '',
        'Options:',
        '  --verify                    Generate into a temporary directory and fail on drift.',
        '  --audit-only                Audit the OpenAPI contract without generating code.',
        '  --engine=npx                Use pinned OpenAPI Generator CLI through npx (default).',
        '  --engine=docker             Use the pinned Docker image instead of Java/npx.',
        '  --skip-dart-quality         Skip dart format/build_runner/analyze checks.',
        '  --allow-incomplete-contract Temporarily generate even when the contract audit fails.',
        '',
      ].join('\n'),
    );
    process.exit(0);
  }

  const engine: Engine = args.includes('--engine=docker') ? 'docker' : 'npx';

  return {
    verify: args.includes('--verify'),
    auditOnly: args.includes('--audit-only'),
    skipDartQuality: args.includes('--skip-dart-quality'),
    allowIncompleteContract: args.includes('--allow-incomplete-contract'),
    engine,
  };
}

async function assertReadable(filePath: string): Promise<void> {
  try {
    await access(filePath, constants.R_OK);
  } catch {
    throw new Error(`Required input file is missing or unreadable: ${filePath}`);
  }
}

async function readJsonFile(filePath: string): Promise<JsonObject> {
  let parsed: unknown;

  try {
    parsed = JSON.parse(await readFile(filePath, 'utf8'));
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    throw new Error(`Unable to parse OpenAPI JSON file "${filePath}": ${message}`);
  }

  if (!isObject(parsed)) {
    throw new Error(`OpenAPI input must be a JSON object: ${filePath}`);
  }

  return parsed;
}

function auditContract(spec: JsonObject): ContractReport {
  const report: ContractReport = {
    operations: 0,
    dataOperations: 0,
    requestBodies: 0,
    typedSuccessResponses: 0,
    pathParameters: 0,
    errors: [],
    warnings: [],
  };

  const openapi = typeof spec.openapi === 'string' ? spec.openapi : '';
  if (!openapi.startsWith('3.')) {
    report.errors.push('The client generator requires an OpenAPI 3.x contract in the "openapi" field.');
  }

  const paths = isObject(spec.paths) ? spec.paths : undefined;
  if (!paths || Object.keys(paths).length === 0) {
    report.errors.push('The contract does not define any paths.');
    return report;
  }

  auditOverlappingServerBasePaths(spec, paths, report);

  const operationIds = new Set<string>();

  for (const [route, pathDefinitionValue] of Object.entries(paths)) {
    if (!isObject(pathDefinitionValue)) {
      report.errors.push(`${route}: path definition is not an object.`);
      continue;
    }

    const sharedParameters = readParameterArray(spec, pathDefinitionValue.parameters);

    for (const method of HTTP_METHODS) {
      const operationValue = pathDefinitionValue[method];
      if (!isObject(operationValue)) {
        continue;
      }

      report.operations += 1;
      if (DATA_METHODS.has(method)) {
        report.dataOperations += 1;
      }
      const label = `${method.toUpperCase()} ${route}`;
      const operationId =
        typeof operationValue.operationId === 'string' && operationValue.operationId.trim().length > 0
          ? operationValue.operationId.trim()
          : undefined;

      if (!operationId) {
        report.errors.push(`${label}: operationId is missing; generated SDK method names would be unstable.`);
      } else if (operationIds.has(operationId)) {
        report.errors.push(`${label}: duplicate operationId "${operationId}".`);
      } else {
        operationIds.add(operationId);
      }

      const parameters = [...sharedParameters, ...readParameterArray(spec, operationValue.parameters)];
      auditPathParameters(route, label, parameters, report);
      auditRequestBody(spec, method, label, operationValue, report);
      auditSuccessResponses(spec, label, operationValue, report);
    }
  }

  if (report.operations === 0) {
    report.errors.push('No HTTP operations were found in the OpenAPI paths object.');
  }

  if (report.dataOperations > 0 && report.requestBodies === 0) {
    report.errors.push(
      `The contract defines ${report.dataOperations} POST/PUT/PATCH operation(s), but none has a typed requestBody. ` +
        'A usable typed SDK cannot model authentication, checkout, cart, or admin writes from this contract.',
    );
  }

  return report;
}

function auditOverlappingServerBasePaths(
  spec: JsonObject,
  paths: JsonObject,
  report: ContractReport,
): void {
  if (!Array.isArray(spec.servers)) {
    return;
  }

  const definedRoutes = Object.keys(paths);
  for (const serverValue of spec.servers) {
    if (!isObject(serverValue) || typeof serverValue.url !== 'string' || serverValue.url.includes('{')) {
      continue;
    }

    let serverPath: string;
    try {
      serverPath = new URL(serverValue.url, 'https://openapi.local').pathname.replace(/\/+$/, '');
    } catch {
      continue;
    }

    if (!serverPath || serverPath === '/') {
      continue;
    }

    const duplicated = definedRoutes.filter(
      (route) => route === serverPath || route.startsWith(`${serverPath}/`),
    );

    if (duplicated.length > 0) {
      report.errors.push(
        `The servers URL already contains "${serverPath}" while ${duplicated.length} path(s) also begin with it. ` +
          'Keep the API prefix in either servers[].url or paths, not both, to avoid duplicated client URLs.',
      );
    }
  }
}

function readParameterArray(spec: JsonObject, value: unknown): JsonObject[] {
  if (!Array.isArray(value)) {
    return [];
  }

  return value
    .map((parameter) => resolveLocalRef(spec, parameter))
    .filter((parameter): parameter is JsonObject => isObject(parameter));
}

function auditPathParameters(
  route: string,
  label: string,
  parameters: JsonObject[],
  report: ContractReport,
): void {
  const expected = [...route.matchAll(/\{([^}]+)\}/g)].map((match) => match[1]);

  for (const name of expected) {
    const parameter = parameters.find(
      (item) => item.in === 'path' && item.name === name && item.required === true && isObject(item.schema),
    );

    if (!parameter) {
      report.errors.push(
        `${label}: path placeholder "{${name}}" must have a required "in: path" parameter with a schema.`,
      );
      continue;
    }

    report.pathParameters += 1;
  }
}

function auditRequestBody(
  spec: JsonObject,
  method: string,
  label: string,
  operation: JsonObject,
  report: ContractReport,
): void {
  const requestBody = resolveLocalRef(spec, operation.requestBody);
  const intentionallyEmpty = operation['x-sdk-allow-empty-request-body'] === true;
  const explicitlyRequired = operation['x-sdk-require-request-body'] === true;

  if (!requestBody) {
    if (explicitlyRequired) {
      report.errors.push(
        `${label}: requestBody is required by x-sdk-require-request-body, but no request DTO schema is declared.`,
      );
    } else if (DATA_METHODS.has(method) && !intentionallyEmpty) {
      report.warnings.push(
        `${label}: no typed requestBody is declared. This is valid for command endpoints without input; ` +
          'add a DTO for data-carrying operations or mark an intentionally empty command with ' +
          '"x-sdk-allow-empty-request-body: true".',
      );
    }
    return;
  }

  if (!hasContentSchema(requestBody)) {
    report.errors.push(`${label}: requestBody exists but has no content schema usable by the SDK.`);
    return;
  }

  report.requestBodies += 1;
}

function auditSuccessResponses(
  spec: JsonObject,
  label: string,
  operation: JsonObject,
  report: ContractReport,
): void {
  const responses = isObject(operation.responses) ? operation.responses : undefined;
  if (!responses) {
    report.errors.push(`${label}: responses are missing.`);
    return;
  }

  const successful = Object.entries(responses).filter(([status]) => /^2\d\d$/.test(status) || status === '2XX');
  if (successful.length === 0) {
    report.errors.push(`${label}: no successful 2xx response is declared.`);
    return;
  }

  if (operation['x-sdk-allow-empty-response'] === true) {
    return;
  }

  const bodyBearingResponses = successful.filter(([status]) => status !== '204');
  if (bodyBearingResponses.length === 0) {
    return;
  }

  const hasTypedResponse = bodyBearingResponses.some(([, response]) => {
    const resolved = resolveLocalRef(spec, response);
    return Boolean(resolved && hasContentSchema(resolved));
  });

  if (!hasTypedResponse) {
    report.errors.push(
      `${label}: successful response has no typed content schema. Add a response DTO, use 204 for an empty ` +
        'response, or set "x-sdk-allow-empty-response: true" deliberately.',
    );
    return;
  }

  report.typedSuccessResponses += 1;
}

function hasContentSchema(value: JsonObject): boolean {
  if (!isObject(value.content)) {
    return false;
  }

  return Object.values(value.content).some((mediaType) => isObject(mediaType) && mediaType.schema !== undefined);
}

function resolveLocalRef(spec: JsonObject, value: unknown): JsonObject | undefined {
  if (!isObject(value)) {
    return undefined;
  }

  if (typeof value.$ref !== 'string') {
    return value;
  }

  if (!value.$ref.startsWith('#/')) {
    return value;
  }

  let resolved: unknown = spec;
  for (const encodedPart of value.$ref.slice(2).split('/')) {
    const part = encodedPart.replace(/~1/g, '/').replace(/~0/g, '~');
    if (!isObject(resolved) || !(part in resolved)) {
      return undefined;
    }
    resolved = resolved[part];
  }

  return isObject(resolved) ? resolved : undefined;
}

function printContractReport(report: ContractReport, reportPath: string): void {
  process.stdout.write(
    [
      'OpenAPI Flutter SDK contract audit:',
      `  operations: ${report.operations}`,
      `  POST/PUT/PATCH operations: ${report.dataOperations}`,
      `  typed request bodies: ${report.requestBodies}`,
      `  typed success responses: ${report.typedSuccessResponses}`,
      `  valid path parameters: ${report.pathParameters}`,
      `  errors: ${report.errors.length}`,
      `  warnings: ${report.warnings.length}`,
      `  full report: ${reportPath}`,
    ].join('\n') + '\n',
  );

  printFindings('ERROR', report.errors);
  printFindings('WARNING', report.warnings);
}

function printFindings(kind: 'ERROR' | 'WARNING', findings: string[]): void {
  for (const finding of findings.slice(0, MAX_CONSOLE_FINDINGS)) {
    process.stderr.write(`  ${kind}: ${finding}\n`);
  }

  if (findings.length > MAX_CONSOLE_FINDINGS) {
    process.stderr.write(
      `  ${kind}: ... ${findings.length - MAX_CONSOLE_FINDINGS} additional finding(s) omitted from the console; ` +
        'see the JSON audit report for the complete list.\n',
    );
  }
}

async function createRunner(engine: Engine, workspaceRoot: string): Promise<GeneratorRunner> {
  if (engine === 'docker') {
    const containerRoot = '/workspace';

    const mapPath = (localPath: string): string => {
      const relative = path.relative(workspaceRoot, localPath);
      if (relative.startsWith('..') || path.isAbsolute(relative)) {
        throw new Error(`Docker generator cannot access a path outside the workspace: ${localPath}`);
      }

      return path.posix.join(containerRoot, relative.split(path.sep).join('/'));
    };

    const dockerUserArguments: string[] = [];
    if (process.platform !== 'win32' && typeof process.getuid === 'function' && typeof process.getgid === 'function') {
      dockerUserArguments.push('--user', `${process.getuid()}:${process.getgid()}`);
    }

    return {
      mapPath,
      invoke: async (args: string[]) => {
        await runCommand(
          'docker',
          ['run', '--rm', ...dockerUserArguments, '-v', `${workspaceRoot}:${containerRoot}`, DOCKER_IMAGE, ...args],
          workspaceRoot,
        );
      },
      close: async () => undefined,
    };
  }

  const isolatedCliDirectory = await mkdtemp(path.join(os.tmpdir(), 'openapi-generator-cli-'));
  const npxCommand = process.platform === 'win32' ? 'npx.cmd' : 'npx';

  // The official Node wrapper reads openapitools.json to choose the JAR version.
  // Write an isolated config instead of mutating project/global state or querying for "latest".
  await writeFile(
    path.join(isolatedCliDirectory, 'openapitools.json'),
    `${JSON.stringify(
      {
        '$schema': 'node_modules/@openapitools/openapi-generator-cli/config.schema.json',
        spaces: 2,
        'generator-cli': { version: GENERATOR_VERSION },
      },
      null,
      2,
    )}\n`,
    'utf8',
  );

  return {
    mapPath: (localPath: string) => localPath,
    invoke: async (args: string[]) => {
      await runCommand(
        npxCommand,
        ['--yes', CLI_PACKAGE, ...args],
        isolatedCliDirectory,
        { OPENAPI_GENERATOR_CLI_SEARCH_URL: 'DEFAULT' },
      );
    },
    close: async () => {
      await rm(isolatedCliDirectory, { recursive: true, force: true, maxRetries: 5, retryDelay: 500 });
    },
  };
}

async function assertExpectedGeneratorVersion(outputPath: string): Promise<void> {
  const versionFile = path.join(outputPath, '.openapi-generator', 'VERSION');
  await assertReadable(versionFile);
  const generatedVersion = (await readFile(versionFile, 'utf8')).trim();

  if (generatedVersion !== GENERATOR_VERSION) {
    throw new Error(
      `Expected OpenAPI Generator ${GENERATOR_VERSION}, but the generated package reports ${generatedVersion}.`,
    );
  }
}

async function runDartQualityChecks(outputPath: string): Promise<void> {
  await runCommand('dart', ['pub', 'get'], outputPath);
  await runCommand('dart', ['run', 'build_runner', 'build', '--delete-conflicting-outputs'], outputPath);
  await runCommand('dart', ['format', 'lib'], outputPath);
  await runCommand('dart', ['analyze', '--fatal-infos'], outputPath);
}

async function removeTransientGeneratedFiles(outputPath: string): Promise<void> {
  for (const entry of TRANSIENT_GENERATED_ENTRIES) {
    await rm(path.join(outputPath, entry), { recursive: true, force: true });
  }
}

async function replaceDirectory(sourcePath: string, destinationPath: string): Promise<void> {
  await rm(destinationPath, { recursive: true, force: true, maxRetries: 5, retryDelay: 500 });
  await rename(sourcePath, destinationPath);
}

async function assertDirectoriesMatch(expectedPath: string, actualPath: string): Promise<void> {
  await assertReadable(expectedPath);

  const [expected, actual] = await Promise.all([hashTree(expectedPath), hashTree(actualPath)]);
  const differences: string[] = [];

  for (const [filePath, digest] of expected) {
    if (!actual.has(filePath)) {
      differences.push(`removed after regeneration: ${filePath}`);
    } else if (actual.get(filePath) !== digest) {
      differences.push(`changed after regeneration: ${filePath}`);
    }
  }

  for (const filePath of actual.keys()) {
    if (!expected.has(filePath)) {
      differences.push(`new after regeneration: ${filePath}`);
    }
  }

  if (differences.length > 0) {
    const visibleDifferences = differences.slice(0, 40).map((item) => `  - ${item}`).join('\n');
    const remaining = differences.length > 40 ? `\n  - ...and ${differences.length - 40} more file(s)` : '';
    throw new Error(`Generated Flutter SDK is out of date:\n${visibleDifferences}${remaining}`);
  }
}

async function hashTree(rootPath: string): Promise<Map<string, string>> {
  const output = new Map<string, string>();

  async function visit(directory: string): Promise<void> {
    const entries = await readdir(directory, { withFileTypes: true });
    for (const entry of entries) {
      if (TRANSIENT_GENERATED_ENTRIES.has(entry.name)) {
        continue;
      }

      const absolutePath = path.join(directory, entry.name);
      const relativePath = path.relative(rootPath, absolutePath).split(path.sep).join('/');

      if (entry.isDirectory()) {
        await visit(absolutePath);
        continue;
      }

      const bytes = await readFile(absolutePath);
      output.set(relativePath, createHash('sha256').update(bytes).digest('hex'));
    }
  }

  await visit(rootPath);
  return output;
}

async function runCommand(
  command: string,
  args: string[],
  cwd: string,
  extraEnvironment: Record<string, string> = {},
): Promise<void> {
  process.stdout.write(`> ${command} ${args.join(' ')}\n`);

  await new Promise<void>((resolve, reject) => {
    // On Windows, .cmd wrappers (npx.cmd, dart.cmd) require cmd.exe to execute.
    // We avoid shell:true (which triggers DEP0190 with an args array) by explicitly
    // prepending `cmd /c` on win32 instead.
    const [resolvedCommand, resolvedArgs] =
      process.platform === 'win32'
        ? (['cmd', ['/c', command, ...args]] as const)
        : ([command, args] as const);

    const child = spawn(resolvedCommand, resolvedArgs, {
      cwd,
      stdio: 'inherit',
      shell: false,
      env: { ...process.env, ...extraEnvironment },
    });

    child.once('exit', (code) => {
      if (code === 0) {
        resolve();
        return;
      }

      reject(new Error(`Command failed (${code ?? 'unknown'}): ${command} ${args.join(' ')}`));
    });

    child.once('error', (error) => {
      reject(new Error(`Unable to execute "${command}": ${error.message}`));
    });
  });
}

function isObject(value: unknown): value is JsonObject {
  return typeof value === 'object' && value !== null && !Array.isArray(value);
}

main().catch((error: unknown) => {
  const message = error instanceof Error ? error.message : String(error);
  process.stderr.write(`Flutter SDK generation failed: ${message}\n`);
  process.exitCode = 1;
});
