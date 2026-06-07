
# AdminCustomerSummaryDto


## Properties

Name | Type
------------ | -------------
`id` | string
`email` | string
`displayName` | string
`status` | string
`createdAt` | string
`lastLoginAt` | string

## Example

```typescript
import type { AdminCustomerSummaryDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "email": null,
  "displayName": null,
  "status": null,
  "createdAt": null,
  "lastLoginAt": null,
} satisfies AdminCustomerSummaryDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AdminCustomerSummaryDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


