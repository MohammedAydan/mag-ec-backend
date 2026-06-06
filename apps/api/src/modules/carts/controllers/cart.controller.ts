import { randomUUID } from 'node:crypto';

import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Inject,
  Param,
  Patch,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiForbiddenResponse,
  ApiHeader,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';
import type { FastifyRequest } from 'fastify';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import { CustomerGuard } from '../../identity/guards/customer.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { TokenService } from '../../identity/services/token.service';
import {
  AddCartItemDto,
  ApplyCouponDto,
  CartResponseDto,
  CreateCartDto,
  MergeCartDto,
  UpdateCartItemDto,
} from '../dto/cart.dto';
import { CartService } from '../services/cart.service';

@ApiTags('Carts')
@Controller('carts')
export class CartController {
  constructor(
    @Inject(CartService) private readonly cartService: CartService,
    @Inject(TokenService) private readonly tokenService: TokenService,
  ) {}

  @Post()
  @ApiOperation({ summary: 'Create or retrieve a shopping cart' })
  @ApiHeader({
    name: 'Authorization',
    required: false,
    description: 'Optional Bearer JWT for authenticated cart access.',
  })
  @ApiHeader({
    name: 'x-guest-cart-token',
    required: false,
    description: 'Guest cart bearer token for guest-owned cart access.',
  })
  @ApiCreatedResponse({ type: CartResponseDto, description: 'Cart created or retrieved' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async createOrGetCart(@Body() body: CreateCartDto, @Req() request: FastifyRequest) {
    const currentUser = await this.resolveOptionalUser(request);

    if (currentUser && !body.guestToken) {
      return this.toPublicCart(await this.cartService.getOrCreateCart(undefined, currentUser.sub));
    }

    const guestToken =
      body.guestToken?.trim() || this.readGuestTokenHeader(request) || randomUUID();
    return this.toPublicCart(await this.cartService.getOrCreateCart(guestToken), guestToken);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get cart by ID' })
  @ApiHeader({
    name: 'Authorization',
    required: false,
    description: 'Optional Bearer JWT for authenticated cart access.',
  })
  @ApiHeader({
    name: 'x-guest-cart-token',
    required: false,
    description: 'Guest cart bearer token for guest-owned cart access.',
  })
  @ApiParam({ name: 'id', description: 'Cart ID', required: true })
  @ApiOkResponse({ type: CartResponseDto, description: 'Cart details' })
  @ApiNotFoundResponse({ description: 'Cart not found' })
  async getCart(@Param('id') id: string, @Req() request: FastifyRequest) {
    const cart = await this.cartService.getCartOrThrow(id);
    const currentUser = await this.resolveOptionalUser(request);

    this.cartService.assertCartAccess(cart, {
      userId: currentUser?.sub,
      guestToken: this.readGuestTokenHeader(request),
    });

    return this.toPublicCart(cart);
  }

  @Post(':id/items')
  @ApiOperation({ summary: 'Add an item to the cart' })
  @ApiHeader({
    name: 'Authorization',
    required: false,
    description: 'Optional Bearer JWT for authenticated cart access.',
  })
  @ApiHeader({
    name: 'x-guest-cart-token',
    required: false,
    description: 'Guest cart bearer token for guest-owned cart access.',
  })
  @ApiParam({ name: 'id', description: 'Cart ID', required: true })
  @ApiCreatedResponse({ type: CartResponseDto, description: 'Item added to cart' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Cart not found' })
  async addItem(
    @Param('id') id: string,
    @Body() body: AddCartItemDto,
    @Req() request: FastifyRequest,
  ) {
    const cart = await this.cartService.getCartOrThrow(id);
    const currentUser = await this.resolveOptionalUser(request);

    this.cartService.assertCartAccess(cart, {
      userId: currentUser?.sub,
      guestToken: this.readGuestTokenHeader(request),
    });

    return this.toPublicCart(await this.cartService.addItem(id, body.variantId, body.quantity));
  }

  @Patch(':id/items/:variantId')
  @ApiOperation({ summary: 'Update cart item quantity' })
  @ApiHeader({
    name: 'Authorization',
    required: false,
    description: 'Optional Bearer JWT for authenticated cart access.',
  })
  @ApiHeader({
    name: 'x-guest-cart-token',
    required: false,
    description: 'Guest cart bearer token for guest-owned cart access.',
  })
  @ApiParam({ name: 'id', description: 'Cart ID', required: true })
  @ApiParam({ name: 'variantId', description: 'Product variant ID', required: true })
  @ApiOkResponse({ type: CartResponseDto, description: 'Item quantity updated' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Cart or variant not found' })
  async updateItemQuantity(
    @Param('id') id: string,
    @Param('variantId') variantId: string,
    @Body() body: UpdateCartItemDto,
    @Req() request: FastifyRequest,
  ) {
    const cart = await this.cartService.getCartOrThrow(id);
    const currentUser = await this.resolveOptionalUser(request);

    this.cartService.assertCartAccess(cart, {
      userId: currentUser?.sub,
      guestToken: this.readGuestTokenHeader(request),
    });

    return this.toPublicCart(
      await this.cartService.updateItemQuantity(id, variantId, body.quantity),
    );
  }

  @Delete(':id/items/:variantId')
  @ApiOperation({ summary: 'Remove an item from the cart' })
  @ApiHeader({
    name: 'Authorization',
    required: false,
    description: 'Optional Bearer JWT for authenticated cart access.',
  })
  @ApiHeader({
    name: 'x-guest-cart-token',
    required: false,
    description: 'Guest cart bearer token for guest-owned cart access.',
  })
  @ApiParam({ name: 'id', description: 'Cart ID', required: true })
  @ApiParam({ name: 'variantId', description: 'Product variant ID', required: true })
  @ApiOkResponse({ type: CartResponseDto, description: 'Item removed from cart' })
  @ApiNotFoundResponse({ description: 'Cart or variant not found' })
  async removeItem(
    @Param('id') id: string,
    @Param('variantId') variantId: string,
    @Req() request: FastifyRequest,
  ) {
    const cart = await this.cartService.getCartOrThrow(id);
    const currentUser = await this.resolveOptionalUser(request);

    this.cartService.assertCartAccess(cart, {
      userId: currentUser?.sub,
      guestToken: this.readGuestTokenHeader(request),
    });

    return this.toPublicCart(await this.cartService.removeItem(id, variantId));
  }

  @Post(':id/coupon')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Apply a coupon to the cart' })
  @ApiHeader({
    name: 'Authorization',
    required: false,
    description: 'Optional Bearer JWT for authenticated cart access.',
  })
  @ApiHeader({
    name: 'x-guest-cart-token',
    required: false,
    description: 'Guest cart bearer token for guest-owned cart access.',
  })
  @ApiParam({ name: 'id', description: 'Cart ID', required: true })
  @ApiOkResponse({ type: CartResponseDto, description: 'Coupon applied' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiNotFoundResponse({ description: 'Cart not found' })
  async applyCoupon(
    @Param('id') id: string,
    @Body() body: ApplyCouponDto,
    @Req() request: FastifyRequest,
  ) {
    const cart = await this.cartService.getCartOrThrow(id);
    const currentUser = await this.resolveOptionalUser(request);

    this.cartService.assertCartAccess(cart, {
      userId: currentUser?.sub,
      guestToken: this.readGuestTokenHeader(request),
    });

    return this.toPublicCart(await this.cartService.applyCoupon(id, body.couponCode));
  }

  @Delete(':id/coupon')
  @ApiOperation({ summary: 'Remove coupon from the cart' })
  @ApiHeader({
    name: 'Authorization',
    required: false,
    description: 'Optional Bearer JWT for authenticated cart access.',
  })
  @ApiHeader({
    name: 'x-guest-cart-token',
    required: false,
    description: 'Guest cart bearer token for guest-owned cart access.',
  })
  @ApiParam({ name: 'id', description: 'Cart ID', required: true })
  @ApiOkResponse({ type: CartResponseDto, description: 'Coupon removed' })
  @ApiNotFoundResponse({ description: 'Cart not found' })
  async removeCoupon(@Param('id') id: string, @Req() request: FastifyRequest) {
    const cart = await this.cartService.getCartOrThrow(id);
    const currentUser = await this.resolveOptionalUser(request);

    this.cartService.assertCartAccess(cart, {
      userId: currentUser?.sub,
      guestToken: this.readGuestTokenHeader(request),
    });

    return this.toPublicCart(await this.cartService.removeCoupon(id));
  }

  @Post('merge')
  @HttpCode(HttpStatus.OK)
  @UseGuards(AuthGuard, CustomerGuard)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Merge guest cart into authenticated user cart' })
  @ApiOkResponse({ type: CartResponseDto, description: 'Guest cart merged into user cart' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Customer-only resource; admin/staff tokens are rejected' })
  async mergeGuestCart(@Body() body: MergeCartDto, @CurrentUser() currentUser: AccessTokenPayload) {
    return this.toPublicCart(
      await this.cartService.mergeGuestCartIntoUserCart(body.sourceGuestToken, currentUser.sub),
    );
  }

  private toPublicCart<T extends { guestToken?: string | null }>(
    cart: T,
    issuedGuestToken?: string,
  ) {
    const publicCart = { ...cart };
    delete publicCart.guestToken;

    return issuedGuestToken ? { ...publicCart, guestToken: issuedGuestToken } : publicCart;
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
