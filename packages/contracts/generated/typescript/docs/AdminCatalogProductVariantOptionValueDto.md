
# AdminCatalogProductVariantOptionValueDto


## Properties

Name | Type
------------ | -------------
`id` | string
`attributeId` | string
`optionId` | string
`attribute` | [AdminCatalogAttributeDto](AdminCatalogAttributeDto.md)
`option` | [AdminCatalogAttributeOptionDto](AdminCatalogAttributeOptionDto.md)

## Example

```typescript
import type { AdminCatalogProductVariantOptionValueDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "attributeId": null,
  "optionId": null,
  "attribute": null,
  "option": null,
} satisfies AdminCatalogProductVariantOptionValueDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AdminCatalogProductVariantOptionValueDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


