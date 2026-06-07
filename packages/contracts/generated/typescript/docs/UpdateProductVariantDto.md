
# UpdateProductVariantDto


## Properties

Name | Type
------------ | -------------
`sku` | string
`isDefault` | boolean
`position` | number
`translations` | [Array&lt;ProductVariantTranslationDto&gt;](ProductVariantTranslationDto.md)
`optionValues` | [Array&lt;VariantOptionValueDto&gt;](VariantOptionValueDto.md)

## Example

```typescript
import type { UpdateProductVariantDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "sku": null,
  "isDefault": null,
  "position": null,
  "translations": null,
  "optionValues": null,
} satisfies UpdateProductVariantDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UpdateProductVariantDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


