# IdentityAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**adminAccessCreateRole**](IdentityAdminApi.md#adminaccesscreaterole) | **POST** /api/v1/identity/admin/roles | Create a new admin role |
| [**adminAccessInviteStaff**](IdentityAdminApi.md#adminaccessinvitestaff) | **POST** /api/v1/identity/admin/staff/invitations | Create a staff member invitation |
| [**adminAccessListCustomers**](IdentityAdminApi.md#adminaccesslistcustomers) | **GET** /api/v1/identity/admin/customers | List all customers |
| [**adminAccessListPermissions**](IdentityAdminApi.md#adminaccesslistpermissions) | **GET** /api/v1/identity/admin/permissions | List all available admin permissions |
| [**adminAccessListRoles**](IdentityAdminApi.md#adminaccesslistroles) | **GET** /api/v1/identity/admin/roles | List all admin roles |
| [**adminAccessListStaff**](IdentityAdminApi.md#adminaccessliststaff) | **GET** /api/v1/identity/admin/staff | List all staff members |
| [**adminAccessResendStaffInvitation**](IdentityAdminApi.md#adminaccessresendstaffinvitation) | **POST** /api/v1/identity/admin/staff/{staffId}/resend-invitation | Resend a staff member invitation |
| [**adminAccessUpdateRolePermissions**](IdentityAdminApi.md#adminaccessupdaterolepermissions) | **PATCH** /api/v1/identity/admin/roles/{roleId}/permissions | Update an admin role\&#39;s permission set |
| [**adminAccessUpdateStaffRoles**](IdentityAdminApi.md#adminaccessupdatestaffroles) | **PATCH** /api/v1/identity/admin/staff/{staffId}/roles | Update a staff member\&#39;s role assignments |
| [**adminAccessUpdateStaffStatus**](IdentityAdminApi.md#adminaccessupdatestaffstatus) | **PATCH** /api/v1/identity/admin/staff/{staffId}/status | Update a staff member\&#39;s account status |



## adminAccessCreateRole

> AdminRoleDto adminAccessCreateRole(createAdminRoleDto)

Create a new admin role

### Example

```ts
import {
  Configuration,
  IdentityAdminApi,
} from '@mag/generated-api-client';
import type { AdminAccessCreateRoleRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityAdminApi(config);

  const body = {
    // CreateAdminRoleDto
    createAdminRoleDto: ...,
  } satisfies AdminAccessCreateRoleRequest;

  try {
    const data = await api.adminAccessCreateRole(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **createAdminRoleDto** | [CreateAdminRoleDto](CreateAdminRoleDto.md) |  | |

### Return type

[**AdminRoleDto**](AdminRoleDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Role created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Missing required role or permission |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminAccessInviteStaff

> StaffSummaryDto adminAccessInviteStaff(inviteStaffDto)

Create a staff member invitation

### Example

```ts
import {
  Configuration,
  IdentityAdminApi,
} from '@mag/generated-api-client';
import type { AdminAccessInviteStaffRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityAdminApi(config);

  const body = {
    // InviteStaffDto
    inviteStaffDto: ...,
  } satisfies AdminAccessInviteStaffRequest;

  try {
    const data = await api.adminAccessInviteStaff(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **inviteStaffDto** | [InviteStaffDto](InviteStaffDto.md) |  | |

### Return type

[**StaffSummaryDto**](StaffSummaryDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Staff invitation created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Missing required role or permission |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminAccessListCustomers

> Array&lt;AdminCustomerSummaryDto&gt; adminAccessListCustomers()

List all customers

### Example

```ts
import {
  Configuration,
  IdentityAdminApi,
} from '@mag/generated-api-client';
import type { AdminAccessListCustomersRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityAdminApi(config);

  try {
    const data = await api.adminAccessListCustomers();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;AdminCustomerSummaryDto&gt;**](AdminCustomerSummaryDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All customers |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Missing required role or permission |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminAccessListPermissions

> Array&lt;AdminPermissionDto&gt; adminAccessListPermissions()

List all available admin permissions

### Example

```ts
import {
  Configuration,
  IdentityAdminApi,
} from '@mag/generated-api-client';
import type { AdminAccessListPermissionsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityAdminApi(config);

  try {
    const data = await api.adminAccessListPermissions();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;AdminPermissionDto&gt;**](AdminPermissionDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All available permissions |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Missing required role or permission |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminAccessListRoles

> Array&lt;AdminRoleDto&gt; adminAccessListRoles()

List all admin roles

### Example

```ts
import {
  Configuration,
  IdentityAdminApi,
} from '@mag/generated-api-client';
import type { AdminAccessListRolesRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityAdminApi(config);

  try {
    const data = await api.adminAccessListRoles();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;AdminRoleDto&gt;**](AdminRoleDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All admin roles |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Missing required role or permission |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminAccessListStaff

> Array&lt;StaffSummaryDto&gt; adminAccessListStaff()

List all staff members

### Example

```ts
import {
  Configuration,
  IdentityAdminApi,
} from '@mag/generated-api-client';
import type { AdminAccessListStaffRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityAdminApi(config);

  try {
    const data = await api.adminAccessListStaff();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;StaffSummaryDto&gt;**](StaffSummaryDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All staff members |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Missing required role or permission |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminAccessResendStaffInvitation

> InvitationSentResponseDto adminAccessResendStaffInvitation(staffId)

Resend a staff member invitation

### Example

```ts
import {
  Configuration,
  IdentityAdminApi,
} from '@mag/generated-api-client';
import type { AdminAccessResendStaffInvitationRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityAdminApi(config);

  const body = {
    // string | UUID of the staff member to resend invitation to
    staffId: staffId_example,
  } satisfies AdminAccessResendStaffInvitationRequest;

  try {
    const data = await api.adminAccessResendStaffInvitation(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **staffId** | `string` | UUID of the staff member to resend invitation to | [Defaults to `undefined`] |

### Return type

[**InvitationSentResponseDto**](InvitationSentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Invitation resent |  -  |
| **400** | Invalid request parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Missing required role or permission |  -  |
| **404** | Requested staff member not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminAccessUpdateRolePermissions

> AdminRoleDto adminAccessUpdateRolePermissions(roleId, updateAdminRolePermissionsDto)

Update an admin role\&#39;s permission set

### Example

```ts
import {
  Configuration,
  IdentityAdminApi,
} from '@mag/generated-api-client';
import type { AdminAccessUpdateRolePermissionsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityAdminApi(config);

  const body = {
    // string | UUID of the admin role to update
    roleId: roleId_example,
    // UpdateAdminRolePermissionsDto
    updateAdminRolePermissionsDto: ...,
  } satisfies AdminAccessUpdateRolePermissionsRequest;

  try {
    const data = await api.adminAccessUpdateRolePermissions(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **roleId** | `string` | UUID of the admin role to update | [Defaults to `undefined`] |
| **updateAdminRolePermissionsDto** | [UpdateAdminRolePermissionsDto](UpdateAdminRolePermissionsDto.md) |  | |

### Return type

[**AdminRoleDto**](AdminRoleDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Role permissions updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Missing required role or permission |  -  |
| **404** | Requested role not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminAccessUpdateStaffRoles

> StaffDetailDto adminAccessUpdateStaffRoles(staffId, updateStaffRolesDto)

Update a staff member\&#39;s role assignments

### Example

```ts
import {
  Configuration,
  IdentityAdminApi,
} from '@mag/generated-api-client';
import type { AdminAccessUpdateStaffRolesRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityAdminApi(config);

  const body = {
    // string | UUID of the staff member to update
    staffId: staffId_example,
    // UpdateStaffRolesDto
    updateStaffRolesDto: ...,
  } satisfies AdminAccessUpdateStaffRolesRequest;

  try {
    const data = await api.adminAccessUpdateStaffRoles(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **staffId** | `string` | UUID of the staff member to update | [Defaults to `undefined`] |
| **updateStaffRolesDto** | [UpdateStaffRolesDto](UpdateStaffRolesDto.md) |  | |

### Return type

[**StaffDetailDto**](StaffDetailDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Staff roles updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Missing required role or permission |  -  |
| **404** | Requested staff member not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminAccessUpdateStaffStatus

> StaffStatusResponseDto adminAccessUpdateStaffStatus(staffId, updateStaffStatusDto)

Update a staff member\&#39;s account status

### Example

```ts
import {
  Configuration,
  IdentityAdminApi,
} from '@mag/generated-api-client';
import type { AdminAccessUpdateStaffStatusRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityAdminApi(config);

  const body = {
    // string | UUID of the staff member to update
    staffId: staffId_example,
    // UpdateStaffStatusDto
    updateStaffStatusDto: ...,
  } satisfies AdminAccessUpdateStaffStatusRequest;

  try {
    const data = await api.adminAccessUpdateStaffStatus(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **staffId** | `string` | UUID of the staff member to update | [Defaults to `undefined`] |
| **updateStaffStatusDto** | [UpdateStaffStatusDto](UpdateStaffStatusDto.md) |  | |

### Return type

[**StaffStatusResponseDto**](StaffStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Staff status updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Missing required role or permission |  -  |
| **404** | Requested staff member not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

