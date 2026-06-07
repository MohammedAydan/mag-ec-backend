
# OrderRefundDto


## Properties

Name | Type
------------ | -------------
`id` | string
`status` | string
`amount` | number
`currencyCode` | string
`provider` | string
`requestedAt` | string
`returnRequestId` | string
`paymentAttemptId` | string
`reason` | string
`providerRefundId` | string
`processedAt` | string

## Example

```typescript
import type { OrderRefundDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "status": null,
  "amount": null,
  "currencyCode": null,
  "provider": null,
  "requestedAt": null,
  "returnRequestId": null,
  "paymentAttemptId": null,
  "reason": null,
  "providerRefundId": null,
  "processedAt": null,
} satisfies OrderRefundDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as OrderRefundDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


