
# CreateMediaUploadIntentDto


## Properties

Name | Type
------------ | -------------
`mediaType` | string
`role` | string
`mimeType` | string
`sizeBytes` | number
`variantId` | string

## Example

```typescript
import type { CreateMediaUploadIntentDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "mediaType": null,
  "role": null,
  "mimeType": null,
  "sizeBytes": null,
  "variantId": null,
} satisfies CreateMediaUploadIntentDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreateMediaUploadIntentDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


