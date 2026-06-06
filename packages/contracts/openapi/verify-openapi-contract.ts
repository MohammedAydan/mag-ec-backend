import { readFile } from 'node:fs/promises';
import path from 'node:path';
import { spawn } from 'node:child_process';

type CliOptions = {
  openapiPath: string;
  generateCommand: string[];
};

type OpenApiSpec = Record<string, unknown> & {
  openapi?: string;
  paths?: Record<string, Record<string, unknown>>;
};

async function main(): Promise<void> {
  const options = parseArguments(process.argv.slice(2));
  const workspaceRoot = process.cwd();
  const openapiPath = path.resolve(workspaceRoot, options.openapiPath);
  const before = await readFile(openapiPath, 'utf8');

  const [command, ...args] = options.generateCommand;
  await runCommand(resolveCommand(command), args, workspaceRoot);

  const after = await readFile(openapiPath, 'utf8');
  if (before !== after) {
    throw new Error(
      `OpenAPI contract is not stable against regeneration. Run \`${options.generateCommand.join(' ')}\` and review the resulting contract changes.`,
    );
  }

  const spec = JSON.parse(after) as OpenApiSpec;
  const errors = validateContract(spec);
  if (errors.length > 0) {
    throw new Error(`OpenAPI contract validation failed:\n- ${errors.join('\n- ')}`);
  }

  process.stdout.write('OpenAPI contract is stable and passed structural validation.\n');
}

function parseArguments(args: string[]): CliOptions {
  const options: CliOptions = {
    openapiPath: 'packages/contracts/openapi/openapi.json',
    generateCommand: [packageManagerCommand('pnpm'), '--filter', '@ecommerce/api', 'openapi:generate'],
  };

  for (let index = 0; index < args.length; index += 1) {
    const argument = args[index];
    switch (argument) {
      case '--help':
        printHelpAndExit();
        break;
      case '--openapi':
        options.openapiPath = readRequiredValue(args, ++index, '--openapi');
        break;
      case '--generate-command': {
        const value = readRequiredValue(args, ++index, '--generate-command');
        options.generateCommand = splitCommand(value);
        break;
      }
      default:
        throw new Error(`Unknown option "${argument}". Run with --help.`);
    }
  }
  return options;
}

function printHelpAndExit(): never {
  process.stdout.write(
    [
      'Verify that OpenAPI generation is deterministic and committed.',
      '',
      'Usage:',
      '  tsx packages/contracts/openapi/verify-openapi-contract.ts [options]',
      '',
      'Options:',
      '  --openapi <path>              Default: packages/contracts/openapi/openapi.json',
      '  --generate-command <command>  Default: pnpm --filter @ecommerce/api openapi:generate',
      '',
    ].join('\n'),
  );
  process.exit(0);
}

function readRequiredValue(args: string[], index: number, flag: string): string {
  const value = args[index];
  if (!value || value.startsWith('--')) throw new Error(`${flag} requires a value.`);
  return value;
}

function splitCommand(value: string): string[] {
  const parts = value.match(/(?:[^\s"']+|"[^"]*"|'[^']*')+/g) ?? [];
  return parts.map((part) => part.replace(/^['"]|['"]$/g, ''));
}

function packageManagerCommand(command: 'npm' | 'pnpm' | 'yarn'): string {
  return process.platform === 'win32' ? `${command}.cmd` : command;
}

function resolveCommand(command: string): string {
  if (process.platform === 'win32' && ['npm', 'pnpm', 'yarn', 'tsx', 'dart'].includes(command)) return `${command}.cmd`;
  return command;
}

function validateContract(spec: OpenApiSpec): string[] {
  const errors: string[] = [];

  if (typeof spec.openapi !== 'string' || !spec.openapi.startsWith('3.')) {
    errors.push('Contract must declare an OpenAPI 3.x version.');
    return errors;
  }

  const paths = spec.paths ?? {};
  const normalizedPaths = new Map<string, string>();
  const operationIds = new Map<string, string>();
  const methods = new Set(['get', 'post', 'put', 'patch', 'delete', 'options', 'head', 'trace']);

  validateLocalRefs(spec, errors);

  for (const [routePath, pathItem] of Object.entries(paths)) {
    const normalizedPath = normalizeTemplatedPath(routePath);
    const existingPath = normalizedPaths.get(normalizedPath);
    if (existingPath && existingPath !== routePath) {
      errors.push(
        `Conflicting templated paths "${existingPath}" and "${routePath}" normalize to the same OpenAPI template "${normalizedPath}".`,
      );
    } else {
      normalizedPaths.set(normalizedPath, routePath);
    }

    const pathLevelParameters = readParameters(pathItem.parameters);

    for (const [method, operationValue] of Object.entries(pathItem)) {
      if (!methods.has(method.toLowerCase())) continue;

      const operation = operationValue as Record<string, unknown>;
      const label = `${method.toUpperCase()} ${routePath}`;
      const operationId = typeof operation.operationId === 'string' ? operation.operationId.trim() : '';
      if (!operationId) {
        errors.push(`${label}: missing operationId.`);
      } else if (!/^[A-Za-z][A-Za-z0-9_]*$/.test(operationId)) {
        errors.push(`${label}: operationId "${operationId}" is not SDK-safe.`);
      } else {
        const existingOperation = operationIds.get(operationId);
        if (existingOperation && existingOperation !== label) {
          errors.push(`${label}: duplicate operationId "${operationId}" also used by ${existingOperation}.`);
        } else {
          operationIds.set(operationId, label);
        }
      }

      const parameters = [...pathLevelParameters, ...readParameters(operation.parameters)];
      validatePathParameters(routePath, parameters, label, errors);
      validateIntegerQueryParameters(parameters, label, errors);
      validateSecurityResponses(operation, label, errors);
      validateEmptyRequestBodies(method, operation, label, errors);
    }
  }

  return errors;
}

function normalizeTemplatedPath(routePath: string): string {
  return routePath.replace(/\{[^}]+\}/g, '{}');
}

function validatePathParameters(
  routePath: string,
  parameters: Array<Record<string, unknown>>,
  label: string,
  errors: string[],
): void {
  const placeholders = [...routePath.matchAll(/\{([^}]+)\}/g)].map((match) => match[1]);
  const pathParameters = parameters.filter((parameter) => parameter.in === 'path');
  const parameterNames = new Set(
    pathParameters
      .map((parameter) => (typeof parameter.name === 'string' ? parameter.name : ''))
      .filter(Boolean),
  );

  for (const placeholder of placeholders) {
    const parameter = pathParameters.find((candidate) => candidate.name === placeholder);
    if (!parameter) {
      errors.push(`${label}: missing path parameter declaration for "{${placeholder}}".`);
      continue;
    }

    if (parameter.required !== true) {
      errors.push(`${label}: path parameter "${placeholder}" must be marked required.`);
    }
  }

  for (const parameterName of parameterNames) {
    if (!placeholders.includes(parameterName)) {
      errors.push(`${label}: declares path parameter "${parameterName}" that is not present in the route template.`);
    }
  }
}

function validateIntegerQueryParameters(
  parameters: Array<Record<string, unknown>>,
  label: string,
  errors: string[],
): void {
  const integerNames = new Set(['page', 'pageSize', 'limit', 'quantity']);

  for (const parameter of parameters) {
    if (parameter.in !== 'query') continue;
    if (typeof parameter.name !== 'string' || !integerNames.has(parameter.name)) continue;

    const schema = asRecord(parameter.schema);
    if (schema?.type !== 'integer') {
      errors.push(`${label}: query parameter "${parameter.name}" must use schema.type "integer".`);
    }

    if (parameter.name !== 'quantity') {
      const minimum = typeof schema?.minimum === 'number' ? schema.minimum : undefined;
      if (minimum === undefined || minimum < 1) {
        errors.push(`${label}: query parameter "${parameter.name}" must declare minimum >= 1.`);
      }
    }
  }
}

function validateSecurityResponses(
  operation: Record<string, unknown>,
  label: string,
  errors: string[],
): void {
  const security = Array.isArray(operation.security) ? operation.security : [];
  if (security.length === 0) return;

  const responses = asRecord(operation.responses) ?? {};
  if (!('401' in responses)) {
    errors.push(`${label}: secured operation is missing a documented 401 response.`);
  }
  if (!('403' in responses)) {
    errors.push(`${label}: secured operation is missing a documented 403 response.`);
  }
}

function validateEmptyRequestBodies(
  method: string,
  operation: Record<string, unknown>,
  label: string,
  errors: string[],
): void {
  if (!['post', 'put', 'patch'].includes(method.toLowerCase())) return;

  const hasRequestBody = operation.requestBody !== undefined;
  const allowsEmptyBody = operation['x-sdk-allow-empty-request-body'] === true;
  if (!hasRequestBody && !allowsEmptyBody) {
    errors.push(
      `${label}: data-changing operation has no requestBody and is missing "x-sdk-allow-empty-request-body: true".`,
    );
  }
}

function validateLocalRefs(spec: OpenApiSpec, errors: string[]): void {
  const visit = (value: unknown, trail: string): void => {
    if (Array.isArray(value)) {
      value.forEach((entry, index) => visit(entry, `${trail}[${index}]`));
      return;
    }

    if (typeof value !== 'object' || value === null) {
      return;
    }

    const record = value as Record<string, unknown>;
    const ref = record.$ref;
    if (typeof ref === 'string' && ref.startsWith('#/')) {
      if (!resolveJsonPointer(spec, ref)) {
        errors.push(`${trail}: unresolved local $ref "${ref}".`);
      }
    }

    for (const [key, child] of Object.entries(record)) {
      visit(child, trail ? `${trail}.${key}` : key);
    }
  };

  visit(spec, '');
}

function resolveJsonPointer(root: Record<string, unknown>, pointer: string): unknown {
  const segments = pointer
    .slice(2)
    .split('/')
    .map((segment) => segment.replace(/~1/g, '/').replace(/~0/g, '~'));

  let current: unknown = root;
  for (const segment of segments) {
    if (typeof current !== 'object' || current === null || !(segment in (current as Record<string, unknown>))) {
      return undefined;
    }
    current = (current as Record<string, unknown>)[segment];
  }

  return current;
}

function readParameters(value: unknown): Array<Record<string, unknown>> {
  if (!Array.isArray(value)) return [];
  return value.filter((parameter): parameter is Record<string, unknown> => typeof parameter === 'object' && parameter !== null);
}

function asRecord(value: unknown): Record<string, unknown> | undefined {
  return typeof value === 'object' && value !== null ? (value as Record<string, unknown>) : undefined;
}

async function runCommand(command: string, args: string[], cwd: string): Promise<void> {
  process.stdout.write(`> ${command} ${args.join(' ')}\n`);
  await new Promise<void>((resolve, reject) => {
    const [resolvedCommand, resolvedArgs] = normalizeCommand(command, args);
    const child = spawn(resolvedCommand, resolvedArgs, { cwd, stdio: 'inherit', shell: false });
    child.once('exit', (code) => {
      if (code === 0) resolve();
      else reject(new Error(`Command failed: ${command} ${args.join(' ')} (exit ${code ?? 'unknown'})`));
    });
    child.once('error', reject);
  });
}

function normalizeCommand(command: string, args: string[]): readonly [string, string[]] {
  if (process.platform === 'win32' && command.endsWith('.cmd')) return [process.env.ComSpec ?? 'cmd.exe', ['/d', '/s', '/c', command, ...args]] as const;
  if (process.platform === 'win32') return ['cmd', ['/c', command, ...args]] as const;
  return [command, args] as const;
}

void main().catch((error: unknown) => {
  const message = error instanceof Error ? error.message : String(error);
  process.stderr.write(`OpenAPI contract verification failed: ${message}\n`);
  process.exitCode = 1;
});
