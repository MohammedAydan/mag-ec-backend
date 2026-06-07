
# UpsertPromotionDto


## Properties

Name | Type
------------ | -------------
`name` | string
`status` | string
`trigger` | string
`rewardType` | string
`description` | string
`currencyCode` | string
`fixedAmount` | number
`percentageBps` | number
`maxDiscountAmount` | number
`minSubtotalAmount` | number
`isCombinable` | boolean
`priority` | number
`startsAt` | Date
`endsAt` | Date
`totalUsageLimit` | number
`perCustomerUsageLimit` | number
`maxApplicationsPerOrder` | number
`excludedPromotionIds` | Set&lt;string&gt;

## Example

```typescript
import type { UpsertPromotionDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "name": null,
  "status": null,
  "trigger": null,
  "rewardType": null,
  "description": null,
  "currencyCode": null,
  "fixedAmount": null,
  "percentageBps": null,
  "maxDiscountAmount": null,
  "minSubtotalAmount": null,
  "isCombinable": null,
  "priority": null,
  "startsAt": null,
  "endsAt": null,
  "totalUsageLimit": null,
  "perCustomerUsageLimit": null,
  "maxApplicationsPerOrder": null,
  "excludedPromotionIds": null,
} satisfies UpsertPromotionDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UpsertPromotionDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


