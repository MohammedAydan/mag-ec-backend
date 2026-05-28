import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

import type { WorkerConfig } from '../config/worker.config';

@Injectable()
export class EmailProviderService {
  private readonly config: WorkerConfig;

  constructor(configService: ConfigService) {
    this.config = configService.getOrThrow<WorkerConfig>('worker');
  }

  async send(input: { to: string; subject: string; text: string }): Promise<void> {
    if (this.config.emailProvider !== 'resend') {
      throw new Error('EMAIL provider is not configured');
    }

    const response = await fetch('https://api.resend.com/emails', {
      signal: AbortSignal.timeout(10_000),
      method: 'POST',
      headers: {
        authorization: `Bearer ${this.config.emailApiKey}`,
        'content-type': 'application/json',
      },
      body: JSON.stringify({
        from: this.config.emailFrom,
        to: [input.to],
        subject: input.subject,
        text: input.text,
      }),
    });

    if (!response.ok) {
      const body = await response.text();
      throw new Error(
        `Email delivery failed with status ${response.status}: ${body.slice(0, 200)}`,
      );
    }
  }
}
