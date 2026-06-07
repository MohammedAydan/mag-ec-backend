
# CreateCategoryDto


## Properties

Name | Type
------------ | -------------
`key` | string
`translations` | [Array&lt;TranslationDto&gt;](TranslationDto.md)
`parentId` | string
`sortOrder` | number

## Example

```typescript
import type { CreateCategoryDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "key": null,
  "translations": null,
  "parentId": null,
  "sortOrder": null,
} satisfies CreateCategoryDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreateCategoryDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


