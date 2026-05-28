import { Inject, Injectable, ServiceUnavailableException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

import type { AppConfig } from '../../../config/app.config';

interface TransactionalEmailInput {
  to: string;
  subject: string;
  text: string;
}

@Injectable()
export class TransactionalEmailService {
  private readonly config: AppConfig;

  constructor(@Inject(ConfigService) configService: ConfigService) {
    this.config = configService.getOrThrow<AppConfig>('app');
  }

  async sendPasswordResetEmail(to: string, rawToken: string): Promise<void> {
    const resetUrl = new URL('/auth/reset-password', this.config.appPublicUrl);
    resetUrl.searchParams.set('token', rawToken);

    await this.send({
      to,
      subject: 'Reset your password',
      text: [
        'A password reset was requested for your account.',
        '',
        `Reset your password: ${resetUrl.toString()}`,
        '',
        'This link expires in 60 minutes. Ignore this message if you did not request a reset.',
      ].join('\n'),
    });
  }

  async sendEmailVerificationEmail(to: string, rawToken: string): Promise<void> {
    const verificationUrl = new URL('/auth/verify-email', this.config.appPublicUrl);
    verificationUrl.searchParams.set('token', rawToken);

    await this.send({
      to,
      subject: 'Verify your email address',
      text: [
        'Please verify your email address to finish setting up your account.',
        '',
        `Verify email: ${verificationUrl.toString()}`,
        '',
        'This link expires in 48 hours.',
      ].join('\n'),
    });
  }

  private async send(input: TransactionalEmailInput): Promise<void> {
    if (this.config.emailProvider !== 'resend') {
      throw new ServiceUnavailableException('Transactional email provider is not configured');
    }

    const response = await fetch('https://api.resend.com/emails', {
      signal: AbortSignal.timeout(10_000),
      method: 'POST',
      headers: {
        Authorization: `Bearer ${this.config.emailApiKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        from: this.config.emailFrom,
        to: [input.to],
        subject: input.subject,
        text: input.text,
      }),
    });

    if (!response.ok) {
      throw new ServiceUnavailableException(
        `Transactional email delivery failed with status ${response.status}`,
      );
    }
  }
}
