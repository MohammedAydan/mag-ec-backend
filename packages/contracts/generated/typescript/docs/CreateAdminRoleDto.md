
# CreateAdminRoleDto


## Properties

Name | Type
------------ | -------------
`key` | string
`name` | string
`permissionKeys` | Array&lt;string&gt;
`description` | string

## Example

```typescript
import type { CreateAdminRoleDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "key": null,
  "name": null,
  "permissionKeys": null,
  "description": null,
} satisfies CreateAdminRoleDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreateAdminRoleDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


