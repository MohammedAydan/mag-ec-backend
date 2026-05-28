import { CatalogLocalizationService } from './catalog-localization.service';

describe('CatalogLocalizationService', () => {
  const service = new CatalogLocalizationService();

  it('returns the requested locale when present', () => {
    const result = service.pickTranslation(
      [
        { locale: 'en', name: 'Perfume' },
        { locale: 'ar', name: 'عطر' },
      ],
      'ar',
    );

    expect(result).toEqual({ locale: 'ar', name: 'عطر' });
  });

  it('falls back to english before other locales', () => {
    const result = service.pickTranslation(
      [
        { locale: 'en', name: 'Perfume' },
        { locale: 'fr', name: 'Parfum' },
      ],
      'de',
    );

    expect(result).toEqual({ locale: 'en', name: 'Perfume' });
  });

  it('falls back to arabic when english is unavailable', () => {
    const result = service.pickTranslation(
      [
        { locale: 'ar', name: 'عطر' },
        { locale: 'fr', name: 'Parfum' },
      ],
      'de',
    );

    expect(result).toEqual({ locale: 'ar', name: 'عطر' });
  });
});
