import { Body, Controller, Get, Inject, Param, Post, Put, UseGuards } from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiForbiddenResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

import { RequirePermissions } from '../../identity/decorators/permissions.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { PermissionsGuard } from '../../identity/guards/permissions.guard';
import { AdminGuard } from '../../identity/guards/admin.guard';
import { UpdateLegalReferencesDto, UpsertContentPageDto } from '../dto/content.dto';
import {
  AdminLegalReferencesResponseDto,
  ContentPageResponseDto,
} from '../dto/content-response.dto';
import { ContentService } from '../services/content.service';

@ApiTags('Content Admin')
@ApiBearerAuth()
@ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
@ApiForbiddenResponse({ description: 'Insufficient permissions' })
@UseGuards(AuthGuard, AdminGuard, PermissionsGuard)
@RequirePermissions(['content.read'])
@Controller('content/admin')
export class AdminContentController {
  constructor(@Inject(ContentService) private readonly contentService: ContentService) {}

  @Get('pages')
  @ApiOperation({ summary: 'List all content pages' })
  @ApiOkResponse({ type: [ContentPageResponseDto], description: 'All content pages' })
  async listPages(): Promise<ContentPageResponseDto[]> {
    return this.contentService.listContentPages();
  }

  @Get('legal-references')
  @ApiOperation({ summary: 'Get legal reference page key mappings' })
  @ApiOkResponse({
    type: AdminLegalReferencesResponseDto,
    description: 'Legal references mapping',
  })
  async getLegalReferences(): Promise<AdminLegalReferencesResponseDto> {
    return this.contentService.getAdminLegalReferences();
  }

  @Post('pages')
  @RequirePermissions(['content.write'])
  @ApiOperation({ summary: 'Create a new content page' })
  @ApiCreatedResponse({ type: ContentPageResponseDto, description: 'Page created' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async createPage(
    @Body() dto: UpsertContentPageDto,
  ): Promise<ContentPageResponseDto> {
    const key = dto.slug ||
      dto.title
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, '-')
        .replace(/^-+|-+$/g, '')
        .substring(0, 80);
    return this.contentService.upsertContentPage(key, dto);
  }

  @Put('pages/:key')
  @RequirePermissions(['content.write'])
  @ApiOperation({ summary: 'Create or update a content page' })
  @ApiParam({ name: 'key', description: 'Content page key', type: String })
  @ApiOkResponse({ type: ContentPageResponseDto, description: 'Page upserted' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async upsertPage(
    @Param('key') key: string,
    @Body() dto: UpsertContentPageDto,
  ): Promise<ContentPageResponseDto> {
    return this.contentService.upsertContentPage(key, dto);
  }

  @Put('legal-references')
  @RequirePermissions(['content.write'])
  @ApiOperation({ summary: 'Update legal reference page key mappings' })
  @ApiOkResponse({
    type: AdminLegalReferencesResponseDto,
    description: 'Legal references updated',
  })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async upsertLegalReferences(
    @Body() dto: UpdateLegalReferencesDto,
  ): Promise<AdminLegalReferencesResponseDto> {
    return this.contentService.updateLegalReferences(dto);
  }
}
