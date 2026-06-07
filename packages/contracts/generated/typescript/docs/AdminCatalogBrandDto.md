
# AdminCatalogBrandDto


## Properties

Name | Type
------------ | -------------
`id` | string
`key` | string
`status` | string
`translations` | [Array&lt;AdminCatalogTranslationDto&gt;](AdminCatalogTranslationDto.md)

## Example

```typescript
import type { AdminCatalogBrandDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "key": null,
  "status": null,
  "translations": null,
} satisfies AdminCatalogBrandDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AdminCatalogBrandDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


