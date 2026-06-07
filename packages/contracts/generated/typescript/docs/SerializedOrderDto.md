
# SerializedOrderDto


## Properties

Name | Type
------------ | -------------
`id` | string
`orderNumber` | string
`cartId` | string
`status` | string
`paymentMethod` | string
`paymentStatus` | string
`fulfillmentStatus` | string
`customerEmail` | string
`customerName` | string
`customerPhone` | string
`currencyCode` | string
`countryCode` | string
`shippingMethod` | [OrderShippingMethodDetailsDto](OrderShippingMethodDetailsDto.md)
`subtotalAmount` | number
`subtotalDiscountAmount` | number
`discountedSubtotalAmount` | number
`shippingAmount` | number
`taxAmount` | number
`grandTotalAmount` | number
`placedAt` | string
`createdAt` | string
`updatedAt` | string
`addresses` | [Array&lt;OrderAddressDto&gt;](OrderAddressDto.md)
`items` | [Array&lt;OrderLineItemDto&gt;](OrderLineItemDto.md)
`appliedPromotions` | [Array&lt;OrderAppliedPromotionDto&gt;](OrderAppliedPromotionDto.md)
`shipments` | [Array&lt;OrderShipmentDto&gt;](OrderShipmentDto.md)
`returnRequests` | [Array&lt;OrderReturnRequestDto&gt;](OrderReturnRequestDto.md)
`refunds` | [Array&lt;OrderRefundDto&gt;](OrderRefundDto.md)
`userId` | string
`couponCode` | string
`paidAt` | string

## Example

```typescript
import type { SerializedOrderDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "orderNumber": null,
  "cartId": null,
  "status": null,
  "paymentMethod": null,
  "paymentStatus": null,
  "fulfillmentStatus": null,
  "customerEmail": null,
  "customerName": null,
  "customerPhone": null,
  "currencyCode": null,
  "countryCode": null,
  "shippingMethod": null,
  "subtotalAmount": null,
  "subtotalDiscountAmount": null,
  "discountedSubtotalAmount": null,
  "shippingAmount": null,
  "taxAmount": null,
  "grandTotalAmount": null,
  "placedAt": null,
  "createdAt": null,
  "updatedAt": null,
  "addresses": null,
  "items": null,
  "appliedPromotions": null,
  "shipments": null,
  "returnRequests": null,
  "refunds": null,
  "userId": null,
  "couponCode": null,
  "paidAt": null,
} satisfies SerializedOrderDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as SerializedOrderDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


