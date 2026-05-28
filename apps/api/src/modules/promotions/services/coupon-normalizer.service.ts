import { Injectable } from '@nestjs/common';

@Injectable()
export class CouponNormalizerService {
  normalize(code: string): string {
    return code.trim().replace(/\s+/g, '').toUpperCase();
  }
}
