import { createContext, useCallback, useContext, useEffect, useMemo, useState, type ReactNode } from 'react';

// ── Types ──────────────────────────────────────────────────────────────────

export type Locale = 'en' | 'ar';

export interface LocaleMeta {
  code: Locale;
  label: string;
  nativeLabel: string;
  dir: 'ltr' | 'rtl';
}

export const SUPPORTED_LOCALES: LocaleMeta[] = [
  { code: 'en', label: 'English', nativeLabel: 'English', dir: 'ltr' },
  { code: 'ar', label: 'Arabic', nativeLabel: 'العربية', dir: 'rtl' },
];

const DEFAULT_LOCALE: Locale = 'en';

// ── Translation map type ───────────────────────────────────────────────────
// Keys are dot-notation paths. Values are strings or nested objects.
export interface TranslationMap {
  [key: string]: string | TranslationMap;
}

// ── Context ────────────────────────────────────────────────────────────────

interface I18nContextValue {
  locale: Locale;
  setLocale: (locale: Locale) => void;
  t: (key: string, params?: Record<string, string | number>) => string;
  dir: 'ltr' | 'rtl';
  localeMeta: LocaleMeta;
}

const I18nContext = createContext<I18nContextValue | null>(null);

// Export for class components that can't use hooks
export { I18nContext as TranslationContext };
export type { I18nContextValue as TranslationContextValue };

// ── Provider ───────────────────────────────────────────────────────────────

interface TranslationProviderProps {
  children: ReactNode;
  translations: Record<Locale, TranslationMap>;
}

export function TranslationProvider({ children, translations }: TranslationProviderProps) {
  const [locale, setLocaleState] = useState<Locale>(() => {
    try {
      const stored = localStorage.getItem('atelier-locale');
      if (stored === 'en' || stored === 'ar') return stored;
    } catch { /* no-op */ }

    // Detect browser preference
    if (typeof navigator !== 'undefined') {
      const navLang = navigator.language.toLowerCase();
      if (navLang.startsWith('ar')) return 'ar';
    }

    return DEFAULT_LOCALE;
  });

  const setLocale = useCallback((next: Locale) => {
    setLocaleState(next);
    try {
      localStorage.setItem('atelier-locale', next);
    } catch { /* no-op */ }
    document.documentElement.dir = next === 'ar' ? 'rtl' : 'ltr';
    document.documentElement.lang = next;
  }, []);

  // Sync dir on mount + locale change
  useEffect(() => {
    document.documentElement.dir = locale === 'ar' ? 'rtl' : 'ltr';
    document.documentElement.lang = locale;
  }, [locale]);

  const t = useCallback(
    (key: string, params?: Record<string, string | number>): string => {
      const map = translations[locale];
      let value: unknown = map;
      for (const segment of key.split('.')) {
        if (typeof value === 'object' && value !== null && segment in value) {
          value = (value as Record<string, unknown>)[segment];
        } else {
          // Fallback to English
          let fallback: unknown = translations['en'];
          for (const fb of key.split('.')) {
            if (typeof fallback === 'object' && fallback !== null && fb in fallback) {
              fallback = (fallback as Record<string, unknown>)[fb];
            } else {
              return key; // Raw key as last resort
            }
          }
          value = fallback;
          break;
        }
      }

      let result = typeof value === 'string' ? value : key;

      // Interpolate params: {{name}}
      if (params) {
        for (const [paramKey, paramValue] of Object.entries(params)) {
          result = result.replaceAll(`{{${paramKey}}}`, String(paramValue));
        }
      }

      return result;
    },
    [locale, translations],
  );

  const localeMeta = useMemo(
    () => SUPPORTED_LOCALES.find((m) => m.code === locale) ?? SUPPORTED_LOCALES[0],
    [locale],
  );

  const ctx = useMemo<I18nContextValue>(
    () => ({ locale, setLocale, t, dir: localeMeta.dir, localeMeta }),
    [locale, setLocale, t, localeMeta],
  );

  return <I18nContext.Provider value={ctx}>{children}</I18nContext.Provider>;
}

// ── Hook ───────────────────────────────────────────────────────────────────

export function useT(): I18nContextValue {
  const ctx = useContext(I18nContext);
  if (!ctx) {
    throw new Error('useT() must be used within a <TranslationProvider>.');
  }
  return ctx;
}
