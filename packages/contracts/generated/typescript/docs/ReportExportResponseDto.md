
# ReportExportResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`reportType` | string
`parametersJson` | object
`status` | string
`requestedByUserId` | string
`createdAt` | string
`updatedAt` | string
`requestedBy` | [ReportExportUserBriefDto](ReportExportUserBriefDto.md)
`resultObjectKey` | string
`errorMessage` | string
`startedAt` | string
`completedAt` | string
`failedAt` | string

## Example

```typescript
import type { ReportExportResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "reportType": null,
  "parametersJson": null,
  "status": null,
  "requestedByUserId": null,
  "createdAt": null,
  "updatedAt": null,
  "requestedBy": null,
  "resultObjectKey": null,
  "errorMessage": null,
  "startedAt": null,
  "completedAt": null,
  "failedAt": null,
} satisfies ReportExportResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ReportExportResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


