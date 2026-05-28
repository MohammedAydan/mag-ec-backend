import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Inject,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { ApiBearerAuth, ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { Throttle } from '@nestjs/throttler';
import type { FastifyRequest } from 'fastify';

import { CurrentUser } from '../decorators/current-user.decorator';
import {
  LoginDto,
  LogoutDto,
  RefreshTokenDto,
  RegisterDto,
  RequestPasswordResetDto,
  ResetPasswordDto,
  VerifyEmailDto,
} from '../dto/auth.dto';
import { AuthGuard } from '../guards/auth.guard';
import type { AccessTokenPayload } from '../services/token.service';
import { AuthService } from '../services/auth.service';

@ApiTags('Authentication')
@Controller('auth')
export class AuthController {
  constructor(@Inject(AuthService) private readonly authService: AuthService) {}

  @Post('register')
  @Throttle({ default: { limit: 10, ttl: 60_000 } })
  @ApiOperation({ summary: 'Register a new customer account' })
  @ApiResponse({ status: HttpStatus.CREATED, description: 'User successfully registered' })
  @ApiResponse({ status: HttpStatus.CONFLICT, description: 'Email already exists' })
  async register(@Body() dto: RegisterDto) {
    return this.authService.register({
      email: dto.email,
      displayName: dto.displayName,
      passwordRaw: dto.password,
    });
  }

  @Post('login')
  @Throttle({ default: { limit: 5, ttl: 60_000 } })
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Authenticate user credentials and issue session tokens' })
  @ApiResponse({ status: HttpStatus.OK, description: 'Login successful' })
  @ApiResponse({ status: HttpStatus.UNAUTHORIZED, description: 'Invalid credentials' })
  async login(@Body() dto: LoginDto, @Req() req: FastifyRequest) {
    const ipAddress = req.ip;
    const userAgent = req.headers['user-agent'];

    return this.authService.login(dto.email, dto.password, ipAddress, userAgent);
  }

  @Post('refresh')
  @Throttle({ default: { limit: 20, ttl: 60_000 } })
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Exchange an active refresh token for a new token set (rotation)' })
  @ApiResponse({ status: HttpStatus.OK, description: 'Tokens successfully rotated' })
  @ApiResponse({ status: HttpStatus.UNAUTHORIZED, description: 'Invalid or rotated refresh token' })
  async refresh(@Body() dto: RefreshTokenDto, @Req() req: FastifyRequest) {
    const ipAddress = req.ip;
    const userAgent = req.headers['user-agent'];

    return this.authService.refresh(dto.refreshToken, ipAddress, userAgent);
  }

  @Post('logout')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiOperation({ summary: 'Revoke active refresh token session family' })
  @ApiResponse({ status: HttpStatus.NO_CONTENT, description: 'Logout successful' })
  async logout(@Body() dto: LogoutDto) {
    await this.authService.logout(dto.refreshToken);
  }

  @Post('password-reset/request')
  @Throttle({ default: { limit: 5, ttl: 60_000 } })
  @HttpCode(HttpStatus.ACCEPTED)
  @ApiOperation({ summary: 'Create a password-reset request without disclosing account existence' })
  @ApiResponse({ status: HttpStatus.ACCEPTED, description: 'Password-reset request accepted' })
  async requestPasswordReset(@Body() dto: RequestPasswordResetDto, @Req() req: FastifyRequest) {
    return this.authService.requestPasswordReset(dto.email, req.ip, req.headers['user-agent']);
  }

  @Post('password-reset/confirm')
  @Throttle({ default: { limit: 5, ttl: 60_000 } })
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Consume a password-reset token and change the user password' })
  @ApiResponse({ status: HttpStatus.OK, description: 'Password reset completed' })
  @ApiResponse({
    status: HttpStatus.UNAUTHORIZED,
    description: 'Invalid or expired password-reset token',
  })
  async resetPassword(@Body() dto: ResetPasswordDto, @Req() req: FastifyRequest) {
    return this.authService.resetPassword(
      dto.token,
      dto.newPassword,
      req.ip,
      req.headers['user-agent'],
    );
  }

  @Post('verification/confirm')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Consume an email-verification token and mark the account verified' })
  @ApiResponse({ status: HttpStatus.OK, description: 'Email verified' })
  @ApiResponse({
    status: HttpStatus.UNAUTHORIZED,
    description: 'Invalid or expired verification token',
  })
  async verifyEmail(@Body() dto: VerifyEmailDto, @Req() req: FastifyRequest) {
    return this.authService.verifyEmail(dto.token, req.ip, req.headers['user-agent']);
  }

  @Post('verification/request')
  @Throttle({ default: { limit: 5, ttl: 60_000 } })
  @HttpCode(HttpStatus.ACCEPTED)
  @UseGuards(AuthGuard)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Issue a new email-verification request for the authenticated user' })
  @ApiResponse({ status: HttpStatus.ACCEPTED, description: 'Email-verification request accepted' })
  async requestEmailVerification(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Req() req: FastifyRequest,
  ) {
    return this.authService.requestEmailVerification(
      currentUser.sub,
      req.ip,
      req.headers['user-agent'],
    );
  }

  @Get('me')
  @UseGuards(AuthGuard)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Return the authenticated user profile and access summary' })
  @ApiResponse({ status: HttpStatus.OK, description: 'Authenticated user profile returned' })
  @ApiResponse({ status: HttpStatus.UNAUTHORIZED, description: 'Authentication is required' })
  async getCurrentUser(@CurrentUser() currentUser: AccessTokenPayload) {
    return this.authService.getCurrentUserProfile(currentUser.sub);
  }
}
