# mag_api_client.api.IdentityAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminAccessCreateRole**](IdentityAdminApi.md#adminaccesscreaterole) | **POST** /api/v1/identity/admin/roles | Create a new admin role
[**adminAccessInviteStaff**](IdentityAdminApi.md#adminaccessinvitestaff) | **POST** /api/v1/identity/admin/staff/invitations | Create a staff member invitation
[**adminAccessListCustomers**](IdentityAdminApi.md#adminaccesslistcustomers) | **GET** /api/v1/identity/admin/customers | List all customers
[**adminAccessListPermissions**](IdentityAdminApi.md#adminaccesslistpermissions) | **GET** /api/v1/identity/admin/permissions | List all available admin permissions
[**adminAccessListRoles**](IdentityAdminApi.md#adminaccesslistroles) | **GET** /api/v1/identity/admin/roles | List all admin roles
[**adminAccessListStaff**](IdentityAdminApi.md#adminaccessliststaff) | **GET** /api/v1/identity/admin/staff | List all staff members
[**adminAccessResendStaffInvitation**](IdentityAdminApi.md#adminaccessresendstaffinvitation) | **POST** /api/v1/identity/admin/staff/{staffId}/resend-invitation | Resend a staff member invitation
[**adminAccessUpdateRolePermissions**](IdentityAdminApi.md#adminaccessupdaterolepermissions) | **PATCH** /api/v1/identity/admin/roles/{roleId}/permissions | Update an admin role&#39;s permission set
[**adminAccessUpdateStaffRoles**](IdentityAdminApi.md#adminaccessupdatestaffroles) | **PATCH** /api/v1/identity/admin/staff/{staffId}/roles | Update a staff member&#39;s role assignments
[**adminAccessUpdateStaffStatus**](IdentityAdminApi.md#adminaccessupdatestaffstatus) | **PATCH** /api/v1/identity/admin/staff/{staffId}/status | Update a staff member&#39;s account status


# **adminAccessCreateRole**
> AdminRoleDto adminAccessCreateRole(createAdminRoleDto)

Create a new admin role

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityAdminApi();
final CreateAdminRoleDto createAdminRoleDto = ; // CreateAdminRoleDto | 

try {
    final response = api.adminAccessCreateRole(createAdminRoleDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityAdminApi->adminAccessCreateRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createAdminRoleDto** | [**CreateAdminRoleDto**](CreateAdminRoleDto.md)|  | 

### Return type

[**AdminRoleDto**](AdminRoleDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAccessInviteStaff**
> StaffSummaryDto adminAccessInviteStaff(inviteStaffDto)

Create a staff member invitation

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityAdminApi();
final InviteStaffDto inviteStaffDto = ; // InviteStaffDto | 

try {
    final response = api.adminAccessInviteStaff(inviteStaffDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityAdminApi->adminAccessInviteStaff: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inviteStaffDto** | [**InviteStaffDto**](InviteStaffDto.md)|  | 

### Return type

[**StaffSummaryDto**](StaffSummaryDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAccessListCustomers**
> BuiltList<AdminCustomerSummaryDto> adminAccessListCustomers()

List all customers

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityAdminApi();

try {
    final response = api.adminAccessListCustomers();
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityAdminApi->adminAccessListCustomers: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdminCustomerSummaryDto&gt;**](AdminCustomerSummaryDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAccessListPermissions**
> BuiltList<AdminPermissionDto> adminAccessListPermissions()

List all available admin permissions

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityAdminApi();

try {
    final response = api.adminAccessListPermissions();
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityAdminApi->adminAccessListPermissions: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdminPermissionDto&gt;**](AdminPermissionDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAccessListRoles**
> BuiltList<AdminRoleDto> adminAccessListRoles()

List all admin roles

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityAdminApi();

try {
    final response = api.adminAccessListRoles();
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityAdminApi->adminAccessListRoles: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdminRoleDto&gt;**](AdminRoleDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAccessListStaff**
> BuiltList<StaffSummaryDto> adminAccessListStaff()

List all staff members

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityAdminApi();

try {
    final response = api.adminAccessListStaff();
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityAdminApi->adminAccessListStaff: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;StaffSummaryDto&gt;**](StaffSummaryDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAccessResendStaffInvitation**
> InvitationSentResponseDto adminAccessResendStaffInvitation(staffId)

Resend a staff member invitation

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityAdminApi();
final String staffId = staffId_example; // String | UUID of the staff member to resend invitation to

try {
    final response = api.adminAccessResendStaffInvitation(staffId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityAdminApi->adminAccessResendStaffInvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **staffId** | **String**| UUID of the staff member to resend invitation to | 

### Return type

[**InvitationSentResponseDto**](InvitationSentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAccessUpdateRolePermissions**
> AdminRoleDto adminAccessUpdateRolePermissions(updateAdminRolePermissionsDto, roleId)

Update an admin role's permission set

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityAdminApi();
final UpdateAdminRolePermissionsDto updateAdminRolePermissionsDto = ; // UpdateAdminRolePermissionsDto | 
final String roleId = roleId_example; // String | UUID of the admin role to update

try {
    final response = api.adminAccessUpdateRolePermissions(updateAdminRolePermissionsDto, roleId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityAdminApi->adminAccessUpdateRolePermissions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateAdminRolePermissionsDto** | [**UpdateAdminRolePermissionsDto**](UpdateAdminRolePermissionsDto.md)|  | 
 **roleId** | **String**| UUID of the admin role to update | 

### Return type

[**AdminRoleDto**](AdminRoleDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAccessUpdateStaffRoles**
> StaffDetailDto adminAccessUpdateStaffRoles(updateStaffRolesDto, staffId)

Update a staff member's role assignments

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityAdminApi();
final UpdateStaffRolesDto updateStaffRolesDto = ; // UpdateStaffRolesDto | 
final String staffId = staffId_example; // String | UUID of the staff member to update

try {
    final response = api.adminAccessUpdateStaffRoles(updateStaffRolesDto, staffId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityAdminApi->adminAccessUpdateStaffRoles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateStaffRolesDto** | [**UpdateStaffRolesDto**](UpdateStaffRolesDto.md)|  | 
 **staffId** | **String**| UUID of the staff member to update | 

### Return type

[**StaffDetailDto**](StaffDetailDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAccessUpdateStaffStatus**
> StaffStatusResponseDto adminAccessUpdateStaffStatus(updateStaffStatusDto, staffId)

Update a staff member's account status

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityAdminApi();
final UpdateStaffStatusDto updateStaffStatusDto = ; // UpdateStaffStatusDto | 
final String staffId = staffId_example; // String | UUID of the staff member to update

try {
    final response = api.adminAccessUpdateStaffStatus(updateStaffStatusDto, staffId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityAdminApi->adminAccessUpdateStaffStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateStaffStatusDto** | [**UpdateStaffStatusDto**](UpdateStaffStatusDto.md)|  | 
 **staffId** | **String**| UUID of the staff member to update | 

### Return type

[**StaffStatusResponseDto**](StaffStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

