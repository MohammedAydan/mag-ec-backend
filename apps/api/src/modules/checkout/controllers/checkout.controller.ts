import { BadRequestException, Body, Controller, HttpCode, HttpStatus, Inject, Post, Req, UseGuards } from '@nestjs/common';
import { ApiBadRequestResponse, ApiBearerAuth, ApiCreatedResponse, ApiForbiddenResponse, ApiHeader, ApiNotFoundResponse, ApiOkResponse, ApiOperation, ApiTags, ApiUnauthorizedResponse } from '@nestjs/swagger';
import type { FastifyRequest } from 'fastify';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { CustomerGuard } from '../../identity/guards/customer.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { TokenService } from '../../identity/services/token.service';
import { CartService } from '../../carts/services/cart.service';
import { CheckoutCartPreviewDto, CheckoutPlaceOrderDto } from '../dto/checkout.dto';
import {
  CheckoutPreviewResponseDto,
  CheckoutPlaceOrderResponseDto,
} from '../dto/checkout-response.dto';
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
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Preview checkout costs before placing an order' })
  @ApiHeader({
    name: 'Authorization',
    required: false,
    description: 'Optional Bearer JWT for authenticated checkout preview.',
  })
  @ApiHeader({
    name: 'x-guest-cart-token',
    required: false,
    description: 'Guest cart bearer token for guest-owned cart access.',
  })
  @ApiOkResponse({
    type: CheckoutPreviewResponseDto,
    description: 'Checkout preview with pricing, tax, and shipping breakdown',
  })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Cart not found' })
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
  @HttpCode(HttpStatus.OK)
  @UseGuards(AuthGuard, CustomerGuard)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Reserve stock and preview checkout (authenticated customer only)' })
  @ApiOkResponse({
    type: CheckoutPreviewResponseDto,
    description: 'Checkout preview with stock reservations confirmed',
  })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Customer-only resource; admin/staff tokens are rejected' })
  @ApiNotFoundResponse({ description: 'Cart not found' })
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
  @ApiOperation({ summary: 'Place an order from cart' })
  @ApiHeader({
    name: 'Authorization',
    required: false,
    description: 'Optional Bearer JWT for authenticated placement or guest checkout attribution.',
  })
  @ApiHeader({
    name: 'x-guest-cart-token',
    required: false,
    description: 'Guest cart bearer token for guest-owned cart access.',
  })
  @ApiHeader({
    name: 'idempotency-key',
    required: true,
    description: 'Client-generated idempotency key for duplicate-submit protection (max 128 chars, alphanumeric, dashes, and underscores).',
  })
  @ApiCreatedResponse({
    type: CheckoutPlaceOrderResponseDto,
    description: 'Order placed successfully',
  })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Cart not found' })
  async placeOrder(@Body() body: CheckoutPlaceOrderDto, @Req() request: FastifyRequest) {
    const cart = await this.cartService.getCartOrThrow(body.cartId);
    const currentUser = await this.resolveOptionalUser(request);
    const guestToken = this.readGuestTokenHeader(request);
    const idempotencyKey = this.validateIdempotencyKey(
      this.readHeader(request, 'idempotency-key'),
    );

    this.cartService.assertCartAccess(cart, {
      userId: currentUser?.sub,
      guestToken,
    });

    return this.checkoutPlacementService.placeOrder(body, {
      actorUserId: currentUser?.sub,
      guestToken,
      idempotencyKey,
    });
  }

  private readGuestTokenHeader(request: FastifyRequest) {
    return this.readHeader(request, 'x-guest-cart-token');
  }

  private readonly IDEMPOTENCY_KEY_PATTERN = /^[a-zA-Z0-9_-]{1,128}$/;

  private validateIdempotencyKey(raw: string | undefined): string {
    if (!raw) {
      throw new BadRequestException('idempotency-key header is required');
    }

    const trimmed = raw.trim();

    if (trimmed.length === 0) {
      throw new BadRequestException('idempotency-key header must not be empty');
    }

    if (trimmed.length > 128) {
      throw new BadRequestException(
        'idempotency-key header must not exceed 128 characters',
      );
    }

    if (!this.IDEMPOTENCY_KEY_PATTERN.test(trimmed)) {
      throw new BadRequestException(
        'idempotency-key header may only contain alphanumeric characters and dashes',
      );
    }

    return trimmed;
  }

  private readHeader(request: FastifyRequest, name: string): string | undefined {
    const header = request.headers[name];
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
