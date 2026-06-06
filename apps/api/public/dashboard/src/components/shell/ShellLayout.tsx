import { useState } from 'react';
import { Outlet } from 'react-router-dom';
import { Sidebar } from './Sidebar';
import { TopBar } from './TopBar';
import { useT } from '@/lib/i18n';

export function ShellLayout() {
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const { dir } = useT();
  const isRtl = dir === 'rtl';

  return (
    <div className="relative flex min-h-screen flex-col bg-[#050505] text-[#d4d4d4] antialiased md:flex-row">
      <Sidebar open={sidebarOpen} onClose={() => setSidebarOpen(false)} />
      <div className={`flex min-w-0 flex-1 flex-col ${isRtl ? 'lg:pr-[280px]' : 'lg:pl-[280px]'}`}>
        <TopBar onMenuToggle={() => setSidebarOpen((v) => !v)} />
        <main
          className="mx-auto w-full max-w-[1400px] flex-1 px-6 pb-10 pt-6 md:px-8 lg:px-12"
          id="main-content"
        >
          <Outlet />
        </main>
      </div>
    </div>
  );
}
