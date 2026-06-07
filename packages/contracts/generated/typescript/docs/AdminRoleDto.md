
# AdminRoleDto


## Properties

Name | Type
------------ | -------------
`id` | string
`key` | string
`name` | string
`permissions` | [Array&lt;AdminPermissionDto&gt;](AdminPermissionDto.md)
`createdAt` | string
`updatedAt` | string
`description` | string
`staffCount` | number

## Example

```typescript
import type { AdminRoleDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "key": null,
  "name": null,
  "permissions": null,
  "createdAt": null,
  "updatedAt": null,
  "description": null,
  "staffCount": null,
} satisfies AdminRoleDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AdminRoleDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


