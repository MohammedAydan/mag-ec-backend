import { Store } from 'lucide-react';
import styles from './LoadingScreen.module.css';

export function LoadingScreen() {
  return (
    <div className={styles.screen} role="status" aria-label="Loading">
      <div className={styles.pulse}>
        <Store size={32} />
      </div>
      <p className={styles.label}>Commerce Command Studio</p>
    </div>
  );
}
