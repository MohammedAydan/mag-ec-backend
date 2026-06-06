import { NavLink } from 'react-router-dom';
import {
  BarChart3,
  Bell,
  Boxes,
  ClipboardList,
  CreditCard,
  FileText,
  Globe,
  HelpCircle,
  Layers,
  LayoutDashboard,
  Package,
  Palette,
  ShieldCheck,
  ShoppingCart,
  Tag,
  Truck,
  Users,
  X,
} from 'lucide-react';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';

interface SidebarProps {
  open: boolean;
  onClose: () => void;
}

export function Sidebar({ open, onClose }: SidebarProps) {
  const { user } = useAuth();
  const { t, locale, setLocale } = useT();

  const GROUPS = [
    {
      label: t('sidebar.groups.operate'),
      items: [
        { to: '/home', icon: LayoutDashboard, label: t('sidebar.nav.overview') },
        { to: '/orders', icon: ShoppingCart, label: t('sidebar.nav.orders') },
        { to: '/fulfillment', icon: Truck, label: t('sidebar.nav.fulfillment') },
      ],
    },
    {
      label: t('sidebar.groups.catalog'),
      items: [
        { to: '/catalog', icon: Package, label: t('sidebar.nav.catalog') },
        { to: '/taxonomy', icon: Tag, label: t('sidebar.nav.taxonomy') },
        { to: '/pricing', icon: CreditCard, label: t('sidebar.nav.pricing') },
        { to: '/inventory', icon: Boxes, label: t('sidebar.nav.inventory') },
      ],
    },
    {
      label: t('sidebar.groups.payments'),
      items: [
        { to: '/payments', icon: CreditCard, label: t('sidebar.nav.payments') },
      ],
    },
    {
      label: t('sidebar.groups.engage'),
      items: [
        { to: '/reviews', icon: ClipboardList, label: t('sidebar.nav.reviews') },
        { to: '/notifications', icon: Bell, label: t('sidebar.nav.notifications') },
        { to: '/reports', icon: BarChart3, label: t('sidebar.nav.reports') },
      ],
    },
    {
      label: t('sidebar.groups.manage'),
      items: [
        { to: '/staff', icon: Users, label: t('sidebar.nav.staff') },
        { to: '/content', icon: FileText, label: t('sidebar.nav.content') },
      ],
    },
    {
      label: t('sidebar.groups.system'),
      items: [
        { to: '/system', icon: ShieldCheck, label: t('sidebar.nav.system') },
      ],
    },
  ];

  return (
    <>
      {/* Mobile overlay */}
      {open && (
        <div
          className="fixed inset-0 z-30 bg-black/60 backdrop-blur-sm lg:hidden"
          onClick={onClose}
          aria-hidden
        />
      )}

      <aside
        className={`fixed inset-y-0 z-40 flex w-[280px] shrink-0 flex-col border-neutral-800 bg-[#0a0a0a] transition-transform duration-300 lg:translate-x-0 ${
          locale === 'ar' ? 'right-0 border-l lg:translate-x-0' : 'left-0 border-r'
        } ${
          open ? 'translate-x-0' : locale === 'ar' ? 'translate-x-full' : '-translate-x-full'
        }`}
      >
        {/* Brand header */}
        <div className="flex items-center justify-between gap-4 px-6 py-5">
          <div className="flex items-center gap-4">
            <div className="flex h-10 w-10 shrink-0 items-center justify-center border border-neutral-800 bg-[#0f0f0f]">
              <Layers className="h-5 w-5 text-white" />
            </div>
            <div>
              <h1 className="font-serif text-xl italic tracking-widest text-white uppercase">
                {t('sidebar.brand')}
              </h1>
              <p className="mt-0.5 font-mono text-[10px] uppercase tracking-[0.25em] text-neutral-500">
                {t('sidebar.tagline')}
              </p>
            </div>
          </div>
          <button
            onClick={onClose}
            className="cursor-pointer text-neutral-500 hover:text-white lg:hidden"
            aria-label={t('sidebar.closeNav')}
          >
            <X className="h-5 w-5" />
          </button>
        </div>

        {/* Operating frame hint */}
        <div className="mx-5 mb-1 rounded-sm border border-neutral-800 bg-[#0f0f0f]/50 px-4 py-3">
          <p className="font-mono text-[10px] font-semibold uppercase tracking-[0.22em] text-neutral-500">
            {t('sidebar.operatingFrame')}
          </p>
          <p className="mt-1 text-xs leading-5 text-neutral-400">
            {t('sidebar.operatingHint')}
          </p>
        </div>

        {/* Divider */}
        <div className="mx-5 my-4 h-px bg-neutral-800" />

        {/* Navigation */}
        <nav className="flex-1 space-y-5 overflow-y-auto px-3 py-1" aria-label="Primary navigation">
          {GROUPS.map((group) => (
            <section key={group.label} aria-label={group.label}>
              <p className="mb-2 px-3 font-mono text-[10px] font-semibold uppercase tracking-[0.22em] text-neutral-500">
                {group.label}
              </p>
              <ul role="list" className="space-y-0.5">
                {group.items.map(({ to, icon: Icon, label }) => (
                  <li key={to}>
                    <NavLink to={to} onClick={onClose} className="block">
                      {({ isActive }: { isActive: boolean }) => (
                        <span
                          className={`flex w-full items-center gap-3 px-4 py-2.5 text-sm font-medium transition-all ${
                            locale === 'ar' ? 'border-r-2' : 'border-l-2'
                          } ${
                            isActive
                              ? 'border-amber-500 bg-neutral-800/50 text-white'
                              : 'border-transparent text-neutral-500 hover:bg-neutral-800/30 hover:text-white'
                          }`}
                        >
                          <span
                            className={`h-2 w-2 shrink-0 rounded-full ${
                              isActive ? 'bg-amber-500' : 'border border-neutral-600'
                            }`}
                          />
                          <Icon className="h-4 w-4 shrink-0" aria-hidden />
                          <span>{label}</span>
                        </span>
                      )}
                    </NavLink>
                  </li>
                ))}
              </ul>
            </section>
          ))}
        </nav>

        {/* Bottom utility */}
        <div className="mx-5 mb-1 h-px bg-neutral-800" />
        <div className="space-y-0.5 px-5 pb-2 pt-2">
          <div className="flex cursor-pointer items-center gap-3 rounded-sm px-4 py-2.5 font-mono text-xs text-neutral-500 transition-colors hover:bg-neutral-800/30 hover:text-white">
            <Palette className="h-4 w-4 shrink-0" />
            <span>{t('sidebar.appearance')}</span>
          </div>
          <div className="flex cursor-pointer items-center gap-3 rounded-sm px-4 py-2.5 font-mono text-xs text-neutral-500 transition-colors hover:bg-neutral-800/30 hover:text-white">
            <HelpCircle className="h-4 w-4 shrink-0" />
            <span>{t('sidebar.helpSuite')}</span>
          </div>
        </div>

        {/* Language switcher */}
        <div className="mx-5 mb-1 h-px bg-neutral-800" />
        <div className="px-5 pb-3 pt-2">
          <button
            onClick={() => setLocale(locale === 'en' ? 'ar' : 'en')}
            className="flex w-full cursor-pointer items-center gap-3 rounded-sm px-4 py-2.5 font-mono text-xs text-neutral-500 transition-colors hover:bg-neutral-800/30 hover:text-white"
            aria-label={t('language.switchLanguage')}
          >
            <Globe className="h-4 w-4 shrink-0" />
            <span className="flex-1 text-start">{t('language.switchLanguage')}</span>
            <span className="font-mono text-[10px] uppercase tracking-widest text-amber-500">
              {locale === 'en' ? 'AR' : 'EN'}
            </span>
          </button>
        </div>

        {/* User profile */}
        {user && (
          <div className="mx-3 mb-3 mt-1">
            <div className="flex items-center gap-3 rounded-sm border border-neutral-800 bg-[#0f0f0f]/50 px-4 py-3">
              <div className="flex h-8 w-8 shrink-0 items-center justify-center border border-neutral-700 bg-neutral-800 font-mono text-xs font-bold text-amber-500">
                {(user.displayName ?? user.email ?? 'A').charAt(0).toUpperCase()}
              </div>
              <div className="min-w-0">
                <span className="block truncate text-sm font-medium text-neutral-200">
                  {user.displayName ?? user.email}
                </span>
                <span className="block font-mono text-[10px] uppercase tracking-wider text-neutral-500">
                  {t('sidebar.administrator')}
                </span>
              </div>
            </div>
          </div>
        )}
      </aside>
    </>
  );
}
