import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsArray,
  IsEmail,
  IsIn,
  IsNotEmpty,
  IsOptional,
  IsString,
  Matches,
  MaxLength,
} from 'class-validator';

export class CreateAdminRoleDto {
  @ApiProperty({ type: String, description: 'Unique role key (lowercase, snake_case)' })
  @IsString()
  @IsNotEmpty()
  @Matches(/^[a-z][a-z0-9_]{2,63}$/)
  key!: string;

  @ApiProperty({ type: String, description: 'Human-readable role name' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(100)
  name!: string;

  @ApiPropertyOptional({ type: String, description: 'Optional role description' })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  description?: string;

  @ApiProperty({ type: [String], description: 'Permission keys assigned to this role' })
  @IsArray()
  @IsString({ each: true })
  @IsNotEmpty({ each: true })
  permissionKeys!: string[];
}

export class UpdateAdminRolePermissionsDto {
  @ApiProperty({ type: [String], description: 'New set of permission keys for the role' })
  @IsArray()
  @IsString({ each: true })
  @IsNotEmpty({ each: true })
  permissionKeys!: string[];
}

export class InviteStaffDto {
  @ApiProperty({ type: String, description: 'Email address of the staff member to invite' })
  @IsEmail()
  email!: string;

  @ApiProperty({ type: String, description: 'Display name for the invited staff member' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(100)
  displayName!: string;

  @ApiProperty({ type: [String], description: 'Role IDs to assign upon invitation' })
  @IsArray()
  @IsString({ each: true })
  @IsNotEmpty({ each: true })
  roleIds!: string[];
}

export class UpdateStaffRolesDto {
  @ApiProperty({ type: [String], description: 'New set of role IDs for the staff member' })
  @IsArray()
  @IsString({ each: true })
  @IsNotEmpty({ each: true })
  roleIds!: string[];
}

const staffStatuses = ['ACTIVE', 'SUSPENDED', 'DISABLED'] as const;

export class UpdateStaffStatusDto {
  @ApiProperty({ enum: staffStatuses, description: 'New staff account status' })
  @IsString()
  @IsIn(staffStatuses)
  status!: (typeof staffStatuses)[number];
}
