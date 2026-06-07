
# CheckoutPreviewShippingMethodDto


## Properties

Name | Type
------------ | -------------
`methodId` | string
`key` | string
`name` | string
`amount` | number
`totalAmount` | number
`estimatedMinDays` | number
`estimatedMaxDays` | number

## Example

```typescript
import type { CheckoutPreviewShippingMethodDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "methodId": null,
  "key": null,
  "name": null,
  "amount": null,
  "totalAmount": null,
  "estimatedMinDays": null,
  "estimatedMaxDays": null,
} satisfies CheckoutPreviewShippingMethodDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CheckoutPreviewShippingMethodDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


