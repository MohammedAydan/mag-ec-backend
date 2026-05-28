import { Controller, Get, Inject, Param } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';

import type { PublicLegalReferencesDto } from '../dto/content.dto';
import { ContentService } from '../services/content.service';

@ApiTags('Content')
@Controller('content')
export class PublicContentController {
  constructor(@Inject(ContentService) private readonly contentService: ContentService) {}

  @Get('pages/:slug')
  getPage(@Param('slug') slug: string) {
    return this.contentService.getPublicContentPage(slug);
  }

  @Get('legal-references')
  getLegalReferences(): Promise<PublicLegalReferencesDto> {
    return this.contentService.getPublicLegalReferences();
  }
}
