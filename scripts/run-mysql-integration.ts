import { spawn } from 'node:child_process';
import net from 'node:net';

const pnpmCommand = process.platform === 'win32' ? 'pnpm.cmd' : 'pnpm';
const defaultDatabaseUrl = 'mysql://root:root@localhost:3306/ecommerce';
const defaultRedisUrl = 'redis://localhost:6379';

function runStep(
  command: string,
  args: string[],
  extraEnv?: Record<string, string>,
): Promise<void> {
  return new Promise((resolve, reject) => {
    const normalized = normalizeCommand(command, args);
    const child = spawn(normalized.command, normalized.args, {
      stdio: 'inherit',
      env: {
        ...process.env,
        ...extraEnv,
      },
    });

    child.on('error', reject);
    child.on('exit', (code) => {
      if (code === 0) {
        resolve();
        return;
      }

      reject(new Error(`Command failed with exit code ${code}: ${command} ${args.join(' ')}`));
    });
  });
}

function normalizeCommand(command: string, args: string[]): { command: string; args: string[] } {
  if (process.platform !== 'win32' || !command.endsWith('.cmd')) {
    return { command, args };
  }

  return {
    command: process.env.ComSpec ?? 'cmd.exe',
    args: ['/d', '/s', '/c', command, ...args],
  };
}

function waitForTcpService(
  host: string,
  port: number,
  label: string,
  timeoutMs = 30_000,
): Promise<void> {
  const startedAt = Date.now();

  return new Promise((resolve, reject) => {
    const tryConnect = () => {
      const socket = new net.Socket();

      const cleanup = () => {
        socket.removeAllListeners();
        socket.destroy();
      };

      socket.setTimeout(2_000);

      socket.once('connect', () => {
        cleanup();
        resolve();
      });

      socket.once('timeout', () => {
        cleanup();
        onFailure(new Error('timeout'));
      });

      socket.once('error', onFailure);

      socket.connect(port, host);

      function onFailure(error: Error): void {
        cleanup();

        if (Date.now() - startedAt >= timeoutMs) {
          reject(
            new Error(
              `${label} did not become ready at ${host}:${port} within ${timeoutMs}ms: ${error.message}`,
            ),
          );
          return;
        }

        setTimeout(tryConnect, 1_000);
      }
    };

    tryConnect();
  });
}

async function main(): Promise<void> {
  const databaseUrl = new URL(process.env.DATABASE_URL ?? defaultDatabaseUrl);
  const redisUrl = new URL(process.env.REDIS_URL ?? defaultRedisUrl);

  await waitForTcpService(
    databaseUrl.hostname,
    Number.parseInt(databaseUrl.port || '3306', 10),
    'MySQL',
  );
  await waitForTcpService(redisUrl.hostname, Number.parseInt(redisUrl.port || '6379', 10), 'Redis');
  await runStep(pnpmCommand, ['prisma:migrate:deploy']);
  await runStep(pnpmCommand, ['prisma:seed']);
  await runStep(pnpmCommand, ['test:integration'], {
    RUN_MYSQL_INTEGRATION: 'true',
    QUEUE_ENABLED: 'true',
  });
}

void main();
