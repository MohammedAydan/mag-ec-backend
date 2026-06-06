import { Body, Controller, Inject, Post } from '@nestjs/common';
import { ApiBadRequestResponse, ApiOkResponse, ApiOperation, ApiTags } from '@nestjs/swagger';

import { CheckoutPreviewDto } from '../dto/pricing-public.dto';
import { PricingPreviewResponseDto } from '../dto/pricing-response.dto';
import { PricingPreviewService } from '../services/pricing-preview.service';

@ApiTags('Pricing Public')
@Controller('pricing')
export class PricingPublicController {
  constructor(@Inject(PricingPreviewService) private readonly pricingPreviewService: PricingPreviewService) {}

  @Post('checkout/preview')
  @ApiOperation({ summary: 'Preview checkout pricing, taxes, shipping, and promotions' })
  @ApiOkResponse({ type: PricingPreviewResponseDto, description: 'Checkout price preview computed' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  previewCheckout(@Body() dto: CheckoutPreviewDto) {
    return this.pricingPreviewService.previewCheckout(dto) as unknown as PricingPreviewResponseDto;
  }
}
