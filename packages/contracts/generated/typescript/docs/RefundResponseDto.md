
# RefundResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`orderId` | string
`provider` | string
`status` | string
`amount` | number
`currencyCode` | string
`requestedAt` | string
`createdAt` | string
`updatedAt` | string
`order` | [OrderBriefDto](OrderBriefDto.md)
`paymentAttemptId` | string
`returnRequestId` | string
`requestedByUserId` | string
`reason` | string
`providerRefundId` | string
`providerReference` | string
`failureReason` | string
`processedAt` | string

## Example

```typescript
import type { RefundResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "orderId": null,
  "provider": null,
  "status": null,
  "amount": null,
  "currencyCode": null,
  "requestedAt": null,
  "createdAt": null,
  "updatedAt": null,
  "order": null,
  "paymentAttemptId": null,
  "returnRequestId": null,
  "requestedByUserId": null,
  "reason": null,
  "providerRefundId": null,
  "providerReference": null,
  "failureReason": null,
  "processedAt": null,
} satisfies RefundResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RefundResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


