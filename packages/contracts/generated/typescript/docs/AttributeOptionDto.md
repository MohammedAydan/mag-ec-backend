
# AttributeOptionDto


## Properties

Name | Type
------------ | -------------
`key` | string
`translations` | [Array&lt;AttributeOptionTranslationDto&gt;](AttributeOptionTranslationDto.md)
`sortOrder` | number
`colorHex` | string

## Example

```typescript
import type { AttributeOptionDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "key": null,
  "translations": null,
  "sortOrder": null,
  "colorHex": null,
} satisfies AttributeOptionDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AttributeOptionDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


