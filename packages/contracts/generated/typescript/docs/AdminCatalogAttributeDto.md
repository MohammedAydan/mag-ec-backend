
# AdminCatalogAttributeDto


## Properties

Name | Type
------------ | -------------
`id` | string
`key` | string
`inputType` | string
`isFilterable` | boolean
`isVariantDefining` | boolean
`sortOrder` | number
`translations` | [Array&lt;AdminCatalogTranslationDto&gt;](AdminCatalogTranslationDto.md)
`options` | [Array&lt;AdminCatalogAttributeOptionDto&gt;](AdminCatalogAttributeOptionDto.md)

## Example

```typescript
import type { AdminCatalogAttributeDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "key": null,
  "inputType": null,
  "isFilterable": null,
  "isVariantDefining": null,
  "sortOrder": null,
  "translations": null,
  "options": null,
} satisfies AdminCatalogAttributeDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AdminCatalogAttributeDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


