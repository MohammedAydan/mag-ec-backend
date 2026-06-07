# Release Smoke Test Report
**Date:** 2026-06-07T02:08:15.056Z
**API Base:** http://localhost:3003/api/v1

| # | Check | Result | Detail |
|---|-------|--------|--------|
| 1 | GET /health/liveness → 200 | ✅ | status=200 |
| 2 | GET /health/readiness → 200 | ✅ | status=200 keys={status,info,error,details} |
| 3 | POST /auth/login → 200 + tokens | ✅ | Token acquired: yes (917 chars) |
| 4 | GET /auth/me → 200 | ✅ | email=admin@example.com |
| 5 | POST /auth/refresh → 200 | ✅ | Token refreshed: yes |
| 6 | GET /pricing/admin/settings/behavior → 200 | ✅ | status=200 |
| 7 | GET /pricing/admin/settings/currency → 200 | ✅ | status=200 |
| 8 | GET /pricing/admin/tax-classes/standard → 200 | ✅ | status=200 |
| 9 | GET /pricing/admin/tax-classes/nonexistent → 404 | ✅ | status=404 |
| 10 | GET /pricing/admin/shipping-zones/domestic → 200 | ✅ | status=200 |
| 11 | POST /promotions/admin → 201 | ✅ | status=201 id=cmq357fx90012ug1iobv0dfv3 |
| 12 | GET /promotions/admin — created promo in list | ✅ | found=true |
| 13 | POST /content/admin/pages → 201 | ✅ | status=201 key=smoke-test-page-mq357fn6 |
| 14 | GET /content/admin/pages — created page in list | ✅ | found=true |
| 15 | POST /catalog/admin/products (no variants) → 201 DRAFT | ✅ | status=201 id=cmq357g0e0015ug1ipwo897vq variants=[len=0] |
| 16 | POST /catalog/admin/products/:id/publish (no variants) → 400 | ✅ | status=400 msg=The product brand must be published before publishing a prod |
| 17 | POST /identity/admin/staff/invitations → 201 (emailDelivered ok) | ✅ | status=201 staffId=cmq357g4m0016ug1iz1o4nhfz staffStatus=INVITED emailDelivered=false |
| 18 | POST /identity/admin/staff/:id/resend-invitation (no body) → success | ✅ | status=201 invitationSent=true emailDelivered=false |
| 19 | OpenAPI: path /api/v1/pricing/admin/settings/behavior exists | ✅ | present |
| 20 | OpenAPI: path /api/v1/pricing/admin/settings/currency exists | ✅ | present |
| 21 | OpenAPI: path /api/v1/pricing/admin/tax-classes/{key} exists | ✅ | present |
| 22 | OpenAPI: path /api/v1/pricing/admin/shipping-zones/{key} exists | ✅ | present |
| 23 | OpenAPI: path /api/v1/promotions/admin exists | ✅ | present |
| 24 | OpenAPI: path /api/v1/content/admin/pages exists | ✅ | present |
| 25 | OpenAPI: POST /api/v1/promotions/admin documents 201 | ✅ | responses=201,400,401,403 |
| 26 | OpenAPI: POST /api/v1/content/admin/pages documents 201 | ✅ | responses=201,400,401,403 |
| 27 | OpenAPI: operation count | ✅ | ops=145 |
| 28 | POST /auth/logout → 200/201 | ✅ | status=204 |

**Total:** 28 | **Passed:** 28 | **Failed:** 0 | **Skipped:** 0

**Result:** ✅ PASS
