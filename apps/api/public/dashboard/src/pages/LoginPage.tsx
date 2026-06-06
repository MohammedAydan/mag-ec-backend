import { useState } from 'react';
import { Navigate } from 'react-router-dom';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';
import { AlertCircle, Eye, EyeOff, Store } from 'lucide-react';
import { useAuth } from '@/lib/auth';
import { ApiRequestError } from '@/lib/http';
import { useT } from '@/lib/i18n';

export function LoginPage() {
  const { login, isAuthenticated, isLoading } = useAuth();
  const [showPassword, setShowPassword] = useState(false);
  const [serverError, setServerError] = useState<string | null>(null);
  const { t } = useT();

  const schema = z.object({
    email: z.string().email(t('auth.invalidEmail')),
    password: z.string().min(1, t('auth.passwordRequired')),
  });

  type FormValues = z.infer<typeof schema>;

  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm<FormValues>({
    resolver: zodResolver(schema),
  });

  if (!isLoading && isAuthenticated) return <Navigate to="/home" replace />;

  const onSubmit = async (values: FormValues) => {
    setServerError(null);
    try {
      await login(values.email, values.password);
    } catch (error) {
      if (error instanceof ApiRequestError) {
        setServerError(error.message);
      } else if (error instanceof Error) {
        setServerError(error.message);
      } else {
        setServerError(t('auth.unableToConnect'));
      }
    }
  };

  return (
    <div className="relative flex min-h-screen items-center justify-center bg-[#050505] px-4 py-10">
      <div className="pointer-events-none absolute inset-0 bg-[radial-gradient(circle_at_top_left,rgba(245,158,11,0.08),transparent_35%),radial-gradient(circle_at_bottom_right,rgba(245,158,11,0.05),transparent_32%)]" />
      <div className="relative w-full max-w-5xl overflow-hidden border border-neutral-800 bg-[#0f0f0f] shadow-2xl">
        <div className="grid lg:grid-cols-[1.15fr_0.85fr]">
          {/* Hero panel */}
          <div className="hidden min-h-full flex-col justify-between border-r border-neutral-800 bg-[#0a0a0a] p-8 lg:flex">
            <div>
              <p className="font-mono text-[10px] uppercase tracking-[0.24em] text-neutral-500">
                {t('auth.heroTagline')}
              </p>
              <h1 className="mt-6 max-w-md font-serif text-5xl italic leading-tight text-white">
                {t('auth.heroTitle')}
              </h1>
              <p className="mt-6 max-w-lg font-mono text-xs leading-7 text-neutral-400">
                {t('auth.heroDescription')}
              </p>
            </div>

            <div className="grid gap-3 sm:grid-cols-2">
              {[
                [t('auth.benefitOrderDisciplineTitle'), t('auth.benefitOrderDisciplineDesc')],
                [t('auth.benefitCatalogConfidenceTitle'), t('auth.benefitCatalogConfidenceDesc')],
                [t('auth.benefitAccessControlTitle'), t('auth.benefitAccessControlDesc')],
                [t('auth.benefitAtelierDarkTitle'), t('auth.benefitAtelierDarkDesc')],
              ].map(([label, copy]) => (
                <div key={label} className="border border-neutral-800 p-4">
                  <p className="font-mono text-[10px] uppercase tracking-widest text-neutral-200">
                    {label}
                  </p>
                  <p className="mt-1.5 font-mono text-[10px] leading-relaxed text-neutral-500">
                    {copy}
                  </p>
                </div>
              ))}
            </div>
          </div>

          {/* Form panel */}
          <div className="px-5 py-6 md:px-8 md:py-10">
            <div className="mb-8 flex items-center gap-4">
              <div className="flex h-12 w-12 items-center justify-center border border-amber-500/20 bg-amber-500/10 text-amber-500">
                <Store className="h-6 w-6" />
              </div>
              <div>
                <p className="font-mono text-[10px] uppercase tracking-[0.2em] text-neutral-500">
                  {t('auth.adminDashboard')}
                </p>
                <h1 className="mt-1 font-serif text-3xl italic text-white">{t('auth.loginTitle')}</h1>
              </div>
            </div>

            <form onSubmit={handleSubmit(onSubmit)} className="space-y-5" noValidate>
              {serverError && (
                <div
                  role="alert"
                  className="flex items-start gap-3 border border-red-400/30 bg-red-400/5 px-4 py-3.5 font-mono text-xs text-red-400"
                >
                  <AlertCircle className="mt-0.5 h-4 w-4 flex-shrink-0" />
                  <span>{serverError}</span>
                </div>
              )}

              <div className="space-y-2">
                <label
                  htmlFor="email"
                  className="block font-mono text-[10px] uppercase tracking-[0.15em] text-neutral-400"
                >
                  {t('auth.emailLabel')}
                </label>
                <input
                  id="email"
                  type="email"
                  autoComplete="email"
                  className="w-full border border-neutral-700 bg-[#0a0a0a] px-3 py-2.5 font-mono text-sm text-neutral-200 placeholder:text-neutral-600 focus:border-amber-500 focus:outline-none"
                  {...register('email')}
                />
                {errors.email && (
                  <span id="email-error" className="block font-mono text-xs text-red-400" role="alert">
                    {errors.email.message}
                  </span>
                )}
              </div>

              <div className="space-y-2">
                <label
                  htmlFor="password"
                  className="block font-mono text-[10px] uppercase tracking-[0.15em] text-neutral-400"
                >
                  {t('auth.passwordLabel')}
                </label>
                <div className="relative">
                  <input
                    id="password"
                    type={showPassword ? 'text' : 'password'}
                    autoComplete="current-password"
                    className="w-full border border-neutral-700 bg-[#0a0a0a] px-3 py-2.5 font-mono text-sm text-neutral-200 placeholder:text-neutral-600 focus:border-amber-500 focus:outline-none"
                    {...register('password')}
                  />
                  <button
                    type="button"
                    className="absolute right-3 top-1/2 -translate-y-1/2 cursor-pointer p-1 text-neutral-500 transition-colors hover:text-white"
                    onClick={() => setShowPassword((v) => !v)}
                    aria-label={showPassword ? t('auth.hidePassword') : t('auth.showPassword')}
                  >
                    {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                  </button>
                </div>
                {errors.password && (
                  <span id="password-error" className="block font-mono text-xs text-red-400" role="alert">
                    {errors.password.message}
                  </span>
                )}
              </div>

              <button
                type="submit"
                disabled={isSubmitting}
                className="w-full cursor-pointer bg-white px-5 py-3 font-mono text-xs font-bold uppercase tracking-widest text-black transition-colors hover:bg-neutral-200 disabled:cursor-not-allowed disabled:opacity-50"
              >
                {isSubmitting ? t('auth.signingIn') : t('auth.signIn')}
              </button>
            </form>

            <div className="mt-8 border border-neutral-800 bg-[#0a0a0a] px-4 py-4 font-mono text-[10px] leading-6 text-neutral-500">
              {t('auth.loginFooter')}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
