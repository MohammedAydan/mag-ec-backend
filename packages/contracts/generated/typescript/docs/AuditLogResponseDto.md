
# AuditLogResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`category` | string
`action` | string
`entityType` | string
`createdAt` | string
`actorUserId` | string
`entityId` | string
`ipAddress` | string
`userAgent` | string
`metadata` | object
`diff` | object
`actorUser` | [AuditLogActorDto](AuditLogActorDto.md)

## Example

```typescript
import type { AuditLogResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "category": null,
  "action": null,
  "entityType": null,
  "createdAt": null,
  "actorUserId": null,
  "entityId": null,
  "ipAddress": null,
  "userAgent": null,
  "metadata": null,
  "diff": null,
  "actorUser": null,
} satisfies AuditLogResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AuditLogResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


