
# CatalogProductSummaryDto


## Properties

Name | Type
------------ | -------------
`id` | string
`sku` | string
`status` | string
`productType` | [CatalogLocalizedReferenceDto](CatalogLocalizedReferenceDto.md)
`categories` | [Array&lt;CatalogLocalizedReferenceDto&gt;](CatalogLocalizedReferenceDto.md)
`collections` | [Array&lt;CatalogLocalizedReferenceDto&gt;](CatalogLocalizedReferenceDto.md)
`tags` | [Array&lt;CatalogLocalizedReferenceDto&gt;](CatalogLocalizedReferenceDto.md)
`media` | [Array&lt;CatalogMediaSummaryDto&gt;](CatalogMediaSummaryDto.md)
`variants` | [Array&lt;CatalogVariantSummaryDto&gt;](CatalogVariantSummaryDto.md)
`name` | string
`slug` | string
`shortDescription` | string
`description` | string
`brand` | [CatalogLocalizedReferenceDto](CatalogLocalizedReferenceDto.md)

## Example

```typescript
import type { CatalogProductSummaryDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "sku": null,
  "status": null,
  "productType": null,
  "categories": null,
  "collections": null,
  "tags": null,
  "media": null,
  "variants": null,
  "name": null,
  "slug": null,
  "shortDescription": null,
  "description": null,
  "brand": null,
} satisfies CatalogProductSummaryDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CatalogProductSummaryDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


