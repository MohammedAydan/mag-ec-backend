
# CreateAttributeDto


## Properties

Name | Type
------------ | -------------
`key` | string
`inputType` | string
`translations` | [Array&lt;AttributeTranslationDto&gt;](AttributeTranslationDto.md)
`isFilterable` | boolean
`isVariantDefining` | boolean
`sortOrder` | number
`options` | [Array&lt;AttributeOptionDto&gt;](AttributeOptionDto.md)

## Example

```typescript
import type { CreateAttributeDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "key": null,
  "inputType": null,
  "translations": null,
  "isFilterable": null,
  "isVariantDefining": null,
  "sortOrder": null,
  "options": null,
} satisfies CreateAttributeDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreateAttributeDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


