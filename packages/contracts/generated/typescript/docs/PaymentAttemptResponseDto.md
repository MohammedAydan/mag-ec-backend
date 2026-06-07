
# PaymentAttemptResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`orderId` | string
`provider` | string
`method` | string
`status` | string
`currencyCode` | string
`amount` | number
`createdAt` | string
`updatedAt` | string
`order` | [OrderBriefDto](OrderBriefDto.md)
`providerPaymentId` | string
`providerIntentStatus` | string
`providerReference` | string
`lastErrorCode` | string
`lastErrorMessage` | string
`succeededAt` | string
`failedAt` | string

## Example

```typescript
import type { PaymentAttemptResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "orderId": null,
  "provider": null,
  "method": null,
  "status": null,
  "currencyCode": null,
  "amount": null,
  "createdAt": null,
  "updatedAt": null,
  "order": null,
  "providerPaymentId": null,
  "providerIntentStatus": null,
  "providerReference": null,
  "lastErrorCode": null,
  "lastErrorMessage": null,
  "succeededAt": null,
  "failedAt": null,
} satisfies PaymentAttemptResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PaymentAttemptResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


