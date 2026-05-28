import request from 'supertest';
import { createApiApplication } from '../../src/bootstrap/create-api-application';

describe('HealthController (e2e)', () => {
  let app: Awaited<ReturnType<typeof createApiApplication>>;

  beforeAll(async () => {
    app = await createApiApplication();
    await app.init();
    await app.getHttpAdapter().getInstance().ready();
  });

  afterAll(async () => {
    if (app) {
      await app.close();
    }
  });

  it('returns liveness status', async () => {
    await request(app.getHttpServer()).get('/api/v1/health/liveness').expect(200).expect({
      status: 'ok',
    });
  });
});
