const ports = [3000, 3001];
const basePaths = [
  '/api/v1/health/liveness',
  '/api/v1/health/readiness',
  '/api/v1/catalog/products',
];

async function testPort(port) {
  const results = [];
  for (const path of basePaths) {
    const url = `http://localhost:${port}${path}`;
    try {
      const res = await fetch(url, { method: 'GET' });
      const text = await res.text();
      results.push({ path, status: res.status, body: text.slice(0, 1000) });
    } catch (err) {
      results.push({ path, error: String(err) });
    }
  }
  return { port, results };
}

(async () => {
  const all = [];
  for (const port of ports) {
    all.push(await testPort(port));
  }
  console.log(JSON.stringify(all, null, 2));
})();
