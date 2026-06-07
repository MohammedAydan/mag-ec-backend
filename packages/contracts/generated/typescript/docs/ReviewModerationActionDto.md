
# ReviewModerationActionDto


## Properties

Name | Type
------------ | -------------
`id` | string
`reviewId` | string
`moderatorUserId` | string
`actionType` | string
`createdAt` | string
`reason` | string

## Example

```typescript
import type { ReviewModerationActionDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "reviewId": null,
  "moderatorUserId": null,
  "actionType": null,
  "createdAt": null,
  "reason": null,
} satisfies ReviewModerationActionDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ReviewModerationActionDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


