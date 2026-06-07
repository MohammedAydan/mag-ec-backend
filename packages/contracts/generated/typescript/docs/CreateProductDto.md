
# CreateProductDto


## Properties

Name | Type
------------ | -------------
`productTypeId` | string
`sku` | string
`translations` | [Array&lt;ProductTranslationDto&gt;](ProductTranslationDto.md)
`variants` | [Array&lt;ProductVariantDto&gt;](ProductVariantDto.md)
`brandId` | string
`isFeatured` | boolean
`categoryIds` | Array&lt;string&gt;
`collectionIds` | Array&lt;string&gt;
`tagIds` | Array&lt;string&gt;

## Example

```typescript
import type { CreateProductDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "productTypeId": null,
  "sku": null,
  "translations": null,
  "variants": null,
  "brandId": null,
  "isFeatured": null,
  "categoryIds": null,
  "collectionIds": null,
  "tagIds": null,
} satisfies CreateProductDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreateProductDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


