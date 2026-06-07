
# PromotionResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`key` | string
`name` | string
`status` | string
`trigger` | string
`rewardType` | string
`isCombinable` | boolean
`priority` | number
`maxApplicationsPerOrder` | number
`reservedCount` | number
`redeemedCount` | number
`createdAt` | string
`updatedAt` | string
`description` | string
`currencyCode` | string
`fixedAmount` | number
`percentageBps` | number
`maxDiscountAmount` | number
`minSubtotalAmount` | number
`startsAt` | string
`endsAt` | string
`totalUsageLimit` | number
`perCustomerUsageLimit` | number

## Example

```typescript
import type { PromotionResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "key": null,
  "name": null,
  "status": null,
  "trigger": null,
  "rewardType": null,
  "isCombinable": null,
  "priority": null,
  "maxApplicationsPerOrder": null,
  "reservedCount": null,
  "redeemedCount": null,
  "createdAt": null,
  "updatedAt": null,
  "description": null,
  "currencyCode": null,
  "fixedAmount": null,
  "percentageBps": null,
  "maxDiscountAmount": null,
  "minSubtotalAmount": null,
  "startsAt": null,
  "endsAt": null,
  "totalUsageLimit": null,
  "perCustomerUsageLimit": null,
} satisfies PromotionResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PromotionResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


