import { Controller, Get, Inject, Param } from '@nestjs/common';
import { ApiNotFoundResponse, ApiOkResponse, ApiOperation, ApiParam, ApiTags } from '@nestjs/swagger';

import { ContentPageResponseDto, LegalReferencesResponseDto } from '../dto/content-response.dto';
import { ContentService } from '../services/content.service';

@ApiTags('Content')
@Controller('content')
export class PublicContentController {
  constructor(@Inject(ContentService) private readonly contentService: ContentService) {}

  @Get('pages/:slug')
  @ApiOperation({ summary: 'Get a published content page by its slug' })
  @ApiParam({ name: 'slug', description: 'Content page slug', type: String })
  @ApiOkResponse({ type: ContentPageResponseDto, description: 'Published content page' })
  @ApiNotFoundResponse({ description: 'Content page not found' })
  async getPage(@Param('slug') slug: string): Promise<ContentPageResponseDto> {
    return this.contentService.getPublicContentPage(slug);
  }

  @Get('legal-references')
  @ApiOperation({ summary: 'Get public legal reference page keys' })
  @ApiOkResponse({ type: LegalReferencesResponseDto, description: 'Public legal references' })
  async getLegalReferences(): Promise<LegalReferencesResponseDto> {
    return this.contentService.getPublicLegalReferences();
  }
}
