
# CouponResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`promotionId` | string
`code` | string
`normalizedCode` | string
`status` | string
`createdAt` | string
`updatedAt` | string
`startsAt` | string
`endsAt` | string
`totalUsageLimit` | number
`perCustomerUsageLimit` | number

## Example

```typescript
import type { CouponResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "promotionId": null,
  "code": null,
  "normalizedCode": null,
  "status": null,
  "createdAt": null,
  "updatedAt": null,
  "startsAt": null,
  "endsAt": null,
  "totalUsageLimit": null,
  "perCustomerUsageLimit": null,
} satisfies CouponResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CouponResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


