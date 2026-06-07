
# AdminCatalogRelationLinkDto


## Properties

Name | Type
------------ | -------------
`id` | string
`sortOrder` | number
`category` | [AdminCatalogCategoryDto](AdminCatalogCategoryDto.md)
`collection` | [AdminCatalogCollectionDto](AdminCatalogCollectionDto.md)
`tag` | [AdminCatalogTagDto](AdminCatalogTagDto.md)

## Example

```typescript
import type { AdminCatalogRelationLinkDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "sortOrder": null,
  "category": null,
  "collection": null,
  "tag": null,
} satisfies AdminCatalogRelationLinkDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AdminCatalogRelationLinkDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


