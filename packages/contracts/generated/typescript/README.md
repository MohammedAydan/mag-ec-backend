# @mag/generated-api-client@0.1.0

A TypeScript SDK client for the localhost API.

## Usage

First, install the SDK from npm.

```bash
npm install @mag/generated-api-client --save
```

Next, try it out.


```ts
import {
  Configuration,
  AuditAdminApi,
} from '@mag/generated-api-client';
import type { AdminAuditListAuditLogsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AuditAdminApi(config);

  const body = {
    // string | Pagination cursor (optional)
    cursor: cursor_example,
    // number | Page size (1-100) (optional)
    limit: 56,
    // string | Filter by audit-log category (optional)
    category: category_example,
    // string | Filter by audit-log action (optional)
    action: action_example,
    // string | Filter by entity type (optional)
    entityType: entityType_example,
  } satisfies AdminAuditListAuditLogsRequest;

  try {
    const data = await api.adminAuditListAuditLogs(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```


## Documentation

### API Endpoints

All URIs are relative to *http://localhost*

| Class | Method | HTTP request | Description
| ----- | ------ | ------------ | -------------
*AuditAdminApi* | [**adminAuditListAuditLogs**](docs/AuditAdminApi.md#adminauditlistauditlogs) | **GET** /api/v1/audit/admin | List audit log entries with optional filters and cursor pagination
*AuthenticationApi* | [**authGetCurrentUser**](docs/AuthenticationApi.md#authgetcurrentuser) | **GET** /api/v1/auth/me | Return the authenticated user profile and access summary
*AuthenticationApi* | [**authLogin**](docs/AuthenticationApi.md#authlogin) | **POST** /api/v1/auth/login | Authenticate user credentials and issue session tokens
*AuthenticationApi* | [**authLogout**](docs/AuthenticationApi.md#authlogout) | **POST** /api/v1/auth/logout | Revoke active refresh token session family
*AuthenticationApi* | [**authRefresh**](docs/AuthenticationApi.md#authrefresh) | **POST** /api/v1/auth/refresh | Exchange an active refresh token for a new token set (rotation)
*AuthenticationApi* | [**authRegister**](docs/AuthenticationApi.md#authregister) | **POST** /api/v1/auth/register | Register a new customer account
*AuthenticationApi* | [**authRequestEmailVerification**](docs/AuthenticationApi.md#authrequestemailverification) | **POST** /api/v1/auth/verification/request | Issue a new email-verification request for the authenticated user
*AuthenticationApi* | [**authRequestPasswordReset**](docs/AuthenticationApi.md#authrequestpasswordreset) | **POST** /api/v1/auth/password-reset/request | Create a password-reset request without disclosing account existence
*AuthenticationApi* | [**authResetPassword**](docs/AuthenticationApi.md#authresetpassword) | **POST** /api/v1/auth/password-reset/confirm | Consume a password-reset token and change the user password
*AuthenticationApi* | [**authVerifyEmail**](docs/AuthenticationApi.md#authverifyemail) | **POST** /api/v1/auth/verification/confirm | Consume an email-verification token and mark the account verified
*CartsApi* | [**cartAddItem**](docs/CartsApi.md#cartadditem) | **POST** /api/v1/carts/{id}/items | Add an item to the cart
*CartsApi* | [**cartApplyCoupon**](docs/CartsApi.md#cartapplycoupon) | **POST** /api/v1/carts/{id}/coupon | Apply a coupon to the cart
*CartsApi* | [**cartCreateOrGetCart**](docs/CartsApi.md#cartcreateorgetcart) | **POST** /api/v1/carts | Create or retrieve a shopping cart
*CartsApi* | [**cartGetCart**](docs/CartsApi.md#cartgetcart) | **GET** /api/v1/carts/{id} | Get cart by ID
*CartsApi* | [**cartMergeGuestCart**](docs/CartsApi.md#cartmergeguestcart) | **POST** /api/v1/carts/merge | Merge guest cart into authenticated user cart
*CartsApi* | [**cartRemoveCoupon**](docs/CartsApi.md#cartremovecoupon) | **DELETE** /api/v1/carts/{id}/coupon | Remove coupon from the cart
*CartsApi* | [**cartRemoveItem**](docs/CartsApi.md#cartremoveitem) | **DELETE** /api/v1/carts/{id}/items/{variantId} | Remove an item from the cart
*CartsApi* | [**cartUpdateItemQuantity**](docs/CartsApi.md#cartupdateitemquantity) | **PATCH** /api/v1/carts/{id}/items/{variantId} | Update cart item quantity
*CatalogAdminApi* | [**catalogAdminArchiveBrand**](docs/CatalogAdminApi.md#catalogadminarchivebrand) | **POST** /api/v1/catalog/admin/brands/{brandId}/archive | Archive a brand
*CatalogAdminApi* | [**catalogAdminArchiveCategory**](docs/CatalogAdminApi.md#catalogadminarchivecategory) | **POST** /api/v1/catalog/admin/categories/{categoryId}/archive | Archive a category
*CatalogAdminApi* | [**catalogAdminArchiveCollection**](docs/CatalogAdminApi.md#catalogadminarchivecollection) | **POST** /api/v1/catalog/admin/collections/{collectionId}/archive | Archive a collection
*CatalogAdminApi* | [**catalogAdminArchiveProduct**](docs/CatalogAdminApi.md#catalogadminarchiveproduct) | **POST** /api/v1/catalog/admin/products/{productId}/archive | Archive a product
*CatalogAdminApi* | [**catalogAdminArchiveProductType**](docs/CatalogAdminApi.md#catalogadminarchiveproducttype) | **POST** /api/v1/catalog/admin/product-types/{productTypeId}/archive | Archive a product type
*CatalogAdminApi* | [**catalogAdminArchiveProductVariant**](docs/CatalogAdminApi.md#catalogadminarchiveproductvariant) | **POST** /api/v1/catalog/admin/variants/{variantId}/archive | Archive a product variant
*CatalogAdminApi* | [**catalogAdminArchiveTag**](docs/CatalogAdminApi.md#catalogadminarchivetag) | **POST** /api/v1/catalog/admin/tags/{tagId}/archive | Archive a tag
*CatalogAdminApi* | [**catalogAdminAttachMedia**](docs/CatalogAdminApi.md#catalogadminattachmedia) | **POST** /api/v1/catalog/admin/products/{productId}/media/attach | Attach uploaded media to a product
*CatalogAdminApi* | [**catalogAdminCreateAttribute**](docs/CatalogAdminApi.md#catalogadmincreateattribute) | **POST** /api/v1/catalog/admin/attributes | Create a new attribute
*CatalogAdminApi* | [**catalogAdminCreateBrand**](docs/CatalogAdminApi.md#catalogadmincreatebrand) | **POST** /api/v1/catalog/admin/brands | Create a new brand
*CatalogAdminApi* | [**catalogAdminCreateCategory**](docs/CatalogAdminApi.md#catalogadmincreatecategory) | **POST** /api/v1/catalog/admin/categories | Create a new category
*CatalogAdminApi* | [**catalogAdminCreateCollection**](docs/CatalogAdminApi.md#catalogadmincreatecollection) | **POST** /api/v1/catalog/admin/collections | Create a new collection
*CatalogAdminApi* | [**catalogAdminCreateProduct**](docs/CatalogAdminApi.md#catalogadmincreateproduct) | **POST** /api/v1/catalog/admin/products | Create a new product
*CatalogAdminApi* | [**catalogAdminCreateProductType**](docs/CatalogAdminApi.md#catalogadmincreateproducttype) | **POST** /api/v1/catalog/admin/product-types | Create a new product type
*CatalogAdminApi* | [**catalogAdminCreateProductVariant**](docs/CatalogAdminApi.md#catalogadmincreateproductvariant) | **POST** /api/v1/catalog/admin/products/{productId}/variants | Create a new product variant
*CatalogAdminApi* | [**catalogAdminCreateTag**](docs/CatalogAdminApi.md#catalogadmincreatetag) | **POST** /api/v1/catalog/admin/tags | Create a new tag
*CatalogAdminApi* | [**catalogAdminGetProduct**](docs/CatalogAdminApi.md#catalogadmingetproduct) | **GET** /api/v1/catalog/admin/products/{productId} | Get a single product by ID
*CatalogAdminApi* | [**catalogAdminIssueMediaUploadIntent**](docs/CatalogAdminApi.md#catalogadminissuemediauploadintent) | **POST** /api/v1/catalog/admin/products/{productId}/media/upload-intents | Issue a media upload intent for a product
*CatalogAdminApi* | [**catalogAdminListAttributes**](docs/CatalogAdminApi.md#catalogadminlistattributes) | **GET** /api/v1/catalog/admin/attributes | List all attributes
*CatalogAdminApi* | [**catalogAdminListBrands**](docs/CatalogAdminApi.md#catalogadminlistbrands) | **GET** /api/v1/catalog/admin/brands | List all brands
*CatalogAdminApi* | [**catalogAdminListCategories**](docs/CatalogAdminApi.md#catalogadminlistcategories) | **GET** /api/v1/catalog/admin/categories | List all categories
*CatalogAdminApi* | [**catalogAdminListCollections**](docs/CatalogAdminApi.md#catalogadminlistcollections) | **GET** /api/v1/catalog/admin/collections | List all collections
*CatalogAdminApi* | [**catalogAdminListProductTypes**](docs/CatalogAdminApi.md#catalogadminlistproducttypes) | **GET** /api/v1/catalog/admin/product-types | List all product types
*CatalogAdminApi* | [**catalogAdminListProducts**](docs/CatalogAdminApi.md#catalogadminlistproducts) | **GET** /api/v1/catalog/admin/products | List all products with pagination and filters
*CatalogAdminApi* | [**catalogAdminListTags**](docs/CatalogAdminApi.md#catalogadminlisttags) | **GET** /api/v1/catalog/admin/tags | List all tags
*CatalogAdminApi* | [**catalogAdminPublishBrand**](docs/CatalogAdminApi.md#catalogadminpublishbrand) | **POST** /api/v1/catalog/admin/brands/{brandId}/publish | Publish a brand
*CatalogAdminApi* | [**catalogAdminPublishCategory**](docs/CatalogAdminApi.md#catalogadminpublishcategory) | **POST** /api/v1/catalog/admin/categories/{categoryId}/publish | Publish a category
*CatalogAdminApi* | [**catalogAdminPublishCollection**](docs/CatalogAdminApi.md#catalogadminpublishcollection) | **POST** /api/v1/catalog/admin/collections/{collectionId}/publish | Publish a collection
*CatalogAdminApi* | [**catalogAdminPublishProduct**](docs/CatalogAdminApi.md#catalogadminpublishproduct) | **POST** /api/v1/catalog/admin/products/{productId}/publish | Publish a product
*CatalogAdminApi* | [**catalogAdminPublishProductType**](docs/CatalogAdminApi.md#catalogadminpublishproducttype) | **POST** /api/v1/catalog/admin/product-types/{productTypeId}/publish | Publish a product type
*CatalogAdminApi* | [**catalogAdminPublishProductVariant**](docs/CatalogAdminApi.md#catalogadminpublishproductvariant) | **POST** /api/v1/catalog/admin/variants/{variantId}/publish | Publish a product variant
*CatalogAdminApi* | [**catalogAdminPublishTag**](docs/CatalogAdminApi.md#catalogadminpublishtag) | **POST** /api/v1/catalog/admin/tags/{tagId}/publish | Publish a tag
*CatalogAdminApi* | [**catalogAdminUpdateProduct**](docs/CatalogAdminApi.md#catalogadminupdateproduct) | **PATCH** /api/v1/catalog/admin/products/{productId} | Update a product
*CatalogAdminApi* | [**catalogAdminUpdateProductVariant**](docs/CatalogAdminApi.md#catalogadminupdateproductvariant) | **PATCH** /api/v1/catalog/admin/variants/{variantId} | Update a product variant
*CatalogPublicApi* | [**catalogPublicBrowseProducts**](docs/CatalogPublicApi.md#catalogpublicbrowseproducts) | **GET** /api/v1/catalog/products | Browse published products with optional filters
*CatalogPublicApi* | [**catalogPublicGetProductBySlug**](docs/CatalogPublicApi.md#catalogpublicgetproductbyslug) | **GET** /api/v1/catalog/products/{slug} | Get a published product by its translated slug
*CheckoutApi* | [**checkoutPlaceOrder**](docs/CheckoutApi.md#checkoutplaceorder) | **POST** /api/v1/checkout/place | Place an order from cart
*CheckoutApi* | [**checkoutPreviewCheckout**](docs/CheckoutApi.md#checkoutpreviewcheckout) | **POST** /api/v1/checkout/preview | Preview checkout costs before placing an order
*CheckoutApi* | [**checkoutReserveCheckoutPreview**](docs/CheckoutApi.md#checkoutreservecheckoutpreview) | **POST** /api/v1/checkout/reserve | Reserve stock and preview checkout (authenticated customer only)
*CommerceSupportAdminApi* | [**commerceSupportAdminListActiveCarts**](docs/CommerceSupportAdminApi.md#commercesupportadminlistactivecarts) | **GET** /api/v1/support/admin/carts | List active carts for support review
*CommerceSupportAdminApi* | [**commerceSupportAdminListWishlists**](docs/CommerceSupportAdminApi.md#commercesupportadminlistwishlists) | **GET** /api/v1/support/admin/wishlists | List active wishlists for support review
*ContentApi* | [**publicContentGetLegalReferences**](docs/ContentApi.md#publiccontentgetlegalreferences) | **GET** /api/v1/content/legal-references | Get public legal reference page keys
*ContentApi* | [**publicContentGetPage**](docs/ContentApi.md#publiccontentgetpage) | **GET** /api/v1/content/pages/{slug} | Get a published content page by its slug
*ContentAdminApi* | [**adminContentGetLegalReferences**](docs/ContentAdminApi.md#admincontentgetlegalreferences) | **GET** /api/v1/content/admin/legal-references | Get legal reference page key mappings
*ContentAdminApi* | [**adminContentListPages**](docs/ContentAdminApi.md#admincontentlistpages) | **GET** /api/v1/content/admin/pages | List all content pages
*ContentAdminApi* | [**adminContentUpsertLegalReferences**](docs/ContentAdminApi.md#admincontentupsertlegalreferences) | **PUT** /api/v1/content/admin/legal-references | Update legal reference page key mappings
*ContentAdminApi* | [**adminContentUpsertPage**](docs/ContentAdminApi.md#admincontentupsertpage) | **PUT** /api/v1/content/admin/pages/{key} | Create or update a content page
*FulfillmentApi* | [**customerFulfillmentListMyShipments**](docs/FulfillmentApi.md#customerfulfillmentlistmyshipments) | **GET** /api/v1/orders/me/{orderId}/shipments | List my order shipments
*FulfillmentAdminApi* | [**adminFulfillmentCreateShipment**](docs/FulfillmentAdminApi.md#adminfulfillmentcreateshipment) | **POST** /api/v1/orders/admin/{orderId}/shipments | Create a shipment for an order
*FulfillmentAdminApi* | [**adminFulfillmentListShipments**](docs/FulfillmentAdminApi.md#adminfulfillmentlistshipments) | **GET** /api/v1/orders/admin/{orderId}/shipments | List shipments for an order
*FulfillmentAdminApi* | [**adminFulfillmentUpdateShipmentStatus**](docs/FulfillmentAdminApi.md#adminfulfillmentupdateshipmentstatus) | **PATCH** /api/v1/orders/admin/{orderId}/shipments/{shipmentId}/status | Update shipment status
*HealthApi* | [**healthGetLiveness**](docs/HealthApi.md#healthgetliveness) | **GET** /api/v1/health/liveness | Check API process liveness
*HealthApi* | [**healthGetReadiness**](docs/HealthApi.md#healthgetreadiness) | **GET** /api/v1/health/readiness | Check API readiness including downstream dependencies
*IdentityApi* | [**identityGetAdminAccessCheck**](docs/IdentityApi.md#identitygetadminaccesscheck) | **GET** /api/v1/identity/admin/access-check | Verify privileged identity access for administrative actors
*IdentityApi* | [**identityGetUserProfile**](docs/IdentityApi.md#identitygetuserprofile) | **GET** /api/v1/identity/users/{userId}/profile | Read a user profile when the actor owns it or has identity.read access
*IdentityAdminApi* | [**adminAccessCreateRole**](docs/IdentityAdminApi.md#adminaccesscreaterole) | **POST** /api/v1/identity/admin/roles | Create a new admin role
*IdentityAdminApi* | [**adminAccessInviteStaff**](docs/IdentityAdminApi.md#adminaccessinvitestaff) | **POST** /api/v1/identity/admin/staff/invitations | Create a staff member invitation
*IdentityAdminApi* | [**adminAccessListCustomers**](docs/IdentityAdminApi.md#adminaccesslistcustomers) | **GET** /api/v1/identity/admin/customers | List all customers
*IdentityAdminApi* | [**adminAccessListPermissions**](docs/IdentityAdminApi.md#adminaccesslistpermissions) | **GET** /api/v1/identity/admin/permissions | List all available admin permissions
*IdentityAdminApi* | [**adminAccessListRoles**](docs/IdentityAdminApi.md#adminaccesslistroles) | **GET** /api/v1/identity/admin/roles | List all admin roles
*IdentityAdminApi* | [**adminAccessListStaff**](docs/IdentityAdminApi.md#adminaccessliststaff) | **GET** /api/v1/identity/admin/staff | List all staff members
*IdentityAdminApi* | [**adminAccessResendStaffInvitation**](docs/IdentityAdminApi.md#adminaccessresendstaffinvitation) | **POST** /api/v1/identity/admin/staff/{staffId}/resend-invitation | Resend a staff member invitation
*IdentityAdminApi* | [**adminAccessUpdateRolePermissions**](docs/IdentityAdminApi.md#adminaccessupdaterolepermissions) | **PATCH** /api/v1/identity/admin/roles/{roleId}/permissions | Update an admin role\&#39;s permission set
*IdentityAdminApi* | [**adminAccessUpdateStaffRoles**](docs/IdentityAdminApi.md#adminaccessupdatestaffroles) | **PATCH** /api/v1/identity/admin/staff/{staffId}/roles | Update a staff member\&#39;s role assignments
*IdentityAdminApi* | [**adminAccessUpdateStaffStatus**](docs/IdentityAdminApi.md#adminaccessupdatestaffstatus) | **PATCH** /api/v1/identity/admin/staff/{staffId}/status | Update a staff member\&#39;s account status
*InventoryAdminApi* | [**inventoryAdminAdjustStock**](docs/InventoryAdminApi.md#inventoryadminadjuststock) | **POST** /api/v1/inventory/admin/adjustments | Adjust stock quantity for a variant in a warehouse
*InventoryAdminApi* | [**inventoryAdminGetReservations**](docs/InventoryAdminApi.md#inventoryadmingetreservations) | **GET** /api/v1/inventory/admin/reservations | Query stock reservations with optional filters and status
*InventoryAdminApi* | [**inventoryAdminGetStockLevels**](docs/InventoryAdminApi.md#inventoryadmingetstocklevels) | **GET** /api/v1/inventory/admin/levels | Query current stock levels with optional filters
*InventoryAdminApi* | [**inventoryAdminGetStockMovements**](docs/InventoryAdminApi.md#inventoryadmingetstockmovements) | **GET** /api/v1/inventory/admin/movements | Query paginated stock movement history
*NotificationsApi* | [**customerNotificationsGetPreference**](docs/NotificationsApi.md#customernotificationsgetpreference) | **GET** /api/v1/notifications/me/preferences | Get my notification preferences
*NotificationsApi* | [**customerNotificationsListMyNotifications**](docs/NotificationsApi.md#customernotificationslistmynotifications) | **GET** /api/v1/notifications/me | List my notifications
*NotificationsApi* | [**customerNotificationsRegisterPushDevice**](docs/NotificationsApi.md#customernotificationsregisterpushdevice) | **POST** /api/v1/notifications/me/push-devices | Register a push device
*NotificationsApi* | [**customerNotificationsUnregisterPushDevice**](docs/NotificationsApi.md#customernotificationsunregisterpushdevice) | **DELETE** /api/v1/notifications/me/push-devices/{deviceId} | Unregister a push device
*NotificationsApi* | [**customerNotificationsUpsertPreference**](docs/NotificationsApi.md#customernotificationsupsertpreference) | **PUT** /api/v1/notifications/me/preferences | Upsert notification preferences
*NotificationsAdminApi* | [**adminNotificationsListNotifications**](docs/NotificationsAdminApi.md#adminnotificationslistnotifications) | **GET** /api/v1/notifications/admin | List all notifications
*NotificationsAdminApi* | [**adminNotificationsRetryNotification**](docs/NotificationsAdminApi.md#adminnotificationsretrynotification) | **POST** /api/v1/notifications/admin/{notificationId}/retry | Retry a failed notification
*OrdersApi* | [**customerOrderCancellationCancelOrder**](docs/OrdersApi.md#customerordercancellationcancelorder) | **POST** /api/v1/orders/me/{orderId}/cancel | Cancel an order
*OrdersApi* | [**customerOrdersGetMyOrder**](docs/OrdersApi.md#customerordersgetmyorder) | **GET** /api/v1/orders/me/{orderId} | Get a single customer order by ID
*OrdersApi* | [**customerOrdersListMyOrders**](docs/OrdersApi.md#customerorderslistmyorders) | **GET** /api/v1/orders/me | List authenticated customer orders
*OrdersAdminApi* | [**adminOrderCancellationCancelOrder**](docs/OrdersAdminApi.md#adminordercancellationcancelorder) | **POST** /api/v1/orders/admin/{orderId}/cancel | Admin cancel an order
*OrdersAdminApi* | [**adminOrdersGetOrder**](docs/OrdersAdminApi.md#adminordersgetorder) | **GET** /api/v1/orders/admin/{orderId} | Get a single order by ID (admin view)
*OrdersAdminApi* | [**adminOrdersListOrders**](docs/OrdersAdminApi.md#adminorderslistorders) | **GET** /api/v1/orders/admin | List all orders (admin view)
*PaymentsAdminApi* | [**adminPaymentsListAttempts**](docs/PaymentsAdminApi.md#adminpaymentslistattempts) | **GET** /api/v1/payments/admin/attempts | List all payment attempts
*PaymentsAdminApi* | [**adminPaymentsListRefunds**](docs/PaymentsAdminApi.md#adminpaymentslistrefunds) | **GET** /api/v1/payments/admin/refunds | List all refunds
*PaymentsAdminApi* | [**adminPaymentsListWebhookEvents**](docs/PaymentsAdminApi.md#adminpaymentslistwebhookevents) | **GET** /api/v1/payments/admin/webhook-events | List all payment webhook events
*PricingAdminApi* | [**pricingAdminUpdatePricingBehavior**](docs/PricingAdminApi.md#pricingadminupdatepricingbehavior) | **PUT** /api/v1/pricing/admin/settings/behavior | Update pricing behavior (tax inclusion, defaults)
*PricingAdminApi* | [**pricingAdminUpdateStoreCurrency**](docs/PricingAdminApi.md#pricingadminupdatestorecurrency) | **PUT** /api/v1/pricing/admin/settings/currency | Update the default store currency
*PricingAdminApi* | [**pricingAdminUpsertManualTaxRate**](docs/PricingAdminApi.md#pricingadminupsertmanualtaxrate) | **PUT** /api/v1/pricing/admin/tax-classes/{taxClassId}/rates/{countryCode} | Upsert a manual tax rate for a tax class and country
*PricingAdminApi* | [**pricingAdminUpsertShippingMethod**](docs/PricingAdminApi.md#pricingadminupsertshippingmethod) | **PUT** /api/v1/pricing/admin/shipping-zones/{zoneId}/methods/{key} | Upsert a shipping method within a shipping zone
*PricingAdminApi* | [**pricingAdminUpsertShippingZone**](docs/PricingAdminApi.md#pricingadminupsertshippingzone) | **PUT** /api/v1/pricing/admin/shipping-zones/{key} | Upsert a shipping zone by key
*PricingAdminApi* | [**pricingAdminUpsertTaxClass**](docs/PricingAdminApi.md#pricingadminupserttaxclass) | **PUT** /api/v1/pricing/admin/tax-classes/{key} | Upsert a tax class by key
*PricingAdminApi* | [**pricingAdminUpsertVariantPrice**](docs/PricingAdminApi.md#pricingadminupsertvariantprice) | **PUT** /api/v1/pricing/admin/variants/{variantId}/price | Upsert variant price for a given currency
*PricingPublicApi* | [**pricingPublicPreviewCheckout**](docs/PricingPublicApi.md#pricingpublicpreviewcheckout) | **POST** /api/v1/pricing/checkout/preview | Preview checkout pricing, taxes, shipping, and promotions
*PromotionsAdminApi* | [**promotionsAdminGetPromotion**](docs/PromotionsAdminApi.md#promotionsadmingetpromotion) | **GET** /api/v1/promotions/admin/{promotionId} | Get a single promotion by ID
*PromotionsAdminApi* | [**promotionsAdminListPromotions**](docs/PromotionsAdminApi.md#promotionsadminlistpromotions) | **GET** /api/v1/promotions/admin | List all promotions
*PromotionsAdminApi* | [**promotionsAdminUpsertCoupon**](docs/PromotionsAdminApi.md#promotionsadminupsertcoupon) | **PUT** /api/v1/promotions/admin/{promotionId}/coupons/{code} | Create or update a coupon for a promotion
*PromotionsAdminApi* | [**promotionsAdminUpsertPromotion**](docs/PromotionsAdminApi.md#promotionsadminupsertpromotion) | **PUT** /api/v1/promotions/admin/by-key/{promotionKey} | Create or update a promotion by key
*ReportingAdminApi* | [**adminReportingCreateExport**](docs/ReportingAdminApi.md#adminreportingcreateexport) | **POST** /api/v1/reports/admin/exports | Request a new asynchronous report export
*ReportingAdminApi* | [**adminReportingCreateExportDownloadUrl**](docs/ReportingAdminApi.md#adminreportingcreateexportdownloadurl) | **GET** /api/v1/reports/admin/exports/{exportId}/download | Generate a short-lived download URL for an export result
*ReportingAdminApi* | [**adminReportingGetInventoryKpis**](docs/ReportingAdminApi.md#adminreportinggetinventorykpis) | **GET** /api/v1/reports/admin/inventory-kpis | Retrieve inventory KPI metrics
*ReportingAdminApi* | [**adminReportingGetPromotionPerformance**](docs/ReportingAdminApi.md#adminreportinggetpromotionperformance) | **GET** /api/v1/reports/admin/promotion-performance | Retrieve promotion usage and performance analytics
*ReportingAdminApi* | [**adminReportingGetSalesSummary**](docs/ReportingAdminApi.md#adminreportinggetsalessummary) | **GET** /api/v1/reports/admin/sales-summary | Retrieve aggregate sales summary metrics
*ReportingAdminApi* | [**adminReportingGetTopProducts**](docs/ReportingAdminApi.md#adminreportinggettopproducts) | **GET** /api/v1/reports/admin/top-products | List top-selling products by quantity
*ReportingAdminApi* | [**adminReportingListExports**](docs/ReportingAdminApi.md#adminreportinglistexports) | **GET** /api/v1/reports/admin/exports | List report exports with cursor pagination
*ReturnsApi* | [**customerReturnsCreateReturn**](docs/ReturnsApi.md#customerreturnscreatereturn) | **POST** /api/v1/returns/me/orders/{orderId} | Create a return request for an order
*ReturnsApi* | [**customerReturnsGetMyReturn**](docs/ReturnsApi.md#customerreturnsgetmyreturn) | **GET** /api/v1/returns/me/{returnRequestId} | Get a return request by ID
*ReturnsApi* | [**customerReturnsListMyReturns**](docs/ReturnsApi.md#customerreturnslistmyreturns) | **GET** /api/v1/returns/me | List my return requests
*ReturnsAdminApi* | [**adminReturnsGetReturn**](docs/ReturnsAdminApi.md#adminreturnsgetreturn) | **GET** /api/v1/returns/admin/{returnRequestId} | Get a return request by ID
*ReturnsAdminApi* | [**adminReturnsListReturns**](docs/ReturnsAdminApi.md#adminreturnslistreturns) | **GET** /api/v1/returns/admin | List all return requests
*ReturnsAdminApi* | [**adminReturnsReceiveReturn**](docs/ReturnsAdminApi.md#adminreturnsreceivereturn) | **POST** /api/v1/returns/admin/{returnRequestId}/receive | Receive a return request
*ReturnsAdminApi* | [**adminReturnsRefundReturn**](docs/ReturnsAdminApi.md#adminreturnsrefundreturn) | **POST** /api/v1/returns/admin/{returnRequestId}/refund | Execute a refund for a return request
*ReturnsAdminApi* | [**adminReturnsReviewReturn**](docs/ReturnsAdminApi.md#adminreturnsreviewreturn) | **POST** /api/v1/returns/admin/{returnRequestId}/review | Review a return request
*ReviewsApi* | [**customerReviewsCreateReview**](docs/ReviewsApi.md#customerreviewscreatereview) | **POST** /api/v1/reviews/order-lines/{orderLineId} | Create a verified purchase review for an order line
*ReviewsApi* | [**customerReviewsGetMyReview**](docs/ReviewsApi.md#customerreviewsgetmyreview) | **GET** /api/v1/reviews/me/{reviewId} | Get a single review written by the authenticated customer
*ReviewsApi* | [**customerReviewsListMyReviews**](docs/ReviewsApi.md#customerreviewslistmyreviews) | **GET** /api/v1/reviews/me | List reviews written by the authenticated customer
*ReviewsAdminApi* | [**adminReviewsGetReview**](docs/ReviewsAdminApi.md#adminreviewsgetreview) | **GET** /api/v1/reviews/admin/{reviewId} | Get a single review by ID
*ReviewsAdminApi* | [**adminReviewsListReviews**](docs/ReviewsAdminApi.md#adminreviewslistreviews) | **GET** /api/v1/reviews/admin | List all reviews with pagination and filters
*ReviewsAdminApi* | [**adminReviewsModerateReview**](docs/ReviewsAdminApi.md#adminreviewsmoderatereview) | **PATCH** /api/v1/reviews/admin/{reviewId}/moderate | Moderate a review (approve, reject, flag, or hide)
*WishlistApi* | [**wishlistAddItem**](docs/WishlistApi.md#wishlistadditem) | **POST** /api/v1/wishlist/items | Add an item to the wishlist
*WishlistApi* | [**wishlistGetWishlist**](docs/WishlistApi.md#wishlistgetwishlist) | **GET** /api/v1/wishlist | Get the authenticated user wishlist
*WishlistApi* | [**wishlistRemoveItem**](docs/WishlistApi.md#wishlistremoveitem) | **DELETE** /api/v1/wishlist/items/{variantId} | Remove an item from the wishlist


### Models

- [AddCartItemDto](docs/AddCartItemDto.md)
- [AddWishlistItemDto](docs/AddWishlistItemDto.md)
- [AdjustStockDto](docs/AdjustStockDto.md)
- [AdminAccessCheckResponseDto](docs/AdminAccessCheckResponseDto.md)
- [AdminCatalogAttributeDto](docs/AdminCatalogAttributeDto.md)
- [AdminCatalogAttributeOptionDto](docs/AdminCatalogAttributeOptionDto.md)
- [AdminCatalogBrandDto](docs/AdminCatalogBrandDto.md)
- [AdminCatalogCategoryDto](docs/AdminCatalogCategoryDto.md)
- [AdminCatalogCollectionDto](docs/AdminCatalogCollectionDto.md)
- [AdminCatalogMediaDto](docs/AdminCatalogMediaDto.md)
- [AdminCatalogProductDto](docs/AdminCatalogProductDto.md)
- [AdminCatalogProductTypeAttributeDto](docs/AdminCatalogProductTypeAttributeDto.md)
- [AdminCatalogProductTypeDto](docs/AdminCatalogProductTypeDto.md)
- [AdminCatalogProductVariantOptionValueDto](docs/AdminCatalogProductVariantOptionValueDto.md)
- [AdminCatalogRelationLinkDto](docs/AdminCatalogRelationLinkDto.md)
- [AdminCatalogTagDto](docs/AdminCatalogTagDto.md)
- [AdminCatalogTranslationDto](docs/AdminCatalogTranslationDto.md)
- [AdminCatalogVariantDto](docs/AdminCatalogVariantDto.md)
- [AdminCustomerSummaryDto](docs/AdminCustomerSummaryDto.md)
- [AdminLegalReferencesResponseDto](docs/AdminLegalReferencesResponseDto.md)
- [AdminPaginatedCatalogProductsDto](docs/AdminPaginatedCatalogProductsDto.md)
- [AdminPermissionDto](docs/AdminPermissionDto.md)
- [AdminRoleDto](docs/AdminRoleDto.md)
- [ApplyCouponDto](docs/ApplyCouponDto.md)
- [AttachMediaDto](docs/AttachMediaDto.md)
- [AttachedMediaResponseDto](docs/AttachedMediaResponseDto.md)
- [AttachedMediaTranslationDto](docs/AttachedMediaTranslationDto.md)
- [AttributeOptionDto](docs/AttributeOptionDto.md)
- [AttributeOptionTranslationDto](docs/AttributeOptionTranslationDto.md)
- [AttributeTranslationDto](docs/AttributeTranslationDto.md)
- [AuditLogActorDto](docs/AuditLogActorDto.md)
- [AuditLogResponseDto](docs/AuditLogResponseDto.md)
- [AuthResponseDto](docs/AuthResponseDto.md)
- [AuthUserDto](docs/AuthUserDto.md)
- [CancelOrderDto](docs/CancelOrderDto.md)
- [CartItemResponseDto](docs/CartItemResponseDto.md)
- [CartResponseDto](docs/CartResponseDto.md)
- [CatalogLocalizedReferenceDto](docs/CatalogLocalizedReferenceDto.md)
- [CatalogMediaSummaryDto](docs/CatalogMediaSummaryDto.md)
- [CatalogProductSummaryDto](docs/CatalogProductSummaryDto.md)
- [CatalogStatusResponseDto](docs/CatalogStatusResponseDto.md)
- [CatalogVariantOptionSummaryDto](docs/CatalogVariantOptionSummaryDto.md)
- [CatalogVariantPriceDto](docs/CatalogVariantPriceDto.md)
- [CatalogVariantSummaryDto](docs/CatalogVariantSummaryDto.md)
- [CheckoutAddressDto](docs/CheckoutAddressDto.md)
- [CheckoutCartPreviewDto](docs/CheckoutCartPreviewDto.md)
- [CheckoutPaymentAttemptDto](docs/CheckoutPaymentAttemptDto.md)
- [CheckoutPaymentReadinessDto](docs/CheckoutPaymentReadinessDto.md)
- [CheckoutPlaceOrderDto](docs/CheckoutPlaceOrderDto.md)
- [CheckoutPlaceOrderResponseDto](docs/CheckoutPlaceOrderResponseDto.md)
- [CheckoutPreviewAppliedPromotionDto](docs/CheckoutPreviewAppliedPromotionDto.md)
- [CheckoutPreviewDto](docs/CheckoutPreviewDto.md)
- [CheckoutPreviewItemDto](docs/CheckoutPreviewItemDto.md)
- [CheckoutPreviewItemResponseDto](docs/CheckoutPreviewItemResponseDto.md)
- [CheckoutPreviewItemStockDto](docs/CheckoutPreviewItemStockDto.md)
- [CheckoutPreviewResponseDto](docs/CheckoutPreviewResponseDto.md)
- [CheckoutPreviewShippingMethodDto](docs/CheckoutPreviewShippingMethodDto.md)
- [ContentPageResponseDto](docs/ContentPageResponseDto.md)
- [CouponResponseDto](docs/CouponResponseDto.md)
- [CreateAdminRoleDto](docs/CreateAdminRoleDto.md)
- [CreateAttributeDto](docs/CreateAttributeDto.md)
- [CreateBrandDto](docs/CreateBrandDto.md)
- [CreateCartDto](docs/CreateCartDto.md)
- [CreateCategoryDto](docs/CreateCategoryDto.md)
- [CreateCollectionDto](docs/CreateCollectionDto.md)
- [CreateMediaUploadIntentDto](docs/CreateMediaUploadIntentDto.md)
- [CreateProductDto](docs/CreateProductDto.md)
- [CreateProductTypeDto](docs/CreateProductTypeDto.md)
- [CreateProductVariantDto](docs/CreateProductVariantDto.md)
- [CreateReportExportDto](docs/CreateReportExportDto.md)
- [CreateReturnRequestDto](docs/CreateReturnRequestDto.md)
- [CreateReturnRequestItemDto](docs/CreateReturnRequestItemDto.md)
- [CreateReviewDto](docs/CreateReviewDto.md)
- [CreateShipmentDto](docs/CreateShipmentDto.md)
- [CreateShipmentItemDto](docs/CreateShipmentItemDto.md)
- [CreateTagDto](docs/CreateTagDto.md)
- [ExecuteReturnRefundDto](docs/ExecuteReturnRefundDto.md)
- [FulfillmentItemDto](docs/FulfillmentItemDto.md)
- [FulfillmentResponseDto](docs/FulfillmentResponseDto.md)
- [HealthIndicatorDetailDto](docs/HealthIndicatorDetailDto.md)
- [HealthLivenessResponseDto](docs/HealthLivenessResponseDto.md)
- [HealthReadinessResponseDto](docs/HealthReadinessResponseDto.md)
- [InventoryKpisResponseDto](docs/InventoryKpisResponseDto.md)
- [InventoryKpisStockMetricDto](docs/InventoryKpisStockMetricDto.md)
- [InventoryKpisStockSumDto](docs/InventoryKpisStockSumDto.md)
- [InvitationSentResponseDto](docs/InvitationSentResponseDto.md)
- [InviteStaffDto](docs/InviteStaffDto.md)
- [LegalReferencesResponseDto](docs/LegalReferencesResponseDto.md)
- [LoginDto](docs/LoginDto.md)
- [LogoutDto](docs/LogoutDto.md)
- [ManualTaxRateResponseDto](docs/ManualTaxRateResponseDto.md)
- [MediaTranslationDto](docs/MediaTranslationDto.md)
- [MediaUploadHeadersDto](docs/MediaUploadHeadersDto.md)
- [MediaUploadIntentResponseDto](docs/MediaUploadIntentResponseDto.md)
- [MergeCartDto](docs/MergeCartDto.md)
- [NotificationPreferenceResponseDto](docs/NotificationPreferenceResponseDto.md)
- [NotificationResponseDto](docs/NotificationResponseDto.md)
- [NotificationUserBriefDto](docs/NotificationUserBriefDto.md)
- [OrderAddressDto](docs/OrderAddressDto.md)
- [OrderAppliedPromotionDto](docs/OrderAppliedPromotionDto.md)
- [OrderBriefDto](docs/OrderBriefDto.md)
- [OrderLineItemDto](docs/OrderLineItemDto.md)
- [OrderRefundDto](docs/OrderRefundDto.md)
- [OrderReturnRequestDto](docs/OrderReturnRequestDto.md)
- [OrderReturnRequestItemDto](docs/OrderReturnRequestItemDto.md)
- [OrderShipmentDto](docs/OrderShipmentDto.md)
- [OrderShipmentItemDto](docs/OrderShipmentItemDto.md)
- [OrderShippingMethodDetailsDto](docs/OrderShippingMethodDetailsDto.md)
- [PaginatedAuditLogsDto](docs/PaginatedAuditLogsDto.md)
- [PaginatedCatalogProductsDto](docs/PaginatedCatalogProductsDto.md)
- [PaginatedNotificationsDto](docs/PaginatedNotificationsDto.md)
- [PaginatedPaymentAttemptsDto](docs/PaginatedPaymentAttemptsDto.md)
- [PaginatedPaymentWebhookEventsDto](docs/PaginatedPaymentWebhookEventsDto.md)
- [PaginatedRefundsDto](docs/PaginatedRefundsDto.md)
- [PaginatedReportExportsDto](docs/PaginatedReportExportsDto.md)
- [PaginatedReviewsDto](docs/PaginatedReviewsDto.md)
- [PaginatedStockMovementsDto](docs/PaginatedStockMovementsDto.md)
- [PaginationDto](docs/PaginationDto.md)
- [PasswordResetConfirmResponseDto](docs/PasswordResetConfirmResponseDto.md)
- [PasswordResetRequestResponseDto](docs/PasswordResetRequestResponseDto.md)
- [PaymentAttemptResponseDto](docs/PaymentAttemptResponseDto.md)
- [PaymentWebhookEventResponseDto](docs/PaymentWebhookEventResponseDto.md)
- [PricingPreviewAppliedPromotionDto](docs/PricingPreviewAppliedPromotionDto.md)
- [PricingPreviewLineItemDto](docs/PricingPreviewLineItemDto.md)
- [PricingPreviewResponseDto](docs/PricingPreviewResponseDto.md)
- [PricingPreviewShippingMethodDto](docs/PricingPreviewShippingMethodDto.md)
- [ProductTranslationDto](docs/ProductTranslationDto.md)
- [ProductTypeAttributeLinkDto](docs/ProductTypeAttributeLinkDto.md)
- [ProductVariantDto](docs/ProductVariantDto.md)
- [ProductVariantTranslationDto](docs/ProductVariantTranslationDto.md)
- [PromotionPerformanceDto](docs/PromotionPerformanceDto.md)
- [PromotionPerformanceSumDto](docs/PromotionPerformanceSumDto.md)
- [PromotionResponseDto](docs/PromotionResponseDto.md)
- [PublicLegalReferenceDto](docs/PublicLegalReferenceDto.md)
- [PushDeviceResponseDto](docs/PushDeviceResponseDto.md)
- [ReceiveReturnRequestDto](docs/ReceiveReturnRequestDto.md)
- [ReceiveReturnRequestItemDto](docs/ReceiveReturnRequestItemDto.md)
- [RefreshTokenDto](docs/RefreshTokenDto.md)
- [RefundResponseDto](docs/RefundResponseDto.md)
- [RegisterDto](docs/RegisterDto.md)
- [RegisterPushDeviceDto](docs/RegisterPushDeviceDto.md)
- [RegisterResponseDto](docs/RegisterResponseDto.md)
- [ReportExportDownloadResponseDto](docs/ReportExportDownloadResponseDto.md)
- [ReportExportResponseDto](docs/ReportExportResponseDto.md)
- [ReportExportUserBriefDto](docs/ReportExportUserBriefDto.md)
- [ReportingCountMetricDto](docs/ReportingCountMetricDto.md)
- [RequestPasswordResetDto](docs/RequestPasswordResetDto.md)
- [ResetPasswordDto](docs/ResetPasswordDto.md)
- [ReturnRequestItemResponseDto](docs/ReturnRequestItemResponseDto.md)
- [ReturnRequestResponseDto](docs/ReturnRequestResponseDto.md)
- [ReviewModerationActionDto](docs/ReviewModerationActionDto.md)
- [ReviewModerationDto](docs/ReviewModerationDto.md)
- [ReviewOrderLineDto](docs/ReviewOrderLineDto.md)
- [ReviewProductDto](docs/ReviewProductDto.md)
- [ReviewProductTranslationDto](docs/ReviewProductTranslationDto.md)
- [ReviewResponseDto](docs/ReviewResponseDto.md)
- [ReviewReturnRequestDto](docs/ReviewReturnRequestDto.md)
- [SalesSummaryAmountSumDto](docs/SalesSummaryAmountSumDto.md)
- [SalesSummaryLinesMetricDto](docs/SalesSummaryLinesMetricDto.md)
- [SalesSummaryLinesSumDto](docs/SalesSummaryLinesSumDto.md)
- [SalesSummaryMetricDto](docs/SalesSummaryMetricDto.md)
- [SalesSummaryRefundsMetricDto](docs/SalesSummaryRefundsMetricDto.md)
- [SalesSummaryRefundsSumDto](docs/SalesSummaryRefundsSumDto.md)
- [SalesSummaryResponseDto](docs/SalesSummaryResponseDto.md)
- [SerializedOrderDto](docs/SerializedOrderDto.md)
- [ShippingMethodResponseDto](docs/ShippingMethodResponseDto.md)
- [ShippingZoneResponseDto](docs/ShippingZoneResponseDto.md)
- [StaffDetailDto](docs/StaffDetailDto.md)
- [StaffStatusResponseDto](docs/StaffStatusResponseDto.md)
- [StaffSummaryDto](docs/StaffSummaryDto.md)
- [StockAdjustmentResponseDto](docs/StockAdjustmentResponseDto.md)
- [StockLevelResponseDto](docs/StockLevelResponseDto.md)
- [StockLevelVariantDto](docs/StockLevelVariantDto.md)
- [StockLevelWarehouseDto](docs/StockLevelWarehouseDto.md)
- [StockMovementActorDto](docs/StockMovementActorDto.md)
- [StockMovementItemDto](docs/StockMovementItemDto.md)
- [StockMovementVariantDto](docs/StockMovementVariantDto.md)
- [StockMovementWarehouseDto](docs/StockMovementWarehouseDto.md)
- [StockReservationResponseDto](docs/StockReservationResponseDto.md)
- [StockReservationUserDto](docs/StockReservationUserDto.md)
- [StockReservationVariantDto](docs/StockReservationVariantDto.md)
- [StockReservationWarehouseDto](docs/StockReservationWarehouseDto.md)
- [StoreSettingResponseDto](docs/StoreSettingResponseDto.md)
- [TaxClassResponseDto](docs/TaxClassResponseDto.md)
- [TopProductDto](docs/TopProductDto.md)
- [TopProductSumDto](docs/TopProductSumDto.md)
- [TranslationDto](docs/TranslationDto.md)
- [UnregisterPushDeviceResponseDto](docs/UnregisterPushDeviceResponseDto.md)
- [UpdateAdminRolePermissionsDto](docs/UpdateAdminRolePermissionsDto.md)
- [UpdateCartItemDto](docs/UpdateCartItemDto.md)
- [UpdateLegalReferencesDto](docs/UpdateLegalReferencesDto.md)
- [UpdatePricingBehaviorDto](docs/UpdatePricingBehaviorDto.md)
- [UpdateProductDto](docs/UpdateProductDto.md)
- [UpdateProductVariantDto](docs/UpdateProductVariantDto.md)
- [UpdateShipmentStatusDto](docs/UpdateShipmentStatusDto.md)
- [UpdateStaffRolesDto](docs/UpdateStaffRolesDto.md)
- [UpdateStaffStatusDto](docs/UpdateStaffStatusDto.md)
- [UpdateStoreCurrencyDto](docs/UpdateStoreCurrencyDto.md)
- [UpsertContentPageDto](docs/UpsertContentPageDto.md)
- [UpsertCouponDto](docs/UpsertCouponDto.md)
- [UpsertManualTaxRateDto](docs/UpsertManualTaxRateDto.md)
- [UpsertNotificationPreferenceDto](docs/UpsertNotificationPreferenceDto.md)
- [UpsertPromotionDto](docs/UpsertPromotionDto.md)
- [UpsertShippingMethodDto](docs/UpsertShippingMethodDto.md)
- [UpsertShippingZoneDto](docs/UpsertShippingZoneDto.md)
- [UpsertTaxClassDto](docs/UpsertTaxClassDto.md)
- [UpsertVariantPriceDto](docs/UpsertVariantPriceDto.md)
- [UserProfileDto](docs/UserProfileDto.md)
- [UserRoleDto](docs/UserRoleDto.md)
- [VariantOptionValueDto](docs/VariantOptionValueDto.md)
- [VariantPriceResponseDto](docs/VariantPriceResponseDto.md)
- [VerificationRequestResponseDto](docs/VerificationRequestResponseDto.md)
- [VerifyEmailDto](docs/VerifyEmailDto.md)
- [VerifyEmailResponseDto](docs/VerifyEmailResponseDto.md)
- [WishlistItemResponseDto](docs/WishlistItemResponseDto.md)
- [WishlistResponseDto](docs/WishlistResponseDto.md)

### Authorization


Authentication schemes defined for the API:
<a id="bearer"></a>
#### bearer


- **Type**: HTTP Bearer Token authentication (JWT)

## About

This TypeScript SDK client supports the [Fetch API](https://fetch.spec.whatwg.org/)
and is automatically generated by the
[OpenAPI Generator](https://openapi-generator.tech) project:

- API version: `1.0.0`
- Package version: `0.1.0`
- Generator version: `7.22.0`
- Build package: `org.openapitools.codegen.languages.TypeScriptFetchClientCodegen`

The generated npm module supports the following:

- Environments
  * Node.js
  * Webpack
  * Browserify
- Language levels
  * ES5 - you must have a Promises/A+ library installed
  * ES6
- Module systems
  * CommonJS
  * ES6 module system


## Development

### Building

To build the TypeScript source code, you need to have Node.js and npm installed.
After cloning the repository, navigate to the project directory and run:

```bash
npm install
npm run build
```

### Publishing

Once you've built the package, you can publish it to npm:

```bash
npm publish
```

## License

[]()
