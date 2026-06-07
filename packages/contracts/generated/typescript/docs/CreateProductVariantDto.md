
# CreateProductVariantDto


## Properties

Name | Type
------------ | -------------
`sku` | string
`translations` | [Array&lt;ProductVariantTranslationDto&gt;](ProductVariantTranslationDto.md)
`optionValues` | [Array&lt;VariantOptionValueDto&gt;](VariantOptionValueDto.md)
`isDefault` | boolean
`position` | number

## Example

```typescript
import type { CreateProductVariantDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "sku": null,
  "translations": null,
  "optionValues": null,
  "isDefault": null,
  "position": null,
} satisfies CreateProductVariantDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreateProductVariantDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


