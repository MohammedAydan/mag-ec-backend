import { Outlet } from 'react-router-dom';
import { useState } from 'react';
import { NavRail } from './NavRail';
import { TopBar } from './TopBar';
import styles from './ShellLayout.module.css';

export function ShellLayout() {
  const [navExpanded, setNavExpanded] = useState(false);

  return (
    <div className={styles.shell}>
      <NavRail expanded={navExpanded} onToggle={() => setNavExpanded((v) => !v)} />
      {navExpanded && (
        <div className={styles.overlay} onClick={() => setNavExpanded(false)} aria-hidden />
      )}
      <div className={styles.main}>
        <TopBar onMenuClick={() => setNavExpanded((v) => !v)} />
        <main className={styles.content} id="main-content">
          <Outlet />
        </main>
      </div>
    </div>
  );
}
