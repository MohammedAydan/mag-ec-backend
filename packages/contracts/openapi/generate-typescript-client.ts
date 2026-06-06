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
const GENERATOR_NAME = 'typescript-fetch';

const HTTP_METHODS = ['get', 'post', 'put', 'patch', 'delete', 'options', 'head', 'trace'] as const;
const DATA_METHODS = new Set(['post', 'put', 'patch']);
const SUCCESS_WITHOUT_BODY = new Set(['204', '205', '304']);
const MAX_CONSOLE_FINDINGS = 60;
const TRANSIENT_GENERATED_ENTRIES = new Set([
  'node_modules',
  'dist',
  'coverage',
  '.turbo',
  '.cache',
  '.sdk-smoke',
  'pnpm-lock.yaml',
  'tsconfig.tsbuildinfo',
]);

const DEFAULT_INPUT_PATH = 'packages/contracts/openapi/openapi.json';
const DEFAULT_CONFIG_PATH = 'packages/contracts/openapi/typescript-fetch-config.yaml';
const DEFAULT_OUTPUT_PATH = 'packages/contracts/generated/typescript';

type JsonObject = Record<string, unknown>;
type HttpMethod = (typeof HTTP_METHODS)[number];
type Engine = 'npx' | 'docker';
type PackageManager = 'npm' | 'pnpm' | 'yarn' | 'skip';

type CliOptions = {
  verify: boolean;
  auditOnly: boolean;
  skipPackageQuality: boolean;
  skipNpmInstall: boolean;
  allowIncompleteContract: boolean;
  keepStaging: boolean;
  engine: Engine;
  packageManager: PackageManager;
  inputPath: string;
  configPath: string;
  outputPath: string;
};

type ContractReport = {
  generator: string;
  operations: number;
  dataOperations: number;
  requestBodies: number;
  typedSuccessResponses: number;
  pathParameters: number;
  componentSchemas: number;
  localRefs: number;
  unresolvedLocalRefs: number;
  errors: string[];
  warnings: string[];
};

type GeneratorRunner = {
  mapPath: (localPath: string) => string;
  invoke: (args: string[]) => Promise<void>;
  close: () => Promise<void>;
};

type SimpleTypeScriptConfig = {
  npmName?: string;
  npmVersion?: string;
  withSeparateModelsAndApi?: boolean;
  apiPackage?: string;
  modelPackage?: string;
};

async function main(): Promise<void> {
  const options = parseArguments(process.argv.slice(2));
  const workspaceRoot = process.cwd();

  const inputPath = path.resolve(workspaceRoot, options.inputPath);
  const configPath = path.resolve(workspaceRoot, options.configPath);
  const outputPath = path.resolve(workspaceRoot, options.outputPath);
  const generatedRoot = path.dirname(outputPath);

  await assertReadable(inputPath);
  await assertReadable(configPath);

  const spec = await readJsonFile(inputPath);
  const configText = await readFile(configPath, 'utf8');
  const tsConfig = parseTypeScriptGeneratorConfig(configText);

  const report = auditContract(spec);
  await mkdir(generatedRoot, { recursive: true });
  const reportPath = path.join(generatedRoot, 'typescript-contract-audit.json');
  await writeFile(reportPath, `${JSON.stringify(report, null, 2)}\n`, 'utf8');
  printContractReport(report, reportPath);

  if (report.errors.length > 0 && !options.allowIncompleteContract) {
    throw new Error(
      'OpenAPI contract is not TypeScript SDK-ready. Fix the reported contract errors before generation. ' +
        'Use --allow-incomplete-contract only as a temporary migration escape hatch.',
    );
  }

  if (options.auditOnly) {
    if (report.errors.length > 0) {
      process.exitCode = 1;
    }
    return;
  }

  let stagingPath: string | undefined = await mkdtemp(path.join(generatedRoot, '.typescript-staging-'));
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

    await assertRealGeneratedPackage(stagingPath, tsConfig);
    await writeDeterministicGenerationManifest({
      outputPath: stagingPath,
      inputPath,
      configPath,
      finalOutputPath: outputPath,
      spec,
      configText,
      report,
      tsConfig,
      engine: options.engine,
    });

    if (!options.skipPackageQuality) {
      await runTypeScriptPackageQualityChecks(stagingPath, options);
    }

    await removeTransientGeneratedFiles(stagingPath);

    if (options.verify) {
      await assertDirectoriesMatch(outputPath, stagingPath);
      process.stdout.write('TypeScript SDK verification passed: generated output is up to date.\n');
      return;
    }

    await replaceDirectory(stagingPath, outputPath);
    stagingPath = undefined;
    process.stdout.write(`TypeScript SDK generated successfully at: ${outputPath}\n`);
  } finally {
    await runner.close();
    if (stagingPath && !options.keepStaging) {
      await rm(stagingPath, { recursive: true, force: true, maxRetries: 5, retryDelay: 500 });
    } else if (stagingPath && options.keepStaging) {
      process.stdout.write(`Kept staging directory for inspection: ${stagingPath}\n`);
    }
  }
}

function parseArguments(args: string[]): CliOptions {
  const options: CliOptions = {
    verify: false,
    auditOnly: false,
    skipPackageQuality: false,
    skipNpmInstall: false,
    allowIncompleteContract: false,
    keepStaging: false,
    engine: 'npx',
    packageManager: 'npm',
    inputPath: DEFAULT_INPUT_PATH,
    configPath: DEFAULT_CONFIG_PATH,
    outputPath: DEFAULT_OUTPUT_PATH,
  };

  for (let index = 0; index < args.length; index += 1) {
    const argument = args[index];

    switch (argument) {
      case '--help':
        printHelpAndExit();
        break;
      case '--verify':
        options.verify = true;
        break;
      case '--audit-only':
        options.auditOnly = true;
        break;
      case '--skip-typescript-quality':
      case '--skip-ts-quality':
      case '--skip-package-quality':
        options.skipPackageQuality = true;
        break;
      case '--skip-npm-install':
        options.skipNpmInstall = true;
        break;
      case '--allow-incomplete-contract':
        options.allowIncompleteContract = true;
        break;
      case '--keep-staging':
        options.keepStaging = true;
        break;
      case '--engine=npx':
        options.engine = 'npx';
        break;
      case '--engine=docker':
        options.engine = 'docker';
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
        options.skipNpmInstall = true;
        break;
      case '--input':
        options.inputPath = readRequiredValue(args, ++index, '--input');
        break;
      case '--config':
        options.configPath = readRequiredValue(args, ++index, '--config');
        break;
      case '--output':
        options.outputPath = readRequiredValue(args, ++index, '--output');
        break;
      default:
        throw new Error(`Unknown option "${argument}". Run with --help to see supported options.`);
    }
  }

  if (options.auditOnly && options.verify) {
    throw new Error('--audit-only and --verify cannot be used together.');
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
      'Generate the real typed TypeScript/fetch SDK from the OpenAPI contract.',
      '',
      'Usage:',
      '  tsx packages/contracts/openapi/generate-typescript-client.ts [options]',
      '',
      'Options:',
      '  --verify                    Generate into staging and fail if committed output has drift.',
      '  --audit-only                Audit the OpenAPI contract without generating code.',
      '  --input <path>              OpenAPI JSON path. Default: packages/contracts/openapi/openapi.json',
      '  --config <path>             Generator YAML path. Default: packages/contracts/openapi/typescript-fetch-config.yaml',
      '  --output <path>             Generated SDK path. Default: packages/contracts/generated/typescript',
      '  --engine=npx                Use pinned OpenAPI Generator CLI through npx (default).',
      '  --engine=docker             Use the pinned Docker image instead of Java/npx.',
      '  --package-manager=npm       Run package quality checks with npm (default).',
      '  --package-manager=pnpm      Run package quality checks with pnpm.',
      '  --package-manager=yarn      Run package quality checks with yarn.',
      '  --package-manager=skip      Skip install/build/lint/package checks.',
      '  --skip-package-quality      Skip install/build/lint/package checks.',
      '  --skip-npm-install          Run build checks without installing dependencies.',
      '  --allow-incomplete-contract Temporary escape hatch for a contract that still has audit errors.',
      '  --keep-staging              Keep staging output when generation fails for inspection.',
      '',
    ].join('\n'),
  );
  process.exit(0);
}

async function assertReadable(filePath: string): Promise<void> {
  try {
    await access(filePath, constants.R_OK);
  } catch {
    throw new Error(`Required input file is missing or unreadable: ${filePath}`);
  }
}

async function fileExists(filePath: string): Promise<boolean> {
  try {
    await access(filePath, constants.F_OK);
    return true;
  } catch {
    return false;
  }
}

async function readJsonFile(filePath: string): Promise<JsonObject> {
  let parsed: unknown;

  try {
    parsed = JSON.parse(await readFile(filePath, 'utf8'));
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    throw new Error(`Unable to parse JSON file "${filePath}": ${message}`);
  }

  if (!isObject(parsed)) {
    throw new Error(`JSON input must be an object: ${filePath}`);
  }

  return parsed;
}

function parseTypeScriptGeneratorConfig(configText: string): SimpleTypeScriptConfig {
  return {
    npmName: parseYamlScalar(configText, 'npmName'),
    npmVersion: parseYamlScalar(configText, 'npmVersion'),
    withSeparateModelsAndApi: parseYamlBoolean(configText, 'withSeparateModelsAndApi'),
    apiPackage: parseYamlScalar(configText, 'apiPackage'),
    modelPackage: parseYamlScalar(configText, 'modelPackage'),
  };
}

function parseYamlScalar(configText: string, key: string): string | undefined {
  const expression = new RegExp(`^\\s*${escapeRegExp(key)}\\s*:\\s*(.+?)\\s*$`, 'm');
  const match = configText.match(expression);
  if (!match) {
    return undefined;
  }

  return match[1].replace(/^['"]|['"]$/g, '').trim();
}

function parseYamlBoolean(configText: string, key: string): boolean | undefined {
  const value = parseYamlScalar(configText, key)?.toLowerCase();
  if (value === 'true') return true;
  if (value === 'false') return false;
  return undefined;
}

function auditContract(spec: JsonObject): ContractReport {
  const report: ContractReport = {
    generator: GENERATOR_NAME,
    operations: 0,
    dataOperations: 0,
    requestBodies: 0,
    typedSuccessResponses: 0,
    pathParameters: 0,
    componentSchemas: isObject(spec.components) && isObject(spec.components.schemas) ? Object.keys(spec.components.schemas).length : 0,
    localRefs: 0,
    unresolvedLocalRefs: 0,
    errors: [],
    warnings: [],
  };

  const openapi = typeof spec.openapi === 'string' ? spec.openapi : '';
  if (!openapi.startsWith('3.')) {
    report.errors.push('The TypeScript SDK generator requires an OpenAPI 3.x contract in the "openapi" field.');
  }

  const paths = isObject(spec.paths) ? spec.paths : undefined;
  if (!paths || Object.keys(paths).length === 0) {
    report.errors.push('The contract does not define any paths.');
    return report;
  }

  auditOverlappingServerBasePaths(spec, paths, report);
  auditAllLocalReferences(spec, report);

  const operationIds = new Set<string>();
  const tags = new Set<string>();

  for (const [route, pathDefinitionValue] of Object.entries(paths)) {
    if (!route.startsWith('/')) {
      report.errors.push(`${route}: path must start with "/".`);
    }

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
      const operationId = readOperationId(operationValue);

      if (!operationId) {
        report.errors.push(`${label}: operationId is missing; generated SDK method names would be unstable.`);
      } else if (!/^[A-Za-z][A-Za-z0-9_]*$/.test(operationId)) {
        report.errors.push(`${label}: operationId "${operationId}" is not a safe TypeScript method identifier.`);
      } else if (operationIds.has(operationId)) {
        report.errors.push(`${label}: duplicate operationId "${operationId}".`);
      } else {
        operationIds.add(operationId);
      }

      const operationTags = Array.isArray(operationValue.tags)
        ? operationValue.tags.filter((tag): tag is string => typeof tag === 'string' && tag.trim().length > 0)
        : [];
      if (operationTags.length === 0) {
        report.warnings.push(`${label}: tags are missing; generated API class grouping may be poor.`);
      }
      operationTags.forEach((tag) => tags.add(tag));

      const parameters = [...sharedParameters, ...readParameterArray(spec, operationValue.parameters)];
      auditPathParameters(route, label, parameters, report);
      auditRequestBody(spec, method, label, operationValue, report);
      auditSuccessResponses(spec, method, label, operationValue, report);
      auditSecurity(label, operationValue, report);
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

  if (tags.size === 0 && report.operations > 0) {
    report.warnings.push('No operation tags were found; the TypeScript SDK will likely generate one large default API class.');
  }

  return report;
}

function readOperationId(operation: JsonObject): string | undefined {
  return typeof operation.operationId === 'string' && operation.operationId.trim().length > 0
    ? operation.operationId.trim()
    : undefined;
}

function auditOverlappingServerBasePaths(spec: JsonObject, paths: JsonObject, report: ContractReport): void {
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

    const duplicated = definedRoutes.filter((route) => route === serverPath || route.startsWith(`${serverPath}/`));

    if (duplicated.length > 0) {
      report.errors.push(
        `The servers URL already contains "${serverPath}" while ${duplicated.length} path(s) also begin with it. ` +
          'Keep the API prefix in either servers[].url or paths, not both, to avoid duplicated client URLs.',
      );
    }
  }
}

function auditAllLocalReferences(spec: JsonObject, report: ContractReport): void {
  function visit(value: unknown, location: string): void {
    if (Array.isArray(value)) {
      value.forEach((item, index) => visit(item, `${location}/${index}`));
      return;
    }

    if (!isObject(value)) {
      return;
    }

    if (typeof value.$ref === 'string') {
      report.localRefs += 1;
      if (!value.$ref.startsWith('#/')) {
        report.warnings.push(`${location}: external $ref "${value.$ref}" is not resolved by this strict local audit.`);
      } else if (!resolveLocalRef(spec, value)) {
        report.unresolvedLocalRefs += 1;
        report.errors.push(`${location}: unresolved local $ref "${value.$ref}".`);
      }
    }

    for (const [key, child] of Object.entries(value)) {
      visit(child, `${location}/${escapeJsonPointer(key)}`);
    }
  }

  visit(spec, '#');
}

function readParameterArray(spec: JsonObject, value: unknown): JsonObject[] {
  if (!Array.isArray(value)) {
    return [];
  }

  return value
    .map((parameter) => resolveLocalRef(spec, parameter))
    .filter((parameter): parameter is JsonObject => isObject(parameter));
}

function auditPathParameters(route: string, label: string, parameters: JsonObject[], report: ContractReport): void {
  const expected = [...route.matchAll(/\{([^}]+)\}/g)].map((match) => match[1]);
  const declared = parameters.filter((item) => item.in === 'path').map((item) => String(item.name ?? ''));

  for (const name of expected) {
    const parameter = parameters.find(
      (item) => item.in === 'path' && item.name === name && item.required === true && isObject(item.schema),
    );

    if (!parameter) {
      report.errors.push(`${label}: path placeholder "{${name}}" must have a required "in: path" parameter with a schema.`);
      continue;
    }

    report.pathParameters += 1;
  }

  for (const parameterName of declared) {
    if (parameterName && !expected.includes(parameterName)) {
      report.warnings.push(`${label}: declares path parameter "${parameterName}" that is not present in the route.`);
    }
  }
}

function auditRequestBody(
  spec: JsonObject,
  method: HttpMethod,
  label: string,
  operation: JsonObject,
  report: ContractReport,
): void {
  const requestBody = resolveLocalRef(spec, operation.requestBody);
  const intentionallyEmpty = operation['x-sdk-allow-empty-request-body'] === true;
  const explicitlyRequired = operation['x-sdk-require-request-body'] === true;

  if (!requestBody) {
    if (explicitlyRequired) {
      report.errors.push(`${label}: requestBody is required by x-sdk-require-request-body, but no request DTO schema is declared.`);
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

  if (!hasJsonLikeContent(requestBody)) {
    report.warnings.push(`${label}: requestBody has no application/json-compatible media type; generated method may be less ergonomic.`);
  }

  report.requestBodies += 1;
}

function auditSuccessResponses(
  spec: JsonObject,
  method: HttpMethod,
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

  const bodyBearingResponses = successful.filter(([status]) => !SUCCESS_WITHOUT_BODY.has(status));
  if (bodyBearingResponses.length === 0) {
    return;
  }

  const hasTypedResponse = bodyBearingResponses.some(([, response]) => {
    const resolved = resolveLocalRef(spec, response);
    return Boolean(resolved && hasContentSchema(resolved));
  });

  if (!hasTypedResponse) {
    report.errors.push(
      `${label}: successful response has no typed content schema. Add a response DTO, use 204/205 for empty ` +
        'responses, or set "x-sdk-allow-empty-response: true" deliberately.',
    );
    return;
  }

  const hasJsonResponse = bodyBearingResponses.some(([, response]) => {
    const resolved = resolveLocalRef(spec, response);
    return Boolean(resolved && hasJsonLikeContent(resolved));
  });

  if (!hasJsonResponse && method !== 'head') {
    report.warnings.push(`${label}: typed success response has no JSON-compatible media type.`);
  }

  report.typedSuccessResponses += 1;
}

function auditSecurity(label: string, operation: JsonObject, report: ContractReport): void {
  if (operation.security === undefined) {
    report.warnings.push(`${label}: security is inherited or unspecified; ensure public/admin/customer endpoints are intentional.`);
    return;
  }

  if (Array.isArray(operation.security) && operation.security.length === 0 && operation['x-sdk-public'] !== true) {
    report.warnings.push(`${label}: explicitly public security=[] without x-sdk-public=true marker.`);
  }
}

function hasContentSchema(value: JsonObject): boolean {
  if (!isObject(value.content)) {
    return false;
  }

  return Object.values(value.content).some((mediaType) => isObject(mediaType) && mediaType.schema !== undefined);
}

function hasJsonLikeContent(value: JsonObject): boolean {
  if (!isObject(value.content)) {
    return false;
  }

  return Object.keys(value.content).some((mediaType) => {
    const lower = mediaType.toLowerCase();
    return lower === 'application/json' || lower.endsWith('+json') || lower.includes('json');
  });
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
      'OpenAPI TypeScript SDK contract audit:',
      `  generator: ${report.generator}`,
      `  operations: ${report.operations}`,
      `  POST/PUT/PATCH operations: ${report.dataOperations}`,
      `  typed request bodies: ${report.requestBodies}`,
      `  typed success responses: ${report.typedSuccessResponses}`,
      `  valid path parameters: ${report.pathParameters}`,
      `  component schemas: ${report.componentSchemas}`,
      `  local refs: ${report.localRefs}`,
      `  unresolved local refs: ${report.unresolvedLocalRefs}`,
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
      `  ${kind}: ... ${findings.length - MAX_CONSOLE_FINDINGS} additional finding(s) omitted from console; ` +
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
  const isolatedNpmCacheDirectory = path.join(isolatedCliDirectory, '.npm-cache');
  const isolatedNpmUserConfigPath = path.join(isolatedCliDirectory, '.npmrc');

  await mkdir(isolatedNpmCacheDirectory, { recursive: true });
  await writeFile(isolatedNpmUserConfigPath, '', 'utf8');

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
      await runCommand(npxCommand, ['--yes', CLI_PACKAGE, ...args], isolatedCliDirectory, {
        OPENAPI_GENERATOR_CLI_SEARCH_URL: 'DEFAULT',
        NPM_CONFIG_CACHE: isolatedNpmCacheDirectory,
        npm_config_cache: isolatedNpmCacheDirectory,
        NPM_CONFIG_USERCONFIG: isolatedNpmUserConfigPath,
        npm_config_userconfig: isolatedNpmUserConfigPath,
      });
    },
    close: async () => {
      await rm(isolatedCliDirectory, { recursive: true, force: true, maxRetries: 5, retryDelay: 500 });
    },
  };
}

async function assertRealGeneratedPackage(outputPath: string, config: SimpleTypeScriptConfig): Promise<void> {
  await assertExpectedGeneratorVersion(outputPath);

  const filesManifestPath = path.join(outputPath, '.openapi-generator', 'FILES');
  await assertReadable(filesManifestPath);
  const listedFiles = (await readFile(filesManifestPath, 'utf8'))
    .split(/\r?\n/)
    .map((line) => line.trim())
    .filter((line) => line.length > 0 && !line.startsWith('#'));

  if (listedFiles.length < 5) {
    throw new Error(`Generated FILES manifest looks incomplete: ${filesManifestPath}`);
  }

  const requiredFiles = ['package.json'];
  if (config.withSeparateModelsAndApi !== false) {
    requiredFiles.push('src/index.ts', 'src/runtime.ts', `src/${config.apiPackage ?? 'apis'}/index.ts`, `src/${config.modelPackage ?? 'models'}/index.ts`);
  } else {
    requiredFiles.push('runtime.ts', 'index.ts');
  }

  for (const requiredFile of requiredFiles) {
    await assertReadable(path.join(outputPath, requiredFile));
  }

  const packageJson = await readJsonFile(path.join(outputPath, 'package.json'));
  if (config.npmName && packageJson.name !== config.npmName) {
    throw new Error(`Generated package.json name mismatch. Expected ${config.npmName}, got ${String(packageJson.name)}.`);
  }
  if (config.npmVersion && packageJson.version !== config.npmVersion) {
    throw new Error(`Generated package.json version mismatch. Expected ${config.npmVersion}, got ${String(packageJson.version)}.`);
  }
}

async function assertExpectedGeneratorVersion(outputPath: string): Promise<void> {
  const versionFile = path.join(outputPath, '.openapi-generator', 'VERSION');
  await assertReadable(versionFile);
  const generatedVersion = (await readFile(versionFile, 'utf8')).trim();

  if (generatedVersion !== GENERATOR_VERSION) {
    throw new Error(`Expected OpenAPI Generator ${GENERATOR_VERSION}, but generated package reports ${generatedVersion}.`);
  }
}

async function writeDeterministicGenerationManifest(args: {
  outputPath: string;
  inputPath: string;
  configPath: string;
  finalOutputPath: string;
  spec: JsonObject;
  configText: string;
  report: ContractReport;
  tsConfig: SimpleTypeScriptConfig;
  engine: Engine;
}): Promise<void> {
  const manifest = {
    generatedBy: 'openapi-generator-cli',
    generatorName: GENERATOR_NAME,
    generatorVersion: GENERATOR_VERSION,
    cliWrapperVersion: CLI_WRAPPER_VERSION,
    dockerImage: DOCKER_IMAGE,
    engine: args.engine,
    inputPath: normalizeSlash(path.relative(process.cwd(), args.inputPath)),
    configPath: normalizeSlash(path.relative(process.cwd(), args.configPath)),
    outputPath: normalizeSlash(path.relative(process.cwd(), args.finalOutputPath)),
    inputSha256: sha256(JSON.stringify(args.spec)),
    configSha256: sha256(args.configText),
    packageName: args.tsConfig.npmName ?? null,
    packageVersion: args.tsConfig.npmVersion ?? null,
    operationCount: args.report.operations,
    componentSchemaCount: args.report.componentSchemas,
  };

  await writeFile(path.join(args.outputPath, 'generation-manifest.json'), `${JSON.stringify(manifest, null, 2)}\n`, 'utf8');
}

async function runTypeScriptPackageQualityChecks(outputPath: string, options: CliOptions): Promise<void> {
  if (options.packageManager === 'skip') {
    process.stdout.write('Package manager is set to skip; skipping TypeScript package quality checks.\n');
    return;
  }

  const packageJsonPath = path.join(outputPath, 'package.json');
  await assertReadable(packageJsonPath);

  const packageJson = await readJsonFile(packageJsonPath);
  const scripts = isObject(packageJson.scripts) ? packageJson.scripts : {};
  const managerCommand = commandForPackageManager(options.packageManager);

  if (!options.skipNpmInstall) {
    await installGeneratedPackageDependencies(outputPath, options.packageManager, managerCommand);
  }

  if (typeof scripts.build === 'string') {
    await runPackageManagerCommand(managerCommand, options.packageManager, ['run', 'build'], outputPath);
  } else if (await fileExists(path.join(outputPath, 'tsconfig.json'))) {
    await execPackageBinary(managerCommand, options.packageManager, 'tsc', ['--noEmit'], outputPath);
  } else {
    process.stdout.write('No build script or tsconfig.json was generated; running smoke compile only.\n');
  }

  await runGeneratedSdkSmokeCompile(outputPath, managerCommand, options.packageManager);

  if (typeof scripts.lint === 'string') {
    await runPackageManagerCommand(managerCommand, options.packageManager, ['run', 'lint'], outputPath);
  }

  await runPackageManagerCommand(managerCommand, options.packageManager, ['pack', '--dry-run'], outputPath);
}

function commandForPackageManager(packageManager: Exclude<PackageManager, 'skip'>): string {
  if (process.platform !== 'win32') {
    return packageManager;
  }

  if (packageManager === 'yarn') return 'yarn.cmd';
  if (packageManager === 'pnpm') return 'pnpm.cmd';
  return 'npm.cmd';
}

async function installGeneratedPackageDependencies(
  outputPath: string,
  packageManager: Exclude<PackageManager, 'skip'>,
  command: string,
): Promise<void> {
  if (packageManager === 'npm') {
    const hasPackageLock = await fileExists(path.join(outputPath, 'package-lock.json'));
    await runCommand(command, [hasPackageLock ? 'ci' : 'install', '--ignore-scripts'], outputPath);
    return;
  }

  if (packageManager === 'pnpm') {
    await runCommand(
      command,
      ['--ignore-workspace', 'install', '--ignore-scripts', '--no-frozen-lockfile', '--config.confirmModulesPurge=false'],
      outputPath,
    );
    return;
  }

  await runCommand(command, ['install', '--ignore-scripts'], outputPath);
}

async function runPackageManagerCommand(
  command: string,
  packageManager: Exclude<PackageManager, 'skip'>,
  args: string[],
  cwd: string,
): Promise<void> {
  if (packageManager === 'pnpm') {
    await runCommand(command, ['--ignore-workspace', ...args], cwd);
    return;
  }

  await runCommand(command, args, cwd);
}

async function execPackageBinary(
  command: string,
  packageManager: Exclude<PackageManager, 'skip'>,
  binary: string,
  args: string[],
  cwd: string,
): Promise<void> {
  if (packageManager === 'npm') {
    await runCommand(command, ['exec', '--', binary, ...args], cwd);
  } else if (packageManager === 'pnpm') {
    await runCommand(command, ['--ignore-workspace', 'exec', binary, ...args], cwd);
  } else {
    await runCommand(command, [binary, ...args], cwd);
  }
}

async function runGeneratedSdkSmokeCompile(
  outputPath: string,
  command: string,
  packageManager: Exclude<PackageManager, 'skip'>,
): Promise<void> {
  const smokeDir = path.join(outputPath, '.sdk-smoke');
  await mkdir(smokeDir, { recursive: true });

  await writeFile(
    path.join(smokeDir, 'index.ts'),
    [
      "import * as sdk from '../src/index';",
      "import { Configuration } from '../src/runtime';",
      '',
      "const configuration = new Configuration({ basePath: 'http://localhost:3000/api/v1' });",
      'const exportedKeys = Object.keys(sdk);',
      'if (exportedKeys.length === 0) {',
      "  throw new Error('Generated SDK root index exports nothing.');",
      '}',
      'void configuration;',
      'void exportedKeys;',
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

  await execPackageBinary(command, packageManager, 'tsc', ['-p', path.join(smokeDir, 'tsconfig.json')], outputPath);
}

async function removeTransientGeneratedFiles(outputPath: string): Promise<void> {
  for (const entry of TRANSIENT_GENERATED_ENTRIES) {
    await rm(path.join(outputPath, entry), { recursive: true, force: true, maxRetries: 5, retryDelay: 500 });
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
    const visibleDifferences = differences.slice(0, 60).map((item) => `  - ${item}`).join('\n');
    const remaining = differences.length > 60 ? `\n  - ...and ${differences.length - 60} more file(s)` : '';
    throw new Error(`Generated TypeScript SDK is out of date:\n${visibleDifferences}${remaining}`);
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
      const relativePath = normalizeSlash(path.relative(rootPath, absolutePath));

      if (entry.isDirectory()) {
        await visit(absolutePath);
        continue;
      }

      if (!entry.isFile()) {
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
    const [resolvedCommand, resolvedArgs] = normalizeCommand(command, args);

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

function normalizeCommand(command: string, args: string[]): readonly [string, string[]] {
  if (process.platform === 'win32' && command.endsWith('.cmd')) {
    return [process.env.ComSpec ?? 'cmd.exe', ['/d', '/s', '/c', command, ...args]] as const;
  }

  if (process.platform === 'win32') {
    return ['cmd', ['/c', command, ...args]] as const;
  }

  return [command, args] as const;
}

function isObject(value: unknown): value is JsonObject {
  return typeof value === 'object' && value !== null && !Array.isArray(value);
}

function sha256(text: string): string {
  return createHash('sha256').update(text).digest('hex');
}

function normalizeSlash(value: string): string {
  return value.split(path.sep).join('/');
}

function escapeRegExp(value: string): string {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function escapeJsonPointer(value: string): string {
  return value.replace(/~/g, '~0').replace(/\//g, '~1');
}

void main().catch((error: unknown) => {
  const message = error instanceof Error ? error.message : String(error);
  process.stderr.write(`TypeScript SDK generation failed: ${message}\n`);
  process.exitCode = 1;
});
