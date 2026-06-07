
# NotificationResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`channel` | string
`eventType` | string
`title` | string
`status` | string
`deduplicationKey` | string
`attempts` | number
`createdAt` | string
`updatedAt` | string
`userId` | string
`recipientEmail` | string
`body` | string
`relatedEntityType` | string
`relatedEntityId` | string
`lastError` | string
`availableAt` | string
`processedAt` | string
`user` | [NotificationUserBriefDto](NotificationUserBriefDto.md)

## Example

```typescript
import type { NotificationResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "channel": null,
  "eventType": null,
  "title": null,
  "status": null,
  "deduplicationKey": null,
  "attempts": null,
  "createdAt": null,
  "updatedAt": null,
  "userId": null,
  "recipientEmail": null,
  "body": null,
  "relatedEntityType": null,
  "relatedEntityId": null,
  "lastError": null,
  "availableAt": null,
  "processedAt": null,
  "user": null,
} satisfies NotificationResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as NotificationResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


