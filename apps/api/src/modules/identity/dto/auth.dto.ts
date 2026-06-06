import { ApiProperty } from '@nestjs/swagger';
import { IsEmail, IsNotEmpty, IsString, MaxLength, MinLength } from 'class-validator';

export class RegisterDto {
  @ApiProperty({ type: String, example: 'customer@example.com', description: 'User email address' })
  @IsEmail({}, { message: 'Invalid email address' })
  @MaxLength(254, { message: 'Email must not exceed 254 characters' })
  email!: string;

  @ApiProperty({ type: String, example: 'John Doe', description: 'User display name' })
  @IsString()
  @IsNotEmpty({ message: 'Display name is required' })
  @MaxLength(100, { message: 'Display name must not exceed 100 characters' })
  displayName!: string;

  @ApiProperty({ type: String, example: 'password123', description: 'Secure password', minLength: 8 })
  @IsString()
  @MinLength(8, { message: 'Password must be at least 8 characters long' })
  @MaxLength(128, { message: 'Password must not exceed 128 characters' })
  password!: string;
}

export class LoginDto {
  @ApiProperty({ type: String, example: 'customer@example.com', description: 'User email address' })
  @IsEmail({}, { message: 'Invalid email address' })
  @MaxLength(254, { message: 'Email must not exceed 254 characters' })
  email!: string;

  @ApiProperty({ type: String, example: 'password123', description: 'User password' })
  @IsString()
  @IsNotEmpty({ message: 'Password is required' })
  @MaxLength(128, { message: 'Password must not exceed 128 characters' })
  password!: string;
}

export class RefreshTokenDto {
  @ApiProperty({ type: String, description: 'Rotating refresh token' })
  @IsString()
  @IsNotEmpty({ message: 'Refresh token is required' })
  refreshToken!: string;
}

export class LogoutDto {
  @ApiProperty({ type: String, description: 'Active refresh token to revoke' })
  @IsString()
  @IsNotEmpty({ message: 'Refresh token is required' })
  refreshToken!: string;
}

export class RequestPasswordResetDto {
  @ApiProperty({ type: String, example: 'customer@example.com', description: 'User email address' })
  @IsEmail({}, { message: 'Invalid email address' })
  @MaxLength(254, { message: 'Email must not exceed 254 characters' })
  email!: string;
}

export class ResetPasswordDto {
  @ApiProperty({ type: String, description: 'Password-reset token from the verification channel' })
  @IsString()
  @IsNotEmpty({ message: 'Password reset token is required' })
  @MaxLength(256, { message: 'Reset token must not exceed 256 characters' })
  token!: string;

  @ApiProperty({ type: String, example: 'newPassword123', description: 'New password', minLength: 8 })
  @IsString()
  @MinLength(8, { message: 'Password must be at least 8 characters long' })
  @MaxLength(128, { message: 'Password must not exceed 128 characters' })
  newPassword!: string;
}

export class VerifyEmailDto {
  @ApiProperty({ type: String, description: 'Email-verification token from the verification channel' })
  @IsString()
  @IsNotEmpty({ message: 'Verification token is required' })
  @MaxLength(256, { message: 'Verification token must not exceed 256 characters' })
  token!: string;
}
