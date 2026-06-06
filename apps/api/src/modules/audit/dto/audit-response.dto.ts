import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class AuditLogActorDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  displayName!: string;

  @ApiProperty({ type: String })
  userType!: string;

  @ApiProperty({ type: String })
  status!: string;
}

export class AuditLogResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  actorUserId!: string | null;

  @ApiProperty({ type: String })
  category!: string;

  @ApiProperty({ type: String })
  action!: string;

  @ApiProperty({ type: String })
  entityType!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  entityId!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  ipAddress!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  userAgent!: string | null;

  @ApiPropertyOptional({ type: Object, nullable: true })
  metadata!: Record<string, unknown> | null;

  @ApiPropertyOptional({ type: Object, nullable: true })
  diff!: Record<string, unknown> | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiPropertyOptional({ type: () => AuditLogActorDto, nullable: true })
  actorUser?: AuditLogActorDto | null;
}

export class PaginatedAuditLogsDto {
  @ApiProperty({ type: () => [AuditLogResponseDto] })
  items!: AuditLogResponseDto[];

  @ApiPropertyOptional({ type: String, nullable: true })
  nextCursor!: string | null;
}
