
# StoreSettingResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`key` | string
`value` | object
`isPublic` | boolean
`updatedAt` | string
`description` | string

## Example

```typescript
import type { StoreSettingResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "key": null,
  "value": null,
  "isPublic": null,
  "updatedAt": null,
  "description": null,
} satisfies StoreSettingResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StoreSettingResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


