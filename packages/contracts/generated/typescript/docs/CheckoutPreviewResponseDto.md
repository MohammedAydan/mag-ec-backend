
# CheckoutPreviewResponseDto


## Properties

Name | Type
------------ | -------------
`cartId` | string
`paymentReadiness` | [CheckoutPaymentReadinessDto](CheckoutPaymentReadinessDto.md)
`currencyCode` | string
`countryCode` | string
`subtotalAmount` | number
`subtotalDiscountAmount` | number
`discountedSubtotalAmount` | number
`taxAmount` | number
`grandTotalExcludingShippingAmount` | number
`appliedPromotions` | [Array&lt;CheckoutPreviewAppliedPromotionDto&gt;](CheckoutPreviewAppliedPromotionDto.md)
`rejectedPromotions` | Array&lt;string&gt;
`items` | [Array&lt;CheckoutPreviewItemResponseDto&gt;](CheckoutPreviewItemResponseDto.md)
`shippingMethods` | [Array&lt;CheckoutPreviewShippingMethodDto&gt;](CheckoutPreviewShippingMethodDto.md)
`reservationKey` | string
`reservationExpiresAt` | string

## Example

```typescript
import type { CheckoutPreviewResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "cartId": null,
  "paymentReadiness": null,
  "currencyCode": null,
  "countryCode": null,
  "subtotalAmount": null,
  "subtotalDiscountAmount": null,
  "discountedSubtotalAmount": null,
  "taxAmount": null,
  "grandTotalExcludingShippingAmount": null,
  "appliedPromotions": null,
  "rejectedPromotions": null,
  "items": null,
  "shippingMethods": null,
  "reservationKey": null,
  "reservationExpiresAt": null,
} satisfies CheckoutPreviewResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CheckoutPreviewResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


