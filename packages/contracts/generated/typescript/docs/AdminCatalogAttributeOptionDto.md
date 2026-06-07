
# AdminCatalogAttributeOptionDto


## Properties

Name | Type
------------ | -------------
`id` | string
`key` | string
`sortOrder` | number
`translations` | [Array&lt;AdminCatalogTranslationDto&gt;](AdminCatalogTranslationDto.md)
`colorHex` | string

## Example

```typescript
import type { AdminCatalogAttributeOptionDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "key": null,
  "sortOrder": null,
  "translations": null,
  "colorHex": null,
} satisfies AdminCatalogAttributeOptionDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AdminCatalogAttributeOptionDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


