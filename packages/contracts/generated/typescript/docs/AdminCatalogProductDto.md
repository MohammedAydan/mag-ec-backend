
# AdminCatalogProductDto


## Properties

Name | Type
------------ | -------------
`id` | string
`productTypeId` | string
`sku` | string
`status` | string
`isFeatured` | boolean
`createdAt` | string
`updatedAt` | string
`translations` | [Array&lt;AdminCatalogTranslationDto&gt;](AdminCatalogTranslationDto.md)
`brandId` | string
`publishedAt` | string
`archivedAt` | string
`productType` | [AdminCatalogProductTypeDto](AdminCatalogProductTypeDto.md)
`brand` | [AdminCatalogBrandDto](AdminCatalogBrandDto.md)
`variants` | [Array&lt;AdminCatalogVariantDto&gt;](AdminCatalogVariantDto.md)
`categoryLinks` | [Array&lt;AdminCatalogRelationLinkDto&gt;](AdminCatalogRelationLinkDto.md)
`collectionLinks` | [Array&lt;AdminCatalogRelationLinkDto&gt;](AdminCatalogRelationLinkDto.md)
`tagLinks` | [Array&lt;AdminCatalogRelationLinkDto&gt;](AdminCatalogRelationLinkDto.md)
`media` | [Array&lt;AdminCatalogMediaDto&gt;](AdminCatalogMediaDto.md)

## Example

```typescript
import type { AdminCatalogProductDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "productTypeId": null,
  "sku": null,
  "status": null,
  "isFeatured": null,
  "createdAt": null,
  "updatedAt": null,
  "translations": null,
  "brandId": null,
  "publishedAt": null,
  "archivedAt": null,
  "productType": null,
  "brand": null,
  "variants": null,
  "categoryLinks": null,
  "collectionLinks": null,
  "tagLinks": null,
  "media": null,
} satisfies AdminCatalogProductDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AdminCatalogProductDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


