
# CreateReturnRequestItemDto


## Properties

Name | Type
------------ | -------------
`orderLineId` | string
`quantity` | number
`requestedDisposition` | string
`reason` | string

## Example

```typescript
import type { CreateReturnRequestItemDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "orderLineId": null,
  "quantity": null,
  "requestedDisposition": null,
  "reason": null,
} satisfies CreateReturnRequestItemDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreateReturnRequestItemDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


