
# ReportExportDownloadResponseDto


## Properties

Name | Type
------------ | -------------
`exportId` | string
`downloadUrl` | string
`expiresInSeconds` | number

## Example

```typescript
import type { ReportExportDownloadResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "exportId": null,
  "downloadUrl": null,
  "expiresInSeconds": null,
} satisfies ReportExportDownloadResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ReportExportDownloadResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


