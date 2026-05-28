import { NavLink } from 'react-router-dom';
import {
  BarChart3, Bell, Boxes, ClipboardList, CreditCard, FileText, LayoutDashboard,
  Package, Settings, ShieldCheck, ShoppingCart, Store, Tag, Truck, Users, X,
} from 'lucide-react';
import { useAuth } from '@/lib/auth';
import styles from './NavRail.module.css';

const GROUPS = [
  {
    label: 'Operate',
    items: [
      { to: '/home', icon: LayoutDashboard, label: 'Overview' },
      { to: '/orders', icon: ShoppingCart, label: 'Orders' },
      { to: '/fulfillment', icon: Truck, label: 'Fulfillment & returns' },
    ],
  },
  {
    label: 'Sell',
    items: [
      { to: '/catalog', icon: Package, label: 'Catalog' },
      { to: '/taxonomy', icon: Tag, label: 'Taxonomy' },
      { to: '/pricing', icon: CreditCard, label: 'Pricing & promotions' },
      { to: '/inventory', icon: Boxes, label: 'Inventory' },
    ],
  },
  {
    label: 'Engage & finance',
    items: [
      { to: '/payments', icon: CreditCard, label: 'Payments' },
      { to: '/reviews', icon: ClipboardList, label: 'Reviews' },
      { to: '/notifications', icon: Bell, label: 'Notifications' },
      { to: '/reports', icon: BarChart3, label: 'Analytics & exports' },
    ],
  },
  {
    label: 'Govern',
    items: [
      { to: '/staff', icon: Users, label: 'Staff & access' },
      { to: '/content', icon: FileText, label: 'Content & audit' },
      { to: '/system', icon: ShieldCheck, label: 'System' },
    ],
  },
];

interface NavRailProps {
  expanded: boolean;
  onToggle: () => void;
}

export function NavRail({ expanded, onToggle }: NavRailProps) {
  const { user } = useAuth();

  return (
    <nav className={`${styles.rail} ${expanded ? styles.expanded : ''}`} aria-label="Primary navigation">
      <div className={styles.header}>
        <div className={styles.logo}>
          <Store size={22} />
          <span className={styles.logoText}>Atelier<br />Commerce</span>
        </div>
        <button className={styles.closeBtn} onClick={onToggle} aria-label="Close navigation">
          <X size={18} />
        </button>
      </div>
      <div className={styles.navList}>
        {GROUPS.map((group) => (
          <section key={group.label} aria-label={group.label}>
            <p className={styles.groupLabel}>{group.label}</p>
            <ul role="list">
              {group.items.map(({ to, icon: Icon, label }) => (
                <li key={to}>
                  <NavLink
                    to={to}
                    className={({ isActive }) => `${styles.navItem} ${isActive ? styles.active : ''}`}
                    title={label}
                  >
                    <Icon size={20} aria-hidden className={styles.navIcon} />
                    <span className={styles.navLabel}>{label}</span>
                  </NavLink>
                </li>
              ))}
            </ul>
          </section>
        ))}
      </div>
      <div className={styles.bottom}>
        <div className={styles.divider} />
        <NavLink to="/system" className={({ isActive }) => `${styles.navItem} ${isActive ? styles.active : ''}`}>
          <Settings size={20} aria-hidden className={styles.navIcon} />
          <span className={styles.navLabel}>Settings</span>
        </NavLink>
        {user && (
          <div className={styles.userChip}>
            <div className={styles.avatar} aria-hidden>{(user.displayName ?? user.email)[0].toUpperCase()}</div>
            <div className={styles.userInfo}>
              <span className={styles.userName}>{user.displayName ?? user.email}</span>
              <span className={styles.userRole}>Administrator</span>
            </div>
          </div>
        )}
      </div>
    </nav>
  );
}
