import { Inject, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';

import type { AppConfig } from '../../../config/app.config';

export interface AccessTokenPayload {
  sub: string;
  email: string;
  userType: 'ADMIN' | 'CUSTOMER' | 'SYSTEM';
  roles: string[];
  permissions: string[];
}

export interface RefreshTokenPayload {
  sub: string;
  sessionId: string;
  family: string;
}

@Injectable()
export class TokenService {
  private readonly jwtAccessSecret: string;
  private readonly jwtAccessExpiresIn: string;
  private readonly jwtRefreshSecret: string;
  private readonly jwtRefreshExpiresIn: string;

  constructor(
    @Inject(JwtService) private readonly jwtService: JwtService,
    @Inject(ConfigService) private readonly configService: ConfigService,
  ) {
    const appConfig = this.configService.getOrThrow<AppConfig>('app');
    this.jwtAccessSecret = appConfig.jwtAccessSecret;
    this.jwtAccessExpiresIn = appConfig.jwtAccessExpiresIn;
    this.jwtRefreshSecret = appConfig.jwtRefreshSecret;
    this.jwtRefreshExpiresIn = appConfig.jwtRefreshExpiresIn;
  }

  async signAccessToken(payload: AccessTokenPayload): Promise<string> {
    return this.jwtService.signAsync(payload, {
      secret: this.jwtAccessSecret,
      // eslint-disable-next-line @typescript-eslint/no-explicit-any, @typescript-eslint/no-unsafe-assignment
      expiresIn: this.jwtAccessExpiresIn as any,
    });
  }

  async verifyAccessToken(token: string): Promise<AccessTokenPayload> {
    return this.jwtService.verifyAsync<AccessTokenPayload>(token, {
      secret: this.jwtAccessSecret,
    });
  }

  async signRefreshToken(payload: RefreshTokenPayload): Promise<string> {
    return this.jwtService.signAsync(payload, {
      secret: this.jwtRefreshSecret,
      // eslint-disable-next-line @typescript-eslint/no-explicit-any, @typescript-eslint/no-unsafe-assignment
      expiresIn: this.jwtRefreshExpiresIn as any,
    });
  }

  async verifyRefreshToken(token: string): Promise<RefreshTokenPayload> {
    return this.jwtService.verifyAsync<RefreshTokenPayload>(token, {
      secret: this.jwtRefreshSecret,
    });
  }
}
