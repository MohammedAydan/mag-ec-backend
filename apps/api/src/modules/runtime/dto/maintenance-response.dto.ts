import { ApiProperty } from '@nestjs/swagger';

export class MaintenanceResponseDto {
  @ApiProperty({ type: String })
  mode!: string;

  @ApiProperty({ type: Boolean })
  skipped!: boolean;

  @ApiProperty({ type: Number })
  expiredReservations!: number;

  @ApiProperty({ type: Number })
  dispatchedEvents!: number;
}
