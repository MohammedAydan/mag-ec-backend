
# ContentPageResponseDto


## Properties

Name | Type
------------ | -------------
`key` | string
`slug` | string
`title` | string
`body` | string
`status` | string
`locale` | string
`sortOrder` | number
`isLegal` | boolean
`createdAt` | string
`updatedAt` | string

## Example

```typescript
import type { ContentPageResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "key": null,
  "slug": null,
  "title": null,
  "body": null,
  "status": null,
  "locale": null,
  "sortOrder": null,
  "isLegal": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies ContentPageResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ContentPageResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


