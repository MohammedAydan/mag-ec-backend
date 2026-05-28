import { readFile } from 'node:fs/promises';

const BASE_URL = process.env.API_BASE_URL ?? 'http://localhost:3000';
const OPENAPI_PATH = process.env.OPENAPI_PATH ?? 'packages/contracts/openapi/openapi.json';
const ROUNDS = Number.parseInt(process.env.ROUNDS ?? '3', 10);

function buildPath(pathTemplate) {
  return pathTemplate.replace(/\{([^}]+)\}/g, (_, name) => {
    const key = String(name).toLowerCase();
    if (key.includes('slug')) return 'sample-slug';
    if (key.includes('id')) return 'sample-id';
    if (key.includes('code')) return 'SAMPLECODE';
    if (key.includes('country')) return 'US';
    return 'sample';
  });
}

function defaultQuery(paramName) {
  const name = paramName.toLowerCase();
  if (name.includes('page')) return '1';
  if (name.includes('size') || name.includes('limit')) return '10';
  if (name.includes('locale')) return 'en';
  if (name.includes('sort')) return 'createdAt';
  return 'sample';
}

function buildUrl(baseUrl, pathTemplate, operation = {}) {
  const url = new URL(buildPath(pathTemplate), baseUrl);
  const params = Array.isArray(operation.parameters) ? operation.parameters : [];
  for (const param of params) {
    if (param?.in === 'query') {
      const value = defaultQuery(String(param.name ?? 'q'));
      url.searchParams.set(String(param.name), value);
    }
  }
  return url.toString();
}

function buildBody(operation = {}) {
  const requestBody = operation.requestBody;
  if (!requestBody || typeof requestBody !== 'object') return undefined;
  const content = requestBody.content;
  if (!content || typeof content !== 'object') return undefined;
  if (content['application/json']) return {};
  return undefined;
}

async function loadOpenApi() {
  const raw = await readFile(OPENAPI_PATH, 'utf8');
  return JSON.parse(raw);
}

async function callEndpoint(url, method, body) {
  const headers = {
    Accept: 'application/json',
    Authorization: 'Bearer test-token',
  };

  const options = { method: method.toUpperCase(), headers };
  if (body !== undefined) {
    headers['Content-Type'] = 'application/json';
    options.body = JSON.stringify(body);
  }

  const startedAt = Date.now();
  try {
    const response = await fetch(url, options);
    const text = await response.text();
    return {
      ok: response.ok,
      status: response.status,
      durationMs: Date.now() - startedAt,
      body: text.slice(0, 500),
    };
  } catch (error) {
    return {
      ok: false,
      status: 0,
      durationMs: Date.now() - startedAt,
      error: String(error),
    };
  }
}

(async () => {
  const openapi = await loadOpenApi();
  const paths = openapi.paths ?? {};
  const operations = [];

  for (const [pathName, pathItem] of Object.entries(paths)) {
    for (const [method, operation] of Object.entries(pathItem)) {
      const lower = method.toLowerCase();
      if (!['get', 'post', 'put', 'patch', 'delete'].includes(lower)) continue;
      operations.push({ pathName, method: lower, operation });
    }
  }

  const rounds = [];
  for (let round = 1; round <= ROUNDS; round += 1) {
    const results = [];
    for (const item of operations) {
      const url = buildUrl(BASE_URL, `/api/v1${item.pathName}`, item.operation);
      const body = buildBody(item.operation);
      const result = await callEndpoint(url, item.method, body);
      results.push({
        round,
        method: item.method.toUpperCase(),
        path: item.pathName,
        url,
        ...result,
      });
    }
    rounds.push(results);
  }

  const flat = rounds.flat();
  const failures5xx = flat.filter((entry) => entry.status >= 500 || entry.status === 0);
  const summary = {
    baseUrl: BASE_URL,
    rounds: ROUNDS,
    operationCount: operations.length,
    totalRequests: flat.length,
    statusBuckets: flat.reduce((acc, entry) => {
      const key = entry.status === 0 ? 'network' : `${Math.floor(entry.status / 100)}xx`;
      acc[key] = (acc[key] ?? 0) + 1;
      return acc;
    }, {}),
    failures5xxCount: failures5xx.length,
    failures5xx,
  };

  console.log(JSON.stringify(summary, null, 2));
})();
