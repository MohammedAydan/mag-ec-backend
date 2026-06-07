
# OrderLineItemDto


## Properties

Name | Type
------------ | -------------
`id` | string
`productId` | string
`variantId` | string
`sku` | string
`productName` | string
`variantName` | string
`quantity` | number
`currencyCode` | string
`unitBaseAmount` | number
`effectiveUnitAmount` | number
`lineSubtotalAmount` | number
`taxAmount` | number
`unitSaleAmount` | number

## Example

```typescript
import type { OrderLineItemDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "productId": null,
  "variantId": null,
  "sku": null,
  "productName": null,
  "variantName": null,
  "quantity": null,
  "currencyCode": null,
  "unitBaseAmount": null,
  "effectiveUnitAmount": null,
  "lineSubtotalAmount": null,
  "taxAmount": null,
  "unitSaleAmount": null,
} satisfies OrderLineItemDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as OrderLineItemDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


