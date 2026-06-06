import { access, constants, mkdir, writeFile } from 'node:fs/promises';
import path from 'node:path';

import type { INestApplication } from '@nestjs/common';
import { SwaggerModule, type OpenAPIObject } from '@nestjs/swagger';

import {
  API_PREFIX,
  buildOpenApiConfig,
  buildOpenApiDocumentOptions,
} from '../openapi/openapi.config.js';

const CONTRACT_RELATIVE_PATH = path.join('packages', 'contracts', 'openapi', 'openapi.json');
const METADATA_PATH = '../metadata.js';
type SwaggerPluginMetadata = Parameters<typeof SwaggerModule.loadPluginMetadata>[0];

async function generateOpenApiDocument(): Promise<void> {
  configureGenerationEnvironment();

  let app: INestApplication | undefined;

  try {
    const imported: unknown = await import(METADATA_PATH);
    const metadata = resolvePluginMetadata(imported);
    await SwaggerModule.loadPluginMetadata(metadata);

    const { createApiApplication } = await import('../bootstrap/create-api-application.js');
    app = await createApiApplication();

    /*
     * createApiApplication() already applies the application's global /api/v1 prefix.
     * SwaggerModule.createDocument() keeps that global prefix in document.paths by default.
     *
     * Do NOT call .addServer('/api/v1') here, otherwise generated clients compose:
     *   baseUrl(/api/v1) + operationPath(/api/v1/...) => /api/v1/api/v1/...
     *
     * The generated Flutter client should receive only the host as its runtime base URL,
     * for example https://api.example.com, while operation paths retain /api/v1.
     */
    const document = SwaggerModule.createDocument(
      app,
      buildOpenApiConfig(),
      buildOpenApiDocumentOptions(),
    );

    assertContractPrefixIsNotDuplicated(document);

    const workspaceRoot = await findWorkspaceRoot();
    const outputFile = path.join(workspaceRoot, CONTRACT_RELATIVE_PATH);

    await mkdir(path.dirname(outputFile), { recursive: true });
    await writeFile(outputFile, `${JSON.stringify(document, null, 2)}\n`, 'utf8');

    process.stdout.write(
      `OpenAPI document generated successfully: ${outputFile}\n` +
        `Operations: ${countOperations(document)}\n`,
    );
  } finally {
    await app?.close();
  }
}

function configureGenerationEnvironment(): void {
  process.env.DATABASE_URL ??= 'mysql://root:root@localhost:3306/ecommerce';
  process.env.REDIS_URL ??= 'redis://localhost:6379';
  process.env.OPENAPI_ENABLED = 'false';
  process.env.EXECUTION_MODE = 'direct';
  process.env.QUEUE_ENABLED = 'false';
  process.env.SCHEMA_GUARD_ENABLED = 'false';
}

async function findWorkspaceRoot(): Promise<string> {
  // Use __dirname to be compatible with CommonJS output
  let currentDirectory = __dirname;

  while (true) {
    const workspaceManifest = path.join(currentDirectory, 'pnpm-workspace.yaml');

    try {
      await access(workspaceManifest, constants.R_OK);
      return currentDirectory;
    } catch {
      const parentDirectory = path.dirname(currentDirectory);

      if (parentDirectory === currentDirectory) {
        throw new Error(
          'Unable to locate pnpm-workspace.yaml while resolving the OpenAPI output directory.',
        );
      }

      currentDirectory = parentDirectory;
    }
  }
}

function resolvePluginMetadata(imported: unknown): SwaggerPluginMetadata {
  const namespace = asRecord(imported);
  const defaultExport = namespace?.default ?? imported;
  const wrappedDefault = asRecord(defaultExport)?.default;

  return (typeof wrappedDefault === 'function' ? wrappedDefault : defaultExport) as SwaggerPluginMetadata;
}

function asRecord(value: unknown): Record<string, unknown> | undefined {
  return typeof value === 'object' && value !== null ? (value as Record<string, unknown>) : undefined;
}

function assertContractPrefixIsNotDuplicated(document: OpenAPIObject): void {
  const serverUrls = document.servers?.map((server) => server.url) ?? [];
  const prefixedPathCount = Object.keys(document.paths).filter(
    (operationPath) =>
      operationPath === API_PREFIX || operationPath.startsWith(`${API_PREFIX}/`),
  ).length;

  if (
    prefixedPathCount > 0 &&
    serverUrls.some((serverUrl) => serverUrl === API_PREFIX || serverUrl.endsWith(API_PREFIX))
  ) {
    throw new Error(
      `OpenAPI contract duplicates "${API_PREFIX}" in both servers[].url and paths. ` +
        'Keep the global API prefix in paths and do not add it as a server URL.',
    );
  }
}

function countOperations(document: OpenAPIObject): number {
  const methods = new Set(['get', 'post', 'put', 'patch', 'delete', 'options', 'head', 'trace']);

  return Object.values(document.paths).reduce((total, pathItem) => {
    if (!pathItem) {
      return total;
    }

    return (
      total +
      Object.keys(pathItem).filter((key) => methods.has(key.toLowerCase())).length
    );
  }, 0);
}

void generateOpenApiDocument().catch((error: unknown) => {
  const message = error instanceof Error ? error.message : String(error);
  process.stderr.write(`OpenAPI document generation failed: ${message}\n`);
  process.exitCode = 1;
});
