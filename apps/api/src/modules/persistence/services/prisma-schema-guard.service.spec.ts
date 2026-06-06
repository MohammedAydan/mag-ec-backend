import { findPendingMigrationNames } from './prisma-schema-guard.service';

describe('findPendingMigrationNames', () => {
  it('returns only local migrations that are not applied yet', () => {
    expect(
      findPendingMigrationNames(
        ['20260525_01_core_init', '20260601_15_security_token_version'],
        ['20260525_01_core_init'],
      ),
    ).toEqual(['20260601_15_security_token_version']);
  });

  it('returns an empty array when the database is up to date', () => {
    expect(
      findPendingMigrationNames(
        ['20260525_01_core_init', '20260601_15_security_token_version'],
        ['20260525_01_core_init', '20260601_15_security_token_version'],
      ),
    ).toEqual([]);
  });
});
