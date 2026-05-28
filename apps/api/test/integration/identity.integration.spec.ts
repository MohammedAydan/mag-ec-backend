import 'dotenv/config';

import { AccountActionTokenType, UserType } from '@prisma/client/index';

import {
  assertMysqlDatabaseAvailable,
  createMysqlTestPrismaClient,
} from './support/mysql-test-client';

const runMysqlIntegration = process.env.RUN_MYSQL_INTEGRATION === 'true';

const describeMysqlIntegration = runMysqlIntegration ? describe : describe.skip;

describeMysqlIntegration('identity integration', () => {
  const prisma = createMysqlTestPrismaClient();

  beforeAll(async () => {
    await assertMysqlDatabaseAvailable(prisma, 'identity integration');
  });

  afterAll(async () => {
    await prisma.$disconnect();
  });

  it('persists and consumes password-reset tokens as one-time-use records', async () => {
    const suffix = `${Date.now()}`;
    const email = `identity-${suffix}@example.com`;
    const normalizedEmail = email.toLowerCase();

    const user = await prisma.user.create({
      data: {
        email,
        normalizedEmail,
        displayName: 'Identity Integration User',
        passwordHash: 'hashed-password',
        userType: UserType.CUSTOMER,
      },
    });

    const token = await prisma.accountActionToken.create({
      data: {
        userId: user.id,
        type: AccountActionTokenType.PASSWORD_RESET,
        hashedToken: `hashed-${suffix}`,
        expiresAt: new Date(Date.now() + 60_000),
      },
    });

    const storedToken = await prisma.accountActionToken.findUnique({
      where: { hashedToken: token.hashedToken },
    });

    expect(storedToken).not.toBeNull();
    expect(storedToken?.consumedAt).toBeNull();

    await prisma.accountActionToken.update({
      where: { id: token.id },
      data: {
        consumedAt: new Date(),
      },
    });

    const consumedToken = await prisma.accountActionToken.findUnique({
      where: { id: token.id },
    });

    expect(consumedToken?.consumedAt).not.toBeNull();

    await prisma.accountActionToken.delete({
      where: { id: token.id },
    });
    await prisma.user.delete({
      where: { id: user.id },
    });
  });
});
