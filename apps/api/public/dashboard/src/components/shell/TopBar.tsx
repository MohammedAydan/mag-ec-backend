import { LogOut, Menu, RefreshCw } from 'lucide-react';
import { useEffect, useCallback } from 'react';
import { useQueryClient } from '@tanstack/react-query';
import { useAuth } from '@/lib/auth';
import { useToast } from '@/lib/toast';
import { useT } from '@/lib/i18n';

interface TopBarProps {
  onMenuToggle: () => void;
}

export function TopBar({ onMenuToggle }: TopBarProps) {
  const { user, logout } = useAuth();
  const queryClient = useQueryClient();
  const { addToast } = useToast();
  const { t } = useT();

  const handleKeyDown = useCallback(
    (event: KeyboardEvent) => {
      if ((event.ctrlKey || event.metaKey) && event.key === 'k') {
        event.preventDefault();
        onMenuToggle();
      }
    },
    [onMenuToggle],
  );

  useEffect(() => {
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [handleKeyDown]);

  const handleExportReport = () => {
    const csvData =
      'data:text/csv;charset=utf-8,Section,Metric,Value\nOperations,Active Status,Running\nOperations,API Endpoint,/api/v1\n';
    const encodedUri = encodeURI(csvData);
    const link = document.createElement('a');
    link.setAttribute('href', encodedUri);
    link.setAttribute('download', `atelier_system_report_${new Date().toISOString().slice(0, 10)}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    addToast(t('topbar.reportGenerated'));
  };

  const now = new Date();
  const timeString = now.toLocaleTimeString('en-US', {
    hour: '2-digit',
    minute: '2-digit',
    hour12: true,
    timeZoneName: 'short',
  });

  return (
    <header
      className="sticky top-0 z-20 flex h-[80px] items-center justify-between border-b border-neutral-800 bg-[#050505]/80 px-6 backdrop-blur-md md:px-10"
      role="banner"
    >
      <div className="flex items-center gap-4">
        <button
          onClick={onMenuToggle}
          className="cursor-pointer text-neutral-400 hover:text-white lg:hidden"
          aria-label={`${t('topbar.toggleNav')} (Ctrl+K)`}
        >
          <Menu className="h-5 w-5" />
        </button>
        <div className="hidden items-center gap-3 sm:flex">
          <span className="font-serif text-2xl italic tracking-wider text-white uppercase">
            {t('topbar.commandCenter')}
          </span>
        </div>
      </div>

      <div className="flex items-center gap-6">
        <button
          onClick={() => {
            void queryClient.invalidateQueries();
            addToast(t('topbar.dataRefreshed'), 'info');
          }}
          className="hidden cursor-pointer items-center gap-1.5 font-mono text-[10px] uppercase tracking-widest text-neutral-500 transition-colors hover:text-white md:flex"
          aria-label={t('topbar.refreshData')}
        >
          <RefreshCw className="h-3.5 w-3.5" />
          {t('topbar.refresh')}
        </button>

        <div className="hidden text-right md:block">
          <p className="font-mono text-[9px] uppercase tracking-widest text-neutral-500">{t('topbar.lastSync')}</p>
          <p className="font-mono text-xs text-neutral-300">{timeString}</p>
        </div>

        <div className="hidden h-8 w-px bg-neutral-800 md:block" />

        <button
          onClick={handleExportReport}
          className="hidden cursor-pointer rounded-sm bg-white px-5 py-2.5 font-mono text-[10px] font-bold uppercase tracking-widest text-black shadow-md transition-colors hover:bg-neutral-200 md:block"
        >
          {t('topbar.generateReport')}
        </button>

        <div className="hidden h-8 w-px bg-neutral-800 md:block" />

        {user && (
          <button
            onClick={() => void logout()}
            className="flex cursor-pointer items-center gap-2 font-mono text-[10px] uppercase tracking-widest text-neutral-500 transition-colors hover:text-red-400"
            aria-label={t('topbar.signOutAria')}
          >
            <div className="flex h-8 w-8 items-center justify-center border border-neutral-800 bg-neutral-900 font-mono text-xs font-bold text-amber-500">
              {(user.displayName ?? user.email ?? 'A').charAt(0).toUpperCase()}
            </div>
            <span className="hidden md:inline">{t('topbar.signOut')}</span>
            <LogOut className="h-3.5 w-3.5 md:hidden" />
          </button>
        )}
      </div>
    </header>
  );
}
