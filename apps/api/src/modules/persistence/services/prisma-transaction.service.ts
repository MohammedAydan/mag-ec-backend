import { Injectable } from '@nestjs/common';
import type { Prisma } from '@prisma/client';

import { PrismaService } from './prisma.service';

export type TransactionCallback<T> = (tx: Prisma.TransactionClient) => Promise<T>;

@Injectable()
export class PrismaTransactionService {
  constructor(private readonly prisma: PrismaService) {}

  async runInTransaction<T>(callback: TransactionCallback<T>): Promise<T> {
    return this.prisma.$transaction((tx) => callback(tx));
  }

  get client(): PrismaService {
    return this.prisma;
  }
}
