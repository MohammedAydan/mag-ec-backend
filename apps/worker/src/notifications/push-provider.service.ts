import { createSign } from 'node:crypto';

import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

import type { WorkerConfig } from '../config/worker.config';

interface OAuthTokenResponse {
  access_token?: string;
  expires_in?: number;
}

function base64Url(input: string | Buffer): string {
  return Buffer.from(input).toString('base64url');
}

@Injectable()
export class PushProviderService {
  private readonly config: WorkerConfig;
  private cachedToken: { value: string; expiresAt: number } | null = null;

  constructor(configService: ConfigService) {
    this.config = configService.getOrThrow<WorkerConfig>('worker');
  }

  async send(input: { token: string; title: string; body: string }): Promise<void> {
    const accessToken = await this.getAccessToken();
    const response = await fetch(
      `https://fcm.googleapis.com/v1/projects/${encodeURIComponent(this.config.fcmProjectId)}/messages:send`,
      {
        signal: AbortSignal.timeout(10_000),
        method: 'POST',
        headers: {
          authorization: `Bearer ${accessToken}`,
          'content-type': 'application/json',
        },
        body: JSON.stringify({
          message: {
            token: input.token,
            notification: { title: input.title, body: input.body },
          },
        }),
      },
    );

    if (!response.ok) {
      const body = await response.text();
      throw new Error(`FCM delivery failed with status ${response.status}: ${body.slice(0, 200)}`);
    }
  }

  private async getAccessToken(): Promise<string> {
    if (this.cachedToken && this.cachedToken.expiresAt > Date.now() + 60_000) {
      return this.cachedToken.value;
    }

    if (!this.config.fcmProjectId || !this.config.fcmClientEmail || !this.config.fcmPrivateKey) {
      throw new Error('FCM service-account configuration is missing');
    }

    const issuedAt = Math.floor(Date.now() / 1000);
    const header = base64Url(JSON.stringify({ alg: 'RS256', typ: 'JWT' }));
    const claim = base64Url(
      JSON.stringify({
        iss: this.config.fcmClientEmail,
        scope: 'https://www.googleapis.com/auth/firebase.messaging',
        aud: 'https://oauth2.googleapis.com/token',
        iat: issuedAt,
        exp: issuedAt + 3600,
      }),
    );
    const signingInput = `${header}.${claim}`;
    const signer = createSign('RSA-SHA256');
    signer.update(signingInput);
    signer.end();
    const signature = signer
      .sign(this.config.fcmPrivateKey.replace(/\\n/g, '\n'))
      .toString('base64url');
    const assertion = `${signingInput}.${signature}`;

    const response = await fetch('https://oauth2.googleapis.com/token', {
      signal: AbortSignal.timeout(10_000),
      method: 'POST',
      headers: { 'content-type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        assertion,
      }).toString(),
    });
    if (!response.ok) {
      throw new Error(`FCM OAuth token request failed with status ${response.status}`);
    }

    const body = (await response.json()) as OAuthTokenResponse;
    if (!body.access_token) {
      throw new Error('FCM OAuth token response did not contain an access token');
    }

    this.cachedToken = {
      value: body.access_token,
      expiresAt: Date.now() + (body.expires_in ?? 3600) * 1000,
    };
    return body.access_token;
  }
}
