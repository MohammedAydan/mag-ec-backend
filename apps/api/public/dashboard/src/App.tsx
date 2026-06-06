import { HashRouter, Navigate, Route, Routes } from 'react-router-dom';
import { TranslationProvider } from '@/lib/i18n';
import en from '@/locales/en.json';
import ar from '@/locales/ar.json';
import { useAuth } from '@/lib/auth';
import { ShellLayout } from '@/components/shell/ShellLayout';
import { LoginPage } from '@/pages/LoginPage';
import { HomePage } from '@/pages/HomePage';
import { OrdersPage } from '@/pages/OrdersPage';
import { OrderDetailPage } from '@/pages/OrderDetailPage';
import { CatalogPage } from '@/pages/CatalogPage';
import { ProductDetailPage } from '@/pages/ProductDetailPage';
import { TaxonomyPage } from '@/pages/TaxonomyPage';
import { InventoryPage } from '@/pages/InventoryPage';
import { PricingPage } from '@/pages/PricingPage';
import { FulfillmentPage } from '@/pages/FulfillmentPage';
import { PaymentsPage } from '@/pages/PaymentsPage';
import { ReviewsPage } from '@/pages/ReviewsPage';
import { NotificationsPage } from '@/pages/NotificationsPage';
import { ReportsPage } from '@/pages/ReportsPage';
import { ContentPage } from '@/pages/ContentPage';
import { StaffPage } from '@/pages/StaffPage';
import { SystemPage } from '@/pages/SystemPage';
import { LoadingScreen } from '@/components/ui/LoadingScreen';

function ProtectedRoute({ children }: { children: React.ReactNode }) {
  const { isAuthenticated, isLoading } = useAuth();
  if (isLoading) return <LoadingScreen />;
  if (!isAuthenticated) return <Navigate to="/login" replace />;
  return <>{children}</>;
}

export function App() {
  return (
    <TranslationProvider translations={{ en, ar }}>
    <HashRouter>
      <Routes>
        <Route path="/login" element={<LoginPage />} />
        <Route
          path="/*"
          element={
            <ProtectedRoute>
              <ShellLayout />
            </ProtectedRoute>
          }
        >
          <Route index element={<Navigate to="/home" replace />} />
          <Route path="home" element={<HomePage />} />
          <Route path="orders" element={<OrdersPage />} />
          <Route path="orders/:orderId" element={<OrderDetailPage />} />
          <Route path="catalog" element={<CatalogPage />} />
          <Route path="catalog/:productId" element={<ProductDetailPage />} />
          <Route path="taxonomy" element={<TaxonomyPage />} />
          <Route path="pricing" element={<PricingPage />} />
          <Route path="inventory" element={<InventoryPage />} />
          <Route path="payments" element={<PaymentsPage />} />
          <Route path="fulfillment" element={<FulfillmentPage />} />
          <Route path="reviews" element={<ReviewsPage />} />
          <Route path="notifications" element={<NotificationsPage />} />
          <Route path="staff" element={<StaffPage />} />
          <Route path="reports" element={<ReportsPage />} />
          <Route path="content" element={<ContentPage />} />
          <Route path="system" element={<SystemPage />} />
          <Route path="*" element={<Navigate to="/home" replace />} />
        </Route>
      </Routes>
    </HashRouter>
    </TranslationProvider>
  );
}
