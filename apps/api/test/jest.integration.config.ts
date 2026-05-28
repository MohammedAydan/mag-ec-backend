import type { Config } from 'jest';

const config: Config = {
  displayName: 'integration',
  rootDir: '..',
  testEnvironment: 'node',
  moduleFileExtensions: ['js', 'json', 'ts'],
  testMatch: ['<rootDir>/test/integration/**/*.spec.ts'],
  testTimeout: 30_000,
  transform: {
    '^.+\\.(t|j)s$': ['ts-jest', { tsconfig: '<rootDir>/tsconfig.json' }],
  },
};

export default config;
