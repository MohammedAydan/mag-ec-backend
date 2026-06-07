
# UpsertShippingMethodDto


## Properties

Name | Type
------------ | -------------
`name` | string
`rateType` | string
`currencyCode` | string
`isActive` | boolean
`flatAmount` | number
`percentageBps` | number
`minSubtotalAmount` | number
`maxSubtotalAmount` | number
`minItemQuantity` | number
`maxItemQuantity` | number
`estimatedMinDays` | number
`estimatedMaxDays` | number
`sortOrder` | number

## Example

```typescript
import type { UpsertShippingMethodDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "name": null,
  "rateType": null,
  "currencyCode": null,
  "isActive": null,
  "flatAmount": null,
  "percentageBps": null,
  "minSubtotalAmount": null,
  "maxSubtotalAmount": null,
  "minItemQuantity": null,
  "maxItemQuantity": null,
  "estimatedMinDays": null,
  "estimatedMaxDays": null,
  "sortOrder": null,
} satisfies UpsertShippingMethodDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UpsertShippingMethodDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


