import type { PrismaService } from '../../persistence/services/prisma.service';
import type { TaskDispatcherService } from '../../queue/task-dispatcher.service';
import type { ObjectStorageService } from '../../storage/object-storage.service';
import type { ReportExportExecutionService } from './report-export-execution.service';
import { ReportingService } from './reporting.service';

const makePrismaMock = () => ({
  reportExport: {
    create: jest.fn(),
    findMany: jest.fn(),
    findUnique: jest.fn(),
    findUniqueOrThrow: jest.fn(),
  },
});
const queuedDispatcher = {
  usesQueue: true,
  generateReportExport: jest.fn().mockResolvedValue(true),
};
const directDispatcher = {
  usesQueue: false,
  generateReportExport: jest.fn().mockResolvedValue(false),
};
const execution = { execute: jest.fn().mockResolvedValue(true) };
const storage = {
  createPrivateDownloadUrl: jest.fn().mockReturnValue('https://storage.example/private-report'),
} as unknown as ObjectStorageService;

function service(prisma: PrismaService, dispatcher = queuedDispatcher) {
  return new ReportingService(
    prisma,
    dispatcher as unknown as TaskDispatcherService,
    execution as unknown as ReportExportExecutionService,
    storage,
  );
}

describe('ReportingService', () => {
  beforeEach(() => jest.clearAllMocks());

  it('creates a report export and dispatches the queue job in queue mode', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.reportExport.create as jest.Mock).mockResolvedValue({
      id: 're-1',
      reportType: 'sales_summary',
    });
    const svc = service(prisma);
    await expect(
      svc.createExport('user-1', { reportType: 'sales_summary', parameters: {} }),
    ).resolves.toBeDefined();
    expect(queuedDispatcher.generateReportExport).toHaveBeenCalledWith('re-1');
    expect(execution.execute).not.toHaveBeenCalled();
  });

  it('executes report generation synchronously in direct mode', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.reportExport.create as jest.Mock).mockResolvedValue({
      id: 're-2',
      reportType: 'sales_summary',
    });
    (prisma.reportExport.findUniqueOrThrow as jest.Mock).mockResolvedValue({
      id: 're-2',
      status: 'COMPLETED',
    });
    const svc = service(prisma, directDispatcher);
    await svc.createExport('user-1', { reportType: 'sales_summary', parameters: {} });
    expect(execution.execute).toHaveBeenCalledWith('re-2');
  });

  it('generates a signed private download URL only for completed exports', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.reportExport.findUnique as jest.Mock).mockResolvedValue({
      id: 're-1',
      status: 'COMPLETED',
      resultObjectKey: 'reports/re-1.csv',
    });
    const svc = service(prisma);
    await expect(svc.createExportDownloadUrl('re-1')).resolves.toEqual({
      exportId: 're-1',
      downloadUrl: 'https://storage.example/private-report',
      expiresInSeconds: 300,
    });
  });

  it('lists exports with cursor pagination', async () => {
    const prisma = makePrismaMock() as unknown as PrismaService;
    (prisma.reportExport.findMany as jest.Mock).mockResolvedValue([{ id: 're-2' }, { id: 're-1' }]);
    const svc = service(prisma);
    const result = await svc.listExports({ limit: 1 });
    expect(result.items).toHaveLength(1);
    expect(result.nextCursor).toBe('re-2');
  });
});
