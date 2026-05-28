import { LogOut, Menu, MoonStar, RefreshCw, SunMedium } from 'lucide-react';
import { useEffect, useState } from 'react';
import { useQueryClient } from '@tanstack/react-query';
import { useAuth } from '@/lib/auth';
import styles from './TopBar.module.css';

const THEME_KEY = 'atelier.admin.theme';

export function TopBar({ onMenuClick }: { onMenuClick: () => void }) {
  const { user, logout } = useAuth();
  const queryClient = useQueryClient();
  const [theme, setTheme] = useState(() => localStorage.getItem(THEME_KEY) || 'studio');

  useEffect(() => {
    document.documentElement.dataset.theme = theme;
    localStorage.setItem(THEME_KEY, theme);
  }, [theme]);

  return (
    <header className={styles.topbar} role="banner">
      <div className={styles.left}>
        <button className={styles.menuBtn} onClick={onMenuClick} aria-label="Toggle navigation">
          <Menu size={20} />
        </button>
        <div className={styles.brandText}>
          <strong>Command Center</strong>
          <span>Commerce operations</span>
        </div>
      </div>
      <div className={styles.center}>
        <button
          className={styles.searchTrigger}
          type="button"
          onClick={() => void queryClient.invalidateQueries()}
          aria-label="Refresh operational data"
        >
          <RefreshCw size={16} />
          <span>Refresh dashboard data</span>
        </button>
      </div>
      <div className={styles.right}>
        <button
          className={styles.themeBtn}
          type="button"
          onClick={() => setTheme((current) => current === 'studio' ? 'luxury-dark' : 'studio')}
          aria-label="Switch theme"
        >
          {theme === 'studio' ? <MoonStar size={17} /> : <SunMedium size={17} />}
        </button>
        <div className={styles.userSection}>
          <div className={styles.avatar} aria-hidden>
            {user ? (user.displayName ?? user.email)[0].toUpperCase() : '?'}
          </div>
          <div className={styles.userDetails}>
            <span className={styles.userName}>{user?.displayName ?? user?.email ?? 'Admin'}</span>
            <span className={styles.userRole}>Administrator</span>
          </div>
          <button className={styles.logoutBtn} onClick={() => void logout()} aria-label="Sign out" title="Sign out">
            <LogOut size={16} />
          </button>
        </div>
      </div>
    </header>
  );
}
