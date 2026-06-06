export interface Product {
  id: string;
  sku: string;
  name: string;
  category: string;
  stock: number;
  price: number;
  status: 'Live' | 'Low Stock' | 'Out of Stock' | 'Draft';
  imageUrl?: string;
  createdAt: string;
}

export interface Order {
  id: string;
  orderNumber: string;
  customerName: string;
  customerEmail: string;
  placedAt: string;
  fulfillmentStatus: 'Processing' | 'Shipped' | 'Pending' | 'Cancelled';
  paymentStatus: 'Paid' | 'Unpaid';
  paymentMethod: string;
  totalAmount: number;
  itemsCount: number;
}

export interface Customer {
  id: string;
  displayName: string;
  email: string;
  totalOrders: number;
  lifetimeValue: number;
  lastActivityAt: string;
  tier: 'VIP' | 'Regular' | 'New';
  avatarUrl?: string;
}

export interface StoreSettings {
  storeName: string;
  contactEmail: string;
  defaultCurrency: 'USD' | 'EUR' | 'GBP';
  timezone: string;
  maintenanceMode: boolean;
}

export interface SalesSummary {
  totalRevenue: number;
  activeOrders: number;
  conversionRate: number;
  lowStockAlerts: number;
}
