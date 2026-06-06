import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'motion/react';
import {
  LayoutDashboard,
  Inbox,
  ShoppingCart,
  Users,
  Settings,
  Palette,
  HelpCircle,
  Search,
  Bell,
  TrendingUp,
  AlertTriangle,
  Download,
  Plus,
  Filter,
  Check,
  X,
  CreditCard,
  Layers,
  Globe,
  DollarSign,
  ChevronLeft,
  ChevronRight,
  MoreVertical,
  Activity,
  ArrowUp,
  CheckCircle,
  UserCheck,
  ToggleLeft,
  ToggleRight
} from 'lucide-react';
import { Product, Order, Customer, StoreSettings } from './types';

export default function App() {
  // Navigation State
  const [activeTab, setActiveTab] = useState<'overview' | 'catalog' | 'orders' | 'customers' | 'settings'>('overview');

  // Backend States
  const [products, setProducts] = useState<Product[]>([]);
  const [orders, setOrders] = useState<Order[]>([]);
  const [customers, setCustomers] = useState<Customer[]>([]);
  const [settings, setSettings] = useState<StoreSettings>({
    storeName: 'Atelier',
    contactEmail: 'operations@atelier-suite.com',
    defaultCurrency: 'USD',
    timezone: 'UTC (GMT+0)',
    maintenanceMode: false
  });
  const [reportSummary, setReportSummary] = useState({
    totalRevenue: 5120.00,
    activeOrders: 86,
    conversionRate: 3.2,
    lowStockAlerts: 5
  });
  const [revenueHistory, setRevenueHistory] = useState<{ label: string; value: number }[]>([]);

  // UI Management States
  const [loading, setLoading] = useState(true);
  const [toasts, setToasts] = useState<{ id: string; message: string; type: 'success' | 'error' | 'info' }[]>([]);
  
  // Drawer / Modal States
  const [isProductDrawerOpen, setIsProductDrawerOpen] = useState(false);
  const [isOrderDrawerOpen, setIsOrderDrawerOpen] = useState(false);
  const [isCustomerDrawerOpen, setIsCustomerDrawerOpen] = useState(false);

  // Search & Filter States
  const [catalogSearch, setCatalogSearch] = useState('');
  const [catalogStatusFilter, setCatalogStatusFilter] = useState<string>('all');
  
  const [orderSearch, setOrderSearch] = useState('');
  const [orderFulfillmentFilter, setOrderFulfillmentFilter] = useState<string>('all');
  const [orderAmountMin, setOrderAmountMin] = useState('');
  const [orderAmountMax, setOrderAmountMax] = useState('');

  const [customerSearch, setCustomerSearch] = useState('');
  const [customerTierFilter, setCustomerTierFilter] = useState<string>('all');

  // Form States
  const [newProductForm, setNewProductForm] = useState({
    name: '',
    sku: '',
    category: 'Apparel',
    stock: 10,
    price: 150,
    status: 'Live' as 'Live' | 'Low Stock' | 'Out of Stock' | 'Draft',
    imageUrl: ''
  });

  const [newOrderForm, setNewOrderForm] = useState({
    customerName: '',
    customerEmail: '',
    paymentMethod: 'Credit Card',
    totalAmount: 120.00,
    itemsCount: 1
  });

  const [newCustomerForm, setNewCustomerForm] = useState({
    displayName: '',
    email: '',
    tier: 'New' as 'VIP' | 'Regular' | 'New',
    avatarUrl: ''
  });

  const [settingsForm, setSettingsForm] = useState<StoreSettings>({
    storeName: '',
    contactEmail: '',
    defaultCurrency: 'USD',
    timezone: '',
    maintenanceMode: false
  });

  // Fetching Helpers
  const addToast = (message: string, type: 'success' | 'error' | 'info' = 'success') => {
    const id = Date.now().toString();
    setToasts(prev => [...prev, { id, message, type }]);
    setTimeout(() => {
      setToasts(prev => prev.filter(t => t.id !== id));
    }, 4000);
  };

  const fetchData = async () => {
    try {
      const [prodRes, ordRes, custRes, setRes, repRes, revRes] = await Promise.all([
        fetch('/api/v1/catalog/admin/products'),
        fetch('/api/v1/orders/admin'),
        fetch('/api/v1/identity/admin/customers'),
        fetch('/api/v1/pricing/admin/settings'),
        fetch('/api/v1/reports/admin/sales-summary'),
        fetch('/api/v1/reports/admin/revenue-history')
      ]);

      if (prodRes.ok) {
        const data = await prodRes.json();
        setProducts(data.items);
      }
      if (ordRes.ok) {
        const data = await ordRes.json();
        setOrders(data.items);
      }
      if (custRes.ok) {
        const data = await custRes.json();
        setCustomers(data.items);
      }
      if (setRes.ok) {
        const data = await setRes.json();
        setSettings(data);
        setSettingsForm(data);
      }
      if (repRes.ok) {
        const data = await repRes.json();
        setReportSummary(data);
      }
      if (revRes.ok) {
        const data = await revRes.json();
        setRevenueHistory(data);
      }
    } catch (err) {
      console.error('Error fetching dashboard data:', err);
      addToast('Failed to sync state with core APIs', 'error');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  // API Call: Add Product
  const handleCreateProduct = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const res = await fetch('/api/v1/catalog/admin/products', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(newProductForm)
      });
      if (res.ok) {
        const created = await res.json();
        setProducts(prev => [created, ...prev]);
        setIsProductDrawerOpen(false);
        addToast(`Product "${created.name}" created successfully`);
        // Reset form
        setNewProductForm({
          name: '',
          sku: '',
          category: 'Apparel',
          stock: 10,
          price: 150,
          status: 'Live',
          imageUrl: ''
        });
        // re-fetch stats
        fetch('/api/v1/reports/admin/sales-summary')
          .then(r => r.json())
          .then(data => setReportSummary(data));
      } else {
        const error = await res.json();
        addToast(error.error || 'Failed to create product', 'error');
      }
    } catch (err) {
      addToast('Network error while saving product', 'error');
    }
  };

  // API Call: Create Order
  const handleCreateOrder = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const res = await fetch('/api/v1/orders/admin', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(newOrderForm)
      });
      if (res.ok) {
        const created = await res.json();
        setOrders(prev => [created, ...prev]);
        setIsOrderDrawerOpen(false);
        addToast(`Order ${created.orderNumber} successfully registered`);
        setNewOrderForm({
          customerName: '',
          customerEmail: '',
          paymentMethod: 'Credit Card',
          totalAmount: 120.00,
          itemsCount: 1
        });
        // refresh counts
        const repRes = await fetch('/api/v1/reports/admin/sales-summary');
        if (repRes.ok) setReportSummary(await repRes.json());
      } else {
        addToast('Failed to create order', 'error');
      }
    } catch (err) {
      addToast('Network error while saving order', 'error');
    }
  };

  // API Call: Register Customer
  const handleCreateCustomer = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const res = await fetch('/api/v1/identity/admin/customers', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(newCustomerForm)
      });
      if (res.ok) {
        const created = await res.json();
        setCustomers(prev => [created, ...prev]);
        setIsCustomerDrawerOpen(false);
        addToast(`Customer ${created.displayName} added to directory`);
        setNewCustomerForm({
          displayName: '',
          email: '',
          tier: 'New',
          avatarUrl: ''
        });
      } else {
        addToast('Failed to add customer', 'error');
      }
    } catch (err) {
      addToast('Network error while saving customer', 'error');
    }
  };

  // API Call: Save Store Settings
  const handleSaveSettings = async () => {
    try {
      const res = await fetch('/api/v1/pricing/admin/settings', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(settingsForm)
      });
      if (res.ok) {
        const updated = await res.json();
        setSettings(updated);
        addToast('Atelier configurations saved successfully');
      } else {
        addToast('Failed to save settings', 'error');
      }
    } catch (err) {
      addToast('Network error saving settings', 'error');
    }
  };

  // Switch Order Status
  const toggleOrderStatus = async (id: string, currentFulfillment: string, currentPayment: string) => {
    const nextFulfill = currentFulfillment === 'Pending' ? 'Processing' : currentFulfillment === 'Processing' ? 'Shipped' : 'Pending';
    const nextPayment = currentPayment === 'Unpaid' ? 'Paid' : 'Unpaid';
    
    try {
      const res = await fetch(`/api/v1/orders/admin/${id}/status`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          fulfillmentStatus: nextFulfill,
          paymentStatus: nextPayment
        })
      });
      if (res.ok) {
        const updated = await res.json() as Order;
        setOrders(prev => prev.map(o => o.id === id ? updated : o));
        addToast(`Order ${updated.orderNumber} updated to ${updated.fulfillmentStatus} / ${updated.paymentStatus}`);
        
        const repRes = await fetch('/api/v1/reports/admin/sales-summary');
        if (repRes.ok) setReportSummary(await repRes.json());
      }
    } catch (err) {
      addToast('Failed to toggle order status', 'error');
    }
  };

  // Quick Action: Delete Product
  const handleDeleteProduct = async (id: string, name: string) => {
    if (!confirm(`Are you sure you want to delete "${name}"?`)) return;
    try {
      const res = await fetch(`/api/v1/catalog/admin/products/${id}`, { method: 'DELETE' });
      if (res.ok) {
        setProducts(prev => prev.filter(p => p.id !== id));
        addToast(`Product "${name}" deleted`);
        
        const repRes = await fetch('/api/v1/reports/admin/sales-summary');
        if (repRes.ok) setReportSummary(await repRes.json());
      }
    } catch (err) {
      addToast('Failed to delete product', 'error');
    }
  };

  // Render Currency Helpers
  const currencySymbol = (code: string) => {
    if (code === 'EUR') return '€';
    if (code === 'GBP') return '£';
    return '$';
  };

  // Filtering Logic
  const filteredProducts = products.filter(p => {
    const matchesSearch = p.name.toLowerCase().includes(catalogSearch.toLowerCase()) || 
                          p.sku.toLowerCase().includes(catalogSearch.toLowerCase());
    const matchesFilter = catalogStatusFilter === 'all' || p.status.toLowerCase() === catalogStatusFilter.toLowerCase();
    return matchesSearch && matchesFilter;
  });

  const filteredOrders = orders.filter(o => {
    const matchesSearch = o.customerName.toLowerCase().includes(orderSearch.toLowerCase()) || 
                          o.orderNumber.toLowerCase().includes(orderSearch.toLowerCase());
    const matchesFulfill = orderFulfillmentFilter === 'all' || o.fulfillmentStatus.toLowerCase() === orderFulfillmentFilter.toLowerCase();
    
    const amount = o.totalAmount;
    const minAmount = orderAmountMin ? parseFloat(orderAmountMin) : 0;
    const maxAmount = orderAmountMax ? parseFloat(orderAmountMax) : Infinity;
    const matchesAmount = amount >= minAmount && amount <= maxAmount;

    return matchesSearch && matchesFulfill && matchesAmount;
  });

  const filteredCustomers = customers.filter(c => {
    const matchesSearch = c.displayName.toLowerCase().includes(customerSearch.toLowerCase()) || 
                          c.email.toLowerCase().includes(customerSearch.toLowerCase());
    const matchesTier = customerTierFilter === 'all' || c.tier.toLowerCase() === customerTierFilter.toLowerCase();
    return matchesSearch && matchesTier;
  });

  return (
    <div className="min-h-screen bg-[#050505] text-[#d4d4d4] font-sans antialiased flex flex-col md:flex-row relative selection:bg-amber-500/20 selection:text-[#fff]">
      
      {/* Top Banners (Maintenance status warning) */}
      {settings.maintenanceMode && (
        <div className="absolute top-0 right-0 left-0 bg-[#A33b3b] text-white py-1.5 px-4 text-xs font-mono tracking-widest text-center z-[100] uppercase">
          ● Suite System Maintenance Mode Active — Customer Access Disabled
        </div>
      )}

      {/* FIXED SIDE NAVIGATION BAR */}
      <aside className="w-full md:w-[280px] bg-[#0a0a0a] border-r border-neutral-800 flex flex-col p-6 md:sticky md:top-0 md:h-screen shrink-0 z-50">
        {/* Editorial Suite Brand Header */}
        <div className="flex items-center gap-4 py-4 mb-10">
          <div className="w-10 h-10 border border-neutral-800 bg-[#0f0f0f] flex items-center justify-center shrink-0">
            <Layers className="text-white w-5 h-5" />
          </div>
          <div>
            <h1 className="text-xl font-serif italic text-white tracking-widest uppercase">
              {settings.storeName || 'Atelier'}
            </h1>
            <p className="text-[10px] text-neutral-500 uppercase tracking-widest mt-1">
              Management Suite
            </p>
          </div>
        </div>

        {/* Tab Controls Navigation List */}
        <nav className="flex-1 space-y-2">
          <button
            onClick={() => setActiveTab('overview')}
            className={`w-full flex items-center gap-3 px-4 py-3 text-sm font-medium transition-all ${
              activeTab === 'overview'
                ? 'bg-neutral-800/50 text-white rounded-lg border-l-2 border-amber-500'
                : 'text-neutral-500 hover:text-white hover:bg-neutral-800/30 rounded-lg border-l-2 border-transparent transition-colors'
            }`}
          >
            <div className={`w-2 h-2 rounded-full ${activeTab === 'overview' ? 'bg-amber-500' : 'border border-neutral-600'}`}></div>
            <span>Overview</span>
          </button>
          
          <button
            onClick={() => setActiveTab('catalog')}
            className={`w-full flex items-center gap-3 px-4 py-3 text-sm font-medium transition-all ${
              activeTab === 'catalog'
                ? 'bg-neutral-800/50 text-white rounded-lg border-l-2 border-amber-500'
                : 'text-neutral-500 hover:text-white hover:bg-neutral-800/30 rounded-lg border-l-2 border-transparent transition-colors'
            }`}
          >
            <div className={`w-2 h-2 rounded-full ${activeTab === 'catalog' ? 'bg-amber-500' : 'border border-neutral-600'}`}></div>
            <span>Catalog</span>
          </button>

          <button
            onClick={() => setActiveTab('orders')}
            className={`w-full flex items-center gap-3 px-4 py-3 text-sm font-medium transition-all ${
              activeTab === 'orders'
                ? 'bg-neutral-800/50 text-white rounded-lg border-l-2 border-amber-500'
                : 'text-neutral-500 hover:text-white hover:bg-neutral-800/30 rounded-lg border-l-2 border-transparent transition-colors'
            }`}
          >
            <div className={`w-2 h-2 rounded-full ${activeTab === 'orders' ? 'bg-amber-500' : 'border border-neutral-600'}`}></div>
            <span>Orders</span>
          </button>

          <button
            onClick={() => setActiveTab('customers')}
            className={`w-full flex items-center gap-3 px-4 py-3 text-sm font-medium transition-all ${
              activeTab === 'customers'
                ? 'bg-neutral-800/50 text-white rounded-lg border-l-2 border-amber-500'
                : 'text-neutral-500 hover:text-white hover:bg-neutral-800/30 rounded-lg border-l-2 border-transparent transition-colors'
            }`}
          >
            <div className={`w-2 h-2 rounded-full ${activeTab === 'customers' ? 'bg-amber-500' : 'border border-neutral-600'}`}></div>
            <span>Customers</span>
          </button>

          <button
            onClick={() => setActiveTab('settings')}
            className={`w-full flex items-center gap-3 px-4 py-3 text-sm font-medium transition-all ${
              activeTab === 'settings'
                ? 'bg-neutral-800/50 text-white rounded-lg border-l-2 border-amber-500'
                : 'text-neutral-500 hover:text-white hover:bg-neutral-800/30 rounded-lg border-l-2 border-transparent transition-colors'
            }`}
          >
            <div className={`w-2 h-2 rounded-full ${activeTab === 'settings' ? 'bg-amber-500' : 'border border-neutral-600'}`}></div>
            <span>System Settings</span>
          </button>
        </nav>

        {/* Bottom Utility Actions */}
        <div className="pt-4 border-t border-neutral-800 space-y-1">
          <div className="flex items-center gap-3 text-xs font-mono text-neutral-500 px-4 py-2 hover:text-white cursor-pointer transition-colors">
            <Palette className="w-4 h-4 shrink-0" />
            <span>Appearance</span>
          </div>
          <div className="flex items-center gap-3 text-xs font-mono text-neutral-500 px-4 py-2 hover:text-white cursor-pointer transition-colors">
            <HelpCircle className="w-4 h-4 shrink-0" />
            <span>Help Suite</span>
          </div>
        </div>
      </aside>

      {/* MAIN SCREEN WRAPPER */}
      <div className="flex-1 flex flex-col min-w-0">
        
        {/* Sticky Top Menu Bar */}
        <header className="sticky top-0 z-40 bg-[#050505]/80 backdrop-blur-md h-[80px] border-b border-neutral-800 flex justify-between items-center px-8 md:px-10">
          <div className="flex items-center gap-4">
            <h2 className="text-2xl font-serif text-white italic uppercase tracking-wider capitalize">
              {activeTab === 'overview' ? 'market intelligence' : `${activeTab} space`}
            </h2>
          </div>
          
          <div className="flex items-center gap-6">
            <div className="text-right hidden md:block">
              <p className="text-[9px] text-neutral-500 uppercase tracking-widest">Last Sync</p>
              <p className="text-xs text-neutral-300 font-mono">09:08 PM GMT</p>
            </div>
            <div className="h-8 w-[1px] bg-neutral-800 hidden md:block"></div>
            
            <button 
              onClick={() => {
                const csvData = "data:text/csv;charset=utf-8,Section,Metric,Value\nDashboard,Total Revenue,5120.00\nDashboard,Active Orders,86\nDashboard,Conversion Rate,3.2";
                const encodedUri = encodeURI(csvData);
                const link = document.createElement("a");
                link.setAttribute("href", encodedUri);
                link.setAttribute("download", `atelier_${activeTab}_report.csv`);
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
                addToast("Atelier report generated and downloaded successfully");
              }}
              className="px-5 py-2.5 bg-white text-black text-xs font-bold uppercase tracking-widest hover:bg-neutral-200 transition-colors rounded-sm shadow-md"
            >
              Generate Report
            </button>
            <div className="h-8 w-8 border border-neutral-800 overflow-hidden cursor-pointer hover:border-white transition-colors">
              <img
                alt="System Administrator Profile"
                className="w-full h-full object-cover"
                src="https://images.unsplash.com/photo-1552058544-f2b08422138a?q=80&w=150&auto=format&fit=crop"
              />
            </div>
          </div>
        </header>

        {/* PRIMARY MAIN CANVAS VIEWPORT */}
        <main className="flex-1 p-8 md:p-12 max-w-[1400px] w-full mx-auto">
          {loading ? (
            <div className="h-96 flex flex-col items-center justify-center gap-4">
              <div className="w-8 h-8 border-t-2 border-[#D4C5A9] rounded-full animate-spin"></div>
              <p className="text-xs font-mono text-[#979085] tracking-widest uppercase">Fetching API data...</p>
            </div>
          ) : (
            <AnimatePresence mode="wait">
              {/* TAB CONTAINER VIEW: OVERVIEW */}
              {activeTab === 'overview' && (
                <motion.div
                  key="overview"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.3 }}
                  className="space-y-12"
                >
                  {/* Bento Header */}
                  <div>
                    <h2 className="text-3xl text-white font-serif italic tracking-tight">Atelier Dashboard</h2>
                    <p className="text-xs font-mono text-neutral-500 tracking-widest uppercase mt-2">
                      Core ecommerce telemetry and systems control
                    </p>
                  </div>

                  {/* Operational Telemetry Grid Cards */}
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                    {/* Stat CARD 1: Revenue */}
                    <div className="bg-[#0f0f0f] border border-neutral-800 p-6 relative overflow-hidden group hover:border-amber-500 transition-all duration-300">
                      <div className="flex justify-between items-start mb-4">
                        <span className="text-[10px] font-mono uppercase tracking-widest text-[#979085]">Total Revenue</span>
                        <span className="text-xs font-mono text-[#979085] bg-neutral-900 px-2 py-0.5 uppercase tracking-widest">Core</span>
                      </div>
                      <div className="text-4xl font-light text-white mb-2">
                        {currencySymbol(settings.defaultCurrency)}
                        {reportSummary.totalRevenue?.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) || '0.00'}
                      </div>
                      <div className="text-[10px] font-mono text-green-400 flex items-center gap-1">
                        <ArrowUp className="w-3 h-3" />
                        <span>+15% vs last month</span>
                      </div>
                    </div>

                    {/* Stat CARD 2: Active Orders */}
                    <div className="bg-[#0f0f0f] border border-neutral-800 p-6 relative overflow-hidden group hover:border-amber-500 transition-all duration-300">
                      <div className="flex justify-between items-start mb-4">
                        <span className="text-[10px] font-mono uppercase tracking-widest text-[#979085]">Active Orders</span>
                        <span className="text-xs font-mono text-[#4ADE80] bg-[#0A1A10] border border-[#143320] px-2 py-0.5 uppercase tracking-widest">LIVE</span>
                      </div>
                      <div className="text-4xl font-light text-white mb-2">
                        {reportSummary.activeOrders || '0'}
                      </div>
                      <div className="text-[10px] font-mono text-[#979085]">
                        Requires active fulfillment dispatch
                      </div>
                    </div>

                    {/* Stat CARD 3: Conversion Rate */}
                    <div className="bg-[#0f0f0f] border border-neutral-800 p-6 relative overflow-hidden group hover:border-amber-500 transition-all duration-300">
                      <div className="flex justify-between items-start mb-4">
                        <span className="text-[10px] font-mono uppercase tracking-widest text-[#979085]">Conversion Rate</span>
                        <span className="text-xs font-mono text-amber-500 bg-[#1C1B1B] px-2 py-0.5 uppercase tracking-widest">Funnel</span>
                      </div>
                      <div className="text-4xl font-light text-white mb-2">
                        {reportSummary.conversionRate || '3.2'}%
                      </div>
                      <div className="text-[10px] font-mono text-green-400 flex items-center gap-1">
                        <ArrowUp className="w-3 h-3" />
                        <span>+0.4% conversion velocity</span>
                      </div>
                    </div>

                    {/* Stat CARD 4: Low Stock Warnings */}
                    <div className="bg-[#0f0f0f] border border-neutral-800 p-6 relative overflow-hidden group hover:border-amber-500 transition-all duration-300">
                      <div className="flex justify-between items-start mb-4">
                        <span className="text-[10px] font-mono uppercase tracking-widest text-[#979085]">Low Stock Warnings</span>
                        <span className="text-xs font-mono text-[#F87171] bg-[#2A080A] border border-[#4A1015] px-2 py-0.5 uppercase tracking-widest">ALERT</span>
                      </div>
                      <div className="text-4xl font-light text-[#F87171] mb-2">
                        {reportSummary.lowStockAlerts || '0'}
                      </div>
                      <div className="text-[10px] font-mono text-[#979085]">
                        Critical action required in Catalog
                      </div>
                    </div>
                  </div>

                  {/* Revenue Growth Editorial SVG Chart */}
                  <div className="bg-[#0f0f0f] border border-neutral-800 p-8 space-y-6">
                    <div className="flex justify-between items-center pb-4 border-b border-neutral-800">
                      <div>
                        <h3 className="text-lg text-white font-serif italic">Revenue Growth</h3>
                        <p className="text-[11px] font-mono text-neutral-500 uppercase tracking-wide mt-1">Simulated metrics across financial cycles</p>
                      </div>
                      <div className="flex gap-1.5">
                        <button className="px-3 py-1 font-mono text-[10px] border border-neutral-800 text-neutral-400 hover:text-white transition-colors">1M</button>
                        <button className="px-3 py-1 font-mono text-[10px] border border-amber-500 text-amber-500 bg-amber-500/5 transition-colors">3M</button>
                        <button className="px-3 py-1 font-mono text-[10px] border border-neutral-800 text-neutral-400 hover:text-white transition-colors">1Y</button>
                      </div>
                    </div>

                    {/* SVG GRAPH */}
                    <div className="h-[280px] w-full flex items-end">
                      <div className="h-full flex flex-col justify-between font-mono text-[10px] text-neutral-500 py-2 w-14 text-right pr-4 border-r border-neutral-800">
                        <span>$1.5M</span>
                        <span>$1.0M</span>
                        <span>$0.5M</span>
                        <span>0</span>
                      </div>

                      <div className="flex-1 h-full relative border-b border-neutral-800 bg-gradient-to-b from-amber-500/5 to-transparent">
                        <svg className="absolute inset-0 w-full h-full" preserveAspectRatio="none" viewBox="0 0 100 100">
                          {/* Grid alignment lines */}
                          <line x1="0" y1="33" x2="100" y2="33" stroke="#262626" strokeWidth="0.5" strokeDasharray="4,4" />
                          <line x1="0" y1="66" x2="100" y2="66" stroke="#262626" strokeWidth="0.5" strokeDasharray="4,4" />
                          {/* Simulated line map */}
                          <path
                            d="M 0 85 Q 20 70 40 75 T 60 40 T 80 45 T 100 20"
                            fill="none"
                            stroke="#f59e0b"
                            strokeWidth="2.5"
                          />
                          {/* Highlight dot points */}
                          <circle cx="60" cy="40" r="4.5" fill="#f59e0b" stroke="#000000" strokeWidth="1.5" />
                        </svg>

                        {/* Chart label periods */}
                        <div className="absolute -bottom-6 inset-x-0 flex justify-between font-mono text-[10px] text-neutral-500 px-4">
                          <span>Sep</span>
                          <span>Oct</span>
                          <span>Nov</span>
                          <span>Dec</span>
                          <span>Jan</span>
                          <span>Feb</span>
                        </div>
                      </div>
                    </div>
                  </div>

                  {/* Two Column Layout: Recent Sales & Inventory Health */}
                  <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    {/* Recent Sales Block */}
                    <div className="lg:col-span-2 bg-[#0f0f0f] border border-neutral-800 p-8 space-y-6">
                      <div className="flex justify-between items-center pb-4 border-b border-neutral-800">
                        <h3 className="text-lg text-white font-serif italic">Recent Dispatch Transactions</h3>
                        <button onClick={() => setActiveTab('orders')} className="text-xs font-mono text-amber-500 hover:text-amber-400 hover:underline uppercase tracking-widest font-medium">
                          View All
                        </button>
                      </div>

                      <div className="overflow-x-auto">
                        <table className="w-full text-left border-collapse whitespace-nowrap">
                          <thead>
                            <tr className="border-b border-neutral-800 font-mono text-[10px] uppercase tracking-widest text-[#979085]">
                              <th className="pb-4 font-normal">Customer</th>
                              <th className="pb-4 font-normal">Amount</th>
                              <th className="pb-4 font-normal">Payment</th>
                              <th className="pb-4 font-normal text-right">Date</th>
                            </tr>
                          </thead>
                          <tbody className="divide-y divide-neutral-800 text-sm">
                            {orders.slice(0, 4).map(ord => (
                              <tr key={ord.id} className="hover:bg-neutral-900/40 transition-colors">
                                <td className="py-4">
                                  <div className="font-sans text-white font-medium">{ord.customerName}</div>
                                  <div className="text-xs text-[#979085] font-mono mt-0.5">{ord.customerEmail}</div>
                                </td>
                                <td className="py-4 font-mono text-amber-500">
                                  {currencySymbol(settings.defaultCurrency)}
                                  {ord.totalAmount?.toFixed(2)}
                                </td>
                                <td className="py-4">
                                  <span className={`inline-block px-2 py-0.5 text-[9px] font-mono uppercase tracking-widest ${
                                    ord.paymentStatus === 'Paid'
                                      ? 'bg-[#0A1A10] text-[#4ADE80] border border-[#143320]'
                                      : 'bg-[#2A080A] text-[#F87171] border border-[#4A1015]'
                                  }`}>
                                    {ord.paymentStatus}
                                  </span>
                                </td>
                                <td className="py-4 font-mono text-xs text-neutral-500 text-right">
                                  {new Date(ord.placedAt).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                                </td>
                              </tr>
                            ))}
                          </tbody>
                        </table>
                      </div>
                    </div>

                    {/* Critical Inventory Health Block */}
                    <div className="bg-[#0f0f0f] border border-neutral-800 p-8 space-y-6">
                      <div className="flex justify-between items-center pb-4 border-b border-neutral-800">
                        <h3 className="text-lg text-white font-serif italic">Inventory Health</h3>
                        <span className="w-2.5 h-2.5 rounded-full bg-[#F87171] animate-pulse"></span>
                      </div>

                      <div className="space-y-6">
                        {products
                           .filter(p => p.stock <= 15)
                          .slice(0, 3)
                          .map(prod => (
                            <div key={prod.id} className="flex items-center justify-between pb-4 border-b border-neutral-800 last:border-0 last:pb-0">
                              <div>
                                <div className="text-sm font-medium text-white">{prod.name}</div>
                                <div className="text-xs font-mono text-[#F87171] mt-1">{prod.stock} units remaining</div>
                              </div>
                              <button 
                                onClick={() => {
                                  // fast restock simulation
                                  const updatedStock = prod.stock + 50;
                                  let nextStatus = 'Live';
                                  if (updatedStock <= 0) nextStatus = 'Out of Stock';
                                  else if (updatedStock < 15) nextStatus = 'Low Stock';

                                  fetch(`/api/v1/catalog/admin/products/${prod.id}`, {
                                    method: 'PATCH',
                                    headers: { 'Content-Type': 'application/json' },
                                    body: JSON.stringify({ stock: updatedStock, status: nextStatus })
                                  })
                                    .then(res => res.json())
                                    .then(updated => {
                                      setProducts(prev => prev.map(p => p.id === prod.id ? updated : p));
                                      addToast(`Restocked ${prod.name} with +50 units`);
                                      // recalculate summary
                                      fetch('/api/v1/reports/admin/sales-summary')
                                        .then(r => r.json())
                                        .then(data => setReportSummary(data));
                                    });
                                }}
                                className="px-4 py-2 border border-neutral-800 hover:border-amber-500 text-neutral-300 hover:text-white transition-all font-mono text-[10px] uppercase tracking-wider bg-transparent rounded-sm cursor-pointer"
                              >
                                Restock +50
                              </button>
                            </div>
                          ))}
                        {products.filter(p => p.stock <= 15).length === 0 && (
                          <div className="text-xs font-mono text-neutral-500 text-center py-6">
                            All products have healthy storage quantities
                          </div>
                        )}
                      </div>
                    </div>
                  </div>
                </motion.div>
              )}

              {/* TAB CONTAINER VIEW: CATALOG */}
              {activeTab === 'catalog' && (
                <motion.div
                  key="catalog"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.3 }}
                  className="space-y-8"
                >
                  <div className="flex justify-between items-end">
                    <div>
                      <h2 className="text-3xl text-white font-serif italic tracking-tight">Product Catalog</h2>
                      <p className="text-xs font-mono text-neutral-500 tracking-widest uppercase mt-2">
                        Manage atelier lines, pricing tiers, and warehouses
                      </p>
                    </div>
                    <button
                      onClick={() => setIsProductDrawerOpen(true)}
                      className="bg-white text-black font-mono text-[10px] uppercase tracking-widest px-5 py-3 hover:bg-neutral-200 transition-colors flex items-center gap-2 font-bold rounded-sm border border-white cursor-pointer"
                    >
                      <Plus className="w-4 h-4" />
                      Add Product
                    </button>
                  </div>

                  {/* Filter & Search Dashboard Controls */}
                  <div className="flex flex-col md:flex-row gap-4 items-center justify-between pb-4 border-b border-neutral-800">
                    <div className="relative w-full md:max-w-sm">
                      <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-neutral-500 w-4 h-4" />
                      <input
                        type="text"
                        value={catalogSearch}
                        onChange={e => setCatalogSearch(e.target.value)}
                        placeholder="Search by name or SKU..."
                        className="w-full bg-[#0f0f0f] border border-neutral-800 py-2.5 pl-10 pr-4 font-mono text-xs text-white placeholder-neutral-500 focus:outline-none focus:border-amber-500 rounded-sm"
                      />
                    </div>

                    <div className="flex gap-4 w-full md:w-auto">
                      <select
                        value={catalogStatusFilter}
                        onChange={e => setCatalogStatusFilter(e.target.value)}
                        className="bg-[#0f0f0f] border border-neutral-800 py-2.5 px-4 font-mono text-xs text-white placeholder-neutral-500 focus:outline-none focus:border-amber-500 cursor-pointer rounded-sm"
                      >
                        <option value="all">All Statuses</option>
                        <option value="live">Live</option>
                        <option value="low stock">Low Stock</option>
                        <option value="out of stock">Out of Stock</option>
                        <option value="draft">Draft</option>
                      </select>
                    </div>
                  </div>

                  {/* Dynamic Products Grid / Table */}
                  <div className="bg-[#0f0f0f] border border-neutral-800 rounded-sm">
                    <div className="overflow-x-auto">
                      <table className="w-full text-left border-collapse whitespace-nowrap">
                        <thead>
                          <tr className="bg-[#0a0a0a] border-b border-neutral-800 font-mono text-[10px] uppercase tracking-widest text-[#979085]">
                            <th className="py-4 px-6 font-normal">Product</th>
                            <th className="py-4 px-6 font-normal">SKU</th>
                            <th className="py-4 px-6 font-normal">Category</th>
                            <th className="py-4 px-6 font-normal">Stock Level</th>
                            <th className="py-4 px-6 font-normal">Price</th>
                            <th className="py-4 px-6 font-normal">Status</th>
                            <th className="py-4 px-6 font-normal text-right">Actions</th>
                          </tr>
                        </thead>
                        <tbody className="divide-y divide-neutral-800 text-sm text-[#e5e2e1]">
                          {filteredProducts.map(prod => (
                            <tr key={prod.id} className="group hover:bg-neutral-900/40 transition-colors">
                              <td className="py-4 px-6">
                                <div className="flex items-center gap-4">
                                  <div className="w-12 h-14 bg-black border border-neutral-800 overflow-hidden shrink-0 flex items-center justify-center">
                                    {prod.imageUrl ? (
                                      <img src={prod.imageUrl} alt={prod.name} className="w-full h-full object-cover" />
                                    ) : (
                                      <Inbox className="w-4 h-4 text-neutral-500" />
                                    )}
                                  </div>
                                  <div>
                                    <span className="font-sans font-medium text-white block group-hover:text-amber-400 transition-colors">{prod.name}</span>
                                    <span className="text-[10px] font-mono text-neutral-500 mt-1 block">ID: {prod.id}</span>
                                  </div>
                                </div>
                              </td>
                              <td className="py-4 px-6 font-mono text-xs text-neutral-500">{prod.sku}</td>
                              <td className="py-4 px-6 text-[#cec5b9]">{prod.category}</td>
                              <td className="py-4 px-6">
                                <div className="flex flex-col gap-1.5 max-w-[120px]">
                                  <span className="font-mono text-xs text-white">{prod.stock} units</span>
                                  <div className="w-full h-1 bg-neutral-800">
                                    <div
                                      className={`h-full ${
                                        prod.status === 'Live' ? 'bg-[#4ADE80]' : prod.status === 'Low Stock' ? 'bg-[#F87171]' : 'bg-neutral-700'
                                      }`}
                                      style={{ width: `${Math.min((prod.stock / 100) * 100, 100)}%` }}
                                    ></div>
                                  </div>
                                </div>
                              </td>
                              <td className="py-4 px-6 font-mono text-amber-500">
                                {currencySymbol(settings.defaultCurrency)}
                                {prod.price?.toFixed(2)}
                              </td>
                              <td className="py-4 px-6">
                                <span className={`inline-block px-3 py-1 text-[9px] font-mono uppercase tracking-widest ${
                                  prod.status === 'Live'
                                    ? 'bg-[#0A1A10] text-[#4ADE80] border border-[#143320]'
                                    : prod.status === 'Low Stock'
                                    ? 'bg-[#2A080A] text-[#F87171] border border-[#4A1015]'
                                    : prod.status === 'Out of Stock'
                                    ? 'bg-neutral-900 text-[#979085] border border-neutral-800'
                                    : 'bg-neutral-850 text-white'
                                }`}>
                                  {prod.status}
                                </span>
                              </td>
                              <td className="py-4 px-6 text-right">
                                <button
                                  onClick={() => handleDeleteProduct(prod.id, prod.name)}
                                  className="text-red-400 hover:text-red-300 font-mono text-[10px] uppercase tracking-wider border border-transparent hover:border-red-950 px-2.5 py-1.5 transition-all rounded-sm bg-red-950/20 hover:bg-red-950/45 cursor-pointer"
                                >
                                  Delete
                                </button>
                              </td>
                            </tr>
                          ))}
                          {filteredProducts.length === 0 && (
                            <tr>
                              <td colSpan={7} className="text-center font-mono py-12 text-neutral-500 text-xs uppercase tracking-widest">
                                No matching atelier lines found
                              </td>
                            </tr>
                          )}
                        </tbody>
                      </table>
                    </div>
                  </div>
                </motion.div>
              )}

              {/* TAB CONTAINER VIEW: ORDERS */}
              {activeTab === 'orders' && (
                <motion.div
                  key="orders"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.3 }}
                  className="space-y-8"
                >
                  <div className="flex justify-between items-end">
                    <div>
                      <h2 className="text-3xl text-white font-serif italic tracking-tight">Order Operations</h2>
                      <p className="text-xs font-mono text-neutral-500 tracking-widest uppercase mt-2">
                        Fulfill active dispatches and execute transaction lifecycles
                      </p>
                    </div>
                    <button
                      onClick={() => setIsOrderDrawerOpen(true)}
                      className="bg-white text-black font-mono text-[10px] uppercase tracking-widest px-5 py-3 hover:bg-neutral-200 transition-colors flex items-center gap-2 font-bold rounded-sm border border-white cursor-pointer"
                    >
                      <Plus className="w-4 h-4" />
                      New Order
                    </button>
                  </div>

                  {/* Filter Layout */}
                  <div className="grid grid-cols-1 lg:grid-cols-4 gap-8">
                    {/* Advanced filter rail */}
                    <div className="bg-[#0f0f0f] border border-neutral-800 p-6 space-y-6 h-fit rounded-sm">
                      <div className="flex justify-between items-center pb-4 border-b border-neutral-800">
                        <span className="text-xs font-mono uppercase tracking-widest text-[#979085]">Filter Operations</span>
                        <Filter className="w-4 h-4 text-neutral-500" />
                      </div>

                      <div className="space-y-6">
                        <div>
                          <label className="text-[10px] font-mono uppercase tracking-widest text-neutral-500 block mb-2">Search Query</label>
                          <div className="relative">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-neutral-500 w-3 h-3" />
                            <input
                              type="text"
                              value={orderSearch}
                              onChange={e => setOrderSearch(e.target.value)}
                              placeholder="Name, email or order..."
                              className="w-full bg-[#050505] border border-neutral-800 py-2.5 pl-9 pr-3 text-xs text-white focus:outline-none focus:border-amber-500 rounded-sm placeholder-neutral-600"
                            />
                          </div>
                        </div>

                        <div>
                          <label className="text-[10px] font-mono uppercase tracking-widest text-neutral-500 block mb-2">Amount Range</label>
                          <div className="flex items-center gap-2">
                            <input
                              type="number"
                              placeholder="Min"
                              value={orderAmountMin}
                              onChange={e => setOrderAmountMin(e.target.value)}
                              className="w-full bg-[#050505] border border-neutral-800 py-2.5 px-3 text-xs text-white focus:outline-none focus:border-amber-500 rounded-sm"
                            />
                            <span className="text-neutral-500 font-mono text-[10px]">-</span>
                            <input
                              type="number"
                              placeholder="Max"
                              value={orderAmountMax}
                              onChange={e => setOrderAmountMax(e.target.value)}
                              className="w-full bg-[#050505] border border-neutral-800 py-2.5 px-3 text-xs text-white focus:outline-none focus:border-amber-500 rounded-sm"
                            />
                          </div>
                        </div>

                        <div>
                          <label className="text-[10px] font-mono uppercase tracking-widest text-neutral-500 block mb-2">Fulfillment Step</label>
                          <select
                            value={orderFulfillmentFilter}
                            onChange={e => setOrderFulfillmentFilter(e.target.value)}
                            className="w-full bg-[#050505] border border-neutral-800 py-2.5 px-3 text-xs text-white focus:outline-none focus:border-amber-500 cursor-pointer rounded-sm"
                          >
                            <option value="all">All Channels</option>
                            <option value="pending">Pending</option>
                            <option value="processing">Processing</option>
                            <option value="shipped">Shipped</option>
                            <option value="cancelled">Cancelled</option>
                          </select>
                        </div>

                        <button 
                          onClick={() => {
                            setOrderSearch('');
                            setOrderFulfillmentFilter('all');
                            setOrderAmountMin('');
                            setOrderAmountMax('');
                            addToast('Filters reset successfully', 'info');
                          }}
                          className="w-full py-2.5 border border-neutral-800 text-neutral-400 hover:text-white hover:bg-neutral-900 hover:border-amber-500 transition-all font-mono text-[10px] uppercase tracking-widest cursor-pointer rounded-sm"
                        >
                          Clear Filters
                        </button>
                      </div>
                    </div>

                    {/* Main content table */}
                    <div className="lg:col-span-3 bg-[#0f0f0f] border border-neutral-800 rounded-sm">
                      <div className="overflow-x-auto">
                        <table className="w-full text-left border-collapse whitespace-nowrap">
                          <thead>
                            <tr className="bg-[#0a0a0a] border-b border-neutral-800 font-mono text-[10px] uppercase tracking-widest text-[#979085]">
                              <th className="py-4 px-6 font-normal">Order ID</th>
                              <th className="py-4 px-6 font-normal">Customer</th>
                              <th className="py-4 px-6 font-normal">Fulfillment</th>
                              <th className="py-4 px-6 font-normal">Payment</th>
                              <th className="py-4 px-6 font-normal text-right">Total</th>
                              <th className="py-4 px-6 font-normal text-right">Action State</th>
                            </tr>
                          </thead>
                          <tbody className="divide-y divide-neutral-800 text-sm text-[#e5e2e1]">
                            {filteredOrders.map(ord => (
                              <tr key={ord.id} className="group hover:bg-neutral-900/40 transition-colors">
                                <td className="py-4 px-6 font-mono text-xs text-amber-500 font-medium">{ord.orderNumber}</td>
                                <td className="py-4 px-6">
                                  <div className="font-sans font-medium text-white">{ord.customerName}</div>
                                  <div className="text-xs text-neutral-500 font-mono mt-0.5">{ord.customerEmail}</div>
                                </td>
                                <td className="py-4 px-6">
                                  <span className={`inline-block px-3 py-1 text-[9px] font-mono uppercase tracking-widest ${
                                    ord.fulfillmentStatus === 'Shipped'
                                      ? 'bg-neutral-900 text-[#4ADE80] border border-neutral-800'
                                      : ord.fulfillmentStatus === 'Processing'
                                      ? 'bg-neutral-800 text-white'
                                      : 'bg-[#1a1a1a] text-neutral-500'
                                  }`}>
                                    {ord.fulfillmentStatus}
                                  </span>
                                </td>
                                <td className="py-4 px-6">
                                  <span className={`inline-block px-3 py-1 text-[9px] font-mono uppercase tracking-widest ${
                                    ord.paymentStatus === 'Paid'
                                      ? 'bg-[#0A1A10] text-[#4ADE80] border border-[#143320]'
                                      : 'bg-[#2A080A] text-[#F87171] border border-[#4A1015]'
                                  }`}>
                                    {ord.paymentStatus}
                                  </span>
                                </td>
                                <td className="py-4 px-6 text-right font-mono text-amber-500 font-medium">
                                  {currencySymbol(settings.defaultCurrency)}
                                  {ord.totalAmount?.toFixed(2)}
                                </td>
                                <td className="py-4 px-6 text-right">
                                  <button
                                    onClick={() => toggleOrderStatus(ord.id, ord.fulfillmentStatus, ord.paymentStatus)}
                                    className="px-3 py-1.5 border border-neutral-800 text-neutral-400 hover:text-white hover:bg-neutral-900 hover:border-amber-500 transition-all font-mono text-[9px] uppercase tracking-widest rounded-sm cursor-pointer"
                                  >
                                    Cycle State
                                  </button>
                                </td>
                              </tr>
                            ))}
                            {filteredOrders.length === 0 && (
                              <tr>
                                <td colSpan={6} className="text-center font-mono py-12 text-neutral-500 text-xs uppercase tracking-widest">
                                  No transaction instances matching query
                                </td>
                              </tr>
                            )}
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </motion.div>
              )}

              {/* TAB CONTAINER VIEW: CUSTOMERS */}
              {activeTab === 'customers' && (
                <motion.div
                  key="customers"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.3 }}
                  className="space-y-8"
                >
                  <div className="flex justify-between items-end">
                    <div>
                      <h2 className="text-3xl text-white font-serif italic tracking-tight">Customer Directory</h2>
                      <p className="text-xs font-mono text-neutral-500 tracking-widest uppercase mt-2">
                        System identity directories and customer relationships
                      </p>
                    </div>
                    <button
                      onClick={() => setIsCustomerDrawerOpen(true)}
                      className="bg-white text-black font-mono text-[10px] uppercase tracking-widest px-5 py-3 hover:bg-neutral-200 transition-colors flex items-center gap-2 font-bold rounded-sm border border-white cursor-pointer"
                    >
                      <Plus className="w-4 h-4" />
                      Add Customer
                    </button>
                  </div>

                  {/* Filter Cluster */}
                  <div className="flex flex-col md:flex-row gap-4 items-center justify-between pb-4 border-b border-neutral-800">
                    <div className="relative w-full md:max-w-sm">
                      <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-neutral-500 w-4 h-4" />
                      <input
                        type="text"
                        value={customerSearch}
                        onChange={e => setCustomerSearch(e.target.value)}
                        placeholder="Search by directory name or email..."
                        className="w-full bg-[#0f0f0f] border border-neutral-800 py-2.5 pl-10 pr-4 font-mono text-xs text-white placeholder-neutral-500 focus:outline-none focus:border-amber-500 rounded-sm"
                      />
                    </div>

                    <div className="flex gap-4 w-full md:w-auto">
                      <select
                        value={customerTierFilter}
                        onChange={e => setCustomerTierFilter(e.target.value)}
                        className="bg-[#0f0f0f] border border-neutral-800 py-2.5 px-4 font-mono text-xs text-white placeholder-neutral-500 focus:outline-none focus:border-amber-500 cursor-pointer rounded-sm"
                      >
                        <option value="all">All Tiers</option>
                        <option value="vip">VIP</option>
                        <option value="regular">Regular</option>
                        <option value="new">New</option>
                      </select>
                    </div>
                  </div>

                  {/* Customer Rows Grid */}
                  <div className="bg-[#0f0f0f] border border-neutral-800 rounded-sm">
                    <div className="overflow-x-auto">
                      <table className="w-full text-left border-collapse whitespace-nowrap">
                        <thead>
                          <tr className="bg-[#0a0a0a] border-b border-neutral-800 font-mono text-[10px] uppercase tracking-widest text-[#979085]">
                            <th className="py-4 px-6 font-normal">Customer</th>
                            <th className="py-4 px-6 font-normal">Email</th>
                            <th className="py-4 px-6 font-normal text-right">Total Orders</th>
                            <th className="py-4 px-6 font-normal text-right">Lifetime Value</th>
                            <th className="py-4 px-6 font-normal">Last Activity</th>
                            <th className="py-4 px-6 font-normal text-center">Tier Label</th>
                          </tr>
                        </thead>
                        <tbody className="divide-y divide-neutral-800 text-sm text-[#e5e2e1]">
                          {filteredCustomers.map(cust => (
                            <tr key={cust.id} className="group hover:bg-neutral-900/40 transition-colors">
                              <td className="py-4 px-6">
                                <div className="flex items-center gap-3">
                                  <div className="w-10 h-10 border border-neutral-800 flex items-center justify-center overflow-hidden shrink-0 bg-neutral-900">
                                    {cust.avatarUrl ? (
                                      <img src={cust.avatarUrl} alt={cust.displayName} className="w-full h-full object-cover" />
                                    ) : (
                                      <span className="font-mono text-xs text-amber-500 font-bold bg-transparent">
                                        {cust.displayName.substring(0, 2).toUpperCase()}
                                      </span>
                                    )}
                                  </div>
                                  <span className="font-sans font-medium text-white group-hover:text-amber-400 transition-colors">
                                    {cust.displayName}
                                  </span>
                                </div>
                              </td>
                              <td className="py-4 px-6 font-mono text-xs text-neutral-500">{cust.email}</td>
                              <td className="py-4 px-6 text-right font-mono text-white">{cust.totalOrders}</td>
                              <td className="py-4 px-6 text-right font-mono text-amber-500">
                                {currencySymbol(settings.defaultCurrency)}
                                {cust.lifetimeValue?.toFixed(2)}
                              </td>
                              <td className="py-4 px-6 text-xs text-neutral-500">{cust.lastActivityAt}</td>
                              <td className="py-4 px-6 text-center">
                                <span className={`inline-block px-3 py-1 text-[9px] font-mono uppercase tracking-widest rounded-sm ${
                                  cust.tier === 'VIP'
                                    ? 'bg-amber-500/10 text-amber-500 border border-amber-500/20'
                                    : cust.tier === 'Regular'
                                    ? 'bg-neutral-800 text-white border border-neutral-700'
                                    : 'bg-transparent text-neutral-500 border border-dashed border-neutral-800'
                                }`}>
                                  {cust.tier}
                                </span>
                              </td>
                            </tr>
                          ))}
                          {filteredCustomers.length === 0 && (
                            <tr>
                              <td colSpan={6} className="text-center font-mono py-12 text-neutral-500 text-xs uppercase tracking-widest">
                                No customer entities matched Search
                              </td>
                            </tr>
                          )}
                        </tbody>
                      </table>
                    </div>
                  </div>
                </motion.div>
              )}

              {/* TAB CONTAINER VIEW: SYSTEM SETTINGS */}
              {activeTab === 'settings' && (
                <motion.div
                  key="settings"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.3 }}
                  className="space-y-12"
                >
                  <div>
                    <h2 className="text-3xl text-white font-serif italic tracking-tight">Configuration</h2>
                    <p className="text-xs font-mono text-neutral-500 tracking-widest uppercase mt-2">
                      Manage global settings, localizations, and integrations for your Atelier suite
                    </p>
                  </div>

                  <div className="flex flex-col lg:flex-row gap-12 items-start">
                    {/* Category selectors */}
                    <aside className="w-full lg:w-48 shrink-0 flex flex-col font-mono text-xs tracking-wider text-neutral-500">
                      <button className="text-left py-3 border-l-2 border-amber-500 text-amber-500 pl-4 bg-gradient-to-r from-neutral-900/40 to-transparent uppercase font-semibold">
                        General
                      </button>
                      <button className="text-left py-3 border-l-2 border-transparent hover:border-neutral-800 hover:text-white pl-4 transition-colors uppercase">
                        Authentication
                      </button>
                      <button className="text-left py-3 border-l-2 border-transparent hover:border-neutral-800 hover:text-white pl-4 transition-colors uppercase">
                        Payments
                      </button>
                      <button className="text-left py-3 border-l-2 border-transparent hover:border-neutral-800 hover:text-white pl-4 transition-colors uppercase">
                        Shipping
                      </button>
                      <button className="text-left py-3 border-l-2 border-transparent hover:border-neutral-800 hover:text-white pl-4 transition-colors uppercase">
                        API Integrations
                      </button>
                    </aside>

                    {/* Settings Forms fields */}
                    <div className="flex-1 max-w-[800px] bg-[#0f0f0f] border border-neutral-800 p-8 space-y-10 rounded-sm">
                      
                      {/* Section 1: Brand details */}
                      <section className="space-y-6">
                        <div className="border-b border-neutral-800 pb-3">
                          <h3 className="text-sm font-mono uppercase tracking-widest text-amber-500 font-semibold">Store Information</h3>
                          <p className="text-xs text-neutral-500 mt-1">Core brand identity and administrative contact details.</p>
                        </div>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                          <div className="flex flex-col gap-2">
                            <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Store Name</label>
                            <input
                              type="text"
                              value={settingsForm.storeName}
                              onChange={e => setSettingsForm(prev => ({ ...prev, storeName: e.target.value }))}
                              className="bg-transparent border-b border-neutral-800 py-2 px-0 text-sm text-white focus:outline-none focus:border-amber-500"
                            />
                          </div>
                          <div className="flex flex-col gap-2">
                            <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Contact Email</label>
                            <input
                              type="email"
                              value={settingsForm.contactEmail}
                              onChange={e => setSettingsForm(prev => ({ ...prev, contactEmail: e.target.value }))}
                              className="bg-transparent border-b border-neutral-800 py-2 px-0 text-sm text-white focus:outline-none focus:border-amber-500"
                            />
                          </div>
                        </div>
                      </section>

                      {/* Section 2: Regional/Localisation */}
                      <section className="space-y-6">
                        <div className="border-b border-neutral-800 pb-3">
                          <h3 className="text-sm font-mono uppercase tracking-widest text-amber-500 font-semibold">Localization Settings</h3>
                          <p className="text-xs text-neutral-500 mt-1">Set defaults for regional operations and display formats.</p>
                        </div>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                          <div className="flex flex-col gap-2">
                            <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Default Currency</label>
                            <select
                              value={settingsForm.defaultCurrency}
                              onChange={e => setSettingsForm(prev => ({ ...prev, defaultCurrency: e.target.value as 'USD' | 'EUR' | 'GBP' }))}
                              className="bg-[#0f0f0f] border-b border-neutral-800 py-2 px-0 text-sm text-white focus:outline-none focus:border-amber-500 select-none cursor-pointer"
                            >
                              <option value="USD">USD ($)</option>
                              <option value="EUR">EUR (€)</option>
                              <option value="GBP">GBP (£)</option>
                            </select>
                          </div>
                          <div className="flex flex-col gap-2">
                            <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Timezone</label>
                            <select
                              value={settingsForm.timezone}
                              onChange={e => setSettingsForm(prev => ({ ...prev, timezone: e.target.value }))}
                              className="bg-[#0f0f0f] border-b border-neutral-800 py-2 px-0 text-sm text-white focus:outline-none focus:border-amber-500 select-none cursor-pointer"
                            >
                              <option value="UTC (GMT+0)">UTC (GMT+0)</option>
                              <option value="EST (GMT-5)">EST (GMT-5)</option>
                              <option value="PST (GMT-8)">PST (GMT-8)</option>
                            </select>
                          </div>
                        </div>
                      </section>

                      {/* Section 3: Safety states / Maintenance Mode */}
                      <section className="space-y-6">
                        <div className="border-b border-neutral-800 pb-3">
                          <h3 className="text-sm font-mono uppercase tracking-widest text-amber-500 font-semibold">System State</h3>
                        </div>
                        <div className="flex items-center justify-between bg-black border border-neutral-800 p-5 rounded-sm">
                          <div>
                            <h4 className="text-sm text-white font-sans">Maintenance Mode</h4>
                            <p className="text-xs text-neutral-500 mt-1 max-w-[450px]">
                              Temporarily disable customer access to storefronts. Administrators and API requests bypass this state.
                            </p>
                          </div>
                          <div>
                            <button
                              type="button"
                              onClick={() => setSettingsForm(prev => ({ ...prev, maintenanceMode: !prev.maintenanceMode }))}
                              className="transition-transform active:scale-95 focus:outline-none cursor-pointer"
                            >
                              {settingsForm.maintenanceMode ? (
                                <ToggleRight className="w-12 h-12 text-amber-500" />
                              ) : (
                                <ToggleLeft className="w-12 h-12 text-neutral-600" />
                              )}
                            </button>
                          </div>
                        </div>
                      </section>

                      {/* Discard & Saved triggers */}
                      <div className="flex justify-end gap-4 pt-6 border-t border-neutral-800">
                        <button
                          onClick={() => {
                            setSettingsForm(settings);
                            addToast('Atelier modifications discarded', 'info');
                          }}
                          className="px-6 py-3 border border-neutral-800 hover:border-amber-500 hover:bg-neutral-900 transition-all font-mono text-[10px] uppercase tracking-widest text-neutral-300 hover:text-white cursor-pointer rounded-sm"
                        >
                          Discard
                        </button>
                        <button
                          onClick={handleSaveSettings}
                          className="px-6 py-3 bg-white text-black hover:bg-neutral-200 transition-all font-mono text-[10px] uppercase tracking-widest font-bold cursor-pointer rounded-sm"
                        >
                          Save Changes
                        </button>
                      </div>

                    </div>
                  </div>
                </motion.div>
              )}
            </AnimatePresence>
          )}
        </main>
      </div>

      {/* --- DRAWERS / OVERLAY WINDOW MODALS --- */}
      
      {/* 1. Add Product Sliding Drawer */}
      <AnimatePresence>
        {isProductDrawerOpen && (
          <>
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 0.5 }}
              exit={{ opacity: 0 }}
              onClick={() => setIsProductDrawerOpen(false)}
              className="fixed inset-0 bg-black/80 z-[110]"
            />
            <motion.div
              initial={{ transform: 'translateX(100%)' }}
              animate={{ transform: 'translateX(0%)' }}
              exit={{ transform: 'translateX(100%)' }}
              transition={{ duration: 0.3, ease: 'easeInOut' }}
              className="fixed top-0 right-0 h-screen w-full max-w-[480px] bg-[#0f0f0f] border-l border-neutral-800 z-[120] p-8 overflow-y-auto space-y-8 flex flex-col justify-between"
            >
              <div className="space-y-8">
                <div className="flex justify-between items-center pb-4 border-b border-neutral-800">
                  <h3 className="text-lg text-white font-serif italic">Add Product Brand</h3>
                  <button onClick={() => setIsProductDrawerOpen(false)} className="text-neutral-500 hover:text-white cursor-pointer">
                    <X className="w-5 h-5" />
                  </button>
                </div>

                <form onSubmit={handleCreateProduct} className="space-y-6">
                  <div className="flex flex-col gap-2">
                    <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Atelier Product Name</label>
                    <input
                      type="text"
                      required
                      value={newProductForm.name}
                      onChange={e => setNewProductForm(prev => ({ ...prev, name: e.target.value }))}
                      placeholder="e.g. Silk Minimalist Blouse"
                      className="bg-black border border-neutral-800 p-3 text-xs text-white placeholder-neutral-600 focus:outline-none focus:border-amber-500 rounded-sm"
                    />
                  </div>

                  <div className="flex flex-col gap-2">
                    <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">SKU Reference</label>
                    <input
                      type="text"
                      required
                      value={newProductForm.sku}
                      onChange={e => setNewProductForm(prev => ({ ...prev, sku: e.target.value }))}
                      placeholder="e.g. BL-001"
                      className="bg-black border border-neutral-800 p-3 text-xs text-white placeholder-neutral-600 focus:outline-none focus:border-amber-500 rounded-sm"
                    />
                  </div>

                  <div className="grid grid-cols-2 gap-4">
                    <div className="flex flex-col gap-2">
                      <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Category</label>
                      <input
                        type="text"
                        value={newProductForm.category}
                        onChange={e => setNewProductForm(prev => ({ ...prev, category: e.target.value }))}
                        className="bg-black border border-neutral-800 p-3 text-xs text-white placeholder-neutral-600 focus:outline-none focus:border-amber-500 rounded-sm"
                      />
                    </div>

                    <div className="flex flex-col gap-2">
                      <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Initial Stock Level</label>
                      <input
                        type="number"
                        min="0"
                        value={newProductForm.stock}
                        onChange={e => setNewProductForm(prev => ({ ...prev, stock: parseInt(e.target.value) || 0 }))}
                        className="bg-black border border-neutral-800 p-3 text-xs text-white focus:outline-none focus:border-amber-500 rounded-sm"
                      />
                    </div>
                  </div>

                  <div className="grid grid-cols-2 gap-4">
                    <div className="flex flex-col gap-2">
                      <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Pricing Tier Amount</label>
                      <input
                        type="number"
                        min="0"
                        value={newProductForm.price}
                        onChange={e => setNewProductForm(prev => ({ ...prev, price: parseFloat(e.target.value) || 0 }))}
                        className="bg-black border border-neutral-800 p-3 text-xs text-white focus:outline-none focus:border-amber-500 rounded-sm"
                      />
                    </div>

                    <div className="flex flex-col gap-2">
                      <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Direct Status</label>
                      <select
                        value={newProductForm.status}
                        onChange={e => setNewProductForm(prev => ({ ...prev, status: e.target.value as any }))}
                        className="bg-black border border-neutral-800 p-3 text-xs text-white focus:outline-none focus:border-amber-500 cursor-pointer rounded-sm"
                      >
                        <option value="Live">Live</option>
                        <option value="Low Stock">Low Stock</option>
                        <option value="Out of Stock">Out of Stock</option>
                        <option value="Draft">Draft</option>
                      </select>
                    </div>
                  </div>

                  <div className="flex flex-col gap-2">
                    <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Design Image Asset url</label>
                    <input
                      type="text"
                      value={newProductForm.imageUrl}
                      onChange={e => setNewProductForm(prev => ({ ...prev, imageUrl: e.target.value }))}
                      placeholder="https://..."
                      className="bg-black border border-neutral-800 p-3 text-xs text-white placeholder-neutral-600 focus:outline-none focus:border-amber-500 rounded-sm"
                    />
                  </div>

                  <div className="pt-6">
                    <button
                      type="submit"
                      className="w-full bg-white text-black py-4 font-mono text-xs uppercase tracking-widest hover:bg-neutral-200 transition-colors font-bold rounded-sm border border-white cursor-pointer"
                    >
                      Save Product to Catalog
                    </button>
                  </div>
                </form>
              </div>
            </motion.div>
          </>
        )}
      </AnimatePresence>

      {/* 2. Place New Order Drawer */}
      <AnimatePresence>
        {isOrderDrawerOpen && (
          <>
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 0.5 }}
              exit={{ opacity: 0 }}
              onClick={() => setIsOrderDrawerOpen(false)}
              className="fixed inset-0 bg-black/80 z-[110]"
            />
            <motion.div
              initial={{ transform: 'translateX(100%)' }}
              animate={{ transform: 'translateX(0%)' }}
              exit={{ transform: 'translateX(100%)' }}
              transition={{ duration: 0.3, ease: 'easeInOut' }}
              className="fixed top-0 right-0 h-screen w-full max-w-[480px] bg-[#0f0f0f] border-l border-neutral-800 z-[120] p-8 overflow-y-auto space-y-8 flex flex-col justify-between"
            >
              <div className="space-y-8">
                <div className="flex justify-between items-center pb-4 border-b border-neutral-800">
                  <h3 className="text-lg text-white font-serif italic">Register New Order</h3>
                  <button onClick={() => setIsOrderDrawerOpen(false)} className="text-neutral-500 hover:text-white cursor-pointer">
                    <X className="w-5 h-5" />
                  </button>
                </div>

                <form onSubmit={handleCreateOrder} className="space-y-6">
                  <div className="flex flex-col gap-2">
                    <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Customer Full Name</label>
                    <input
                      type="text"
                      required
                      value={newOrderForm.customerName}
                      onChange={e => setNewOrderForm(prev => ({ ...prev, customerName: e.target.value }))}
                      placeholder="e.g. Johnathan Doe"
                      className="bg-black border border-neutral-800 p-3 text-xs text-white placeholder-neutral-600 focus:outline-none focus:border-amber-500 rounded-sm"
                    />
                  </div>

                  <div className="flex flex-col gap-2">
                    <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Customer Email Address</label>
                    <input
                      type="email"
                      required
                      value={newOrderForm.customerEmail}
                      onChange={e => setNewOrderForm(prev => ({ ...prev, customerEmail: e.target.value }))}
                      placeholder="john@example.com"
                      className="bg-black border border-neutral-800 p-3 text-xs text-white placeholder-neutral-600 focus:outline-none focus:border-amber-500 rounded-sm"
                    />
                  </div>

                  <div className="flex flex-col gap-2">
                    <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Payment Method Selection</label>
                    <select
                      value={newOrderForm.paymentMethod}
                      onChange={e => setNewOrderForm(prev => ({ ...prev, paymentMethod: e.target.value }))}
                      className="bg-black border border-neutral-800 p-3 text-xs text-white focus:outline-none focus:border-amber-500 cursor-pointer rounded-sm"
                    >
                      <option value="Credit Card">Credit Card</option>
                      <option value="PayPal">PayPal</option>
                      <option value="Bank Transfer">Bank Transfer</option>
                    </select>
                  </div>

                  <div className="grid grid-cols-2 gap-4">
                    <div className="flex flex-col gap-2">
                      <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Items Count</label>
                      <input
                        type="number"
                        min="1"
                        value={newOrderForm.itemsCount}
                        onChange={e => setNewOrderForm(prev => ({ ...prev, itemsCount: parseInt(e.target.value) || 1 }))}
                        className="bg-black border border-neutral-800 p-3 text-xs text-white focus:outline-none focus:border-amber-500 rounded-sm"
                      />
                    </div>

                    <div className="flex flex-col gap-2">
                      <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Total Amount Value</label>
                      <input
                        type="number"
                        min="1"
                        value={newOrderForm.totalAmount}
                        onChange={e => setNewOrderForm(prev => ({ ...prev, totalAmount: parseFloat(e.target.value) || 0 }))}
                        className="bg-black border border-neutral-800 p-3 text-xs text-white focus:outline-none focus:border-amber-500 rounded-sm"
                      />
                    </div>
                  </div>

                  <div className="pt-6">
                    <button
                      type="submit"
                      className="w-full bg-white text-black py-4 font-mono text-xs uppercase tracking-widest hover:bg-neutral-200 transition-colors font-bold rounded-sm border border-white cursor-pointer"
                    >
                      Process & Place Order
                    </button>
                  </div>
                </form>
              </div>
            </motion.div>
          </>
        )}
      </AnimatePresence>

      {/* 3. Add Customer sliding drawer */}
      <AnimatePresence>
        {isCustomerDrawerOpen && (
          <>
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 0.5 }}
              exit={{ opacity: 0 }}
              onClick={() => setIsCustomerDrawerOpen(false)}
              className="fixed inset-0 bg-black/80 z-[110]"
            />
            <motion.div
              initial={{ transform: 'translateX(100%)' }}
              animate={{ transform: 'translateX(0%)' }}
              exit={{ transform: 'translateX(100%)' }}
              transition={{ duration: 0.3, ease: 'easeInOut' }}
              className="fixed top-0 right-0 h-screen w-full max-w-[480px] bg-[#0f0f0f] border-l border-neutral-800 z-[120] p-8 overflow-y-auto space-y-8 flex flex-col justify-between"
            >
              <div className="space-y-8">
                <div className="flex justify-between items-center pb-4 border-b border-neutral-800">
                  <h3 className="text-lg text-white font-serif italic">Register New Customer</h3>
                  <button onClick={() => setIsCustomerDrawerOpen(false)} className="text-neutral-500 hover:text-white cursor-pointer">
                    <X className="w-5 h-5" />
                  </button>
                </div>

                <form onSubmit={handleCreateCustomer} className="space-y-6">
                  <div className="flex flex-col gap-2">
                    <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Customer Display Name</label>
                    <input
                      type="text"
                      required
                      value={newCustomerForm.displayName}
                      onChange={e => setNewCustomerForm(prev => ({ ...prev, displayName: e.target.value }))}
                      placeholder="e.g. Sarah Chen"
                      className="bg-black border border-neutral-800 p-3 text-xs text-white placeholder-neutral-600 focus:outline-none focus:border-amber-500 rounded-sm"
                    />
                  </div>

                  <div className="flex flex-col gap-2">
                    <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Email Address</label>
                    <input
                      type="email"
                      required
                      value={newCustomerForm.email}
                      onChange={e => setNewCustomerForm(prev => ({ ...prev, email: e.target.value }))}
                      placeholder="sh.chen@example.com"
                      className="bg-black border border-neutral-800 p-3 text-xs text-white placeholder-neutral-600 focus:outline-none focus:border-amber-500 rounded-sm"
                    />
                  </div>

                  <div className="flex flex-col gap-2">
                    <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Subscription / Value Tier</label>
                    <select
                      value={newCustomerForm.tier}
                      onChange={e => setNewCustomerForm(prev => ({ ...prev, tier: e.target.value as any }))}
                      className="bg-black border border-neutral-800 p-3 text-xs text-white focus:outline-none focus:border-amber-500 cursor-pointer rounded-sm"
                    >
                      <option value="New">New</option>
                      <option value="Regular">Regular</option>
                      <option value="VIP">VIP</option>
                    </select>
                  </div>

                  <div className="flex flex-col gap-2">
                    <label className="text-[10px] uppercase font-mono tracking-widest text-neutral-500">Avatar URL</label>
                    <input
                      type="text"
                      value={newCustomerForm.avatarUrl}
                      onChange={e => setNewCustomerForm(prev => ({ ...prev, avatarUrl: e.target.value }))}
                      placeholder="https://..."
                      className="bg-black border border-neutral-800 p-3 text-xs text-white placeholder-neutral-600 focus:outline-none focus:border-amber-500 rounded-sm"
                    />
                  </div>

                  <div className="pt-6">
                    <button
                      type="submit"
                      className="w-full bg-white text-black py-4 font-mono text-xs uppercase tracking-widest hover:bg-neutral-200 transition-colors font-bold rounded-sm border border-white cursor-pointer"
                    >
                      Create Customer Identity
                    </button>
                  </div>
                </form>
              </div>
            </motion.div>
          </>
        )}
      </AnimatePresence>

      {/* FIXED TOAST NOTIFICATION STACK */}
      <div className="fixed bottom-6 right-6 space-y-3 z-[200]">
        <AnimatePresence>
          {toasts.map(toast => (
            <motion.div
              key={toast.id}
              initial={{ opacity: 0, x: 50, scale: 0.9 }}
              animate={{ opacity: 1, x: 0, scale: 1 }}
              exit={{ opacity: 0, x: 50, scale: 0.9 }}
              className="bg-[#0f0f0f] border border-neutral-800 text-xs font-mono py-4 px-6 tracking-wide text-white uppercase flex items-center justify-between gap-4 shadow-xl select-none rounded-sm"
              style={{ borderLeft: toast.type === 'success' ? '3px solid #f59e0b' : toast.type === 'error' ? '3px solid #ef4444' : '3px solid #737373' }}
            >
              <div className="flex items-center gap-2">
                {toast.type === 'success' && <CheckCircle className="w-4 h-4 text-amber-500 shrink-0" />}
                {toast.type === 'error' && <AlertTriangle className="w-4 h-4 text-[#ef4444] shrink-0" />}
                {toast.type === 'info' && <Activity className="w-4 h-4 text-[#a3a3a3] shrink-0" />}
                <span>{toast.message}</span>
              </div>
              <button
                onClick={() => setToasts(prev => prev.filter(t => t.id !== toast.id))}
                className="text-neutral-500 hover:text-white cursor-pointer"
              >
                <X className="w-4 h-4" />
              </button>
            </motion.div>
          ))}
        </AnimatePresence>
      </div>

    </div>
  );
}
