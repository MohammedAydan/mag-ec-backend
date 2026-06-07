
# CheckoutPaymentAttemptDto


## Properties

Name | Type
------------ | -------------
`attemptId` | string
`provider` | string
`status` | string
`clientSecret` | string
`checkoutUrl` | string
`providerPaymentId` | string

## Example

```typescript
import type { CheckoutPaymentAttemptDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "attemptId": null,
  "provider": null,
  "status": null,
  "clientSecret": null,
  "checkoutUrl": null,
  "providerPaymentId": null,
} satisfies CheckoutPaymentAttemptDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CheckoutPaymentAttemptDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


