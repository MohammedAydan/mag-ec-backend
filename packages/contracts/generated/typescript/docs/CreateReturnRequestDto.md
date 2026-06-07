
# CreateReturnRequestDto


## Properties

Name | Type
------------ | -------------
`reason` | string
`items` | [Array&lt;CreateReturnRequestItemDto&gt;](CreateReturnRequestItemDto.md)
`notes` | string

## Example

```typescript
import type { CreateReturnRequestDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "reason": null,
  "items": null,
  "notes": null,
} satisfies CreateReturnRequestDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreateReturnRequestDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


