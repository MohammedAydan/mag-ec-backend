
# UpsertCouponDto


## Properties

Name | Type
------------ | -------------
`code` | string
`status` | string
`startsAt` | Date
`endsAt` | Date
`totalUsageLimit` | number
`perCustomerUsageLimit` | number

## Example

```typescript
import type { UpsertCouponDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "code": null,
  "status": null,
  "startsAt": null,
  "endsAt": null,
  "totalUsageLimit": null,
  "perCustomerUsageLimit": null,
} satisfies UpsertCouponDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UpsertCouponDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


