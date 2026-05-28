import { Injectable } from '@nestjs/common';

interface BaseTranslation {
  locale: string;
}

@Injectable()
export class CatalogLocalizationService {
  pickTranslation<T extends BaseTranslation>(translations: T[], locale: string): T | null {
    if (translations.length === 0) {
      return null;
    }

    const normalizedLocale = locale.trim().toLowerCase();
    const exact = translations.find(
      (translation) => translation.locale.toLowerCase() === normalizedLocale,
    );
    if (exact) {
      return exact;
    }

    const english = translations.find((translation) => translation.locale.toLowerCase() === 'en');
    if (english) {
      return english;
    }

    const arabic = translations.find((translation) => translation.locale.toLowerCase() === 'ar');
    if (arabic) {
      return arabic;
    }

    return translations[0] ?? null;
  }
}
