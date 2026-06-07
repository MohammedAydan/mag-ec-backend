
# AdminCatalogVariantDto


## Properties

Name | Type
------------ | -------------
`id` | string
`productId` | string
`sku` | string
`status` | string
`isDefault` | boolean
`position` | number
`translations` | [Array&lt;AdminCatalogTranslationDto&gt;](AdminCatalogTranslationDto.md)
`optionValues` | [Array&lt;AdminCatalogProductVariantOptionValueDto&gt;](AdminCatalogProductVariantOptionValueDto.md)
`price` | [CatalogVariantPriceDto](CatalogVariantPriceDto.md)

## Example

```typescript
import type { AdminCatalogVariantDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "productId": null,
  "sku": null,
  "status": null,
  "isDefault": null,
  "position": null,
  "translations": null,
  "optionValues": null,
  "price": null,
} satisfies AdminCatalogVariantDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AdminCatalogVariantDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


