import { buildAppConfig } from '../../src/config/app.config';

describe('buildAppConfig', () => {
  it('builds the API prefix from environment values', () => {
    process.env.API_PREFIX = 'api/v1';

    expect(buildAppConfig().app.apiPrefix).toBe('api/v1');
  });
});
