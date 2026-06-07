
# UserProfileDto


## Properties

Name | Type
------------ | -------------
`id` | string
`email` | string
`displayName` | string
`userType` | string
`status` | string
`createdAt` | string
`roles` | [Array&lt;UserRoleDto&gt;](UserRoleDto.md)
`emailVerifiedAt` | string
`lastLoginAt` | string

## Example

```typescript
import type { UserProfileDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "email": null,
  "displayName": null,
  "userType": null,
  "status": null,
  "createdAt": null,
  "roles": null,
  "emailVerifiedAt": null,
  "lastLoginAt": null,
} satisfies UserProfileDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UserProfileDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


