
# StaffDetailDto


## Properties

Name | Type
------------ | -------------
`id` | string
`email` | string
`displayName` | string
`status` | string
`roles` | [Array&lt;UserRoleDto&gt;](UserRoleDto.md)

## Example

```typescript
import type { StaffDetailDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "email": null,
  "displayName": null,
  "status": null,
  "roles": null,
} satisfies StaffDetailDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StaffDetailDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


