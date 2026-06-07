
# MediaUploadIntentResponseDto


## Properties

Name | Type
------------ | -------------
`mediaId` | string
`objectKey` | string
`uploadUrl` | string
`publicUrl` | string
`uploadToken` | string
`expiresAt` | string
`headers` | [MediaUploadHeadersDto](MediaUploadHeadersDto.md)

## Example

```typescript
import type { MediaUploadIntentResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "mediaId": null,
  "objectKey": null,
  "uploadUrl": null,
  "publicUrl": null,
  "uploadToken": null,
  "expiresAt": null,
  "headers": null,
} satisfies MediaUploadIntentResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as MediaUploadIntentResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


