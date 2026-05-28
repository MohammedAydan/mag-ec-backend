import { createSign } from 'node:crypto';

import { Inject, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

import type { AppConfig } from '../../../config/app.config';
import { PrismaService } from '../../persistence/services/prisma.service';

interface OAuthTokenResponse {
  access_token?: string;
  expires_in?: number;
}
function base64Url(input: string | Buffer): string {
  return Buffer.from(input).toString('base64url');
}

@Injectable()
export class NotificationDeliveryService {
  private readonly config: AppConfig;
  private cachedFcmToken: { value: string; expiresAt: number } | null = null;

  constructor(
    @Inject(ConfigService) configService: ConfigService,
    @Inject(PrismaService) private readonly prisma: PrismaService,
  ) {
    this.config = configService.getOrThrow<AppConfig>('app');
  }

  async deliver(notificationId: string): Promise<boolean> {
    const claimed = await this.prisma.notification.updateMany({
      where: { id: notificationId, status: 'PENDING' },
      data: { status: 'PROCESSING', attempts: { increment: 1 }, lastError: null },
    });
    if (claimed.count !== 1) return false;

    const notification = await this.prisma.notification.findUnique({
      where: { id: notificationId },
      include: { user: { include: { pushDevices: { where: { isActive: true } } } } },
    });
    if (!notification) return false;

    try {
      if (notification.channel === 'IN_APP') {
        await this.markSent(notification.id);
        return true;
      }
      if (notification.channel === 'EMAIL') {
        const to = notification.recipientEmail ?? notification.user?.email;
        if (!to) throw new Error('EMAIL notification has no recipient email address');
        await this.sendEmail(to, notification.title, notification.body ?? notification.title);
        await this.markSent(notification.id);
        return true;
      }
      const tokens = notification.user?.pushDevices.map((device) => device.token) ?? [];
      if (!tokens.length) throw new Error('PUSH notification has no active registered device');
      await Promise.all(
        tokens.map((token) =>
          this.sendPush(token, notification.title, notification.body ?? notification.title),
        ),
      );
      await this.markSent(notification.id);
      return true;
    } catch (error) {
      await this.prisma.notification.update({
        where: { id: notification.id },
        data: {
          status: 'FAILED',
          processedAt: new Date(),
          lastError: error instanceof Error ? error.message : 'Notification delivery failed',
        },
      });
      throw error;
    }
  }

  private markSent(notificationId: string) {
    return this.prisma.notification.update({
      where: { id: notificationId },
      data: { status: 'SENT', sentAt: new Date(), processedAt: new Date(), lastError: null },
    });
  }

  private async sendEmail(to: string, subject: string, text: string): Promise<void> {
    if (this.config.emailProvider !== 'resend') throw new Error('EMAIL provider is not configured');
    const response = await fetch('https://api.resend.com/emails', {
      signal: AbortSignal.timeout(10_000),
      method: 'POST',
      headers: {
        authorization: `Bearer ${this.config.emailApiKey}`,
        'content-type': 'application/json',
      },
      body: JSON.stringify({ from: this.config.emailFrom, to: [to], subject, text }),
    });
    if (!response.ok) throw new Error(`Email delivery failed with status ${response.status}`);
  }

  private async sendPush(token: string, title: string, body: string): Promise<void> {
    const accessToken = await this.getFcmAccessToken();
    const response = await fetch(
      `https://fcm.googleapis.com/v1/projects/${encodeURIComponent(this.config.fcmProjectId)}/messages:send`,
      {
        signal: AbortSignal.timeout(10_000),
        method: 'POST',
        headers: { authorization: `Bearer ${accessToken}`, 'content-type': 'application/json' },
        body: JSON.stringify({ message: { token, notification: { title, body } } }),
      },
    );
    if (!response.ok) throw new Error(`FCM delivery failed with status ${response.status}`);
  }

  private async getFcmAccessToken(): Promise<string> {
    if (this.cachedFcmToken && this.cachedFcmToken.expiresAt > Date.now() + 60_000)
      return this.cachedFcmToken.value;
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
    const response = await fetch('https://oauth2.googleapis.com/token', {
      signal: AbortSignal.timeout(10_000),
      method: 'POST',
      headers: { 'content-type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        assertion: `${signingInput}.${signature}`,
      }).toString(),
    });
    if (!response.ok)
      throw new Error(`FCM OAuth token request failed with status ${response.status}`);
    const body = (await response.json()) as OAuthTokenResponse;
    if (!body.access_token)
      throw new Error('FCM OAuth token response did not contain an access token');
    this.cachedFcmToken = {
      value: body.access_token,
      expiresAt: Date.now() + (body.expires_in ?? 3600) * 1000,
    };
    return body.access_token;
  }
}
