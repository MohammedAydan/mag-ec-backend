
# WishlistResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`userId` | string
`items` | [Array&lt;WishlistItemResponseDto&gt;](WishlistItemResponseDto.md)
`itemCount` | number

## Example

```typescript
import type { WishlistResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "userId": null,
  "items": null,
  "itemCount": null,
} satisfies WishlistResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as WishlistResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


