import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

// ─── Auth ─────────────────────────────────────────────────────────────────────

export class AuthUserDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  email!: string;

  @ApiProperty({ type: String })
  displayName!: string;

  @ApiProperty({ type: String })
  userType!: string;
}

export class AuthResponseDto {
  @ApiProperty({ type: String })
  accessToken!: string;

  @ApiProperty({ type: String })
  refreshToken!: string;

  @ApiProperty({ type: () => AuthUserDto })
  user!: AuthUserDto;
}

export class RegisterResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  email!: string;

  @ApiProperty({ type: String })
  displayName!: string;

  @ApiProperty({ type: String })
  userType!: string;
}

export class PasswordResetRequestResponseDto {
  @ApiProperty({ type: Boolean })
  accepted!: boolean;
}

export class PasswordResetConfirmResponseDto {
  @ApiProperty({ type: Boolean })
  passwordReset!: boolean;
}

export class VerifyEmailResponseDto {
  @ApiProperty({ type: Boolean })
  verified!: boolean;
}

export class VerificationRequestResponseDto {
  @ApiProperty({ type: Boolean })
  accepted!: boolean;
}

// ─── User Profile ─────────────────────────────────────────────────────────────

export class UserRoleDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;
}

export class UserProfileDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  email!: string;

  @ApiProperty({ type: String })
  displayName!: string;

  @ApiProperty({ type: String })
  userType!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  emailVerifiedAt!: string | null;

  @ApiPropertyOptional({ type: String, nullable: true })
  lastLoginAt!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: () => [UserRoleDto] })
  roles!: UserRoleDto[];
}

// ─── Admin Access Check ───────────────────────────────────────────────────────

export class AdminAccessCheckResponseDto {
  @ApiProperty({ type: Boolean })
  allowed!: boolean;
}

// ─── Staff / Invitation ───────────────────────────────────────────────────────

export class StaffSummaryDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  email!: string;

  @ApiProperty({ type: String })
  displayName!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: Boolean, required: false })
  emailDelivered?: boolean;
}

export class InvitationSentResponseDto {
  @ApiProperty({ type: Boolean })
  invitationSent!: boolean;

  @ApiProperty({ type: Boolean, required: false })
  emailDelivered?: boolean;
}

export class StaffStatusResponseDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  email!: string;

  @ApiProperty({ type: String })
  displayName!: string;

  @ApiProperty({ type: String })
  status!: string;
}

// ─── Admin Permission ─────────────────────────────────────────────────────────

export class AdminPermissionDto {
  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  group!: string;

  @ApiProperty({ type: String })
  description!: string;
}

// ─── Admin Role ────────────────────────────────────────────────────────────────

export class AdminRoleDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  name!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  description!: string | null;

  @ApiProperty({ type: () => [AdminPermissionDto] })
  permissions!: AdminPermissionDto[];

  @ApiPropertyOptional({ type: Number, nullable: true })
  staffCount!: number | null;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

// ─── Admin Customer ────────────────────────────────────────────────────────────

export class AdminCustomerSummaryDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  email!: string;

  @ApiProperty({ type: String })
  displayName!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiPropertyOptional({ type: String, nullable: true })
  lastLoginAt!: string | null;

  @ApiProperty({ type: String })
  createdAt!: string;
}

// ─── Staff Detail (for role updates) ───────────────────────────────────────────

export class StaffDetailDto {
  @ApiProperty({ type: String })
  id!: string;

  @ApiProperty({ type: String })
  email!: string;

  @ApiProperty({ type: String })
  displayName!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: () => [UserRoleDto] })
  roles!: UserRoleDto[];
}
