
# ReviewOrderLineDto


## Properties

Name | Type
------------ | -------------
`id` | string
`orderId` | string
`productId` | string
`variantId` | string
`sku` | string
`productName` | string
`variantName` | string
`quantity` | number

## Example

```typescript
import type { ReviewOrderLineDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "orderId": null,
  "productId": null,
  "variantId": null,
  "sku": null,
  "productName": null,
  "variantName": null,
  "quantity": null,
} satisfies ReviewOrderLineDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ReviewOrderLineDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


