
# ShippingMethodResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`zoneId` | string
`key` | string
`name` | string
`isActive` | boolean
`rateType` | string
`currencyCode` | string
`sortOrder` | number
`updatedAt` | string
`flatAmount` | number
`percentageBps` | number
`estimatedMinDays` | number
`estimatedMaxDays` | number

## Example

```typescript
import type { ShippingMethodResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "zoneId": null,
  "key": null,
  "name": null,
  "isActive": null,
  "rateType": null,
  "currencyCode": null,
  "sortOrder": null,
  "updatedAt": null,
  "flatAmount": null,
  "percentageBps": null,
  "estimatedMinDays": null,
  "estimatedMaxDays": null,
} satisfies ShippingMethodResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ShippingMethodResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


