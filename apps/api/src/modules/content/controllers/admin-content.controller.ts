import { Body, Controller, Get, Inject, Param, Put, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import type { LegalReferencesDto } from '../dto/content.dto';
import { UpdateLegalReferencesDto, UpsertContentPageDto } from '../dto/content.dto';
import { ContentService } from '../services/content.service';

@ApiTags('Content Admin')
@ApiBearerAuth()
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['content.read'])
@Controller('content/admin')
export class AdminContentController {
  constructor(@Inject(ContentService) private readonly contentService: ContentService) {}

  @Get('pages')
  listPages() {
    return this.contentService.listContentPages();
  }

  @Get('legal-references')
  getLegalReferences(): Promise<LegalReferencesDto> {
    return this.contentService.getAdminLegalReferences();
  }

  @Put('pages/:key')
  @RequirePermissions(['content.write'])
  upsertPage(@Param('key') key: string, @Body() dto: UpsertContentPageDto) {
    return this.contentService.upsertContentPage(key, dto);
  }

  @Put('legal-references')
  @RequirePermissions(['content.write'])
  upsertLegalReferences(@Body() dto: UpdateLegalReferencesDto): Promise<LegalReferencesDto> {
    return this.contentService.updateLegalReferences(dto);
  }
}
