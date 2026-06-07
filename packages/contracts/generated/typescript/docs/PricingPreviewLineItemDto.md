
# PricingPreviewLineItemDto


## Properties

Name | Type
------------ | -------------
`variantId` | string
`sku` | string
`quantity` | number
`currencyCode` | string
`unitBaseAmount` | number
`effectiveUnitAmount` | number
`lineSubtotalAmount` | number
`taxAmount` | number
`taxRateBps` | number
`taxIncludedInPrice` | boolean
`unitSaleAmount` | number

## Example

```typescript
import type { PricingPreviewLineItemDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "variantId": null,
  "sku": null,
  "quantity": null,
  "currencyCode": null,
  "unitBaseAmount": null,
  "effectiveUnitAmount": null,
  "lineSubtotalAmount": null,
  "taxAmount": null,
  "taxRateBps": null,
  "taxIncludedInPrice": null,
  "unitSaleAmount": null,
} satisfies PricingPreviewLineItemDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PricingPreviewLineItemDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


