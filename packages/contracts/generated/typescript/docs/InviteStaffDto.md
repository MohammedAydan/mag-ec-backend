
# InviteStaffDto


## Properties

Name | Type
------------ | -------------
`email` | string
`displayName` | string
`roleIds` | Array&lt;string&gt;

## Example

```typescript
import type { InviteStaffDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "email": null,
  "displayName": null,
  "roleIds": null,
} satisfies InviteStaffDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as InviteStaffDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


