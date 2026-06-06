async function main() {
  const PORT = process.env.PORT || 3003;
  const BASE_URL = `http://localhost:${PORT}/api/v1`;

  try {
    console.log('Logging in as admin...');
    const loginRes = await fetch(`${BASE_URL}/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email: 'admin@example.com', password: 'ChangeMe123!' }),
    });

    if (!loginRes.ok) {
      const errBody = await loginRes.text();
      throw new Error(`Login failed with status ${loginRes.status}: ${errBody}`);
    }

    const loginData = await loginRes.json() as { accessToken: string };
    const token = loginData.accessToken;
    console.log('Login successful. Access token obtained.');

    console.log('Requesting products endpoint: /catalog/admin/products?limit=50 ...');
    const productsRes = await fetch(`${BASE_URL}/catalog/admin/products?limit=50`, {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Authorization': `Bearer ${token}`,
      },
    });

    console.log(`Status code: ${productsRes.status}`);
    const body = await productsRes.text();
    console.log('Response body:');
    try {
      console.log(JSON.stringify(JSON.parse(body), null, 2));
    } catch {
      console.log(body);
    }
  } catch (error) {
    console.error('Error occurred in reproduction script:');
    console.error(error);
  }
}

main();
