import { createHash } from 'node:crypto';
import { spawn } from 'node:child_process';
import {
  access,
  constants,
  copyFile,
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
const SUCCESS_WITHOUT_BODY = new Set(['204', '205', '304']);
const MAX_CONSOLE_FINDINGS = 60;
const TRANSIENT_GENERATED_ENTRIES = new Set(['.dart_tool', '.packages', 'build', 'coverage']);

const DEFAULT_INPUT_PATH = 'packages/contracts/openapi/openapi.json';
const DEFAULT_CONFIG_PATH = 'packages/contracts/openapi/dart-dio-config.yaml';
const DEFAULT_OUTPUT_PATH = 'packages/contracts/generated/flutter';

type JsonObject = Record<string, unknown>;
type Engine = 'npx' | 'docker';

type CliOptions = {
  verify: boolean;
  auditOnly: boolean;
  skipDartQuality: boolean;
  allowIncompleteContract: boolean;
  keepStaging: boolean;
  engine: Engine;
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

type SimpleDartConfig = {
  pubName?: string;
  pubVersion?: string;
  pubDescription?: string;
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
  const dartConfig = parseDartGeneratorConfig(configText);

  const report = auditContract(spec);
  await mkdir(generatedRoot, { recursive: true });
  const reportPath = path.join(generatedRoot, 'flutter-contract-audit.json');
  await writeFile(reportPath, `${JSON.stringify(report, null, 2)}\n`, 'utf8');
  printContractReport(report, reportPath);

  if (report.errors.length > 0 && !options.allowIncompleteContract) {
    throw new Error(
      'OpenAPI contract is not Flutter SDK-ready. Fix the reported contract errors before generation. ' +
        'Use --allow-incomplete-contract only as a temporary migration escape hatch.',
    );
  }

  if (options.auditOnly) {
    if (report.errors.length > 0) process.exitCode = 1;
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

    await assertRealGeneratedPackage(stagingPath, dartConfig);
    await stripUnusedBuiltValueJsonObjectImports(stagingPath);
    await writeDeterministicGenerationManifest({
      outputPath: stagingPath,
      inputPath,
      configPath,
      finalOutputPath: outputPath,
      spec,
      configText,
      report,
      dartConfig,
      engine: options.engine,
    });

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
    skipDartQuality: false,
    allowIncompleteContract: false,
    keepStaging: false,
    engine: 'npx',
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
      case '--skip-dart-quality':
      case '--skip-package-quality':
        options.skipDartQuality = true;
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
      case '--package-manager=skip':
        // Accepted for compatibility with shared CI helpers. Dart quality is controlled separately.
        options.skipDartQuality = true;
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
  if (!value || value.startsWith('--')) throw new Error(`${flag} requires a value.`);
  return value;
}

function printHelpAndExit(): never {
  process.stdout.write(
    [
      'Generate the real typed Flutter/Dio SDK from the OpenAPI contract.',
      '',
      'Usage:',
      '  tsx packages/contracts/openapi/generate-flutter-client.ts [options]',
      '',
      'Options:',
      '  --verify                    Generate into staging and fail if committed output has drift.',
      '  --audit-only                Audit the OpenAPI contract without generating code.',
      '  --input <path>              OpenAPI JSON path. Default: packages/contracts/openapi/openapi.json',
      '  --config <path>             Generator YAML path. Default: packages/contracts/openapi/dart-dio-config.yaml',
      '  --output <path>             Generated SDK path. Default: packages/contracts/generated/flutter',
      '  --engine=npx                Use pinned OpenAPI Generator CLI through npx (default).',
      '  --engine=docker             Use the pinned Docker image instead of Java/npx.',
      '  --skip-dart-quality         Skip dart pub get/build_runner/format/analyze checks.',
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

async function readJsonFile(filePath: string): Promise<JsonObject> {
  let parsed: unknown;
  try {
    parsed = JSON.parse(await readFile(filePath, 'utf8'));
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    throw new Error(`Unable to parse JSON file "${filePath}": ${message}`);
  }
  if (!isObject(parsed)) throw new Error(`JSON input must be an object: ${filePath}`);
  return parsed;
}

function parseDartGeneratorConfig(configText: string): SimpleDartConfig {
  return {
    pubName: parseYamlScalar(configText, 'pubName'),
    pubVersion: parseYamlScalar(configText, 'pubVersion'),
    pubDescription: parseYamlScalar(configText, 'pubDescription'),
  };
}

function parseYamlScalar(configText: string, key: string): string | undefined {
  const expression = new RegExp(`^\\s*${escapeRegExp(key)}\\s*:\\s*(.+?)\\s*$`, 'm');
  const match = configText.match(expression);
  if (!match) return undefined;
  return match[1].replace(/^['"]|['"]$/g, '').trim();
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
    report.errors.push('The Flutter SDK generator requires an OpenAPI 3.x contract in the "openapi" field.');
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
    if (!route.startsWith('/')) report.errors.push(`${route}: path must start with "/".`);
    if (!isObject(pathDefinitionValue)) {
      report.errors.push(`${route}: path definition is not an object.`);
      continue;
    }

    const sharedParameters = readParameterArray(spec, pathDefinitionValue.parameters);

    for (const method of HTTP_METHODS) {
      const operationValue = pathDefinitionValue[method];
      if (!isObject(operationValue)) continue;

      report.operations += 1;
      if (DATA_METHODS.has(method)) report.dataOperations += 1;

      const label = `${method.toUpperCase()} ${route}`;
      const operationId = readOperationId(operationValue);

      if (!operationId) {
        report.errors.push(`${label}: operationId is missing; generated SDK method names would be unstable.`);
      } else if (!/^[A-Za-z][A-Za-z0-9_]*$/.test(operationId)) {
        report.errors.push(`${label}: operationId "${operationId}" is not a safe Dart/TypeScript method identifier.`);
      } else if (operationIds.has(operationId)) {
        report.errors.push(`${label}: duplicate operationId "${operationId}".`);
      } else {
        operationIds.add(operationId);
      }

      const operationTags = Array.isArray(operationValue.tags)
        ? operationValue.tags.filter((tag): tag is string => typeof tag === 'string' && tag.trim().length > 0)
        : [];
      if (operationTags.length === 0) report.warnings.push(`${label}: tags are missing; generated API class grouping may be poor.`);
      operationTags.forEach((tag) => tags.add(tag));

      const parameters = [...sharedParameters, ...readParameterArray(spec, operationValue.parameters)];
      auditPathParameters(route, label, parameters, report);
      auditRequestBody(spec, method, label, operationValue, report);
      auditSuccessResponses(spec, method, label, operationValue, report);
      auditSecurity(label, operationValue, report);
    }
  }

  if (report.operations === 0) report.errors.push('No HTTP operations were found in the OpenAPI paths object.');
  if (report.dataOperations > 0 && report.requestBodies === 0) {
    report.errors.push(
      `The contract defines ${report.dataOperations} POST/PUT/PATCH operation(s), but none has a typed requestBody. ` +
        'A usable typed SDK cannot model authentication, checkout, cart, or admin writes from this contract.',
    );
  }
  if (tags.size === 0 && report.operations > 0) {
    report.warnings.push('No operation tags were found; the Flutter SDK will likely generate one large default API class.');
  }
  return report;
}

function readOperationId(operation: JsonObject): string | undefined {
  return typeof operation.operationId === 'string' && operation.operationId.trim().length > 0
    ? operation.operationId.trim()
    : undefined;
}

function auditOverlappingServerBasePaths(spec: JsonObject, paths: JsonObject, report: ContractReport): void {
  if (!Array.isArray(spec.servers)) return;
  const definedRoutes = Object.keys(paths);
  for (const serverValue of spec.servers) {
    if (!isObject(serverValue) || typeof serverValue.url !== 'string' || serverValue.url.includes('{')) continue;
    let serverPath: string;
    try {
      serverPath = new URL(serverValue.url, 'https://openapi.local').pathname.replace(/\/+$/, '');
    } catch {
      continue;
    }
    if (!serverPath || serverPath === '/') continue;
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
    if (!isObject(value)) return;
    if (typeof value.$ref === 'string') {
      report.localRefs += 1;
      if (!value.$ref.startsWith('#/')) {
        report.warnings.push(`${location}: external $ref "${value.$ref}" is not resolved by this strict local audit.`);
      } else if (!resolveLocalRef(spec, value)) {
        report.unresolvedLocalRefs += 1;
        report.errors.push(`${location}: unresolved local $ref "${value.$ref}".`);
      }
    }
    for (const [key, child] of Object.entries(value)) visit(child, `${location}/${escapeJsonPointerPart(key)}`);
  }
  visit(spec, '#');
}

function readParameterArray(spec: JsonObject, value: unknown): JsonObject[] {
  if (!Array.isArray(value)) return [];
  return value.map((parameter) => resolveLocalRef(spec, parameter)).filter((parameter): parameter is JsonObject => isObject(parameter));
}

function auditPathParameters(route: string, label: string, parameters: JsonObject[], report: ContractReport): void {
  const expected = [...route.matchAll(/\{([^}]+)\}/g)].map((match) => match[1]);
  const declared = parameters.filter((item) => item.in === 'path').map((item) => String(item.name ?? ''));
  for (const name of expected) {
    const parameter = parameters.find((item) => item.in === 'path' && item.name === name && item.required === true && isObject(item.schema));
    if (!parameter) {
      report.errors.push(`${label}: path placeholder "{${name}}" must have a required "in: path" parameter with a schema.`);
      continue;
    }
    report.pathParameters += 1;
  }
  for (const name of declared) {
    if (name && !expected.includes(name)) report.errors.push(`${label}: declares path parameter "${name}" but the route has no matching placeholder.`);
  }
}

function auditRequestBody(spec: JsonObject, method: string, label: string, operation: JsonObject, report: ContractReport): void {
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
  report.requestBodies += 1;
}

function auditSuccessResponses(spec: JsonObject, method: string, label: string, operation: JsonObject, report: ContractReport): void {
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
  if (operation['x-sdk-allow-empty-response'] === true) return;
  const bodyBearingResponses = successful.filter(([status]) => !SUCCESS_WITHOUT_BODY.has(status));
  if (bodyBearingResponses.length === 0) return;
  const hasTypedResponse = bodyBearingResponses.some(([, response]) => {
    const resolved = resolveLocalRef(spec, response);
    return Boolean(resolved && hasContentSchema(resolved));
  });
  if (!hasTypedResponse) {
    report.errors.push(
      `${label}: successful response has no typed content schema. Add a response DTO, use 204/205 for an empty ` +
        'response, or set "x-sdk-allow-empty-response: true" deliberately.',
    );
    return;
  }
  report.typedSuccessResponses += 1;
  if (method === 'delete' && bodyBearingResponses.length > 0) {
    report.warnings.push(`${label}: DELETE declares a body-bearing success response; confirm this is intentional for generated clients.`);
  }
}

function auditSecurity(label: string, operation: JsonObject, report: ContractReport): void {
  if (operation.security === undefined) {
    report.warnings.push(`${label}: security is inherited or unspecified; make sure the generated SDK auth behavior is intentional.`);
  }
}

function hasContentSchema(value: JsonObject): boolean {
  if (!isObject(value.content)) return false;
  return Object.values(value.content).some((mediaType) => isObject(mediaType) && mediaType.schema !== undefined);
}

function resolveLocalRef(spec: JsonObject, value: unknown): JsonObject | undefined {
  if (!isObject(value)) return undefined;
  if (typeof value.$ref !== 'string') return value;
  if (!value.$ref.startsWith('#/')) return value;
  let resolved: unknown = spec;
  for (const encodedPart of value.$ref.slice(2).split('/')) {
    const part = encodedPart.replace(/~1/g, '/').replace(/~0/g, '~');
    if (!isObject(resolved) || !(part in resolved)) return undefined;
    resolved = resolved[part];
  }
  return isObject(resolved) ? resolved : undefined;
}

function printContractReport(report: ContractReport, reportPath: string): void {
  process.stdout.write(
    [
      'OpenAPI Flutter SDK contract audit:',
      `  generator: ${report.generator}`,
      `  operations: ${report.operations}`,
      `  POST/PUT/PATCH operations: ${report.dataOperations}`,
      `  component schemas: ${report.componentSchemas}`,
      `  typed request bodies: ${report.requestBodies}`,
      `  typed success responses: ${report.typedSuccessResponses}`,
      `  valid path parameters: ${report.pathParameters}`,
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
  for (const finding of findings.slice(0, MAX_CONSOLE_FINDINGS)) process.stderr.write(`  ${kind}: ${finding}\n`);
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
      if (relative.startsWith('..') || path.isAbsolute(relative)) throw new Error(`Docker generator cannot access a path outside the workspace: ${localPath}`);
      return path.posix.join(containerRoot, relative.split(path.sep).join('/'));
    };
    const dockerUserArguments: string[] = [];
    if (process.platform !== 'win32' && typeof process.getuid === 'function' && typeof process.getgid === 'function') {
      dockerUserArguments.push('--user', `${process.getuid()}:${process.getgid()}`);
    }
    return {
      mapPath,
      invoke: async (args: string[]) => {
        await runCommand('docker', ['run', '--rm', ...dockerUserArguments, '-v', `${workspaceRoot}:${containerRoot}`, DOCKER_IMAGE, ...args], workspaceRoot);
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

async function assertRealGeneratedPackage(outputPath: string, dartConfig: SimpleDartConfig): Promise<void> {
  await assertExpectedGeneratorVersion(outputPath);
  await assertReadable(path.join(outputPath, '.openapi-generator', 'FILES'));
  await assertReadable(path.join(outputPath, 'pubspec.yaml'));
  await assertReadable(path.join(outputPath, 'lib', 'src', 'api.dart'));

  const filesManifest = await readFile(path.join(outputPath, '.openapi-generator', 'FILES'), 'utf8');
  const manifestLines = filesManifest.split(/\r?\n/).filter((line) => line.trim().length > 0);
  if (manifestLines.length < 5) throw new Error(`Generated Flutter package FILES manifest is unexpectedly small (${manifestLines.length} files).`);

  const pubspecText = await readFile(path.join(outputPath, 'pubspec.yaml'), 'utf8');
  if (dartConfig.pubName && !new RegExp(`^name:\\s*${escapeRegExp(dartConfig.pubName)}\\s*$`, 'm').test(pubspecText)) {
    throw new Error(`Generated pubspec.yaml does not contain expected name "${dartConfig.pubName}".`);
  }
  if (dartConfig.pubVersion && !new RegExp(`^version:\\s*${escapeRegExp(dartConfig.pubVersion)}\\s*$`, 'm').test(pubspecText)) {
    throw new Error(`Generated pubspec.yaml does not contain expected version "${dartConfig.pubVersion}".`);
  }
}

async function assertExpectedGeneratorVersion(outputPath: string): Promise<void> {
  const versionFile = path.join(outputPath, '.openapi-generator', 'VERSION');
  await assertReadable(versionFile);
  const generatedVersion = (await readFile(versionFile, 'utf8')).trim();
  if (generatedVersion !== GENERATOR_VERSION) {
    throw new Error(`Expected OpenAPI Generator ${GENERATOR_VERSION}, but the generated package reports ${generatedVersion}.`);
  }
}

async function writeDeterministicGenerationManifest(input: {
  outputPath: string;
  inputPath: string;
  configPath: string;
  finalOutputPath: string;
  spec: JsonObject;
  configText: string;
  report: ContractReport;
  dartConfig: SimpleDartConfig;
  engine: Engine;
}): Promise<void> {
  const specDigest = createHash('sha256').update(JSON.stringify(input.spec)).digest('hex');
  const configDigest = createHash('sha256').update(input.configText).digest('hex');
  const manifest = {
    generator: GENERATOR_NAME,
    generatorVersion: GENERATOR_VERSION,
    cliWrapperVersion: CLI_WRAPPER_VERSION,
    engine: input.engine,
    inputPath: path.relative(process.cwd(), input.inputPath).split(path.sep).join('/'),
    configPath: path.relative(process.cwd(), input.configPath).split(path.sep).join('/'),
    outputPath: path.relative(process.cwd(), input.finalOutputPath).split(path.sep).join('/'),
    specSha256: specDigest,
    configSha256: configDigest,
    pubName: input.dartConfig.pubName,
    pubVersion: input.dartConfig.pubVersion,
    audit: {
      operations: input.report.operations,
      requestBodies: input.report.requestBodies,
      typedSuccessResponses: input.report.typedSuccessResponses,
      errors: input.report.errors.length,
      warnings: input.report.warnings.length,
    },
  };
  await writeFile(path.join(input.outputPath, '.openapi-generation-manifest.json'), `${JSON.stringify(manifest, null, 2)}\n`, 'utf8');
}

async function runDartQualityChecks(outputPath: string): Promise<void> {
  await runCommand(dartCommand(), ['pub', 'get'], outputPath);
  await runCommand(dartCommand(), ['run', 'build_runner', 'build', '--delete-conflicting-outputs'], outputPath);
  await runCommand(dartCommand(), ['format', 'lib'], outputPath);
  await runCommand(dartCommand(), ['analyze', '--fatal-infos'], outputPath);
}

async function stripUnusedBuiltValueJsonObjectImports(outputPath: string): Promise<void> {
  const apiDirectory = path.join(outputPath, 'lib', 'src', 'api');

  try {
    await access(apiDirectory, constants.R_OK);
  } catch {
    return;
  }

  const entries = await readdir(apiDirectory, { withFileTypes: true });
  const unusedImportLine = "import 'package:built_value/json_object.dart';\n";
  const unusedImportLineWindows = "import 'package:built_value/json_object.dart';\r\n";

  for (const entry of entries) {
    if (!entry.isFile() || !entry.name.endsWith('.dart')) {
      continue;
    }

    const filePath = path.join(apiDirectory, entry.name);
    const source = await readFile(filePath, 'utf8');
    let nextSource = source.replace(unusedImportLineWindows, '').replace(unusedImportLine, '');

    if (nextSource !== source) {
      nextSource = nextSource.replace(/\n{3,}/g, '\n\n');
      await writeFile(filePath, nextSource, 'utf8');
    }
  }
}

async function removeTransientGeneratedFiles(outputPath: string): Promise<void> {
  for (const entry of TRANSIENT_GENERATED_ENTRIES) await rm(path.join(outputPath, entry), { recursive: true, force: true, maxRetries: 5, retryDelay: 500 });
}

async function replaceDirectory(sourcePath: string, destinationPath: string): Promise<void> {
  await rm(destinationPath, { recursive: true, force: true, maxRetries: 5, retryDelay: 500 });
  try {
    await rename(sourcePath, destinationPath);
  } catch (error) {
    if (!isRetryableWindowsRenameError(error)) {
      throw error;
    }

    await copyDirectory(sourcePath, destinationPath);
    await rm(sourcePath, { recursive: true, force: true, maxRetries: 5, retryDelay: 500 });
  }
}

async function assertDirectoriesMatch(expectedPath: string, actualPath: string): Promise<void> {
  await assertReadable(expectedPath);
  const [expected, actual] = await Promise.all([hashTree(expectedPath), hashTree(actualPath)]);
  const differences: string[] = [];
  for (const [filePath, digest] of expected) {
    if (!actual.has(filePath)) differences.push(`removed after regeneration: ${filePath}`);
    else if (actual.get(filePath) !== digest) differences.push(`changed after regeneration: ${filePath}`);
  }
  for (const filePath of actual.keys()) {
    if (!expected.has(filePath)) differences.push(`new after regeneration: ${filePath}`);
  }
  if (differences.length > 0) {
    const visibleDifferences = differences.slice(0, 60).map((item) => `  - ${item}`).join('\n');
    const remaining = differences.length > 60 ? `\n  - ...and ${differences.length - 60} more file(s)` : '';
    throw new Error(`Generated Flutter SDK is out of date:\n${visibleDifferences}${remaining}`);
  }
}

async function hashTree(rootPath: string): Promise<Map<string, string>> {
  const output = new Map<string, string>();
  async function visit(directory: string): Promise<void> {
    const entries = await readdir(directory, { withFileTypes: true });
    for (const entry of entries) {
      if (TRANSIENT_GENERATED_ENTRIES.has(entry.name)) continue;
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

async function copyDirectory(sourcePath: string, destinationPath: string): Promise<void> {
  await mkdir(destinationPath, { recursive: true });
  const entries = await readdir(sourcePath, { withFileTypes: true });

  for (const entry of entries) {
    const sourceEntryPath = path.join(sourcePath, entry.name);
    const destinationEntryPath = path.join(destinationPath, entry.name);

    if (entry.isDirectory()) {
      await copyDirectory(sourceEntryPath, destinationEntryPath);
      continue;
    }

    if (entry.isFile()) {
      await copyFile(sourceEntryPath, destinationEntryPath);
    }
  }
}

function isRetryableWindowsRenameError(error: unknown): boolean {
  if (!(error instanceof Error) || process.platform !== 'win32') {
    return false;
  }

  const code = 'code' in error ? String((error as NodeJS.ErrnoException).code ?? '') : '';
  return code === 'EBUSY' || code === 'EPERM';
}

async function runCommand(command: string, args: string[], cwd: string, extraEnvironment: Record<string, string> = {}): Promise<void> {
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
      if (code === 0) resolve();
      else reject(new Error(`Command failed (${code ?? 'unknown'}): ${command} ${args.join(' ')}`));
    });
    child.once('error', (error) => reject(new Error(`Unable to execute "${command}": ${error.message}`)));
  });
}

function normalizeCommand(command: string, args: string[]): readonly [string, string[]] {
  if (process.platform === 'win32' && command.endsWith('.cmd')) return [process.env.ComSpec ?? 'cmd.exe', ['/d', '/s', '/c', command, ...args]] as const;
  if (process.platform === 'win32') return ['cmd', ['/c', command, ...args]] as const;
  return [command, args] as const;
}

function dartCommand(): string {
  return process.platform === 'win32' ? 'dart.bat' : 'dart';
}

function escapeRegExp(value: string): string {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function escapeJsonPointerPart(value: string): string {
  return value.replace(/~/g, '~0').replace(/\//g, '~1');
}

function isObject(value: unknown): value is JsonObject {
  return typeof value === 'object' && value !== null && !Array.isArray(value);
}

main().catch((error: unknown) => {
  const message = error instanceof Error ? error.message : String(error);
  process.stderr.write(`Flutter SDK generation failed: ${message}\n`);
  process.exitCode = 1;
});
