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
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiExtension,
  ApiForbiddenResponse,
  ApiOkResponse,
  ApiOperation,
  ApiResponse,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';
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
import {
  AuthResponseDto,
  PasswordResetConfirmResponseDto,
  PasswordResetRequestResponseDto,
  RegisterResponseDto,
  UserProfileDto,
  VerificationRequestResponseDto,
  VerifyEmailResponseDto,
} from '../dto/identity-response.dto';
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
  @ApiCreatedResponse({ type: RegisterResponseDto, description: 'User successfully registered' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiResponse({ status: HttpStatus.CONFLICT, description: 'Email already exists' })
  async register(@Body() dto: RegisterDto): Promise<RegisterResponseDto> {
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
  @ApiOkResponse({ type: AuthResponseDto, description: 'Login successful' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiResponse({ status: HttpStatus.UNAUTHORIZED, description: 'Invalid credentials' })
  async login(@Body() dto: LoginDto, @Req() req: FastifyRequest): Promise<AuthResponseDto> {
    const ipAddress = req.ip;
    const userAgent = req.headers['user-agent'];

    return this.authService.login(dto.email, dto.password, ipAddress, userAgent);
  }

  @Post('refresh')
  @Throttle({ default: { limit: 20, ttl: 60_000 } })
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Exchange an active refresh token for a new token set (rotation)' })
  @ApiOkResponse({ type: AuthResponseDto, description: 'Tokens successfully rotated' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiResponse({ status: HttpStatus.UNAUTHORIZED, description: 'Invalid or rotated refresh token' })
  async refresh(@Body() dto: RefreshTokenDto, @Req() req: FastifyRequest): Promise<AuthResponseDto> {
    const ipAddress = req.ip;
    const userAgent = req.headers['user-agent'];

    return this.authService.refresh(dto.refreshToken, ipAddress, userAgent);
  }

  @Post('logout')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiOperation({ summary: 'Revoke active refresh token session family' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiResponse({ status: HttpStatus.NO_CONTENT, description: 'Logout successful' })
  async logout(@Body() dto: LogoutDto): Promise<void> {
    await this.authService.logout(dto.refreshToken);
  }

  @Post('password-reset/request')
  @Throttle({ default: { limit: 5, ttl: 60_000 } })
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Create a password-reset request without disclosing account existence' })
  @ApiOkResponse({
    type: PasswordResetRequestResponseDto,
    description: 'Password-reset request accepted',
  })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  async requestPasswordReset(
    @Body() dto: RequestPasswordResetDto,
    @Req() req: FastifyRequest,
  ): Promise<PasswordResetRequestResponseDto> {
    return this.authService.requestPasswordReset(dto.email, req.ip, req.headers['user-agent']);
  }

  @Post('password-reset/confirm')
  @Throttle({ default: { limit: 5, ttl: 60_000 } })
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Consume a password-reset token and change the user password' })
  @ApiOkResponse({ type: PasswordResetConfirmResponseDto, description: 'Password reset completed' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiResponse({
    status: HttpStatus.UNAUTHORIZED,
    description: 'Invalid or expired password-reset token',
  })
  async resetPassword(
    @Body() dto: ResetPasswordDto,
    @Req() req: FastifyRequest,
  ): Promise<PasswordResetConfirmResponseDto> {
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
  @ApiOkResponse({ type: VerifyEmailResponseDto, description: 'Email verified' })
  @ApiBadRequestResponse({ description: 'Invalid request body or parameters' })
  @ApiResponse({
    status: HttpStatus.UNAUTHORIZED,
    description: 'Invalid or expired verification token',
  })
  async verifyEmail(
    @Body() dto: VerifyEmailDto,
    @Req() req: FastifyRequest,
  ): Promise<VerifyEmailResponseDto> {
    return this.authService.verifyEmail(dto.token, req.ip, req.headers['user-agent']);
  }

  @Post('verification/request')
  @Throttle({ default: { limit: 5, ttl: 60_000 } })
  @HttpCode(HttpStatus.OK)
  @UseGuards(AuthGuard)
  @ApiBearerAuth()
  @ApiOperation({ summary: 'Issue a new email-verification request for the authenticated user' })
  @ApiOkResponse({
    type: VerificationRequestResponseDto,
    description: 'Email-verification request accepted',
  })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  @ApiExtension('x-sdk-allow-empty-request-body', true)
  async requestEmailVerification(
    @CurrentUser() currentUser: AccessTokenPayload,
    @Req() req: FastifyRequest,
  ): Promise<VerificationRequestResponseDto> {
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
  @ApiOkResponse({ type: UserProfileDto, description: 'Authenticated user profile returned' })
  @ApiUnauthorizedResponse({ description: 'Missing or invalid access token' })
  @ApiForbiddenResponse({ description: 'Insufficient permissions' })
  async getCurrentUser(
    @CurrentUser() currentUser: AccessTokenPayload,
  ): Promise<UserProfileDto> {
    return this.authService.getCurrentUserProfile(currentUser.sub);
  }
}
