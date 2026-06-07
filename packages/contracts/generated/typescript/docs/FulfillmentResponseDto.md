
# FulfillmentResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`orderId` | string
`shipmentNumber` | string
`status` | string
`createdAt` | string
`updatedAt` | string
`items` | [Array&lt;FulfillmentItemDto&gt;](FulfillmentItemDto.md)
`carrierKey` | string
`carrierName` | string
`trackingNumber` | string
`trackingUrl` | string
`notes` | string
`shippedAt` | string
`deliveredAt` | string
`cancelledAt` | string

## Example

```typescript
import type { FulfillmentResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "orderId": null,
  "shipmentNumber": null,
  "status": null,
  "createdAt": null,
  "updatedAt": null,
  "items": null,
  "carrierKey": null,
  "carrierName": null,
  "trackingNumber": null,
  "trackingUrl": null,
  "notes": null,
  "shippedAt": null,
  "deliveredAt": null,
  "cancelledAt": null,
} satisfies FulfillmentResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as FulfillmentResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


