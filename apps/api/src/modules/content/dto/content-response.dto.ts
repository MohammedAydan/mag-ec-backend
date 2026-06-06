import { ApiProperty } from '@nestjs/swagger';

export class ContentPageResponseDto {
  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  slug!: string;

  @ApiProperty({ type: String })
  title!: string;

  @ApiProperty({ type: String })
  body!: string;

  @ApiProperty({ type: String })
  status!: string;

  @ApiProperty({ type: String })
  locale!: string;

  @ApiProperty({ type: Number })
  sortOrder!: number;

  @ApiProperty({ type: Boolean })
  isLegal!: boolean;

  @ApiProperty({ type: String })
  createdAt!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

export class PublicLegalReferenceDto {
  @ApiProperty({ type: String })
  key!: string;

  @ApiProperty({ type: String })
  slug!: string;

  @ApiProperty({ type: String })
  title!: string;

  @ApiProperty({ type: String })
  updatedAt!: string;
}

export class LegalReferencesResponseDto {
  @ApiProperty({ type: () => PublicLegalReferenceDto, nullable: true })
  terms!: PublicLegalReferenceDto | null;

  @ApiProperty({ type: () => PublicLegalReferenceDto, nullable: true })
  privacy!: PublicLegalReferenceDto | null;

  @ApiProperty({ type: () => PublicLegalReferenceDto, nullable: true })
  returns!: PublicLegalReferenceDto | null;

  @ApiProperty({ type: () => PublicLegalReferenceDto, nullable: true })
  shipping!: PublicLegalReferenceDto | null;
}

export class AdminLegalReferencesResponseDto {
  @ApiProperty({ type: String, nullable: true })
  termsPageKey!: string | null;

  @ApiProperty({ type: String, nullable: true })
  privacyPageKey!: string | null;

  @ApiProperty({ type: String, nullable: true })
  returnsPageKey!: string | null;

  @ApiProperty({ type: String, nullable: true })
  shippingPageKey!: string | null;
}
