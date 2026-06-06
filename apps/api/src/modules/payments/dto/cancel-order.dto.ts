import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsOptional, IsString, MaxLength } from 'class-validator';

export class CancelOrderDto {
  @ApiPropertyOptional({ description: 'Reason for order cancellation' })
  @IsOptional()
  @IsString()
  @MaxLength(500)
  reason?: string;
}
