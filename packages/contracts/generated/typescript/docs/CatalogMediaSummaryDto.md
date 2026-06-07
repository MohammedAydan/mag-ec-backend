
# CatalogMediaSummaryDto


## Properties

Name | Type
------------ | -------------
`id` | string
`objectKey` | string
`publicUrl` | string
`role` | string
`mediaType` | string
`mimeType` | string
`altText` | string
`title` | string

## Example

```typescript
import type { CatalogMediaSummaryDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "objectKey": null,
  "publicUrl": null,
  "role": null,
  "mediaType": null,
  "mimeType": null,
  "altText": null,
  "title": null,
} satisfies CatalogMediaSummaryDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CatalogMediaSummaryDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


