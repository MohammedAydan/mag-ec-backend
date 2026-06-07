
# UpdateProductDto


## Properties

Name | Type
------------ | -------------
`brandId` | string
`isFeatured` | boolean
`categoryIds` | Array&lt;string&gt;
`collectionIds` | Array&lt;string&gt;
`tagIds` | Array&lt;string&gt;
`translations` | [Array&lt;ProductTranslationDto&gt;](ProductTranslationDto.md)

## Example

```typescript
import type { UpdateProductDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "brandId": null,
  "isFeatured": null,
  "categoryIds": null,
  "collectionIds": null,
  "tagIds": null,
  "translations": null,
} satisfies UpdateProductDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UpdateProductDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


