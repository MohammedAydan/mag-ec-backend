import { Body, Controller, Inject, Post } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';

import { CheckoutPreviewDto } from '../dto/pricing-public.dto';
import { PricingPreviewService } from '../services/pricing-preview.service';

@ApiTags('Pricing Public')
@Controller('pricing')
export class PricingPublicController {
  constructor(@Inject(PricingPreviewService) private readonly pricingPreviewService: PricingPreviewService) {}

  @Post('checkout/preview')
  previewCheckout(@Body() dto: CheckoutPreviewDto) {
    return this.pricingPreviewService.previewCheckout(dto);
  }
}
