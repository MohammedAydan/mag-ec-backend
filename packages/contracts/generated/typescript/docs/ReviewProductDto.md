
# ReviewProductDto


## Properties

Name | Type
------------ | -------------
`id` | string
`sku` | string
`translations` | [Array&lt;ReviewProductTranslationDto&gt;](ReviewProductTranslationDto.md)

## Example

```typescript
import type { ReviewProductDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "sku": null,
  "translations": null,
} satisfies ReviewProductDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ReviewProductDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


