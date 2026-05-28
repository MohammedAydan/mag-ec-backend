import { randomUUID } from 'node:crypto';

import { Body, Controller, Delete, Get, Inject, Param, Patch, Post, Req, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import type { FastifyRequest } from 'fastify';

import { CurrentUser } from '../../identity/decorators/current-user.decorator';
import { AuthGuard } from '../../identity/guards/auth.guard';
import type { AccessTokenPayload } from '../../identity/services/token.service';
import { TokenService } from '../../identity/services/token.service';
import {
  AddCartItemDto,
  ApplyCouponDto,
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
  @UseGuards(AuthGuard)
  @ApiBearerAuth()
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
