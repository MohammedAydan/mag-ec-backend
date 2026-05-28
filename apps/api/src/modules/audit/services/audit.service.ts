import { Inject, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';

import { PrismaService } from '../../persistence/services/prisma.service';
import type { ListAuditLogsQueryDto } from '../dto/audit.dto';

const auditInclude = {
  actorUser: {
    select: {
      id: true,
      displayName: true,
      userType: true,
      status: true,
    },
  },
} satisfies Prisma.AuditLogInclude;

const sensitiveKeys = new Set([
  'authorization',
  'cookie',
  'set-cookie',
  'email',
  'customeremail',
  'password',
  'passwordhash',
  'phonenumber',
  'refreshtoken',
  'accesstoken',
  'guesttoken',
  'uploadtoken',
  'hashedtoken',
  'token',
  'secret',
  'signature',
  'providerclientsecret',
]);

function shouldRedactAuditKey(key: string): boolean {
  const normalized = key.toLowerCase();
  return (
    sensitiveKeys.has(normalized) ||
    normalized.includes('password') ||
    normalized.includes('token') ||
    normalized.includes('secret') ||
    normalized.includes('authorization') ||
    normalized.includes('cookie') ||
    normalized.includes('signature') ||
    normalized.endsWith('email') ||
    normalized.includes('phone')
  );
}

type AuditLogRecord = Prisma.AuditLogGetPayload<{ include: typeof auditInclude }>;

@Injectable()
export class AuditService {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
  ) {}

  async listAuditLogs(query: ListAuditLogsQueryDto) {
    const logs = await this.prisma.auditLog.findMany({
      where: {
        ...(query.category ? { category: query.category as never } : {}),
        ...(query.action ? { action: query.action } : {}),
        ...(query.entityType ? { entityType: query.entityType } : {}),
      },
      include: auditInclude,
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
      ...(query.cursor ? { cursor: { id: query.cursor }, skip: 1 } : {}),
      take: (query.limit ?? 20) + 1,
    });

    return this.serializePage(logs, query.limit ?? 20);
  }

  private serializePage(logs: AuditLogRecord[], limit: number) {
    const hasNextPage = logs.length > limit;
    const items = hasNextPage ? logs.slice(0, limit) : logs;

    return {
      items: items.map((log) => ({
        ...log,
        metadata: this.redactJson(log.metadata),
        diff: this.redactJson(log.diff),
      })),
      nextCursor: hasNextPage ? (items[items.length - 1]?.id ?? null) : null,
    };
  }

  private redactJson(value: Prisma.JsonValue | null): Prisma.JsonValue | null {
    if (value === null) {
      return null;
    }

    if (Array.isArray(value)) {
      return value.map((item) => this.redactJson(item));
    }

    if (typeof value !== 'object') {
      return value;
    }

    const record = value as Record<string, Prisma.JsonValue>;
    const sanitized: Record<string, Prisma.JsonValue> = {};

    for (const [key, item] of Object.entries(record)) {
      sanitized[key] = shouldRedactAuditKey(key) ? '[Redacted]' : (this.redactJson(item) ?? null);
    }

    return sanitized;
  }
}
