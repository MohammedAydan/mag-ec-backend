
# CartResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`status` | string
`items` | [Array&lt;CartItemResponseDto&gt;](CartItemResponseDto.md)
`createdAt` | string
`updatedAt` | string
`guestToken` | string
`couponCode` | string
`userId` | string

## Example

```typescript
import type { CartResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "status": null,
  "items": null,
  "createdAt": null,
  "updatedAt": null,
  "guestToken": null,
  "couponCode": null,
  "userId": null,
} satisfies CartResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CartResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


