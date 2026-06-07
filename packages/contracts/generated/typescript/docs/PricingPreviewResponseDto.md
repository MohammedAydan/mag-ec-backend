
# PricingPreviewResponseDto


## Properties

Name | Type
------------ | -------------
`currencyCode` | string
`countryCode` | string
`subtotalAmount` | number
`subtotalDiscountAmount` | number
`discountedSubtotalAmount` | number
`taxAmount` | number
`grandTotalExcludingShippingAmount` | number
`items` | [Array&lt;PricingPreviewLineItemDto&gt;](PricingPreviewLineItemDto.md)
`appliedPromotions` | [Array&lt;PricingPreviewAppliedPromotionDto&gt;](PricingPreviewAppliedPromotionDto.md)
`rejectedPromotions` | Array&lt;string&gt;
`shippingMethods` | [Array&lt;PricingPreviewShippingMethodDto&gt;](PricingPreviewShippingMethodDto.md)

## Example

```typescript
import type { PricingPreviewResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "currencyCode": null,
  "countryCode": null,
  "subtotalAmount": null,
  "subtotalDiscountAmount": null,
  "discountedSubtotalAmount": null,
  "taxAmount": null,
  "grandTotalExcludingShippingAmount": null,
  "items": null,
  "appliedPromotions": null,
  "rejectedPromotions": null,
  "shippingMethods": null,
} satisfies PricingPreviewResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PricingPreviewResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


