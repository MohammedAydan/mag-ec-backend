
# ReviewResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`productId` | string
`userId` | string
`orderLineId` | string
`rating` | number
`title` | string
`body` | string
`isVerifiedPurchase` | boolean
`status` | string
`createdAt` | string
`updatedAt` | string
`product` | [ReviewProductDto](ReviewProductDto.md)
`orderLine` | [ReviewOrderLineDto](ReviewOrderLineDto.md)
`moderationActions` | [Array&lt;ReviewModerationActionDto&gt;](ReviewModerationActionDto.md)
`rejectionReason` | string

## Example

```typescript
import type { ReviewResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "productId": null,
  "userId": null,
  "orderLineId": null,
  "rating": null,
  "title": null,
  "body": null,
  "isVerifiedPurchase": null,
  "status": null,
  "createdAt": null,
  "updatedAt": null,
  "product": null,
  "orderLine": null,
  "moderationActions": null,
  "rejectionReason": null,
} satisfies ReviewResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ReviewResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


