
# TaxClassResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`key` | string
`name` | string
`isDefault` | boolean
`updatedAt` | string

## Example

```typescript
import type { TaxClassResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "key": null,
  "name": null,
  "isDefault": null,
  "updatedAt": null,
} satisfies TaxClassResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TaxClassResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


