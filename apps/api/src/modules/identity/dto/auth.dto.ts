import { ApiProperty } from '@nestjs/swagger';
import { IsEmail, IsNotEmpty, IsString, MinLength } from 'class-validator';

export class RegisterDto {
  @ApiProperty({ example: 'customer@example.com', description: 'User email address' })
  @IsEmail({}, { message: 'Invalid email address' })
  email!: string;

  @ApiProperty({ example: 'John Doe', description: 'User display name' })
  @IsString()
  @IsNotEmpty({ message: 'Display name is required' })
  displayName!: string;

  @ApiProperty({ example: 'password123', description: 'Secure password', minLength: 8 })
  @IsString()
  @MinLength(8, { message: 'Password must be at least 8 characters long' })
  password!: string;
}

export class LoginDto {
  @ApiProperty({ example: 'customer@example.com', description: 'User email address' })
  @IsEmail({}, { message: 'Invalid email address' })
  email!: string;

  @ApiProperty({ example: 'password123', description: 'User password' })
  @IsString()
  @IsNotEmpty({ message: 'Password is required' })
  password!: string;
}

export class RefreshTokenDto {
  @ApiProperty({ description: 'Rotating refresh token' })
  @IsString()
  @IsNotEmpty({ message: 'Refresh token is required' })
  refreshToken!: string;
}

export class LogoutDto {
  @ApiProperty({ description: 'Active refresh token to revoke' })
  @IsString()
  @IsNotEmpty({ message: 'Refresh token is required' })
  refreshToken!: string;
}

export class RequestPasswordResetDto {
  @ApiProperty({ example: 'customer@example.com', description: 'User email address' })
  @IsEmail({}, { message: 'Invalid email address' })
  email!: string;
}

export class ResetPasswordDto {
  @ApiProperty({ description: 'Password-reset token from the verification channel' })
  @IsString()
  @IsNotEmpty({ message: 'Password reset token is required' })
  token!: string;

  @ApiProperty({ example: 'newPassword123', description: 'New password', minLength: 8 })
  @IsString()
  @MinLength(8, { message: 'Password must be at least 8 characters long' })
  newPassword!: string;
}

export class VerifyEmailDto {
  @ApiProperty({ description: 'Email-verification token from the verification channel' })
  @IsString()
  @IsNotEmpty({ message: 'Verification token is required' })
  token!: string;
}
