
# PaymentWebhookEventResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`provider` | string
`status` | string
`receivedAt` | string
`createdAt` | string
`updatedAt` | string
`externalEventId` | string
`eventType` | string
`paymentAttemptId` | string
`orderId` | string
`processingError` | string
`processedAt` | string

## Example

```typescript
import type { PaymentWebhookEventResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "provider": null,
  "status": null,
  "receivedAt": null,
  "createdAt": null,
  "updatedAt": null,
  "externalEventId": null,
  "eventType": null,
  "paymentAttemptId": null,
  "orderId": null,
  "processingError": null,
  "processedAt": null,
} satisfies PaymentWebhookEventResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PaymentWebhookEventResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


