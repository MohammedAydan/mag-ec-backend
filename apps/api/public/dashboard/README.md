# Atelier Commerce — Admin Command Center

لوحة إدارة كاملة مبنية بـ **React + TypeScript + Vite** باستخدام مكونات وتصميم `dashboard.zip`، مع نقل الوظائف الحقيقية وعقود الـ API الموجودة في `admin.zip`.

## ما تم تنفيذه

- نظام دخول Administrator مع حفظ الجلسة في `sessionStorage`، وتحديث access token عبر refresh token، والتحقق الإجباري من `/api/v1/auth/me`.
- واجهة responsive كاملة: navigation rail، top bar، light/dark theme، refresh للبيانات، panels، tables، badges، stat cards، وJSON action dialogs.
- صفحات تشغيل فعلية:
  - Overview
  - Orders + Order Details + Shipments
  - Fulfillment & Returns
  - Catalog + Product Details + Variants
  - Taxonomy & Attributes
  - Pricing & Promotions
  - Inventory
  - Payments
  - Reviews
  - Notifications
  - Analytics & Exports
  - Staff & Access
  - Content & Audit
  - System Operations
- الحفاظ على مسارات API الأساسية المستخدمة في لوحة `admin.zip` بدل صفحات placeholder الموجودة في القالب.
- إعداد إنتاج يعمل مباشرة من مسار `/admin/` باستخدام `HashRouter`، وبالتالي لا يحتاج SPA rewrite من السيرفر.

## التشغيل أثناء التطوير

```bash
npm install
npm run dev
```

التطبيق يفترض أن الـ backend يعمل على `http://localhost:3000` أثناء التطوير، ويقوم Vite بعمل proxy للمسار `/api`.

## البناء

```bash
npm run build
```

مجلد `dist/` الناتج جاهز ليُخدم من المسار:

```text
/admin/index.html
/admin/assets/*
```

## الدمج مع المشروع الحالي

يوجد ملف منفصل باسم `admin-rebuilt.zip` جاهز للاستبدال بمجلد `admin` الحالي الذي كان يحتوي على `index.html` و`assets/admin.js`.

1. احتفظ بنسخة احتياطية من مجلد `admin` الحالي.
2. فك ضغط `admin-rebuilt.zip` داخل مكان الملفات static التي تُخدم على `/admin`.
3. تأكد أن API ما زال متاحًا على `/api/v1`.
4. افتح `/admin/index.html` وسجّل الدخول بحساب نوعه `ADMIN`.

## التحقق المنفذ

- نجح فحص TypeScript: `tsc -b`.
- نجح إنتاج build باستخدام Vite، وأُخرجت ملفات `dist/index.html` و`dist/assets/*`.
- لم يتم تشغيل اختبار تكاملي للـ API؛ ملفات المشروع المرفقة لم تتضمن backend يعمل محليًا أو بيانات دخول اختبارية.
