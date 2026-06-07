
# AdminCatalogMediaDto


## Properties

Name | Type
------------ | -------------
`id` | string
`objectKey` | string
`status` | string
`mediaType` | string
`role` | string
`mimeType` | string
`sortOrder` | number
`translations` | [Array&lt;AttachedMediaTranslationDto&gt;](AttachedMediaTranslationDto.md)
`variantId` | string
`checksum` | string

## Example

```typescript
import type { AdminCatalogMediaDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "objectKey": null,
  "status": null,
  "mediaType": null,
  "role": null,
  "mimeType": null,
  "sortOrder": null,
  "translations": null,
  "variantId": null,
  "checksum": null,
} satisfies AdminCatalogMediaDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AdminCatalogMediaDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


