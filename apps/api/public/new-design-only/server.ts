import express from 'express';
import path from 'path';
import { createServer as createViteServer } from 'vite';
import { Product, Order, Customer, StoreSettings } from './src/types';

async function startServer() {
  const app = express();
  const PORT = 3000;

  app.use(express.json());

  // --- IN-MEMORY DATABASE STORES ---
  let products: Product[] = [
    {
      id: 'prod_1',
      sku: 'BL-001',
      name: 'Silk Minimalist Blouse',
      category: 'Apparel',
      stock: 85,
      price: 245.00,
      status: 'Live',
      imageUrl: 'https://images.unsplash.com/photo-1548624313-0396c75e4b1a?q=80&w=300&auto=format&fit=crop',
      createdAt: new Date().toISOString()
    },
    {
      id: 'prod_2',
      sku: 'TR-002',
      name: 'Tailored Wool Trousers',
      category: 'Apparel',
      stock: 12,
      price: 320.00,
      status: 'Low Stock',
      imageUrl: 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?q=80&w=300&auto=format&fit=crop',
      createdAt: new Date().toISOString()
    },
    {
      id: 'prod_3',
      sku: 'CO-003',
      name: 'Cashmere Overcoat',
      category: 'Outerwear',
      stock: 0,
      price: 890.00,
      status: 'Out of Stock',
      imageUrl: '',
      createdAt: new Date().toISOString()
    },
    {
      id: 'prod_4',
      sku: 'TA-004',
      name: 'Ribbed Cotton Tank',
      category: 'Apparel',
      stock: 0,
      price: 85.00,
      status: 'Draft',
      imageUrl: 'https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?q=80&w=300&auto=format&fit=crop',
      createdAt: new Date().toISOString()
    }
  ];

  let orders: Order[] = [
    {
      id: 'ord_1',
      orderNumber: '#8921',
      customerName: 'Eleanor Vance',
      customerEmail: 'eleanor.v@example.com',
      placedAt: '2023-10-24T14:32:00Z',
      fulfillmentStatus: 'Processing',
      paymentStatus: 'Paid',
      paymentMethod: 'Credit Card',
      totalAmount: 1240.00,
      itemsCount: 2
    },
    {
      id: 'ord_2',
      orderNumber: '#8920',
      customerName: 'Julian Crane',
      customerEmail: 'j.crane@gmail.com',
      placedAt: '2023-10-23T11:15:00Z',
      fulfillmentStatus: 'Shipped',
      paymentStatus: 'Paid',
      paymentMethod: 'PayPal',
      totalAmount: 3850.00,
      itemsCount: 5
    },
    {
      id: 'ord_3',
      orderNumber: '#8919',
      customerName: 'Sylvia Plath',
      customerEmail: 'sylvia@plath.org',
      placedAt: '2023-10-23T09:40:00Z',
      fulfillmentStatus: 'Pending',
      paymentStatus: 'Unpaid',
      paymentMethod: 'Bank Transfer',
      totalAmount: 890.00,
      itemsCount: 1
    },
    {
      id: 'ord_4',
      orderNumber: '#8918',
      customerName: 'Arthur Dent',
      customerEmail: 'arthur.d@guide.space',
      placedAt: '2023-10-21T16:55:00Z',
      fulfillmentStatus: 'Shipped',
      paymentStatus: 'Paid',
      paymentMethod: 'Credit Card',
      totalAmount: 4200.00,
      itemsCount: 4
    }
  ];

  let customers: Customer[] = [
    {
      id: 'cust_1',
      displayName: 'Elena Rostova',
      email: 'elena.r@example.com',
      totalOrders: 42,
      lifetimeValue: 12450.00,
      lastActivityAt: '2 hours ago',
      tier: 'VIP',
      avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=150&auto=format&fit=crop'
    },
    {
      id: 'cust_2',
      displayName: 'Marcus Sterling',
      email: 'm.sterling@agency.co',
      totalOrders: 8,
      lifetimeValue: 1820.00,
      lastActivityAt: 'Oct 12, 2023',
      tier: 'Regular',
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=150&auto=format&fit=crop'
    },
    {
      id: 'cust_3',
      displayName: 'Sarah Chen',
      email: 'sarah.c@studio.io',
      totalOrders: 1,
      lifetimeValue: 350.00,
      lastActivityAt: 'Yesterday',
      tier: 'New',
      avatarUrl: ''
    },
    {
      id: 'cust_4',
      displayName: 'David Alaba',
      email: 'david.alaba@group.com',
      totalOrders: 156,
      lifetimeValue: 45900.00,
      lastActivityAt: 'Just now',
      tier: 'VIP',
      avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=150&auto=format&fit=crop'
    }
  ];

  let settings: StoreSettings = {
    storeName: 'Atelier',
    contactEmail: 'operations@atelier-suite.com',
    defaultCurrency: 'USD',
    timezone: 'UTC (GMT+0)',
    maintenanceMode: false
  };

  // --- API ROUTE HANDLERS ---

  // Health check
  app.get('/api/v1/health/liveness', (req, res) => {
    res.json({ status: 'ok' });
  });

  app.get('/api/v1/health/readiness', (req, res) => {
    res.json({ status: 'ok', details: { database: { status: 'up' } } });
  });

  // Settings
  app.get('/api/v1/pricing/admin/settings', (req, res) => {
    res.json(settings);
  });

  app.put('/api/v1/pricing/admin/settings', (req, res) => {
    const { storeName, contactEmail, defaultCurrency, timezone, maintenanceMode } = req.body;
    if (storeName !== undefined) settings.storeName = storeName;
    if (contactEmail !== undefined) settings.contactEmail = contactEmail;
    if (defaultCurrency !== undefined) settings.defaultCurrency = defaultCurrency;
    if (timezone !== undefined) settings.timezone = timezone;
    if (maintenanceMode !== undefined) settings.maintenanceMode = maintenanceMode;
    res.json(settings);
  });

  // Reports / Analytics
  app.get('/api/v1/reports/admin/sales-summary', (req, res) => {
    const totalRevenue = orders
      .filter(o => o.paymentStatus === 'Paid')
      .reduce((sum, o) => sum + o.totalAmount, 0);

    const activeOrders = orders.filter(o => o.fulfillmentStatus === 'Processing' || o.fulfillmentStatus === 'Pending').length;
    const lowStockAlerts = products.filter(p => p.status === 'Low Stock' || p.stock <= 5 && p.status !== 'Draft' && p.status !== 'Out of Stock').length;

    res.json({
      totalRevenue,
      activeOrders,
      conversionRate: 3.2,
      lowStockAlerts
    });
  });

  app.get('/api/v1/reports/admin/top-products', (req, res) => {
    res.json([
      { id: 'prod_1', name: 'Silk Minimalist Blouse', quantity: 142, revenue: 34790 },
      { id: 'prod_2', name: 'Tailored Wool Trousers', quantity: 98, revenue: 31360 },
      { id: 'prod_3', name: 'Cashmere Overcoat', quantity: 24, revenue: 21360 }
    ]);
  });

  app.get('/api/v1/reports/admin/revenue-history', (req, res) => {
    res.json([
      { label: 'Sep', value: 320000 },
      { label: 'Oct', value: 450000 },
      { label: 'Nov', value: 380000 },
      { label: 'Dec', value: 870000 },
      { label: 'Jan', value: 1150000 },
      { label: 'Feb', value: 1350000 },
    ]);
  });

  // Catalog Products
  app.get('/api/v1/catalog/admin/products', (req, res) => {
    let result = [...products];
    const { status, search } = req.query;

    if (status) {
      result = result.filter(p => p.status.toLowerCase() === (status as string).toLowerCase());
    }

    if (search) {
      const q = (search as string).toLowerCase();
      result = result.filter(p => p.name.toLowerCase().includes(q) || p.sku.toLowerCase().includes(q));
    }

    res.json({ items: result });
  });

  app.post('/api/v1/catalog/admin/products', (req, res) => {
    const { name, sku, category, stock, price, status, imageUrl } = req.body;
    if (!name || !sku || price === undefined) {
      return res.status(400).json({ error: 'Missing required fields: name, sku, price' });
    }

    const newProduct: Product = {
      id: 'prod_' + Math.random().toString(36).substring(2, 9),
      sku,
      name,
      category: category || 'Apparel',
      stock: Number(stock) || 0,
      price: Number(price),
      status: status || 'Draft',
      imageUrl: imageUrl || '',
      createdAt: new Date().toISOString()
    };

    products.unshift(newProduct);
    res.status(201).json(newProduct);
  });

  app.patch('/api/v1/catalog/admin/products/:id', (req, res) => {
    const { id } = req.params;
    const { name, sku, category, stock, price, status, imageUrl } = req.body;
    const index = products.findIndex(p => p.id === id);

    if (index === -1) {
      return res.status(404).json({ error: 'Product not found' });
    }

    const current = products[index];
    const updated: Product = {
      ...current,
      name: name !== undefined ? name : current.name,
      sku: sku !== undefined ? sku : current.sku,
      category: category !== undefined ? category : current.category,
      stock: stock !== undefined ? Number(stock) : current.stock,
      price: price !== undefined ? Number(price) : current.price,
      status: status !== undefined ? status : current.status,
      imageUrl: imageUrl !== undefined ? imageUrl : current.imageUrl
    };

    products[index] = updated;
    res.json(updated);
  });

  app.delete('/api/v1/catalog/admin/products/:id', (req, res) => {
    const { id } = req.params;
    products = products.filter(p => p.id !== id);
    res.json({ success: true });
  });

  // Orders Admin
  app.get('/api/v1/orders/admin', (req, res) => {
    let result = [...orders];
    const { search, fulfillmentStatus, paymentStatus } = req.query;

    if (fulfillmentStatus) {
      result = result.filter(o => o.fulfillmentStatus.toLowerCase() === (fulfillmentStatus as string).toLowerCase());
    }
    if (paymentStatus) {
      result = result.filter(o => o.paymentStatus.toLowerCase() === (paymentStatus as string).toLowerCase());
    }
    if (search) {
      const q = (search as string).toLowerCase();
      result = result.filter(o => o.customerName.toLowerCase().includes(q) || o.orderNumber.toLowerCase().includes(q));
    }

    res.json({ items: result });
  });

  app.post('/api/v1/orders/admin', (req, res) => {
    const { customerName, customerEmail, paymentMethod, totalAmount, itemsCount } = req.body;
    if (!customerName || !customerEmail || totalAmount === undefined) {
      return res.status(400).json({ error: 'Missing customerName, customerEmail or totalAmount' });
    }

    const maxNum = Math.max(...orders.map(o => parseInt(o.orderNumber.replace('#', '')) || 0));
    const nextNum = '#' + (maxNum + 1);

    const newOrder: Order = {
      id: 'ord_' + Math.random().toString(36).substring(2, 9),
      orderNumber: nextNum,
      customerName,
      customerEmail,
      placedAt: new Date().toISOString(),
      fulfillmentStatus: 'Pending',
      paymentStatus: 'Unpaid',
      paymentMethod: paymentMethod || 'Credit Card',
      totalAmount: Number(totalAmount),
      itemsCount: itemsCount !== undefined ? Number(itemsCount) : 1
    };

    orders.unshift(newOrder);
    res.status(201).json(newOrder);
  });

  app.patch('/api/v1/orders/admin/:id/status', (req, res) => {
    const { id } = req.params;
    const { fulfillmentStatus, paymentStatus } = req.body;
    const index = orders.findIndex(o => o.id === id);

    if (index === -1) {
      return res.status(404).json({ error: 'Order not found' });
    }

    const current = orders[index];
    const updated: Order = {
      ...current,
      fulfillmentStatus: fulfillmentStatus !== undefined ? fulfillmentStatus : current.fulfillmentStatus,
      paymentStatus: paymentStatus !== undefined ? paymentStatus : current.paymentStatus
    };

    orders[index] = updated;
    res.json(updated);
  });

  // Customers
  app.get('/api/v1/identity/admin/customers', (req, res) => {
    let result = [...customers];
    const { search } = req.query;

    if (search) {
      const q = (search as string).toLowerCase();
      result = result.filter(c => c.displayName.toLowerCase().includes(q) || c.email.toLowerCase().includes(q));
    }

    res.json({ items: result });
  });

  app.post('/api/v1/identity/admin/customers', (req, res) => {
    const { displayName, email, tier, avatarUrl } = req.body;
    if (!displayName || !email) {
      return res.status(400).json({ error: 'displayName and email are required' });
    }

    const newCustomer: Customer = {
      id: 'cust_' + Math.random().toString(36).substring(2, 9),
      displayName,
      email,
      totalOrders: 0,
      lifetimeValue: 0.00,
      lastActivityAt: 'Just now',
      tier: tier || 'New',
      avatarUrl: avatarUrl || ''
    };

    customers.unshift(newCustomer);
    res.status(201).json(newCustomer);
  });


  // --- FRONTEND INTEGRATION & ASSET SERVING ---

  if (process.env.NODE_ENV !== 'production') {
    const vite = await createViteServer({
      server: { middlewareMode: true },
      appType: 'spa',
    });
    app.use(vite.middlewares);
  } else {
    const distPath = path.join(process.cwd(), 'dist');
    app.use(express.static(distPath));
    app.get('*', (req, res) => {
      res.sendFile(path.join(distPath, 'index.html'));
    });
  }

  app.listen(PORT, '0.0.0.0', () => {
    console.log(`Atelier full-stack server running on http://localhost:${PORT}`);
  });
}

startServer();
