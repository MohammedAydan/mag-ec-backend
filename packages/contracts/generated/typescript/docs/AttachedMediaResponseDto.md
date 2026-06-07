
# AttachedMediaResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`productId` | string
`status` | string
`mediaType` | string
`role` | string
`mimeType` | string
`objectKey` | string
`publicUrl` | string
`translations` | [Array&lt;AttachedMediaTranslationDto&gt;](AttachedMediaTranslationDto.md)
`variantId` | string
`checksum` | string
`attachedAt` | string

## Example

```typescript
import type { AttachedMediaResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "productId": null,
  "status": null,
  "mediaType": null,
  "role": null,
  "mimeType": null,
  "objectKey": null,
  "publicUrl": null,
  "translations": null,
  "variantId": null,
  "checksum": null,
  "attachedAt": null,
} satisfies AttachedMediaResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AttachedMediaResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


