import { Body, Controller, Headers, Inject, Post, Req, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import type { FastifyRequest } from 'fastify';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { TokenService } from '../../identity/services/token.service';
import { CartService } from '../../carts/services/cart.service';
import { CheckoutCartPreviewDto, CheckoutPlaceOrderDto } from '../dto/checkout.dto';
import { CheckoutPlacementService } from '../services/checkout-placement.service';
import { CheckoutPreviewService } from '../services/checkout-preview.service';

@ApiTags('Checkout')
@Controller('checkout')
export class CheckoutController {
  constructor(
    @Inject(CheckoutPreviewService) private readonly checkoutPreviewService: CheckoutPreviewService,
    @Inject(CheckoutPlacementService) private readonly checkoutPlacementService: CheckoutPlacementService,
    @Inject(CartService) private readonly cartService: CartService,
    @Inject(TokenService) private readonly tokenService: TokenService,
  ) {}

  @Post('preview')
  async previewCheckout(@Body() body: CheckoutCartPreviewDto, @Req() request: FastifyRequest) {
    const cart = await this.cartService.getCartOrThrow(body.cartId);
    const currentUser = await this.resolveOptionalUser(request);

    this.cartService.assertCartAccess(cart, {
      userId: currentUser?.sub,
      guestToken: this.readGuestTokenHeader(request),
    });

    return this.checkoutPreviewService.previewFromCart(
      {
        ...body,
        reserveStockOnPreview: false,
      },
      currentUser?.sub,
    );
  }

  @Post('reserve')
  @UseGuards(AuthGuard)
  @ApiBearerAuth()
  async reserveCheckoutPreview(
    @Body() body: CheckoutCartPreviewDto,
    @CurrentUser() currentUser: AccessTokenPayload,
  ) {
    const cart = await this.cartService.getCartOrThrow(body.cartId);
    this.cartService.assertCartAccess(cart, { userId: currentUser.sub });

    return this.checkoutPreviewService.previewFromCart(
      {
        ...body,
        reserveStockOnPreview: true,
      },
      currentUser.sub,
    );
  }

  @Post('place')
  async placeOrder(
    @Body() body: CheckoutPlaceOrderDto,
    @Headers('idempotency-key') idempotencyKey: string | undefined,
    @Req() request: FastifyRequest,
  ) {
    const cart = await this.cartService.getCartOrThrow(body.cartId);
    const currentUser = await this.resolveOptionalUser(request);
    const guestToken = this.readGuestTokenHeader(request);

    this.cartService.assertCartAccess(cart, {
      userId: currentUser?.sub,
      guestToken,
    });

    return this.checkoutPlacementService.placeOrder(body, {
      actorUserId: currentUser?.sub,
      guestToken,
      idempotencyKey: idempotencyKey ?? '',
    });
  }

  private readGuestTokenHeader(request: FastifyRequest) {
    const header = request.headers['x-guest-cart-token'];
    return Array.isArray(header) ? header[0] : header;
  }

  private async resolveOptionalUser(request: FastifyRequest) {
    const authorization = request.headers.authorization;

    if (!authorization) {
      return null;
    }

    const [type, token] = authorization.split(' ');
    if (type !== 'Bearer' || !token) {
      return null;
    }

    return this.tokenService.verifyAccessToken(token);
  }
}
